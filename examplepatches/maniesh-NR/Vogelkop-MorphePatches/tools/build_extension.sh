#!/bin/bash
# Build extensions/extension.mpe — the Morphe patch extension containing the
# SignatureHookApp runtime hook (see patches/.../SpoofAppSignaturePatch.kt).
#
# v1.2.1: the extension is compiled against the REAL Android framework
# (Robolectric's android-all build of AOSP) instead of the hand-written
# tools/android-stubs. The v1.2.0 stubs modeled several framework types with
# the wrong shape:
#
#   - android.util.Base64 as a Kotlin object -> the extension called a
#     nonexistent Base64.INSTANCE field and an instance decode(String, int)
#   - PackageInfo's public fields as Kotlin var properties -> the extension
#     called nonexistent getPackageName()/getSignatures()/getSigningInfo()
#
# On a device those references throw NoSuchFieldError / NoSuchMethodError
# inside SignatureHookApp's static initializer -> ExceptionInInitializerError
# -> the app crashes at startup with a black screen, before any UI.
#
# Steps:
#   1. kotlinc (embeddable, from the Gradle cache) compiles the extension
#      source against android-all. No Android SDK required.
#   2. D8 (r8 jar from Google Maven) dexes ONLY the extension classes,
#      with android-all as the library for correct API resolution.
#   3. tools/AuditExtDex.java verifies EVERY android/* reference in the
#      built DEX against the real framework via reflection — the build FAILS
#      if any reference would not resolve on a device (this is the guard
#      that would have caught the v1.2.0 bug).
#   4. The raw classes.dex bytes become extensions/extension.mpe (the Morphe
#      patcher reads .mpe extension resources as raw DEX images) and are
#      copied next to the patch sources as a bundle resource.
#
# Prerequisites: a Gradle cache with kotlin-compiler-embeddable + guava
# (populated by any ./gradlew build), a JDK with javac (an ecj jar is
# downloaded as fallback), and curl access to dl.google.com, JitPack and
# Maven Central (Aliyun mirror tried as fallback).
#
# Usage: tools/build_extension.sh   (run from the repo root)
set -euo pipefail
cd "$(dirname "$0")/.."

OUT_MPE="extensions/extension.mpe"
OUT_MPE_RESOURCE="patches/src/main/resources/extensions/extension.mpe"
CACHE="tools/.cache"
mkdir -p "$CACHE"
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

find_jar() { # pattern
    local caches=("${GRADLE_USER_HOME:-$HOME/.gradle}/caches" "$HOME/.gradle/caches")
    local hit=""
    for c in "${caches[@]}"; do
        [ -d "$c" ] || continue
        hit=$(find "$c" -name "$1" ! -name "*sources*" 2>/dev/null | sort | tail -1 || true)
        [ -n "$hit" ] && break
    done
    echo "$hit"
}

KC=$(find_jar "kotlin-compiler-embeddable-*.jar")
KSTDLIB=$(find_jar "kotlin-stdlib-2*.jar")
CORO=$(find_jar "kotlinx-coroutines-core-jvm-1*.jar")
ANN=$(find_jar "annotations-2*.jar")
GUAVA=$(find_jar "guava-3*.jre.jar")
[ -n "$KC" ] && [ -n "$KSTDLIB" ] && [ -n "$CORO" ] && echo "kotlinc deps: OK" || {
    echo "kotlinc deps missing in Gradle cache (run ./gradlew build once first)" >&2
    exit 1
}

fetch_cached() { # url dest
    [ -s "$2" ] && return 0
    local urls=("$1" "$(echo "$1" | sed 's|https://repo1.maven.org/maven2|https://maven.aliyun.com/repository/public|')")
    for url in "${urls[@]}"; do
        curl -sfL --max-time 480 -o "$2" "$url" && return 0
    done
    echo "download failed: $1" >&2
    exit 1
}

