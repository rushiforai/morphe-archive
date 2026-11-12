#!/usr/bin/env bash
# build_w_rung.sh — W-rung: v1.3.1-R2 fix round (2026-11-11).
#
# S-rung verdicts this builds on:
#   S1 (02a old)   -> HANG at "Almost there"   : 02a convicted (read-bypass never
#                     wrote eula_accepted.gdpr; flow state machine deadlocked).
#   S2 (03a)       -> instant crash            : 03a convicted (manifest component
#                     removal breaks startup resolution).
#   S3/S4/S5/S6    -> boot fine                : 03c/02b/02c/03b innocent
#                     (02b/02c/03b inert for the onboarding dialogs, but harmless).
#
# Builds:
#   W1 = C1 + {02b, 02c, 03b, 03c-extended}      (binary patcher only)
#        Combination check of the four innocent patches + extended string blanks.
#   W2 = C1 + smali-rebuilt classes3.dex (02a' auto-accept, step-condition kills,
#        nt8 emptied) + {02b, 02c, 03b, 03c-extended}
#        The full v1.3.1-R2 feature candidate.
#
# smali edits in the rebuilt classes3.dex (see docs/v1.3.1-R2/):
#   02a'  WelcomeActivity site#1: eula read -> const/4 v4,0x1 (skip EULA leaf)
#   02a'  WelcomeActivity site#2 :cond_9: N().e.r(k0n(14) posting) -> invoke X()V
#         (X = the real T&C accept handler: writes eula_accepted.gdpr, m9k.S(),
#          W() -> flow continues; identical state to a real button press)
#   02d   cfn case 0x8  canOfferDefaultBrowser -> false (DEFAULT_BROWSER step dead)
#   02e   cfn case 0xc  isCmpIntroductionDue   -> false (CMP_INTRO step dead)
#   02e   cfn case 0xd  e0o.shouldShow         -> false (CONSENT screen dead)
#   03d   nt8 <clinit>: ESIM + VPN_PRO entries removed -> empty values array
#         (omnibox feature-suggestion chips gone; no valueOf callers anywhere)
set -euo pipefail

REPO=/home/z/my-project/work/Vogelkop-MorphePatches
DL=/home/z/my-project/work/dl
BT=/home/z/my-project/work/tools/android-14
WORK=/home/z/my-project/work/wbuild
KS=$DL/morphe.keystore
SUB=$DL/C1-morphe-v130-nospoof-v123.apk
NEWC3=$WORK/new_classes3.dex

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

build W1 "$SUB"

python3 scripts/splice_entry.py \
  --src "$SUB" --entry classes3.dex --file "$NEWC3" \
  --out "$WORK/W2-spliced.apk"
build W2 "$WORK/W2-spliced.apk"

echo
echo "=== entry-level diff vs C1 ==="
python3 - <<'EOF'
import zipfile
base = {i.filename: (i.CRC, i.file_size) for i in zipfile.ZipFile(
    '/home/z/my-project/work/dl/C1-morphe-v130-nospoof-v123.apk').infolist()}
for tag in ('W1', 'W2'):
    zf = zipfile.ZipFile(f'/home/z/my-project/work/dl/{tag}-rung-universal_signed.apk')
    changed = [n for i in zf.infolist()
               if base.get(i.filename) != (i.CRC, i.file_size)]
    print(f'{tag}: {len(changed)} changed entry(ies): {changed}')
EOF

echo
echo "=== sha256 ==="
sha256sum "$DL"/W1-*.apk "$DL"/W2-*.apk
echo "W-RUNG BUILD DONE"
