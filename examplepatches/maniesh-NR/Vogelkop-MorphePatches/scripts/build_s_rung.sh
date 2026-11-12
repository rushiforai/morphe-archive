#!/usr/bin/env bash
# build_s_rung.sh — S-rung: single-patch bisect builds + null-patch control.
# All on the C1 substrate (boots on device, carries startup diagnostics).
#   N0 = C1, patcher zip-rewrite ONLY, zero semantic patches  (pipeline control)
#   S1 = C1 + 02a only   (WelcomeActivity eula force-accept, 4 sites)
#   S2 = C1 + 03a only   (manifest: 3 VpnPro components cut)
#   S3 = C1 + 03c only   (resources.arsc: 5 vpn_pro strings -> " ")
#   S4 = C1 + 02b only   (r65.l CMP gate, FIXED single-byte flip)
#   S5 = C1 + 02c only   (mm6.e default-browser gate -> false)
#   S6 = C1 + 03b only   (wdn.a()Z -> false)
set -euo pipefail

REPO=/home/z/my-project/work/repo
DL=/home/z/my-project/work/dl
BT=/home/z/my-project/work/tools/android-14/android-14
OUT=/home/z/my-project/work/dl
WORK=/home/z/my-project/work/sbuild
KS=$DL/morphe.keystore
SUB=$DL/C1-morphe-v130-nospoof-v123.apk

mkdir -p "$WORK"
cd "$REPO"

build () {  # build <tag> <patcher-flags...>
  local TAG=$1; shift
  echo "================ $TAG ================"
  python3 scripts/v131_binary_patch.py "$@" --patch "$SUB" "$WORK/$TAG-patched.apk"
  "$BT/zipalign" -f -p 4 "$WORK/$TAG-patched.apk" "$WORK/$TAG-aligned.apk"
  "$BT/zipalign" -c -p 4 "$WORK/$TAG-aligned.apk" >/dev/null && echo "  zipalign OK"
  "$BT/apksigner" sign \
    --ks "$KS" --ks-pass pass:Morphe \
    --ks-key-alias morphe --key-pass pass:Morphe \
    --v1-signing-enabled true --v2-signing-enabled true \
    --v3-signing-enabled true \
    --out "$OUT/${TAG}-rung-universal_signed.apk" "$WORK/$TAG-aligned.apk"
  "$BT/apksigner" verify --min-sdk-version 24 "$OUT/${TAG}-rung-universal_signed.apk" \
    && echo "  apksigner OK"
  rm -f "$WORK/$TAG-patched.apk" "$WORK/$TAG-aligned.apk"
}

build N0 --no-patches
build S1 --only 02a
build S2 --only 03a
build S3 --only 03c
build S4 --only 02b
build S5 --only 02c
build S6 --only 03b

echo
echo "=== sha256 ==="
sha256sum "$OUT"/N0-*.apk "$OUT"/S[1-6]-*.apk
echo "S-RUNG BUILD DONE"
