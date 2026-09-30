#!/usr/bin/env bash
#
# Runs ART's own bytecode verifier over every class of a patched APK, on a rooted emulator.
#
# Hooks that use registers the method does not have, or give a register the wrong type, patch
# and build without complaint, and then make the app throw VerifyError when the class loads.
# dex2oat's verify filter checks every class up front, so those show up here instead.
#
#   scripts/verify-dex.sh <patched.apk> [original.apk]
#
# The patched APK comes from ./gradlew :patches:apkTest. Apps can ship classes that already fail
# to verify (Reddit's Firebase code does); pass the original APK and only failures the patches
# added are reported.
#
# The emulator needs root (a google_apis image, not google_play), but not the app's ABI:
# verification does not run native code. ANDROID_SERIAL picks the device, and ADB the adb
# binary when it is not on the PATH.

set -euo pipefail
# Failures inside the command substitutions below must stop the script too.
shopt -s inherit_errexit

patched=$1
original=${2:-}
serial=${ANDROID_SERIAL:-emulator-5554}
remote=/data/local/tmp/verify
# Git Bash on Windows rewrites /data/... into a Windows path otherwise.
export MSYS_NO_PATHCONV=1

# `command` so that without ADB set this runs the adb binary, not this function again.
adb() { command "${ADB:-adb}" -s "$serial" "$@"; }

# A local path as adb sees it: a Windows adb cannot open Git Bash's /e/... paths.
local_path() { if command -v cygpath > /dev/null; then cygpath -w "$1"; else echo "$1"; fi; }

# Prints each class that fails to verify in the APK, one line per failure.
failures() {
    adb push "$(local_path "$1")" "$remote.apk" > /dev/null
    adb logcat -c
    adb shell "dex2oat64 --dex-file=$remote.apk --dex-location=$remote.apk --oat-file=$remote.odex \
        --compiler-filter=verify --instruction-set=\$(getprop ro.product.cpu.abi | sed 's/-v8a//') -j8" > /dev/null
    adb logcat -d -s dex2oat64:W dex2oat:W | grep -E "failed to verify" | sed -E 's/^.* dex2oat(64)?: //' | sort -u || true
    adb shell rm -f "$remote.apk" "$remote.odex" "$remote.vdex"
}

adb root > /dev/null
adb wait-for-device

new=$(failures "$patched")
if [ -n "$original" ]; then
    # Into a variable first: a failure inside <(...) would not stop the script, and every
    # class would then look verified.
    old=$(failures "$original")
    new=$(comm -13 <(echo "$old") <(echo "$new"))
fi

if [ -n "$new" ]; then
    echo "$new"
    exit 1
fi
echo "Every class verified."
