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
python3 - "$DIST_DIR" <<'PY'
from pathlib import Path
import hashlib, sys
root = Path(sys.argv[1])
files = sorted([*root.glob('*.apk'), root / 'gemini-patches.jar'])
(root / 'SHA256SUMS').write_text(''.join(hashlib.sha256(p.read_bytes()).hexdigest() + '  ' + p.name + '\n' for p in files))
PY
printf 'Signed and verified APKs: %s\n' "$DIST_DIR"
