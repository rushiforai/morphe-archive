#!/usr/bin/env bash
# Build script for Opera Beta 104 custom-universal APK v14.
#
# v14 = v13 with the REAL v12-crash root cause fixed: PT.1/PT.3 (bo3 menu-row
# removals) are rewritten verifier-safe. The v11-v13 form deleted the whole
# row-add block INCLUDING the const assignments that define v5/v6/v7 for the
# fall-through chain of invoke-static/range row-adds -> ART VerifyError:
#   bo3.invoke: [0x1D2] register v7 has type Precise Reference: ng but
#   expected Integer   (user logcat, 2026-11-16 17:35)
# v14 keeps every const (dead stores) and removes ONLY the invoke line.
#
# New gates vs v13:
#   [4b] miniverify.py — a Dalvik register-type checker over ALL patched
#        classes. Validated: stock/v10 bo3 PASS, v12/v13 bo3 FAIL @0x1D2
#        (ART-identical error). Any REJECT aborts the build.
#   [5]  bo3 exact-delta gate — v14 bo3 vs stock bo3 must differ ONLY by the
#        two removed invoke-static/range lines (label-normalized).
#
# Base: v12 APK (classes.dex = v12 bytes, stock asset layer); stock v9 dexes.
set -euo pipefail
cd "$(dirname "$0")"

W=..
CP="$W/tools/baksmali-2.5.2.jar:$W/tools/smali-2.5.2.jar:$W/tools/dexlib2-2.5.2.jar:$W/tools/util-2.5.2.jar:$W/tools/guava-33.2.1-jre.jar:$W/tools/jcommander-1.82.jar:$W/tools/antlr-runtime-3.5.3.jar"
VERSION=v14
OUT_NAME="OperaBeta-104.0.5262.91143-custom-${VERSION}-universal.apk"

echo "== [1] fresh disassembly of the STOCK v9 dexes"
rm -rf build-c1 build-c3 verify-c1 verify-c3 verify-off-c1 verify-off-c3
java -Xmx3g -cp "$CP" org.jf.baksmali.Main disassemble "$W/dex/v9/classes.dex"  -o build-c1
java -Xmx3g -cp "$CP" org.jf.baksmali.Main disassemble "$W/dex/v9/classes3.dex" -o build-c3

echo "== [2] apply patches (PT.1/PT.3 = v14 verifier-safe rewrite; AB.1-AB.4 disabled)"
python3 patches/apply.py apply build-c1 build-c3 "$VERSION"

echo "== [3] reassemble"
java -Xmx3g -cp "$CP" org.jf.smali.Main assemble build-c1 -o "${VERSION}-classes.dex"
java -Xmx3g -cp "$CP" org.jf.smali.Main assemble build-c3 -o "${VERSION}-classes3.dex"

echo "== [3b] class-set equality vs stock"
python3 - "${VERSION}-classes.dex"  "$W/dex/v9/classes.dex"  <<'EOF'
import sys
sys.path.insert(0, 'scripts')
from verify_v9 import dex_classes
a, b = dex_classes(open(sys.argv[1],'rb').read()), dex_classes(open(sys.argv[2],'rb').read())
assert a == b, "class set changed!"
print(f"OK classes.dex: {len(a)} classes identical")
EOF
python3 - "${VERSION}-classes3.dex" "$W/dex/v9/classes3.dex" <<'EOF'
import sys
sys.path.insert(0, 'scripts')
from verify_v9 import dex_classes
a, b = dex_classes(open(sys.argv[1],'rb').read()), dex_classes(open(sys.argv[2],'rb').read())
assert a == b, "class set changed!"
print(f"OK classes3.dex: {len(a)} classes identical")
EOF

echo "== [4] verify patches in the re-assembled output"
java -Xmx3g -cp "$CP" org.jf.baksmali.Main disassemble "${VERSION}-classes.dex"  -o verify-c1
java -Xmx3g -cp "$CP" org.jf.baksmali.Main disassemble "${VERSION}-classes3.dex" -o verify-c3
python3 patches/apply.py verify verify-c1 verify-c3 "$VERSION"

echo "== [4b] MINIVERIFY GATE: register-type check on every patched class"
java -Xmx3g -cp "$CP" org.jf.baksmali.Main disassemble --code-offsets "${VERSION}-classes.dex"  -o verify-off-c1
java -Xmx3g -cp "$CP" org.jf.baksmali.Main disassemble --code-offsets "${VERSION}-classes3.dex" -o verify-off-c3
python3 - <<'EOF'
import json, os, subprocess, sys
man = json.load(open('patches/manifest.json'))
targets = sorted({p['target'] for p in man['patches'] if p['enabled']})
files = []
for t in targets:
    for tree in ('verify-off-c1', 'verify-off-c3'):
        cand = os.path.join(tree, t)
        if os.path.isfile(cand):
            files.append(cand)
            break
    else:
        print(f"ERROR: patched target not found in either tree: {t}")
        sys.exit(1)
cmd = ['python3', 'scripts/miniverify.py',
       '--tree', 'verify-off-c1', '--tree', 'verify-off-c3',
       '--tree', '../forensics/v9-c1', '--tree', '../forensics/v9-c2',
       '--tree', '../forensics/off/v9', '--tree', '../forensics/v9-c4',
       '--tree', '../forensics/v9-c5'] + files
print(f"miniverify over {len(files)} patched classes:")
r = subprocess.run(cmd)
if r.returncode != 0:
    print("MINIVERIFY GATE FAILED - build aborted")
    sys.exit(1)
EOF

