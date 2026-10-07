#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
runtime_dir="${REDDIT_ANDROID_RUNTIME:-$(dirname "$repo_dir")/.android-testing}"
apk="${1:-$runtime_dir/artifacts/reddit-defaults-unsigned.apk}"
serial="${REDDIT_ANDROID_SERIAL:-emulator-5554}"
adb="$runtime_dir/sdk/platform-tools/adb"
signer="$runtime_dir/sdk/build-tools/35.0.0/apksigner"
key="$runtime_dir/keys/debug.keystore"
signed="$runtime_dir/artifacts/reddit-test.apk"
if [[ "$("$adb" -s "$serial" shell getprop sys.boot_completed | tr -d '\r')" != 1 ]]; then
    echo "Android has not finished booting on $serial." >&2
    exit 1
fi
mkdir -p "$runtime_dir/keys" "$runtime_dir/artifacts"
if [[ ! -f "$apk" ]]; then
    echo "APK not found: $apk" >&2
    exit 1
fi
if [[ ! -f "$key" ]]; then
    keytool -genkeypair -keystore "$key" -storepass android -keypass android \
        -alias androiddebugkey -dname 'CN=Android Debug,O=Local Reddit Testing,C=DE' \
        -keyalg RSA -keysize 2048 -validity 10000
    chmod 600 "$key"
fi
"$signer" sign --ks "$key" --ks-pass pass:android --key-pass pass:android \
    --out "$signed" "$apk"
"$signer" verify "$signed"
"$adb" -s "$serial" install --no-incremental -r "$signed"
