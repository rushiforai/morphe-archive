#!/usr/bin/env bash
# Small adb UI helpers for driving the emulator from Git Bash.
# Usage: source tools/adbui.sh; ui_texts; ui_tap "Languages"; ui_shot out.png
export MSYS_NO_PATHCONV=1

ui_dump() {
  adb shell uiautomator dump /sdcard/ui.xml >/dev/null 2>&1
  adb shell cat /sdcard/ui.xml
}

# Print every node with text or content-desc and its bounds.
ui_texts() {
  ui_dump | grep -oE '<node [^>]*>' | grep -E 'text="[^"]+"|content-desc="[^"]+"' |
    sed -E 's/.*text="([^"]*)".*content-desc="([^"]*)".*bounds="([^"]*)".*/\1 | \2 | \3/'
}

# Tap the center of the first node whose text or content-desc equals $1.
ui_tap() {
  local b
  b=$(ui_dump | grep -oE '<node [^>]*>' | grep -E "(text|content-desc)=\"$1\"" | head -1 | grep -oE 'bounds="[^"]*"')
  if [ -z "$b" ]; then echo "not found: $1" >&2; return 1; fi
  read -r x1 y1 x2 y2 <<<"$(echo "$b" | grep -oE '[0-9]+' | tr '\n' ' ')"
  adb shell input tap $(((x1 + x2) / 2)) $(((y1 + y2) / 2))
}

ui_shot() {
  adb exec-out screencap -p >"$1"
}
