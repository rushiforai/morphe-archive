#!/usr/bin/env bash
# Grab a README screenshot from the connected phone, crop the status bar, resize to 520px
# (shown at 260px, sharp on retina). Usage: docs/screenshots/shot.sh <name> [top_px] [bottom_px]
#   docs/screenshots/shot.sh after-home   -> docs/screenshots/after-home.png
set -euo pipefail
name="${1:?usage: docs/screenshots/shot.sh <name> [top_px] [bottom_px]}"
top="${2:-110}" bottom="${3:-0}"
out="$(dirname "$0")/$name.png"
tmp="$(mktemp --suffix=.png)"
adb exec-out screencap -p > "$tmp"
ffmpeg -loglevel error -y -i "$tmp" -vf "crop=iw:ih-$top-$bottom:0:$top,scale=520:-1" "$out"
rm "$tmp"
echo "$out"
