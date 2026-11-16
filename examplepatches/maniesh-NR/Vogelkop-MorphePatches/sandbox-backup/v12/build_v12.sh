#!/usr/bin/env bash
# Build script for Opera Beta 104 custom-universal APK v12+.
#
# Differences vs v11 (see work/DIAGNOSIS-v12.md):
#   * FIX: the v11 abp asset surgery corrupted abp.manifest (ADBLOCK_CSS count)
#     -> startup crash. v12 ships the STOCK v9 asset layer untouched:
#        no abp pipeline, no manifest rebuild, no asset replacement.
#   * NEW: blocklist updater redirects to original maintainers (AB.1-AB.4,
#     patches/adblock/updater_redirect.py + updater_map.json).
#   [1] fresh disassembly of the two target dexes (stock v9 content)
#   [2] patches/apply.py apply    - every patch anchor must match exactly,
#                                   otherwise the build ABORTS
#   [3] smali reassembly + class-set equality vs stock
#   [4] patches/apply.py verify   - re-disassembled output re-checked
#   [5] splice patched dexes into the stock-asset base (assets untouched)
#   [6] zipalign -p + sign v1/v2/v3 (same key as v9/v10: in-place upgrade)
#   [7] structural verification of the final signed APK
#   [8] regenerate patches/PATCHES.md ledger
set -euo pipefail
cd "$(dirname "$0")"

W=work
V=work/v12
SMALI_CP="tools/baksmali-2.5.2.jar:tools/smali-2.5.2.jar:tools/dexlib2-2.5.2.jar:tools/util-2.5.2.jar:tools/guava-33.2.1-jre.jar:tools/jcommander-1.82.jar:tools/antlr-runtime-3.5.3.jar"
VERSION="${VERSION:-v12}"
OUT_NAME="OperaBeta-104.0.5262.91143-custom-${VERSION}-universal.apk"

echo "== [1] fresh disassembly (stock dexes from the v9 base)"
rm -rf "$V/build-c1" "$V/build-c3"
java -Xmx3g -cp "$SMALI_CP" org.jf.baksmali.Main disassemble "$W/dex/base/classes.dex" -o "$V/build-c1"
java -Xmx3g -cp "$SMALI_CP" org.jf.baksmali.Main disassemble "$W/dex/base/classes3.dex" -o "$V/build-c3"

echo "== [2] apply patches (fails loudly on any anchor mismatch)"
python3 patches/apply.py apply "$V/build-c1" "$V/build-c3" "$VERSION"

echo "== [3] reassemble"
java -Xmx3g -cp "$SMALI_CP" org.jf.smali.Main assemble "$V/build-c1" -o "$V/${VERSION}-classes.dex"
java -Xmx3g -cp "$SMALI_CP" org.jf.smali.Main assemble "$V/build-c3" -o "$V/${VERSION}-classes3.dex"

echo "== [3b] class-set equality vs stock"
python3 - "$V/${VERSION}-classes.dex" "$W/dex/base/classes.dex" <<'EOF'
import sys
sys.path.insert(0, 'scripts')
from verify_v9 import dex_classes
a = dex_classes(open(sys.argv[1],'rb').read())
b = dex_classes(open(sys.argv[2],'rb').read())
assert a == b, f"class set changed! missing={sorted(b-a)[:10]} extra={sorted(a-b)[:10]}"
print(f"OK classes.dex: {len(a)} classes identical")
EOF
python3 - "$V/${VERSION}-classes3.dex" "$W/dex/base/classes3.dex" <<'EOF'
import sys
sys.path.insert(0, 'scripts')
from verify_v9 import dex_classes
a = dex_classes(open(sys.argv[1],'rb').read())
b = dex_classes(open(sys.argv[2],'rb').read())
assert a == b, f"class set changed! missing={sorted(b-a)[:10]} extra={sorted(a-b)[:10]}"
print(f"OK classes3.dex: {len(a)} classes identical")
EOF

echo "== [4] verify patches inside the RE-ASSEMBLED output (the guarantee)"
rm -rf "$V/verify-c1" "$V/verify-c3"
java -Xmx3g -cp "$SMALI_CP" org.jf.baksmali.Main disassemble "$V/${VERSION}-classes.dex" -o "$V/verify-c1"
java -Xmx3g -cp "$SMALI_CP" org.jf.baksmali.Main disassemble "$V/${VERSION}-classes3.dex" -o "$V/verify-c3"
python3 patches/apply.py verify "$V/verify-c1" "$V/verify-c3" "$VERSION"

echo "== [5] splice patched dexes into the stock-asset v9 base (NO asset changes)"
python3 - "$W/v9-unsigned.apk" "$V/${VERSION}-classes.dex" "$V/${VERSION}-classes3.dex" \
         "$V/${VERSION}-unsigned.apk" <<'EOF'
import sys
import zipfile

src, dex1, dex3, dst = sys.argv[1:5]
zin = zipfile.ZipFile(src)
zout = zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED)
replaced = {'classes.dex', 'classes3.dex'}
dropped = set()
for item in zin.infolist():
    n = item.filename
    if n in replaced:
        dropped.add(n)
        continue
    data = zin.read(n)
    newinfo = zipfile.ZipInfo(n, date_time=item.date_time)
    newinfo.compress_type = item.compress_type
    newinfo.external_attr = item.external_attr
    zout.writestr(newinfo, data)
assert dropped == {'classes.dex', 'classes3.dex'}, dropped
for name, path in (('classes.dex', dex1), ('classes3.dex', dex3)):
    zout.write(path, name, compress_type=zipfile.ZIP_DEFLATED)
zout.close()
# sanity: stock asset layer must be present and untouched
z = zipfile.ZipFile(dst)
assert z.read('assets/op/abp.manifest') == zipfile.ZipFile(src).read('assets/op/abp.manifest'), \
    "abp.manifest changed - asset layer must stay stock"
n_abp = len([x for x in z.namelist() if x.startswith('assets/abp_files/op/')])
print(f"wrote {dst}; bundled abp files = {n_abp} (stock)")
EOF
ls -la "$V/${VERSION}-unsigned.apk"

echo "== [6] zipalign (page) + sign v1/v2/v3 (v9/v10 key: in-place upgrade)"
rm -rf "$V/${VERSION}-signed" && mkdir -p "$V/${VERSION}-signed"
java -Xmx4g -jar tools/uber-apk-signer.jar \
    -a "$V/${VERSION}-unsigned.apk" \
    --ks work/opera-v9.keystore --ksAlias opera-v9 \
    --ksPass opera-v9-build-key --ksKeyPass opera-v9-build-key \
    -o "$V/${VERSION}-signed"

echo "== [7] structural verification of the final signed APK"
python3 scripts/verify_v9.py "$(ls "$V/${VERSION}-signed"/*.apk | head -1)" "$W/dex/base"

echo "== [8] regenerate PATCHES.md ledger"
python3 patches/gen_patch_md.py "$VERSION"

SIGNED=$(ls "$V/${VERSION}-signed"/*.apk | head -1)
cp "$SIGNED" "download/$OUT_NAME"
echo "== done: download/$OUT_NAME"
sha256sum "download/$OUT_NAME"
