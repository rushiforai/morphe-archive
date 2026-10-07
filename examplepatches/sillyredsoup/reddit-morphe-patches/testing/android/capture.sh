#!/usr/bin/env bash
set -euo pipefail
umask 077
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
runtime_dir="${REDDIT_ANDROID_RUNTIME:-$(dirname "$repo_dir")/.android-testing}"
serial="${REDDIT_ANDROID_SERIAL:-emulator-5554}"
adb="$runtime_dir/sdk/platform-tools/adb"
label="${1:-$(date -u +%Y%m%dT%H%M%SZ)}"
if [[ ! "$label" =~ ^[A-Za-z0-9_-]+$ ]]; then
    echo "Capture label may contain only letters, numbers, underscores and hyphens." >&2
    exit 1
fi
capture_dir="$runtime_dir/captures/$label"
mkdir -p "$capture_dir"
"$adb" -s "$serial" emu screenrecord screenshot "$capture_dir/screen.png" \
    > "$capture_dir/screenshot-status.txt"
if [[ ! -s "$capture_dir/screen.png" ]]; then
    echo "Emulator screenshot failed. See $capture_dir/screenshot-status.txt" >&2
    exit 1
fi
"$adb" -s "$serial" logcat -d -t 1000 > "$capture_dir/logcat.txt"
"$adb" -s "$serial" logcat -b crash -d > "$capture_dir/crashes.txt"
if "$adb" -s "$serial" shell uiautomator dump /sdcard/window.xml \
    > "$capture_dir/ui-status.txt" 2>&1; then
    "$adb" -s "$serial" pull /sdcard/window.xml "$capture_dir/window.xml" \
        >> "$capture_dir/ui-status.txt" 2>&1
fi
echo "$capture_dir"
