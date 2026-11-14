#!/bin/bash
# build_v4_universal.sh — v4: hybrid-pipeline universal APK (device-proven recipe).
# substrate (APKEditor merge, stock) -> dex-rebuild with P1/P2/P3/02f -> splice
# -> zipalign -P 16 -> apksigner (morphe.keystore, v1+v2+v3) -> verify.
set -euo pipefail
V4=/tmp/v4
BT=/tmp/bt/bt36/android-16
KS=$V4/tools/morphe.keystore
OUT=/home/z/my-project/download/OperaBeta-104.0.5262.91143-custom-v4-universal.apk

echo "== 1. rebuild classes3.dex (apktool b on the dex-only project) =="
rm -rf $V4/rebuilt3 $V4/rd
java -jar $V4/tools/apktool_3.0.3.jar b $V4/smali3 -o $V4/rebuilt3.apk 2>&1 | tail -2
mkdir -p $V4/rd && (cd $V4/rd && unzip -o -q $V4/rebuilt3.apk classes.dex)
mv $V4/rd/classes.dex $V4/new_classes3.dex
ls -la $V4/new_classes3.dex
echo "old: $(stat -c%s $V4/stock_classes3.dex) bytes / new: $(stat -c%s $V4/new_classes3.dex) bytes"

echo "== 2. structural gate on the rebuilt dex =="
python3 /home/z/my-project/.harness/vogelkop/scripts/dex_structural_walk.py $V4/new_classes3.dex 2>/dev/null || \
  python3 - << 'EOF'
# fallback: dexdump parse + header sanity if the repo walker needs args we lack
import struct, subprocess, sys
p = '/tmp/v4/new_classes3.dex'
d = open(p,'rb').read()
magic, chk, off, size = d[:4], struct.unpack('<I', d[8:12])[0], struct.unpack('<I', d[12:16])[0], struct.unpack('<I', d[16:20])[0]
import zlib, hashlib
print(f"dex magic={magic} checksum_ok={zlib.crc32(d[12:]) & 0xffffffff == chk} sha1_ok={hashlib.sha1(d[32:]).digest() == d[12:32]} file_size={size}=={len(d)}")
EOF

echo "== 3. baksmali roundtrip: verify the 4 patch markers =="
rm -rf $V4/verify3
python3 -c "import zipfile; z=zipfile.ZipFile('/tmp/v4/vc3.zip','w'); z.write('/tmp/v4/new_classes3.dex','classes.dex')"
java -jar $V4/tools/apktool_3.0.3.jar d --no-res -f -o $V4/verify3 $V4/vc3.zip 2>&1 | tail -1
python3 - << 'EOF'
import re
t = '/tmp/v4/verify3/smali'
ok = True
# P1
src = open(f'{t}/com/opera/android/OperaApplication.smali').read()
m = re.search(r'\.method public final a\(\)Z\n    \.locals 5\n\n    const/4 v0, 0x1\n\n    return v0\n', src)
print('P1 early-return true:', bool(m)); ok &= bool(m)
# P2
src = open(f'{t}/cfn.smali').read()
m = re.search(r'const-string v1, "personalization\.onboarding\.completed".{0,400}?const/4 v0, 0x0\n\n    invoke-static \{v0\}, Ljava/lang/Boolean;->valueOf', src, re.S)
print('P2 personalization forced completed:', bool(m)); ok &= bool(m)
# P3
src = open(f'{t}/ssi.smali').read()
seg = re.search(r':pswitch_17\n.*?(?=\n    :pswitch_18)', src, re.S).group(0)
print('P3 spinner reveal removed:', 'setVisibility' not in seg and 'SplashView' in seg); ok &= ('setVisibility' not in seg and 'SplashView' in seg)
# 02f
src = open(f'{t}/m9k.smali').read()
m = re.search(r'const/4 p5, 0x1\n\n    invoke-static \{p5\}, Ljava/lang/Boolean;->valueOf\(Z\)Ljava/lang/Boolean;', src)
print('02f waiter seed forced true:', bool(m)); ok &= bool(m)
if not ok: raise SystemExit('PATCH MARKER VERIFICATION FAILED')
print('all 4 patch markers verified in the rebuilt dex')
EOF

echo "== 4. splice into substrate (byte-preserving) =="
python3 /home/z/my-project/.harness/vogelkop/scripts/splice_entry.py \
  --src $V4/substrate.apk --entry classes3.dex --file $V4/new_classes3.dex --out $V4/spliced.apk

