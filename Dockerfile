FROM debian:stable-slim

RUN apt update && apt install wget -y
RUN wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg
RUN echo "deb http://download.proxmox.com/debian/pbs-client bookworm main" >> /etc/apt/sources.list
RUN apt update && apt install proxmox-backup-client -y

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]