#!/usr/bin/env bash
# On a booted emulator: install MicroG and the patched YouTube, open a video, show the player's controls,
# and pass when Jimaku registers with Morphe, attaches to the player and places its button, with no crash.
# YouTube shows GitHub's runners a bot check, so the video never plays; Jimaku's button stays hidden.
#
# bash smoke.sh WORKDIR   (WORKDIR holds microg-*.apk and youtube-patched.apk; the report goes there too)
set -u
W=$1
VIDEO=S6jjcVNzcdM
HERE=$(dirname "$0")
# A second attempt keeps the first one's report, logs and screenshots in attempt-1.
if [ -f "$W/report.txt" ]; then
  mkdir -p "$W/attempt-1"
  mv "$W/report.txt" "$W"/logcat*.txt "$W/shots" "$W/attempt-1/" 2>/dev/null
fi
mkdir -p "$W/shots"
report() { echo "$*" | tee -a "$W/report.txt"; }
fail() { report "FAIL: $*"; exit 1; }
# A failed check of Jimaku itself, unlike a boot or install failure, is not tried again.
fail_jimaku() { touch "$W/jimaku-check-failed"; fail "$@"; }
shot() { adb exec-out screencap -p > "$W/shots/$1.png"; }
dump() {
  for _ in 1 2 3; do adb shell uiautomator dump /sdcard/u.xml 2>&1 | grep -q dumped && break; sleep 1; done
  adb exec-out cat /sdcard/u.xml > "$W/shots/$1.xml" 2>/dev/null
}
find_ui() { python3 "$HERE/ui.py" "$W/shots/$1.xml" "$2" "$3"; }
oneline() { tr '\r\n' '  '; }
# The link is quoted for the device's shell: unquoted, its & ends the command and another app opens it.
open_video() {
  report "start (t=$1): $(adb shell "am start -W -a android.intent.action.VIEW -d 'https://www.youtube.com/watch?v=$VIDEO&t=$1' $PKG" 2>&1 | grep -E 'Activity:|Error' | oneline)"
}
jimaku_log() { adb logcat -d -s Jimaku:* > "$W/logcat-jimaku.txt"; }
logged() { grep -q "$1" "$W/logcat-jimaku.txt"; }

report "emulator: Android $(adb shell getprop ro.build.version.release) / API $(adb shell getprop ro.build.version.sdk)"
read -r SW SH <<< "$(adb shell wm size | grep -o -E '[0-9]+x[0-9]+' | tail -1 | tr x ' ')"
report "screen: ${SW}x${SH}"
result=$(adb install -r "$W"/microg-*.apk 2>&1 | tail -1)
report "MicroG install: $result"
[ "$result" = "Success" ] || fail "MicroG did not install"
result=$(adb install -r -g "$W/youtube-patched.apk" 2>&1 | tail -1)
report "app install: $result"
[ "$result" = "Success" ] || fail "the patched app did not install"
PKG=$("$(ls "$ANDROID_HOME"/build-tools/*/aapt2 | tail -1)" dump packagename "$W/youtube-patched.apk")
report "patched package: $PKG"
# The image ships stock YouTube, which would take the link.
report "stock YouTube removed: $(adb shell pm uninstall --user 0 com.google.android.youtube 2>&1)"
adb shell dumpsys deviceidle whitelist +app.revanced.android.gms > /dev/null
adb logcat -G 16M

# First launch: Morphe asks for a restart to finish setting up. Press Restart, then start clean.
open_video 30
sleep 20
shot first
dump first
pos=$(find_ui first text Restart)
report "restart prompt: ${pos:-none}"
if [ -n "$pos" ]; then adb shell input tap $pos; sleep 8; fi
adb shell am force-stop "$PKG"
sleep 2
adb logcat -d > "$W/logcat-first-launch.txt"
adb logcat -c
open_video 31

# Jimaku attaches once the player's controls show: tap the middle of the 16:9 player until it has.
for attempt in 1 2 3 4 5 6; do
  sleep 10
  adb shell input tap $((SW / 2)) $((SH * 3 / 100 + SW * 9 / 32))
  sleep 2
  jimaku_log
  logged "Attached to the player overlay" && logged "Button placed in the top bar" && break
done
report "player taps: $attempt"
shot controls
dump controls
report "top: $(adb shell dumpsys activity activities | grep -m1 topResumedActivity | oneline)"

jimaku_log
adb logcat -d > "$W/logcat.txt"
report "--- Jimaku log ---"
cat "$W/logcat-jimaku.txt" >> "$W/report.txt"
report "--- Morphe log ---"
grep -E " morphe *:" "$W/logcat.txt" | cut -c1-220 | head -30 >> "$W/report.txt"
report "--- playback hints ---"
grep -i -E "sign in to confirm|not a bot|PlaybackException|LOGIN_REQUIRED|UNPLAYABLE|playability" "$W/logcat.txt" | cut -c1-220 | head -20 >> "$W/report.txt"
report "---"

for line in "Registered with Morphe" "Attached to the player overlay" "Button placed in the top bar"; do
  logged "$line" || fail_jimaku "Jimaku never logged \"$line\""
done
if cat "$W/logcat-first-launch.txt" "$W/logcat.txt" | grep -A2 "FATAL EXCEPTION" | grep -q "Process: $PKG"; then
  fail_jimaku "the app crashed (FATAL EXCEPTION in $PKG)"
fi
if grep -q -E " E Jimaku *:" "$W/logcat-first-launch.txt" "$W/logcat.txt"; then
  fail_jimaku "Jimaku logged an error"
fi
report "PASS: Jimaku registered, attached and placed its button"