ANDROID_ALL_VER="17-robolectric-16653203"
fetch_cached "https://repo1.maven.org/maven2/org/robolectric/android-all/$ANDROID_ALL_VER/android-all-$ANDROID_ALL_VER.jar" "$CACHE/android-all.jar"
R8_JAR="$CACHE/r8.jar"
fetch_cached "https://dl.google.com/android/maven2/com/android/tools/r8/8.5.35/r8-8.5.35.jar" "$R8_JAR"
DEXLIB2_JAR="$CACHE/dexlib2.jar"
fetch_cached "https://jitpack.io/com/github/MorpheApp/smali/smali-dexlib2/4220ae75f7/smali-dexlib2-4220ae75f7.jar" "$DEXLIB2_JAR"

echo "== compile extension against the real framework (kotlinc) =="
# KSTDLIB is needed to RESOLVE built-in types; the -Xno-*-assertions flags
# plus the no-stdlib-API code discipline keep the OUTPUT bytecode free of
# stdlib code references (verified below).
java -Xmx1500m -cp "$KC:$KSTDLIB:$CORO${ANN:+:$ANN}" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler \
    -no-reflect \
    -jvm-target 1.8 \
    -Xno-param-assertions -Xno-call-assertions -Xno-receiver-assertions \
    -cp "$KSTDLIB:$CACHE/android-all.jar" \
    -d "$WORK/extclasses" \
    extensions/extension/src/main/java/app/template/extension/extension/SignatureHookApp.kt

echo "== verify no kotlin-stdlib CODE references leaked into extension bytecode =="
if find "$WORK/extclasses/app" -name "*.class" | xargs strings 2>/dev/null | grep -q "kotlin/jvm/internal/Intrinsics\|kotlin/jvm/functions\|kotlin/collections\|kotlin/sequences\|kotlin/jvm/internal/lambda"; then
    echo "ERROR: kotlin stdlib code references found; rewrite the hook without stdlib APIs" >&2
    exit 1
fi
echo "   clean (no stdlib code references)"

echo "== verify no framework classes were compiled into the extension package =="
if find "$WORK/extclasses" -path "*android/*" -name "*.class" | grep -q .; then
    echo "ERROR: android framework classes leaked into extension output" >&2
    exit 1
fi
echo "   clean (framework used as library only)"

echo "== dex with D8 (extension classes only, real framework as library) =="
mkdir -p "$WORK/dexout"
java -Xmx1500m -cp "$R8_JAR:$GUAVA" com.android.tools.r8.D8 \
    --release --min-api 26 --lib "$CACHE/android-all.jar" \
    --output "$WORK/dexout" \
    $(find "$WORK/extclasses/app" -name "*.class")
[ -f "$WORK/dexout/classes.dex" ]

echo "== audit: every android/* reference must resolve on the real framework =="
mkdir -p "$WORK/auditcls"
if command -v javac >/dev/null 2>&1; then
    javac -source 11 -target 11 -nowarn -cp "$DEXLIB2_JAR" -d "$WORK/auditcls" tools/AuditExtDex.java
else
    fetch_cached "https://repo1.maven.org/maven2/org/eclipse/jdt/ecj/3.36.0/ecj-3.36.0.jar" "$CACHE/ecj.jar"
    java -jar "$CACHE/ecj.jar" -source 11 -target 11 -nowarn -cp "$DEXLIB2_JAR" -d "$WORK/auditcls" tools/AuditExtDex.java
fi
java -cp "$WORK/auditcls:$DEXLIB2_JAR:$GUAVA:$CACHE/android-all.jar" AuditExtDex "$WORK/dexout/classes.dex"

echo "== sanity: placeholders present, hook class present =="
strings "$WORK/dexout/classes.dex" | grep -q "app/template/extension/extension/SignatureHookApp"
strings "$WORK/dexout/classes.dex" | grep -q "<package-name>"
strings "$WORK/dexout/classes.dex" | grep -q "<signature>"

echo "== package .mpe (raw dex image) =="
mkdir -p "$(dirname "$OUT_MPE")" "$(dirname "$OUT_MPE_RESOURCE")"
cp "$WORK/dexout/classes.dex" "$OUT_MPE"
cp "$WORK/dexout/classes.dex" "$OUT_MPE_RESOURCE"
ls -la "$OUT_MPE" "$OUT_MPE_RESOURCE"
echo "extension built + audited: $OUT_MPE"
