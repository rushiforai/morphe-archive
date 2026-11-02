#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Small screenshot of the device for looking at the screen: one JPEG 576 px wide in the screen's shape (~25–65 KB
# depending on the screen, ~2–3 s), taken from a 1 s screenrecord, instead of a full PNG (~470 KB, ~5 s over the slow
# link). The size is the recordings' (Device/ScreenRecording): 576x1248 on the phone's 1080x2340.
# Usage: tools/e2e/screenshot.sh [out.jpg]   (after `source tools/e2e/connect.sh`)
set -euo pipefail
out=${1:-.e2e/screen.jpg}
mkdir -p "$(dirname "$out")"
serial=${E2E_ADB_SERIAL:-127.0.0.1:15555}
# "Physical size: 1080x1920", and "Override size: …" after it when one is set.
size=$(adb -s "$serial" shell wm size | tr -d '\r' | tail -n 1 | sed 's/.*: //' |
  awk -Fx '{ printf "576x%d", int(576 * $2 / $1 / 16 + 0.5) * 16 }')
adb -s "$serial" exec-out \
  screenrecord --time-limit 1 --size "$size" --bit-rate 1000000 --output-format=h264 - |
  ffmpeg -loglevel error -y -f h264 -i - -frames:v 1 -q:v 4 "$out"
echo "$out"