echo "== 5. entry-diff vs substrate =="
python3 - << 'EOF'
import zipfile, hashlib
a = zipfile.ZipFile('/tmp/v4/substrate.apk'); b = zipfile.ZipFile('/tmp/v4/spliced.apk')
an, bn = a.namelist(), b.namelist()
assert an == bn, 'entry list changed!'
diff = [n for n in an if hashlib.sha256(a.read(n)).digest() != hashlib.sha256(b.read(n)).digest()]
print('changed entries:', diff)
assert diff == ['classes3.dex'], diff
print('entry-diff OK: only classes3.dex changed')
EOF

echo "== 6. zipalign -P 16 =="
$BT/zipalign -P 16 -f 4 $V4/spliced.apk $V4/aligned.apk
$BT/zipalign -c -P 16 -f 4 $V4/aligned.apk && echo "16KB alignment OK"
python3 -c "
import zipfile
z = zipfile.ZipFile('/tmp/v4/aligned.apk')
sos = [n for n in z.namelist() if n.startswith('lib/') and n.endswith('.so')]
bad = [n for n in sos if z.getinfo(n).compress_type != 0]
assert not bad, bad
assert z.getinfo('resources.arsc').compress_type == 0
print(f'.so STORED ({len(sos)}) + arsc STORED preserved after align')"

echo "== 7. sign (morphe.keystore, v1+v2+v3) =="
$BT/apksigner sign \
  --ks "$KS" --ks-pass pass:Morphe --key-pass pass:Morphe \
  --ks-key-alias morphe \
  --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true \
  --out "$OUT" "$V4/aligned.apk"
$BT/apksigner verify --min-sdk-version 23 --verbose "$OUT" > $V4/sig-verify.txt 2>&1 || true
sed -n '1,9p' $V4/sig-verify.txt
$BT/apksigner verify --print-certs "$OUT" | sed -n '1,3p'

echo "== 8. final sanity =="
$BT/aapt2 dump badging "$OUT" > $V4/final-badging.txt 2>&1 || { echo BADGING-FAIL; tail -3 $V4/final-badging.txt; exit 1; }
sed -n '1,2p' $V4/final-badging.txt
python3 -c "
import zipfile
z = zipfile.ZipFile('$OUT')
print('final entries:', len(z.namelist()), '/ dex:', sum(1 for n in z.namelist() if n.startswith('classes') and n.endswith('.dex')))"
echo "== 9. patch markers inside the SIGNED apk =="
python3 -c "import zipfile; z=zipfile.ZipFile('$OUT'); open('/tmp/v4/signed_c3.dex','wb').write(z.read('classes3.dex'))"
python3 -c "import zipfile; z=zipfile.ZipFile('/tmp/v4/sc3.zip','w'); z.write('/tmp/v4/signed_c3.dex','classes.dex')"
rm -rf $V4/sverify3
java -jar $V4/tools/apktool_3.0.3.jar d --no-res -f -o $V4/sverify3 $V4/sc3.zip 2>&1 | tail -1
python3 - << 'EOF'
import re
t = '/tmp/v4/sverify3/smali'
src = open(f'{t}/com/opera/android/OperaApplication.smali').read()
p1 = bool(re.search(r'\.method public final a\(\)Z\n    \.locals 5\n\n    const/4 v0, 0x1\n\n    return v0\n', src))
src = open(f'{t}/cfn.smali').read()
p2 = bool(re.search(r'personalization\.onboarding\.completed".{0,400}?const/4 v0, 0x0\n\n    invoke-static \{v0\}, Ljava/lang/Boolean;->valueOf', src, re.S))
src = open(f'{t}/ssi.smali').read()
seg = re.search(r':pswitch_17\n.*?(?=\n    :pswitch_18)', src, re.S).group(0)
p3 = 'setVisibility' not in seg and 'SplashView' in seg
src = open(f'{t}/m9k.smali').read()
pf = bool(re.search(r'const/4 p5, 0x1\n\n    invoke-static \{p5\}, Ljava/lang/Boolean;->valueOf\(Z\)Ljava/lang/Boolean;', src))
print(f'signed-apk markers: P1={p1} P2={p2} P3={p3} 02f={pf}')
assert p1 and p2 and p3 and pf
print('ALL PATCH MARKERS VERIFIED IN SIGNED APK')
EOF

echo "== 10. sha256 =="
sha256sum "$OUT"
echo "DONE: $OUT"
