#!/usr/bin/env bash
# Reset the prototype IME on the emulator and set it up the way it is tested:
# English + Japanese 12-key, number row on, comma and period keys off.
# Usage: tools/proto_setup.sh
set -u
cd "$(dirname "$0")/.."
source tools/adbui.sh
P=com.google.android.inputmethod.latin.iosflick
ID=$P/com.android.inputmethod.latin.LatinIME

timeout 30 adb shell pm clear $P >/dev/null
timeout 10 adb shell ime enable $ID >/dev/null
timeout 10 adb shell ime set $ID >/dev/null
timeout 20 adb shell monkey -p $P -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
sleep 4
ui_tap DONE; sleep 2

# Japanese 12-key
ui_tap Languages; sleep 1.5
ui_tap "Add keyboard"; sleep 1.5
ui_tap "Search language"; sleep 1.5
timeout 10 adb shell input text Japan; sleep 2
ui_tap "日本語"; sleep 2
ui_tap Done; sleep 2
timeout 10 adb shell input keyevent BACK; sleep 1

# Preferences
ui_tap Preferences; sleep 1.5
ui_tap "Number row"; sleep 0.7
ui_tap "Comma key"; sleep 0.7
ui_tap "Period key"; sleep 0.7
timeout 10 adb shell input keyevent BACK; sleep 1

# Open a text field
ui_tap Languages; sleep 1.5
ui_tap "Add keyboard"; sleep 1.5
ui_tap "Search language"; sleep 2
