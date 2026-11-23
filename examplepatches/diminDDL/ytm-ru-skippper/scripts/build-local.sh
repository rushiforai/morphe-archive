#!/bin/bash
set -euo pipefail
# Builds the bundle without Gradle, using Morphe Desktop's bundled libraries, then patches a local APK.
# Run from the folder that contains this repository and the APK:
#   VERSION=0.5.0 bash ytm-ru-skippper/scripts/build-local.sh
# Every path below can be overridden with an environment variable of the same name.
VERSION=${VERSION:-0.5.0}
# OFFICIAL=defaults applies the official default patches too, which include Settings > Morphe.
# OFFICIAL=minimal applies only GmsCore support, so the skipper runs with its default settings.
SELECTION=()
OFFICIAL_ONLY=()
if [ "${OFFICIAL:-defaults}" = minimal ]; then SELECTION=(--exclusive); OFFICIAL_ONLY=(-e 'GmsCore support'); fi
JDK_TOOLS=${JDK_TOOLS:-$HOME/.gradle/jdks/jetbrains_s_r_o_-21-amd64-linux.2/bin}
# Any Gradle distribution lib folder; it supplies the Kotlin compiler and standard library.
GRADLE_LIB=${GRADLE_LIB:-$(ls -d $HOME/.gradle/wrapper/dists/gradle-*/*/gradle-*/lib | tail -1)}
SDK_TOOLS=${SDK_TOOLS:-${ANDROID_HOME:-$HOME/Android/Sdk}/build-tools/36.0.0}
ANDROID_API=${ANDROID_API:-${ANDROID_HOME:-$HOME/Android/Sdk}/platforms/android-33/android.jar}
DESKTOP=${DESKTOP:-/tmp/morphe-desktop-2.2.0-all.jar}
OFFICIAL_MPP=${OFFICIAL_MPP:-/tmp/morphe-official-patches-2.3.0.mpp}
# A throwaway keystore for test installs. Morphe Desktop creates it if missing.
KEYSTORE=${KEYSTORE:-/tmp/ytm-ru-skippper-probe/test.keystore}
APK=${APK:-com_google_android_apps_youtube_music_9_30_53_93053240_minAPI26arm64.apk}
PROBE_WORK=$(mktemp -d)
mkdir -p probe-output
mkdir -p "$PROBE_WORK"/{java,kotlin,bundle/extensions,extension}
# The Morphe settings classes are compile-only: the official shared extension provides them at runtime.
mkdir -p "$PROBE_WORK/stubs"
"$JDK_TOOLS/javac" --release 17 -d "$PROBE_WORK/stubs" $(find ytm-ru-skippper/scripts/morphe-stubs/src -name '*.java')
"$JDK_TOOLS/javac" --release 17 -cp "$ANDROID_API:$PROBE_WORK/stubs" -d "$PROBE_WORK/java" ytm-ru-skippper/extensions/skipper/src/main/java/dev/ytmruskippper/skipper/*.java
"$JDK_TOOLS/jar" --create --file "$PROBE_WORK/extension-classes.jar" -C "$PROBE_WORK/java" .
"$SDK_TOOLS/d8" --release --min-api 26 --lib "$ANDROID_API" --output "$PROBE_WORK/extension" "$PROBE_WORK/extension-classes.jar"
cp "$PROBE_WORK/extension/classes.dex" "$PROBE_WORK/bundle/extensions/skipper.mpe"
"$JDK_TOOLS/java" -cp "$GRADLE_LIB/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -jvm-target 11 -classpath "$DESKTOP:$GRADLE_LIB/kotlin-stdlib-2.4.21.jar" -d "$PROBE_WORK/kotlin" ytm-ru-skippper/patches/src/main/kotlin/dev/ytmruskippper/patches/*.kt
"$JDK_TOOLS/jar" --create --file "$PROBE_WORK/patch-classes.jar" -C "$PROBE_WORK/kotlin" .
"$SDK_TOOLS/d8" --release --min-api 26 --lib "$ANDROID_API" --classpath "$DESKTOP" --output "$PROBE_WORK/bundle" "$PROBE_WORK/patch-classes.jar"
printf 'Manifest-Version: 1.0\nName: YTM RU Skippper\nDescription: Skips russian tracks in YouTube Music\nVersion: %s\nSource: local\nPatcher-Version: 2.4.0\n\n' "$VERSION" > "$PROBE_WORK/manifest.mf"
"$JDK_TOOLS/jar" --create --file probe-output/patches-${VERSION}.mpp --manifest "$PROBE_WORK/manifest.mf" -C "$PROBE_WORK/kotlin" . -C "$PROBE_WORK/bundle" .
"$JDK_TOOLS/java" -Xmx3g -jar "$DESKTOP" patch "${SELECTION[@]}" -p probe-output/patches-${VERSION}.mpp -e 'Auto-skip russian tracks' -e 'Playback metadata probe' -p "$OFFICIAL_MPP" "${OFFICIAL_ONLY[@]}" --bytecode-mode FULL --validate --keystore="$KEYSTORE" --keystore-password=android --keystore-entry-password=android -o probe-output/ytm-ru-skippper-${VERSION}.apk "$APK" > "$PROBE_WORK/patch.log" 2>&1 || { tail -35 "$PROBE_WORK/patch.log"; exit 1; }
tail -22 "$PROBE_WORK/patch.log"
