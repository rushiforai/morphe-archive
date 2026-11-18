#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
original_apk="${1:?Usage: scripts/build-apk.sh /path/to/original.apk}"
android_sdk="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
build_tools="$android_sdk/build-tools/35.0.0"

app_version="$(python3 scripts/apk_profiles.py "$original_apk")"
output_apk="dist/roborock-${app_version}-local-server.apk"

npm ci --ignore-scripts
./gradlew buildAndroid --console=plain
ORIGINAL_APK="$original_apk" npm test
mkdir -p dist signing

if [ ! -f signing/roborock-local.jks ]; then
    keytool -genkeypair -keystore signing/roborock-local.jks \
        -storepass android -keypass android -alias roborock-local \
        -keyalg RSA -keysize 2048 -validity 10000 \
        -dname 'CN=Roborock Local Development'
    chmod 600 signing/roborock-local.jks
fi

bundle="$(find patches/build/libs -maxdepth 1 -type f -name 'patches-*.mpp' \
    ! -name '*sources*' ! -name '*javadoc*' -print -quit)"
[ -n "$bundle" ] || { echo "patches-*.mpp not found under patches/build/libs" >&2; exit 1; }

java -jar tools/morphe-desktop.jar patch \
    -p "$bundle" \
    --unsigned --validate -o dist/roborock-local-unsigned.apk \
    -r dist/patch-result.json "$original_apk"

"$build_tools/zipalign" -P 16 -f 4 dist/roborock-local-unsigned.apk dist/roborock-local-aligned.apk
"$build_tools/apksigner" sign --ks signing/roborock-local.jks \
    --ks-key-alias roborock-local --ks-pass pass:android --key-pass pass:android \
    --v4-signing-enabled false \
    --out "$output_apk" dist/roborock-local-aligned.apk
"$build_tools/apksigner" verify --verbose "$output_apk"
"$build_tools/zipalign" -c -P 16 4 "$output_apk"
python3 scripts/verify-apk.py "$original_apk" "$output_apk" > "dist/apk-verification-${app_version}.json"
cp "dist/apk-verification-${app_version}.json" dist/apk-verification.json
cp dist/patch-result.json "dist/patch-result-${app_version}.json"
cp "$bundle" dist/
