#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/common.sh"
"$ROOT/scripts/check-inputs.sh"
fixture="$ROOT/local/issue8/fixtures"
mkdir -p "$fixture/baseline-src"
# The original licensed APK is provided locally; do not upload these fixtures.
git -C "$ROOT" archive v0.3.0 src/main/kotlin | tar -x -C "$fixture/baseline-src"
"$KOTLINC" "$fixture/baseline-src/src/main/kotlin" -cp "$MORPHE" -d "$fixture/baseline-patches.jar"
"$ROOT/scripts/patch-apk.sh" "$ROOT/inputs/google-base.apk" "$fixture/baseline.apk" "$fixture/baseline.json" \
  -p "$fixture/baseline-patches.jar" -p "$PATCHES" -e 'Clone app' \
  -O packageName=Default -O updatePermissions=true -O updateProviders=true
"$ROOT/scripts/patch-apk.sh" "$ROOT/inputs/google-base.apk" "$fixture/bad.apk" "$fixture/bad.json" \
  --exclusive -p "$BUILD_DIR/gemini-patches.jar" -e 'Google App Manifest Tweaks' \
  -p "$PATCHES" -e 'Clone app' -O packageName=com.quicksearch.bond -O updatePermissions=false -O updateProviders=true
: "${GEMINIPATCH_STORE_PASS:?Set local signing environment first}"
export GEMINIPATCH_STORE_PASS
key="${KEYSTORE_PATH:-local/keys/gemini-release.p12}"
[[ "$key" = /* ]] || key="$ROOT/$key"
for name in baseline bad; do
  "$ANDROID_HOME/build-tools/36.0.0/apksigner" sign --ks "$key" --ks-key-alias "${KEY_ALIAS:-geminipatch}" \
    --ks-pass env:GEMINIPATCH_STORE_PASS --key-pass env:GEMINIPATCH_STORE_PASS \
    --out "$fixture/$name-signed.apk" "$fixture/$name.apk"
done
printf 'Emulator fixtures only (never distribute): %s\n' "$fixture"
