#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
set -euo pipefail

here=$(cd "$(dirname "$0")" && pwd)
bundle=${1:?Pass the built Reseam bundle from just reseam-build}
: "${ANDROID_SERIAL:?Set ANDROID_SERIAL to your disposable Android test device}"
: "${ANDROID_HOME:?Set ANDROID_HOME to the Android SDK}"
platform="$ANDROID_HOME/platforms/android-36/android.jar"
tools="$ANDROID_HOME/build-tools/36.0.0"
java_bin=${JAVA_HOME:+$JAVA_HOME/bin/}
scratch=$(mktemp -d)
package=app.edbfi.tests.reseam.imagetext
installed=false
trap 'if "$installed"; then adb uninstall "$package" >/dev/null; fi; rm -rf "$scratch"' EXIT

cat > "$scratch/AndroidManifest.xml" <<EOF
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="$package">
    <uses-sdk android:minSdkVersion="26" android:targetSdkVersion="35" />
    <application>
        <activity android:name="android.app.Activity" android:exported="false" />
    </application>
    <instrumentation android:name="app.edbfi.tests.reseam.ImageTextWorkTest"
        android:targetPackage="$package" />
</manifest>
EOF

mkdir "$scratch/classes" "$scratch/dex"
"${java_bin}javac" --release 17 -cp "$platform" -d "$scratch/classes" "$here/ImageTextWorkTest.java"
"$tools/d8" --release --min-api 26 --lib "$platform" --thread-count 1 --output "$scratch/dex" \
    "$scratch/classes/app/edbfi/tests/reseam/ImageTextWorkTest.class"
unzip -p "$bundle" syncforreddit-imagetext.dex > "$scratch/dex/classes2.dex"
"$tools/aapt2" link -I "$platform" --manifest "$scratch/AndroidManifest.xml" -o "$scratch/unsigned.apk"
"${java_bin}jar" --update --no-compress --file "$scratch/unsigned.apk" \
    -C "$scratch/dex" classes.dex -C "$scratch/dex" classes2.dex
"${java_bin}keytool" -genkeypair -storetype PKCS12 -keystore "$scratch/test.p12" -storepass image-text-test \
    -alias test -keyalg EC -groupname secp256r1 -dname "CN=Reseam OCR test" -validity 1
"$tools/apksigner" sign --ks "$scratch/test.p12" --ks-pass pass:image-text-test \
    --out "$scratch/test.apk" "$scratch/unsigned.apk"
adb install --no-incremental "$scratch/test.apk"
installed=true
result=$(adb shell am instrument -w -r "$package/app.edbfi.tests.reseam.ImageTextWorkTest")
printf '%s\n' "$result"
[[ "$result" == *'INSTRUMENTATION_CODE: -1'* ]]
