#!/bin/sh
# Build Thread Ripper patches, patch the original YouTube APK with official Morphe patches + ours,
# and install over the existing app (keeps app data; the vivo phone asks for confirmation on screen).
# Needs in .local/: youtube-21.16.256.apk, patches-1.45.0.mpp, Morphe.keystore,
# tools/morphe-desktop-1.18.0-all.jar. gh token needs read:packages.
set -e
REPO=$(cd "$(dirname "$0")/../.." && pwd)
L="$REPO/.local"
cd "$REPO"
export GITHUB_ACTOR=${GITHUB_ACTOR:-$(gh api user --jq .login)} GITHUB_TOKEN=$(gh auth token)
./gradlew buildAndroid --no-daemon -q 2>&1 | grep -v "^Note:" || true
MPP=$(ls -t patches/build/libs/patches-*.mpp | head -1)
mkdir -p "$L/build"
rm -f "$L/build/tr.apk"
java -jar "$L/tools/morphe-desktop-1.18.0-all.jar" patch -p "$L/patches-1.45.0.mpp" -p "$REPO/$MPP" \
  --keystore "$L/Morphe.keystore" --keystore-entry-alias Morphe --keystore-entry-password Morphe \
  -o "$L/build/tr.apk" -t "$L/build/tmp" "$L/youtube-21.16.256.apk" 2>&1 | grep -i -E "Applied: Multi|SEVERE|fail|Saved" || true
test -f "$L/build/tr.apk"
adb install -r "$L/build/tr.apk"
