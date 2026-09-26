#!/usr/bin/env bash
# Sign the patched base APK plus the original split APKs with one shared key.
# Produces an installable split set under out/signed/.
# Every split in an install set must be signed with the same key, or the
# package manager rejects the install (INSTALL_FAILED_INVALID_APK /
# signature mismatch).
#
# Override these settings in the environment to reuse the script for another app:
#   APP_NAME             keystore name (default: ather)
#   SPLITS               config split names under base/, space separated
#                        (default: config.arm64_v8a config.en config.mdpi)
#   SRC_SPLITS_DIR       directory with the original config.*.apk (default: base)
#   PATCHED_BASE         unsigned patched base APK (default: build/base-unsigned.apk)
#   OUT_DIR              signed output directory (default: out/signed)
#   KS                   signing keystore (default: keystore/<APP_NAME>-morphe.jks)
#   KS_PASS              keystore password (default: <APP_NAME>patch)
#   KS_ALIAS             key alias (default: <APP_NAME>)
#   ANDROID_HOME         Android SDK (default: ~/Library/Android/sdk)
#   BUILD_TOOLS_VERSION  build-tools revision (default: 37.0.0)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
APP_NAME="${APP_NAME:-ather}"
ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
BUILD_TOOLS_VERSION="${BUILD_TOOLS_VERSION:-37.0.0}"
BT="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION"
KS="${KS:-$ROOT/keystore/$APP_NAME-morphe.jks}"
KS_PASS="${KS_PASS:-${APP_NAME}patch}"
export KS_PASS
KS_ALIAS="${KS_ALIAS:-$APP_NAME}"
SPLITS="${SPLITS:-config.arm64_v8a config.en config.mdpi}"

SRC_SPLITS_DIR="${SRC_SPLITS_DIR:-$ROOT/base}"  # original config.*.apk live here
PATCHED_BASE="${PATCHED_BASE:-$ROOT/build/base-unsigned.apk}"
OUT_DIR="${OUT_DIR:-$ROOT/out/signed}"

if [ -z "$OUT_DIR" ] || [ "$OUT_DIR" = "/" ]; then
  echo "refusing to remove OUT_DIR '$OUT_DIR'" >&2
  exit 1
fi
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

align_and_sign() {
  local in="$1" name="$2"
  local aligned="$OUT_DIR/${name}.aligned.apk"
  local final="$OUT_DIR/${name}.apk"
  "$BT/zipalign" -p -f 4 "$in" "$aligned"
  "$BT/apksigner" sign \
    --ks "$KS" --ks-pass env:KS_PASS --ks-key-alias "$KS_ALIAS" \
    --v1-signing-enabled true --v2-signing-enabled true \
    --v3-signing-enabled true --v4-signing-enabled false \
    --out "$final" "$aligned"
  rm -f "$aligned" "${final}.idsig"
  echo "signed: $final"
}

align_and_sign "$PATCHED_BASE" "base"
INSTALL_APKS="$OUT_DIR/base.apk"
for s in $SPLITS; do
  align_and_sign "$SRC_SPLITS_DIR/${s}.apk" "$s"
  INSTALL_APKS="$INSTALL_APKS $OUT_DIR/$s.apk"
done

echo
echo "Verifying signatures:"
for f in "$OUT_DIR"/*.apk; do
  echo "== $(basename "$f") =="
  "$BT/apksigner" verify --print-certs "$f" | grep -E 'Signer #1 certificate SHA-256|Verified using' || true
done

echo
echo "Install set ready in: $OUT_DIR"
echo "Install with the phone connected:"
echo "  adb install-multiple $INSTALL_APKS"
