#!/bin/sh
# Build only the test instrumentation; compile-only Kotlin signatures stay out of DEX.
set -eu
: "${ANDROID_HOME:?Set ANDROID_HOME to the Android SDK}"
: "${TEST_KEYSTORE:?Set TEST_KEYSTORE to the disposable test.jks}"
out=".scratch/mihon/native"
mkdir -p "$out/stubs" "$out/classes" "$out/dex"
javac -source 11 -target 11 -Xlint:-options -cp "$ANDROID_HOME/platforms/android-35/android.jar" -d "$out/stubs" tests/mihon/compile/kotlin/coroutines/*.java tests/mihon/compile/kotlin/coroutines/jvm/internal/*.java
javac -source 11 -target 11 -Xlint:-options -cp "$ANDROID_HOME/platforms/android-35/android.jar:$out/stubs" -d "$out/classes" tests/mihon/NativeContinuation.java tests/mihon/MihonRetention.java
jar cf "$out/stubs.jar" -C "$out/stubs" .
d8 --min-api 35 --lib "$ANDROID_HOME/platforms/android-35/android.jar" --classpath "$out/stubs.jar" --output "$out/dex" "$out"/classes/io/github/pengusto/patches/mihon/tests/*.class
rm -f "$out/acceptance.apk"
aapt2 link -I "$ANDROID_HOME/platforms/android-35/android.jar" --manifest tests/mihon/AcceptanceManifest.xml -o "$out/acceptance.apk"
python3 - <<'PY'
import zipfile
with zipfile.ZipFile('.scratch/mihon/native/acceptance.apk','a') as apk:
    apk.write('.scratch/mihon/native/dex/classes.dex','classes.dex')
PY
apksigner sign --ks "$TEST_KEYSTORE" --ks-pass pass:android --key-pass pass:android --ks-key-alias test "$out/acceptance.apk"
apksigner verify "$out/acceptance.apk"
