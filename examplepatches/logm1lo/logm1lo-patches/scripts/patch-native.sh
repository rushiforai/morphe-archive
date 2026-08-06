#!/usr/bin/env bash
set -euo pipefail
WORKDIR="$(cd "$(dirname "$0")/.." && pwd)"
BUILDDIR="$WORKDIR/analysis/zalo/builds"
SDK="$HOME/Android/Sdk/build-tools/35.0.0"
JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/java-21-openjdk}"
STORE_PASS="${SIGN_STORE_PASS:-android}"
KEY_PASS="${SIGN_KEY_PASS:-android}"

echo "==> Step 1: Extract split APKs from bundle"
unzip -oq "$WORKDIR/apks/com.zing.zalo_26.08.01.apks" -d "$BUILDDIR/splits/"

echo "==> Step 2: Extract libnative_utils.so from arm64 split"
cd "$BUILDDIR"
unzip -oq splits/split_config.arm64_v8a.apk lib/arm64-v8a/libnative_utils.so -d "$BUILDDIR/"

echo "==> Step 3: Hex-patch libnative_utils.so"
SOFILE="$BUILDDIR/lib/arm64-v8a/libnative_utils.so"
cp "$SOFILE" "$SOFILE.bak"

python3 << PYEOF
import struct
data = bytearray(open("$SOFILE", "rb").read())
RET = bytes([0xc0, 0x03, 0x5f, 0xd6])
MOV_X0_XZR = bytes([0xe0, 0x03, 0x1f, 0xaa])
data[0x288e4:0x288e4+4] = RET
data[0x2c6c0:0x2c6c0+4] = RET
data[0x268fc:0x268fc+8] = MOV_X0_XZR + RET
open("$SOFILE", "wb").write(data)
print("  libnative_utils.so patched successfully")
PYEOF

echo "==> Step 4: Repack patched .so into arm64 split"
cd "$BUILDDIR"
zip -d splits/split_config.arm64_v8a.apk lib/arm64-v8a/libnative_utils.so 2>/dev/null || true
zip -0 splits/split_config.arm64_v8a.apk lib/arm64-v8a/libnative_utils.so
"$SDK/zipalign" -f 4 splits/split_config.arm64_v8a.apk splits/split_config.arm64_v8a_aligned.apk 2>/dev/null
mv splits/split_config.arm64_v8a_aligned.apk splits/split_config.arm64_v8a.apk

echo "==> Step 5: Patch base.apk"
$JAVA_HOME/bin/java -Xms1024m -jar "$WORKDIR/morphe-cli.jar" patch \
  --patches "$WORKDIR/patches/build/libs/patches-1.0.0.mpp" \
  -e "Remove File Size Limit" -e "Manifest Fix" -e "Integrity Bypass" -f \
  --out "$BUILDDIR/splits/base_patched.apk" \
  "$BUILDDIR/splits/base.apk" 2>&1 | grep -E "Applied|Error|Warn"
"$SDK/zipalign" -f 4 "$BUILDDIR/splits/base_patched.apk" "$BUILDDIR/splits/base_aligned.apk" 2>/dev/null
mv "$BUILDDIR/splits/base_aligned.apk" "$BUILDDIR/splits/base.apk"

echo "==> Step 6: Sign all split APKs with same key"
KEYSTORE="$BUILDDIR/zalo_sign.jks"
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkey -v -keystore "$KEYSTORE" -alias signer \
      -keyalg RSA -keysize 2048 -validity 10000 \
      -storepass "$STORE_PASS" -keypass "$KEY_PASS" \
      -dname "CN=Zalo, OU=Patched, O=Logm1lo, L=Hanoi, ST=VN, C=VN" 2>&1 | tail -1
fi

for apk in "$BUILDDIR/splits"/*.apk; do
    "$SDK/apksigner" sign --ks "$KEYSTORE" \
      --ks-key-alias signer --ks-pass pass:"$STORE_PASS" --key-pass pass:"$KEY_PASS" "$apk" 2>/dev/null
done
echo "  All APKs signed"

echo "==> Step 7: Install split bundle"
adb install-multiple "$BUILDDIR/splits"/*.apk 2>&1

echo "==> DONE =="
