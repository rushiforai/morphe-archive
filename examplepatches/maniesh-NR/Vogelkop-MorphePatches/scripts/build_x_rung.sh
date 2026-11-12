#!/usr/bin/env bash
# build_x_rung.sh — X-rung: v1.3.1-R3 fresh-install waiter bypass (2026-11-12).
#
# W-rung verdicts this builds on:
#   W1 -> boots (four-innocent combo cleared).
#   W2 -> all R2 patches behave as designed, but first-run finalization
#         freezes at the m9k startup-dependency waiter ("Almost there!" /
#         black screen; see STATE.md §W2 post-mortem). Root cause: on fresh
#         installs (version_code == 0) the flow driver waits for remote
#         config (j9k) + Leanplum/Braze (bac) or a umi-scheduled timeout,
#         none of which fire in the patched flow.
#
# Builds (both = C1 substrate + spliced rebuilt classes3.dex + the four
# proven-innocent binary patches):
#   X1 = W2 dex + 02f (m9k waiter starts TRUE)                — differential
#   X2 = W2 dex + 02f + 02h (q0o.f() hch-splash posting dead) — feature candidate
#
# Preconditions (this session, recycle #3 layout):
#   /home/z/my-project/work/dl/C1-morphe-v130-nospoof-v123.apk     (substrate)
#   /home/z/my-project/work/dl/morphe.keystore                     (signing key)
#   /home/z/my-project/work/xbuild/new_classes3_x{1,2}.dex         (assembled)
#   /home/z/my-project/work/tools/android-14/{zipalign,apksigner}
set -euo pipefail

REPO=/home/z/my-project/.harness/vogelkop
DL=/home/z/my-project/work/dl
BT=/home/z/my-project/work/tools/android-14
WORK=/home/z/my-project/work/xbuild
KS=$DL/morphe.keystore
SUB=$DL/C1-morphe-v130-nospoof-v123.apk

cd "$REPO"

build () {  # build <tag> <substrate>
  local TAG=$1; local SUBSTRATE=$2
  echo "================ $TAG ================"
  python3 scripts/v131_binary_patch.py --only 02b,02c,03b,03c \
    --patch "$SUBSTRATE" "$WORK/$TAG-patched.apk"
  "$BT/zipalign" -f -p 4 "$WORK/$TAG-patched.apk" "$WORK/$TAG-aligned.apk"
  "$BT/zipalign" -c -p 4 "$WORK/$TAG-aligned.apk" >/dev/null && echo "  zipalign OK"
  "$BT/apksigner" sign \
    --ks "$KS" --ks-pass pass:Morphe \
    --ks-key-alias morphe --key-pass pass:Morphe \
    --v1-signing-enabled true --v2-signing-enabled true \
    --v3-signing-enabled true \
    --out "$DL/${TAG}-rung-universal_signed.apk" "$WORK/$TAG-aligned.apk"
  "$BT/apksigner" verify --min-sdk-version 24 "$DL/${TAG}-rung-universal_signed.apk" \
    && echo "  apksigner OK"
}

python3 scripts/splice_entry.py \
  --src "$SUB" --entry classes3.dex --file "$WORK/new_classes3_x1.dex" \
  --out "$WORK/X1-spliced.apk"
build X1 "$WORK/X1-spliced.apk"

python3 scripts/splice_entry.py \
  --src "$SUB" --entry classes3.dex --file "$WORK/new_classes3_x2.dex" \
  --out "$WORK/X2-spliced.apk"
build X2 "$WORK/X2-spliced.apk"

echo
echo "=== entry-level diff vs C1 ==="
python3 - <<'EOF'
import zipfile
base = {i.filename: (i.CRC, i.file_size) for i in zipfile.ZipFile(
    '/home/z/my-project/work/dl/C1-morphe-v130-nospoof-v123.apk').infolist()}
for tag in ('X1', 'X2'):
    zf = zipfile.ZipFile(f'/home/z/my-project/work/dl/{tag}-rung-universal_signed.apk')
    changed = [i.filename for i in zf.infolist()
               if base.get(i.filename) != (i.CRC, i.file_size)]
    print(f'{tag}: {len(changed)} changed entry(ies): {changed}')
EOF

echo
echo "=== sha256 ==="
sha256sum "$DL"/X1-*.apk "$DL"/X2-*.apk "$WORK"/new_classes3_x1.dex "$WORK"/new_classes3_x2.dex
echo "X-RUNG BUILD DONE"
