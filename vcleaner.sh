#!/bin/bash

#colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
end="\033[0m"
transparent="\e[0m"
#setresolution

TOPLEFTBIG="-geometry  100x52+0+0"

#define

LinuxPKG="linux-(image|headers|debian-modules|restricted-modules)"
MetaLinuxPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen)"
CurrentKernel=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
#OldKernels=$(dpkg -l|awk '{print $2}'|grep -E $LinuxPKG |grep -vE $MetaLinuxPKG|grep -v $CurrentKernel)

#Design

echo -e $white"==============================="${green}VCleaner"${white}===================================="$end
echo -e $white"=                 $blue A simple cleaner for Linux by "${yellow}VKing34"                  "${white}=""$end
echo -e $white"==========================================================================="$end
echo -e
echo -e $grey"*This program and tools used here "${red}wont clean up all" "${grey}trashes in your Linux""$end
echo -e 

#Check Root

if [ $USER != root ]; then
echo -e $red"[ VCleaner ]:Error: Must be root"
echo -e $white"[ VCleaner ]:Exiting..."$end
echo -e $blue"Please try agian! And thank you for using this program by "${white}VKing34""
exit 0
fi

#Check requirement
if ! hash aptitude 2>/dev/null; then
	echo -e $blue"Installing 'aptitude' ..."$transparent""
		xterm $HOLD -title "Installing aptitude" $TOPLEFTBIG -bg "#FFFFFF" -fg "#000000" -e apt-get --yes install aptitude
  fi
	sleep 0.025

#Cleaning

echo -e $blue"[ VCleaner ]: Cleaning apt cache ..."$end
sudo aptitude clean

echo -e $blue"[ VCleaner ]: Removing old config files ..."$end
sudo aptitude purge $(dpkg -l|grep "^rc"|awk '{print $2}')

sleep 0.2

echo -e $blue"[ VCleaner ]: Removing old kernels..."$end
sudo aptitude purge $OldKernels
sleep 0.2

echo -e $blue"[ VCleaner ]: Removing trashes ..."$end
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null

sleep 0.2

#Finish and Goodbye
echo -e $blue"[ VCleaner ]: Completed!"$end
echo -e $blue"[ VCleaner ]: Goodbye ! And "${red}VKing34" thanks you for using VCleaner :*"$end

sleep 4
clear






