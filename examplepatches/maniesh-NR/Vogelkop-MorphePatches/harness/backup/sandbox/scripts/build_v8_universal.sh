#!/bin/bash
# build_v8_universal.sh — v8: system-wide free VPN + v7 patch set + fixes.
#
#   v6 universal APK (substrate)
#     -> baksmali classes.dex + classes3.dex
#     -> apply_v8_patches.py (v7 set + V8a/V7b2/N8/RS8)
#     -> apktool b both dexes
#     -> ecj + d8 build the embedded VPN stack into classes5.dex
#     -> v8_splice.py (manifest AXML edits + dex/lib payload + sig strip)
#     -> zipalign -p 4 -> apksigner (morphe.keystore, v1+v2+v3)
#     -> verify_v8_markers.py on the signed APK
set -euo pipefail

V8=/tmp/v8
BT=/tmp/my-project/tools/android-14
KS=/tmp/morphe_release.keystore
APKTOOL=/tmp/my-project/tools/apktool.jar
HS=/home/z/my-project/scripts
SRC=/home/z/my-project/build-cache/OperaBeta-104.0.5262.91143-custom-v6-universal.apk
OUT=/home/z/my-project/download/OperaBeta-104.0.5262.91143-custom-v8-universal.apk
OPRX=/home/z/my-project/download/v8-vpnkit/opera-proxy.android-arm
HEVLIB=/tmp/v8/hev/jni/armeabi-v7a/libhev-socks5-tunnel.so
ECJ=/tmp/v8/ecj.jar
PLATFORM=/tmp/v8/p34/android-34/android.jar

cd "$V8"

echo "== 0. inputs =="
[ -f "$SRC" ] || { echo "missing substrate $SRC"; exit 1; }
[ -f "$OPRX" ] || { echo "missing opera-proxy binary"; exit 1; }
[ -f "$HEVLIB" ] || { echo "missing hev lib (unzip AAR first)"; exit 1; }
[ -f "$ECJ" ] || { echo "missing ecj.jar"; exit 1; }
[ -f "$PLATFORM" ] || { echo "missing android.jar"; exit 1; }
sha256sum "$SRC" | grep -q 15cc03fc || { echo "substrate hash mismatch"; exit 1; }

echo "== 1. baksmali classes.dex + classes3.dex (fresh) =="
for i in 1 3; do
  e=classes.dex; [ $i = 3 ] && e=classes3.dex
  python3 -c "import zipfile; z=zipfile.ZipFile('$SRC'); open('/tmp/v8/v6c$i.dex','wb').write(z.read('$e'))"
  python3 -c "import zipfile; z=zipfile.ZipFile('/tmp/v8/v6c$i.zip','w'); z.write('/tmp/v8/v6c$i.dex','classes.dex')"
  rm -rf work_sm$i
  java -jar $APKTOOL d --no-res -f -o work_sm$i v6c$i.zip 2>&1 | tail -1
done

echo "== 2. apply v8 patches (v7 set + fixes) =="
python3 $HS/apply_v8_patches.py $V8/work_sm1/smali $V8/work_sm3/smali

echo "== 3. rebuild classes.dex + classes3.dex =="
for i in 1 3; do
  rm -rf rb$i rb$i.apk new_classes$i.dex
  java -jar $APKTOOL b work_sm$i -o rb$i.apk 2>&1 | tail -1
  mkdir -p rb$i && (cd rb$i && unzip -o -q ../rb$i.apk classes.dex)
  mv rb$i/classes.dex new_classes$i.dex
done
ls -la new_classes1.dex new_classes3.dex

echo "== 4. compile + dex the embedded VPN stack (classes5.dex) =="
rm -rf jout dout && mkdir -p jout dout
java -jar $ECJ -source 1.8 -target 1.8 -bootclasspath $PLATFORM -warn:none \
  -d jout \
  $(find /home/z/my-project/scripts/v8src -name '*.java') \
  $V8/hev-jdx/sources/hev/htproxy/TProxyService.java
