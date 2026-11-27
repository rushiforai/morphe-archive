#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
: "${GEMINIPATCH_STORE_PASS:?Set GEMINIPATCH_STORE_PASS in .env or the environment}"
export GEMINIPATCH_STORE_PASS
KEYSTORE_PATH="${KEYSTORE_PATH:-local/keys/gemini-debug.p12}"
[[ "$KEYSTORE_PATH" = /* ]] || KEYSTORE_PATH="$ROOT/$KEYSTORE_PATH"
KEY_ALIAS="${KEY_ALIAS:-geminipatch}"
SIGNER="${APKSIGNER:-$ANDROID_HOME/build-tools/36.0.0/apksigner}"
require_file "$KEYSTORE_PATH"
[[ -x "$SIGNER" ]] || fail 'Install Android SDK Build Tools 36.0.0 or set APKSIGNER.'
for name in google-login split_config.xxhdpi gemini-login; do require_file "$BUILD_DIR/$name-unsigned.apk"; done
"$ROOT/scripts/verify-clone-contract.sh" "$ROOT/inputs/google-base.apk" "$BUILD_DIR/google-login-unsigned.apk"
"$ROOT/scripts/verify-clone-contract.sh" "$ROOT/inputs/gemini-base.apk" "$BUILD_DIR/gemini-login-unsigned.apk"
# Keep the last successful dist intact if signing or verification fails.
staging="$(mktemp -d "$BUILD_DIR/sign.XXXXXX")"
trap 'rm -rf "$staging"' EXIT
for name in google-login split_config.xxhdpi gemini-login; do
  "$SIGNER" sign --ks "$KEYSTORE_PATH" --ks-key-alias "$KEY_ALIAS" \
    --ks-pass env:GEMINIPATCH_STORE_PASS --key-pass env:GEMINIPATCH_STORE_PASS \
    --out "$staging/$name.apk" "$BUILD_DIR/$name-unsigned.apk"
  "$SIGNER" verify --verbose "$staging/$name.apk"
done
mkdir -p "$DIST_DIR"
cp "$staging/"*.apk "$DIST_DIR/"
cp "$BUILD_DIR/gemini-patches.jar" "$DIST_DIR/"
(
  cd "$DIST_DIR"
  export LC_ALL=C
  printf '%s\n' ./*.apk ./gemini-patches.jar | cut -c 3- | sort |
    while IFS= read -r name; do shasum -a 256 -- "$name"; done
) > "$DIST_DIR/SHA256SUMS"
printf 'Signed and verified APKs: %s\n' "$DIST_DIR"
