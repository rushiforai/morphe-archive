#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-only
set -eu
: "${JAVA_HOME:?Set Java 21 JAVA_HOME}"
: "${ANDROID_HOME:?Set Android SDK ANDROID_HOME}"
: "${KOMIKKU_TEST_KEYSTORE:?Set disposable signing key path}"
out=.scratch/komikku/native
mkdir -p "$out/classes" "$out/dex"
"$JAVA_HOME/bin/javac" -source 11 -target 11 -Xlint:-options -cp "$ANDROID_HOME/platforms/android-35/android.jar" -d "$out/classes" tests/komikku/LocalSearch.java
"$ANDROID_HOME/build-tools/36.0.0/d8" --min-api 35 --lib "$ANDROID_HOME/platforms/android-35/android.jar" --output "$out/dex" "$out/classes/io/github/pengusto/patches/komikku/tests/LocalSearch.class"
"$ANDROID_HOME/build-tools/36.0.0/aapt2" link -I "$ANDROID_HOME/platforms/android-35/android.jar" --manifest tests/komikku/AcceptanceManifest.xml -o "$out/acceptance.apk"
python3 - <<'PY'
import zipfile
with zipfile.ZipFile('.scratch/komikku/native/acceptance.apk','a') as z:
    z.write('.scratch/komikku/native/dex/classes.dex','classes.dex')
PY
"$ANDROID_HOME/build-tools/36.0.0/apksigner" sign --ks "$KOMIKKU_TEST_KEYSTORE" --ks-pass pass:android --key-pass pass:android --ks-key-alias test "$out/acceptance.apk"
