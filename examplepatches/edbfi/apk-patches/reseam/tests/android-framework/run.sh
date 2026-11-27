#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
set -euo pipefail

# Run the compiled extensions on Redroid after just reseam-build.

here=$(cd "$(dirname "$0")" && pwd)
bundle=${1:?Pass the built Reseam bundle from just reseam-build}
rif_apk=${2:-}
if [[ -n "$rif_apk" && ! -f "$rif_apk" ]]; then
    echo "Missing patched rif APK: $rif_apk" >&2
    exit 1
fi
: "${ANDROID_SERIAL:?Set ANDROID_SERIAL to your Android test device}"
: "${ANDROID_HOME:?Set ANDROID_HOME to the Android SDK}"
platform="$ANDROID_HOME/platforms/android-36/android.jar"
d8="$ANDROID_HOME/build-tools/36.0.0/d8"
java_bin=${JAVA_HOME:+$JAVA_HOME/bin/}
scratch=$(mktemp -d)
remote=
cleanup() {
    rm -rf "$scratch"
    if [[ -n "$remote" ]]; then adb shell rm -r "$remote" >/dev/null; fi
}
trap cleanup EXIT
mkdir "$scratch/classes" "$scratch/dex"
sources=("$here/FrameworkExtensionsTest.java")
if [[ -n "$rif_apk" ]]; then sources+=("$here/RifSearchTest.java"); fi
"${java_bin}javac" --release 17 -cp "$platform" -d "$scratch/classes" "${sources[@]}"
"$d8" --release --min-api 26 --lib "$platform" --output "$scratch/dex" \
    "$scratch/classes/app/edbfi/tests/reseam/"*.class

modules=(kotlin rifisfun-markdown-links rifisfun-media-links syncforreddit-commentrequest)
for name in "${modules[@]}"; do
    unzip -p "$bundle" "$name.dex" > "$scratch/dex/$name.dex"
done
remote_dir=$(adb shell mktemp -d /data/local/tmp/reseam-framework.XXXXXXXX)
[[ "$remote_dir" =~ ^/data/local/tmp/reseam-framework\.[[:alnum:]]+$ ]]
remote=$remote_dir
classpath="$remote/classes.dex"
for name in "${modules[@]}"; do
    classpath+=":$remote/$name.dex"
done
adb push "$scratch/dex/." "$remote/" >/dev/null
adb shell "chmod 444 '$remote'/*.dex && CLASSPATH='$classpath' app_process /system/bin app.edbfi.tests.reseam.FrameworkExtensionsTest"
if [[ -n "$rif_apk" ]]; then
    adb push "$rif_apk" "$remote/rif.apk" >/dev/null
    adb shell "chmod 444 '$remote/rif.apk' && CLASSPATH='$remote/classes.dex' app_process /system/bin app.edbfi.tests.reseam.RifSearchTest '$remote/rif.apk'"
fi
