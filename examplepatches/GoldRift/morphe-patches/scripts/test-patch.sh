#!/usr/bin/env sh
# Build, patch, install on a connected device. Usage: scripts/test-patch.sh <apk|apkm> [device-serial]
set -eu
apk=${1:?usage: $0 <apk|apkm> [device-serial]}
serial=${2:-$(adb devices | awk 'NR==2{print $1}')}
mpp=patches/build/libs/patches-$(sed -n 's/^version *= *//p' gradle.properties).mpp

./gradlew :patches:buildAndroid --no-configuration-cache -q
morphe-cli patch -p "$mpp" -i="$serial" "$apk"
