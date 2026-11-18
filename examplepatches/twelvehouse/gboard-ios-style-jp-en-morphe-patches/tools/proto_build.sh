#!/usr/bin/env bash
# Build, sign and install the apktool prototype on the connected device.
# Usage: tools/proto_build.sh <decoded_dir>
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${1:-$ROOT/_proto_x86}"
OUT="$ROOT/_build"
BT="$LOCALAPPDATA/Android/Sdk/build-tools/36.1.0"
mkdir -p "$OUT"
java -jar "$ROOT/_tools/apktool_3.0.3.jar" b "$SRC" -o "$OUT/proto-unsigned.apk" | tail -1
"$BT/zipalign" -f -P 16 4 "$OUT/proto-unsigned.apk" "$OUT/proto-aligned.apk"
"$BT/apksigner.bat" sign --ks "$HOME/.android/debug.keystore" --ks-pass pass:android --key-pass pass:android \
  --out "$OUT/proto.apk" "$OUT/proto-aligned.apk"
adb install -r "$OUT/proto.apk" | tail -1
