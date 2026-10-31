#!/bin/bash
# Patch a Samsung Notes APK with these patches + Morphe's "Clone app" (side-by-side package).
# Usage: tools/patch.sh <notes.apk> [extra morphe-cli options...]
#   e.g. tools/patch.sh notes.apk -e "Folder sync" -e "Hide camera" -d "Pen button actions"
#        -O upperKey=24 (options go right after the patch they belong to, see `list-patches -o`)
# PKG=<package> changes the cloned package name (default com.jibon.samsungnotes.patched).
# Signs with tools/test.keystore (created on first run; keep it, updates need the same key).
cd "$(dirname "$0")/.." || exit 1
APK=$(realpath "$1"); shift; PKG=${PKG:-com.jibon.samsungnotes.patched}
JAVA21=${JAVA21:-/usr/lib/jvm/java-21-openjdk/bin/java}
[ -f "$APK" ] || { echo "usage: tools/patch.sh <notes.apk> [package]"; exit 1; }
[ -f build/notes-patches.mpp ] || sh tools/build-local.sh || exit 1
[ -f tools/morphe-patches.mpp ] || gh release download -R MorpheApp/morphe-patches -p 'patches-*.mpp' -O tools/morphe-patches.mpp || exit 1
[ -f tools/test.keystore ] || keytool -genkeypair -keystore tools/test.keystore -storetype PKCS12 -alias morphe -keyalg RSA \
    -keysize 2048 -validity 10000 -storepass morphetest -keypass morphetest -dname "CN=Notes patches test" || exit 1
mkdir -p out
# --exclusive keeps Morphe's own bundle to "Clone app", so this bundle's default-on patches are listed here.
DEFAULTS=()
for p in "Samsung framework compatibility" "Manifest compatibility" "Crash fixes" "Treat as pen device" \
    "Finger drawing" "Pen button actions" "Backup to folder" "Hide Samsung account features" \
    "Turn off Samsung cloud components" "Branding"; do DEFAULTS+=(-e "$p"); done
$JAVA21 -Xmx6g -jar tools/morphe-cli.jar patch --exclusive \
    -p build/notes-patches.mpp "${DEFAULTS[@]}" "$@" \
    -p tools/morphe-patches.mpp -e "Clone app" -O packageName=$PKG \
    --striplibs=arm64-v8a --keystore=tools/test.keystore --keystore-password=morphetest \
    --keystore-entry-alias=morphe --keystore-entry-password=morphetest \
    -t build/tmp -o out/notes-$PKG.apk "$APK"
