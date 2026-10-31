#!/bin/bash
# SPDX-FileCopyrightText: 2026 JoanComasFdz
# SPDX-License-Identifier: GPL-3.0-only
# Small screenshot of the emulator for looking at the screen: one 540x960 JPEG (~25–65 KB depending on the screen, ~2–3 s),
# taken from a 1 s screenrecord, instead of a full PNG (~470 KB, ~5 s over the slow link).
# Usage: tools/e2e/screenshot.sh [out.jpg]   (after `source tools/e2e/connect.sh`)
set -euo pipefail
out=${1:-.e2e/screen.jpg}
mkdir -p "$(dirname "$out")"
adb -s "${E2E_ADB_SERIAL:-127.0.0.1:15555}" exec-out \
  screenrecord --time-limit 1 --size 540x960 --bit-rate 1000000 --output-format=h264 - |
  ffmpeg -loglevel error -y -f h264 -i - -frames:v 1 -q:v 4 "$out"
echo "$out"
