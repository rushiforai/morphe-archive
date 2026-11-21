#!/usr/bin/env bash
# Spike: embed a MicroG-RE build into a patched Maps NMAX APK, then align and sign with the debug key.
# Usage: tools/embed-gms/build.sh <patched-maps.apk> <microg.apk> <out.apk>
#   MicroG: ./gradlew :play-services-core:assembleDefaultRelease -Pabi=arm64-v8a -PbasePackageName=app.morphe.nmax \
#     -PgmsPackageName=app.morphe.android.apps.maps.nmaxconnect -PresPackageId=0x7e -PresPackageName=app.morphe.nmax.gms \
#     -PnoIcon=true -PonlineLocationDefault=true
# The bundle ships that build as patches/src/main/resources/nmaxgms/microg.apk, minus EmbedGms.SKIP_LIBS and META-INF:
#   cp microg.apk p.apk && zip -d p.apk 'lib/*/libopencv_java4.so' 'lib/*/libmapbox-gl.so' 'lib/*/libvtm-jni.so' 'META-INF/*'
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
JDK="${JDK:-$HOME/.gradle/jdks/eclipse_adoptium-25-amd64-windows.2/bin}"
BT="${BT:-$LOCALAPPDATA/Android/Sdk/build-tools/36.1.0}"
G="$HOME/.gradle/caches/modules-2/files-2.1"
ARSC="$(find "$G/com.github.MorpheApp/ARSCLib" -name 'ARSCLib-*.jar' ! -name '*sources*' | head -1)"
DEXLIB="$(find "$G/com.github.MorpheApp.smali/smali-dexlib2" -name '*.jar' ! -name '*sources*' | head -1)"
GUAVA="$(find "$G/com.google.guava/guava" -name 'guava-33*-jre.jar' ! -name '*sources*' | head -1)"
OUT="$(mktemp -d)"
w() { command -v cygpath >/dev/null && cygpath -w "$1" || echo "$1"; } # Windows JDK needs Windows paths
"$JDK/javac" -cp "$(w "$ARSC");$(w "$DEXLIB")" -d "$(w "$OUT")" "$(w "$HERE/../../patches/src/main/java/app/morphe/patches/maps/EmbedGms.java")"
"$JDK/java" -Xmx6g -cp "$(w "$ARSC");$(w "$DEXLIB");$(w "$GUAVA");$(w "$OUT")" EmbedGms "$(w "$1")" "$(w "$2")" "$(w "$OUT/unsigned.apk")"
"$BT/zipalign" -f -P 16 4 "$OUT/unsigned.apk" "$OUT/aligned.apk"
powershell.exe -NoProfile -Command "& '$(w "$BT/apksigner.bat")' sign --ks '$(w "$HOME/.android/debug.keystore")' --ks-pass pass:android --out '$(w "$3")' '$(w "$OUT/aligned.apk")'"
rm -rf "$OUT"
echo "Built $3"
