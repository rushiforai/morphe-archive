#!/usr/bin/env bash
# build_binary_v131.sh — E-rung build: v1.3.1 patches at BYTE level (no apktool).
# See docs/v1.3.1/BINARY-BUILD.md for the full pipeline description.
#
# Usage:
#   scripts/build_binary_v131.sh <substrate.apk> <out_signed.apk> [workdir]
#
# Substrate must be a universal (merged) APK:
#   E1: APKEditor merge of stock base.apk + 46 splits (B0b method)
#   E2: C1-morphe-v130-nospoof-v123.apk (from the sandbox-storage release)
set -euo pipefail

SUB=$1
OUT=$2
WORK=${3:-build_binary_work}

command -v python3 >/dev/null || { echo "python3 required"; exit 1; }
BT=${BT:-$HOME/android-build-tools}   # dir containing zipalign + apksigner
KS=${KS:-morphe.keystore}

mkdir -p "$WORK"

echo "[1/4] binary patch"
python3 scripts/v131_binary_patch.py --inspect "$SUB"
python3 scripts/v131_binary_patch.py --patch "$SUB" "$WORK/patched.apk"

echo "[2/4] zipalign"
"$BT/zipalign" -f -p 4 "$WORK/patched.apk" "$WORK/aligned.apk"
"$BT/zipalign" -c -p 4 "$WORK/aligned.apk"

echo "[3/4] sign (v1+v2+v3)"
"$BT/apksigner" sign \
  --ks "$KS" --ks-pass pass:Morphe \
  --ks-key-alias morphe --key-pass pass:Morphe \
  --v1-signing-enabled true --v2-signing-enabled true \
  --v3-signing-enabled true \
  --out "$OUT" "$WORK/aligned.apk"
"$BT/apksigner" verify --min-sdk-version 24 --verbose "$OUT" | head -6

echo "[4/4] validate"
python3 scripts/validate_build.py "$OUT" "$SUB"

sha256sum "$OUT"
echo "DONE: $OUT"