echo "== [5] bo3 exact-delta gate: v14 bo3 vs stock bo3 (label-normalized)"
python3 - verify-c3/bo3.smali "$W/dex/v9/classes3.dex" "$CP" <<'EOF'
import re, subprocess, sys, tempfile, os
v14_path, stock_dex, cp = sys.argv[1:4]
LABEL = re.compile(r":(?:cond|goto|pswitch|sswitch|catch|catchall|try_start|try_end)[_0-9a-zA-Z]*")
def norm(t):
    return [LABEL.sub(":L", l).rstrip() for l in t.split("\n") if l.strip()]
# disassemble ONLY stock bo3 for comparison via a tiny full pass
tmp = tempfile.mkdtemp()
subprocess.run(['java', '-Xmx3g', '-cp', cp, 'org.jf.baksmali.Main',
                'disassemble', stock_dex, '-o', tmp], check=True)
a = norm(open(v14_path, encoding='utf-8').read())
b = norm(open(os.path.join(tmp, 'bo3.smali'), encoding='utf-8').read())
import difflib
delta = [l for l in difflib.unified_diff(b, a, lineterm='', n=0)
         if l.startswith(('+', '-')) and not l.startswith(('+++', '---'))]
bad = [l for l in delta if 'invoke-static/range {v1 .. v7}, Ln6j;->c(' not in l]
invokes = [l for l in delta if 'invoke-static/range {v1 .. v7}, Ln6j;->c(' in l and l.startswith('-')]
print(f"delta lines: {len(delta)} (removed row-add invokes: {len(invokes)})")
for l in delta:
    print("   ", l)
assert len(invokes) == 2 and not bad, f"UNEXPECTED bo3 delta! invokes={len(invokes)} other={bad[:5]}"
print("bo3 gate OK: exactly the two row-add invokes removed, nothing else")
EOF

echo "== [6] splice into the v12 base (classes.dex = v12 bytes, zero delta)"
python3 - "$W/apks/v12.apk" "${VERSION}-classes3.dex" "${VERSION}-unsigned.apk" <<'EOF'
import sys, zipfile
src, dex3, dst = sys.argv[1:4]
zin = zipfile.ZipFile(src)
zout = zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED)
skip = {'classes.dex', 'classes3.dex',
        'META-INF/MANIFEST.MF', 'META-INF/OPERA-V9.SF', 'META-INF/OPERA-V9.RSA'}
for item in zin.infolist():
    n = item.filename
    if n in skip:
        continue
    newinfo = zipfile.ZipInfo(n, date_time=item.date_time)
    newinfo.compress_type = item.compress_type
    newinfo.external_attr = item.external_attr
    zout.writestr(newinfo, zin.read(n))
zout.writestr('classes.dex', zin.read('classes.dex'), compress_type=zipfile.ZIP_DEFLATED)
with open(dex3, 'rb') as f:
    zout.writestr('classes3.dex', f.read(), compress_type=zipfile.ZIP_DEFLATED)
zout.close()
z = zipfile.ZipFile(dst)
assert z.read('assets/op/abp.manifest') == zipfile.ZipFile(src).read('assets/op/abp.manifest')
print("spliced; asset layer stock (byte-identical abp.manifest)")
EOF

echo "== [7] sign (same keystore as v9-v13; in-place upgrade)"
rm -rf "${VERSION}-signed" && mkdir -p "${VERSION}-signed"
java -Xmx4g -jar "$W/tools/uber-apk-signer-1.3.0.jar" \
    -a "${VERSION}-unsigned.apk" \
    --ks "$W/tools/opera-custom-build.keystore" --ksAlias opera-v9 \
    --ksPass opera-v9-build-key --ksKeyPass opera-v9-build-key \
    -o "${VERSION}-signed"

echo "== [8] structural verification of the signed APK"
SIGNED=$(ls "${VERSION}-signed"/*.apk | grep -v idsig | head -1)
python3 scripts/verify_v9.py "$SIGNED" "$W/dex/v9"

echo "== [8b] final byte-level gates on the SIGNED apk"
python3 - "$SIGNED" "$W/apks/v12.apk" <<'EOF'
import hashlib, sys, zipfile
signed, base12 = sys.argv[1:3]
zs, zb = zipfile.ZipFile(signed), zipfile.ZipFile(base12)
# 1. classes.dex must be byte-identical to v12's
assert zs.read('classes.dex') == zb.read('classes.dex'), "classes.dex != v12 bytes"
print("OK classes.dex == v12 bytes (zero delta)")
# 2. asset layer identical
assert zs.read('assets/op/abp.manifest') == zb.read('assets/op/abp.manifest')
print("OK assets/op/abp.manifest == v12 (stock)")
# 3. entry diff vs v12 = classes3.dex only (META-INF excluded)
ds, db = set(zs.namelist()), set(zb.namelist())
diff = set()
for n in ds | db:
    if n.startswith('META-INF/'):
        continue
    if n not in ds or n not in db or zs.read(n) != zb.read(n):
        diff.add(n)
print(f"content-differing entries vs v12 (excl. META-INF): {sorted(diff)}")
assert diff == {'classes3.dex'}, f"unexpected entry delta: {diff}"
print("OK entry delta vs v12 = classes3.dex only")
EOF

echo "== [9] regenerate PATCHES.md ledger"
python3 patches/gen_patch_md.py "$VERSION"

mkdir -p "$W/../download"
cp "$SIGNED" "$W/../download/$OUT_NAME"
echo "== done: download/$OUT_NAME"
sha256sum "$W/../download/$OUT_NAME"