java -cp $BT/lib/d8.jar com.android.tools.r8.D8 --min-api 29 --lib $PLATFORM \
  --output dout $(find jout -name '*.class')
ls -la dout/classes.dex
mv dout/classes.dex mini_classes5.dex

echo "== 5. safety: component class layout =="
# The three Opera-declared components MUST exist in classes3 (we patch their
# method bodies); the Kape service class must NOT exist anywhere.
for t in "com/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService" \
         "com/opera/android/vpn/app_widget/VpnProAppWidget" \
         "com/opera/android/vpn/VpnReceiver"; do
  [ -f "$V8/work_sm3/smali/$t.smali" ] || { echo "MISSING (expected in classes3): $t"; exit 1; }
done
for d in work_sm1 work_sm3 sm4; do
  [ -d "$V8/$d/smali/com/kape" ] && { echo "CLASH: com/kape already in $d"; exit 1; }
done
echo "component layout OK"

echo "== 6. splice (manifest AXML edits + dexes + libs) =="
rm -rf spliced_v8.apk
python3 $HS/v8_splice.py "$SRC" $V8/spliced_v8.apk \
  new_classes1.dex new_classes3.dex mini_classes5.dex "$OPRX" "$HEVLIB"

echo "== 7. zipalign -p 4 =="
rm -rf aligned_v8.apk
$BT/zipalign -p -f 4 $V8/spliced_v8.apk $V8/aligned_v8.apk
$BT/zipalign -c -p 4 $V8/aligned_v8.apk && echo "alignment OK"
python3 - <<'EOF'
import zipfile
z = zipfile.ZipFile('/tmp/v8/aligned_v8.apk')
bad = [n for n in z.namelist()
       if n.startswith('lib/') and n.endswith('.so') and z.getinfo(n).compress_type != 0]
oldso = [n for n in z.namelist() if n.startswith('lib/armeabi-v7a/libopera')]
print('stored .so kept uncompressed: %s' % (not bad or bad))
assert z.getinfo('resources.arsc').compress_type == 0
print('arsc STORED preserved; libopera entries: %d' % len(oldso))
EOF

echo "== 8. sign (morphe.keystore, v1+v2+v3) =="
rm -f "$OUT" "$OUT.idsig"
$BT/apksigner sign \
  --ks "$KS" --ks-pass pass:Morphe --key-pass pass:Morphe \
  --ks-key-alias morphe \
  --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true \
  --out "$OUT" $V8/aligned_v8.apk
$BT/apksigner verify --min-sdk-version 29 --verbose "$OUT" | sed -n '1,6p'
$BT/apksigner verify --print-certs "$OUT" | sed -n '1,2p'

echo "== 9. badging sanity =="
$BT/aapt2 dump badging "$OUT" > $V8/final-badging.txt 2>&1 || { tail -3 $V8/final-badging.txt; exit 1; }
sed -n '1,2p' $V8/final-badging.txt

echo "== 10. marker verification on the signed APK =="
for e in 1 3 5; do
  E=classes.dex; [ $e = 3 ] && E=classes3.dex; [ $e = 5 ] && E=classes5.dex
  python3 -c "import zipfile; z=zipfile.ZipFile('$OUT'); open('/tmp/v8/fin$e.dex','wb').write(z.read('$E'))"
  python3 -c "import zipfile; z=zipfile.ZipFile('/tmp/v8/fin$e.zip','w'); z.write('/tmp/v8/fin$e.dex','classes.dex')"
  rm -rf fin_sm$e
  java -jar $APKTOOL d --no-res -f -o fin_sm$e fin$e.zip 2>&1 | tail -1
done
python3 $HS/verify_v8_markers.py $V8/fin_sm1/smali $V8/fin_sm3/smali $V8/fin_sm5/smali "$OUT"

echo "== 11. sha256 =="
sha256sum "$OUT"
echo "DONE: $OUT"
