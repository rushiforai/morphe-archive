#!/usr/bin/env bash
# Build the synthetic fixture APK end-to-end:
#   smali -> classes.dex ; extension runtime (javac + d8) -> classes2.dex ;
#   aapt2-linked manifest/resources ; merge ; debug-sign.
# The fixture contains NO Google content. It proves the patch pipeline.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TOOLS="${TOOLS_DIR:-./tools}"
export JAVA_HOME="${JAVA_HOME:-$(ls -d "$TOOLS"/jdk-21* 2>/dev/null || true)}"
[ -n "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"
if [ -z "${SMALI_CP:-}" ]; then
  SMALI_CP="$(cat "$TOOLS/smali.cp" | sed "s|^|$TOOLS/|g;s|:|:$TOOLS/|g")"
fi
OUT="$ROOT/fixtures/out"
rm -rf "$OUT"; mkdir -p "$OUT"

python3 "$ROOT/fixtures/build_fixture.py"

echo "== assemble fixture classes.dex"
java -cp "$SMALI_CP" org.jf.smali.Main a "$ROOT/fixtures/src" -o "$OUT/classes.dex"

echo "== compile extension runtime and dex to classes2.dex"
mkdir -p "$OUT/ext-classes"
javac -d "$OUT/ext-classes" \
  "$ROOT/extension-src/com/akshaykadam/pixelboard/extension/ramblerlite/GboardRamblerLiteScriptRuntime.java"
mkdir -p "$OUT/ext-dex"
java -cp "$TOOLS/r8-8.3.37.jar" com.android.tools.r8.D8 \
  --min-api 24 --output "$OUT/ext-dex" "$OUT/ext-classes"/com/akshaykadam/pixelboard/extension/ramblerlite/*.class
mv "$OUT/ext-dex/classes.dex" "$OUT/classes2.dex"

echo "== link manifest with aapt2"
"$TOOLS/aapt2-extract/aapt2" link -I "$TOOLS/android.jar" \
  --manifest "$ROOT/fixtures/AndroidManifest.xml" \
  -o "$OUT/base.apk"

echo "== merge dexes into APK"
cd "$OUT"
cp base.apk fixture-unsigned.apk
zip -q fixture-unsigned.apk classes.dex classes2.dex
cd "$ROOT"

echo "== debug-sign (fixture-only key, generated locally)"
KEYSTORE="$OUT/fixture-debug.keystore"
keytool -genkeypair -keystore "$KEYSTORE" -storepass fixture-only -keypass fixture-only \
  -alias fixture -keyalg RSA -keysize 2048 -validity 3650 \
  -dname "CN=PixelBoard Fixture (not a release key), OU=testing, O=PixelBoard contributors" 2>/dev/null
java -cp "$TOOLS/apksig-8.3.0.jar:$TOOLS/classes" MiniApkSigner sign \
  "$KEYSTORE" fixture-only fixture fixture-only \
  "$OUT/fixture-unsigned.apk" "$OUT/fixture-stock.apk"

echo "== built: $OUT/fixture-stock.apk"
sha256sum "$OUT/fixture-stock.apk"
