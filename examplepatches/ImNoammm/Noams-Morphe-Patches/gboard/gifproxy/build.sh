#!/data/data/com.termux/files/usr/bin/bash
# Builds the GIF helper APK without Gradle (aapt2 + javac + d8 + apksigner), signed with the patch
# keystore. The helper serves the app that installed it (the keyboard) and apps with its signature.
set -euo pipefail
. "$HOME/gb/env.sh"
ROOT=$(cd "$(dirname "$0")" && pwd)
ANDROID_JAR=$HOME/gb/sdk/android-35/android.jar
KEYSTORE=${KEYSTORE:-$HOME/gb/work/nogoogle.keystore}
VERSION=${VERSION:-1.0.0}
CODE=${CODE:-1}
B=$ROOT/build
rm -rf "$B" && mkdir -p "$B/classes" "$B/dex" "$ROOT/out"
# Termux's aapt2 cannot read the API 34+ resource format of android.jar; link against the stripped
# API 33 framework table that Morphe's jar (ARSCLib) bundles (attribute IDs never change).
unzip -p "$HOME/gb/morphe-desktop.jar" frameworks/android/android-33.apk > "$B/framework.apk"
aapt2 link --manifest "$ROOT/AndroidManifest.xml" -I "$B/framework.apk" \
    --min-sdk-version 26 --target-sdk-version 35 --version-code "$CODE" --version-name "$VERSION" \
    -o "$B/unsigned.apk"
javac -source 11 -target 11 -Xlint:-options -cp "$ANDROID_JAR" -d "$B/classes" $(find "$ROOT/src" -name '*.java')
d8 --min-api 26 --lib "$ANDROID_JAR" --output "$B/dex" $(find "$B/classes" -name '*.class')
(cd "$B/dex" && zip -q "$B/unsigned.apk" classes.dex)
zipalign -f -p 4 "$B/unsigned.apk" "$B/aligned.apk"
# Morphe's keystore: BouncyCastle (BKS), its defaults (empty store password, alias and key password
# "Morphe"); the BKS provider comes from its jar.
java -cp "$PREFIX/share/java/apksigner.jar:$HOME/gb/morphe-desktop.jar" com.android.apksigner.ApkSignerTool sign \
    --ks "$KEYSTORE" --ks-type BKS --ks-pass pass: --ks-key-alias Morphe --key-pass pass:Morphe \
    --provider-class org.bouncycastle.jce.provider.BouncyCastleProvider --v4-signing-enabled false \
    --out "$ROOT/out/gif-helper-$VERSION.apk" "$B/aligned.apk"
rm -rf "$B"
echo "Built $ROOT/out/gif-helper-$VERSION.apk"
