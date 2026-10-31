#!/bin/bash
# Assemble stubs/smali (stand-ins for One UI framework classes + samsungcompat.Shim, generated for
# Notes 4.4.48.15) into patches/src/main/resources/extensions/compat-stubs.mpe (a DEX file).
# apktool needs a decoded-APK layout; any APK's binary manifest + resources.arsc will do, since only
# classes.dex is kept. Usage: tools/build-stubs.sh <any notes.apk>
cd "$(dirname "$0")/.." || exit 1
APK=$(realpath "$1"); T=build/stubs; rm -rf $T; mkdir -p $T/apk
[ -f "$APK" ] || { echo "usage: tools/build-stubs.sh <notes.apk>"; exit 1; }
unzip -q -o "$APK" AndroidManifest.xml resources.arsc -d $T/apk && cp -r stubs/smali $T/apk/smali &&
printf 'version: 3.0.3\napkFileName: stubs.apk\nsdkInfo:\n  minSdkVersion: 29\n' > $T/apk/apktool.yml &&
apktool b $T/apk -o $T/stubs.apk >/dev/null && unzip -q -o $T/stubs.apk classes.dex -d $T &&
cp $T/classes.dex patches/src/main/resources/extensions/compat-stubs.mpe && echo "compat-stubs.mpe: $(find stubs/smali -name '*.smali' | wc -l) classes"
