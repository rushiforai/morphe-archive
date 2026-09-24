#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="${SCRIPT_DIR}/dist"
BUILD_DIR="${SCRIPT_DIR}/build/classes"
LIBS_DIR="${SCRIPT_DIR}/libs"

echo "=== Building Gboard Backspace Continuous Haptics Patch ==="

# 1. Resolve Version from gradle.properties
VERSION="$(grep -m1 '^version=' "${SCRIPT_DIR}/gradle.properties" | cut -d'=' -f2 | tr -d ' ')"
echo "Target Patch Version: ${VERSION}"

# 2. Resolve Java
if [ -n "${JAVA_HOME:-}" ] && [ -x "${JAVA_HOME}/bin/java" ]; then
    JAVA="${JAVA_HOME}/bin/java"
elif [ -x "/home/ausamnco/.local/jdk-21/bin/java" ]; then
    JAVA="/home/ausamnco/.local/jdk-21/bin/java"
elif command -v java >/dev/null 2>&1; then
    JAVA="$(command -v java)"
else
    echo "Error: Java 21+ is required but not found." >&2
    exit 1
fi
echo "Using Java: $(${JAVA} -version 2>&1 | head -n 1)"

# 3. Resolve Kotlin compiler
if [ -f "${HOME}/.local/kotlinc/lib/kotlin-compiler.jar" ]; then
    KOTLINC_JAR="${HOME}/.local/kotlinc/lib/kotlin-compiler.jar"
elif [ -f "/home/ausamnco/.local/kotlinc/lib/kotlin-compiler.jar" ]; then
    KOTLINC_JAR="/home/ausamnco/.local/kotlinc/lib/kotlin-compiler.jar"
elif [ -f "${LIBS_DIR}/kotlin-compiler.jar" ]; then
    KOTLINC_JAR="${LIBS_DIR}/kotlin-compiler.jar"
elif command -v kotlinc >/dev/null 2>&1; then
    KOTLINC_BIN="$(command -v kotlinc)"
    KOTLINC_DIR="$(dirname "$(dirname "$(readlink -f "${KOTLINC_BIN}")")")"
    KOTLINC_JAR="${KOTLINC_DIR}/lib/kotlin-compiler.jar"
else
    echo "Error: kotlin-compiler.jar not found." >&2
    exit 1
fi
echo "Using Kotlin Compiler: ${KOTLINC_JAR}"

# 4. Resolve Morphe CLI / Patcher Framework
mkdir -p "${LIBS_DIR}"
MORPHE_JAR="${LIBS_DIR}/morphe-cli.jar"
if [ ! -f "${MORPHE_JAR}" ]; then
    if [ -f "/home/ausamnco/.local/morphe/morphe-cli.jar" ]; then
        cp "/home/ausamnco/.local/morphe/morphe-cli.jar" "${MORPHE_JAR}"
    elif [ -f "${HOME}/.local/morphe/morphe-cli.jar" ]; then
        cp "${HOME}/.local/morphe/morphe-cli.jar" "${MORPHE_JAR}"
    else
        echo "Downloading morphe-desktop jar..."
        curl -fSL -o "${MORPHE_JAR}" "https://github.com/MorpheApp/morphe-desktop/releases/download/v1.16.0/morphe-desktop-1.16.0-all.jar"
    fi
fi
echo "Using Morphe Framework: ${MORPHE_JAR}"

# Prepare folders
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"
mkdir -p "${DIST_DIR}"

# 5. Compile Kotlin sources
echo "Compiling Kotlin sources..."
mapfile -t KT_SOURCES < <(find "${SCRIPT_DIR}/src/main/kotlin" -name "*.kt" | sort)
"${JAVA}" -jar "${KOTLINC_JAR}" \
    -cp "${MORPHE_JAR}" \
    -d "${BUILD_DIR}" \
    -jvm-target 11 \
    -Xskip-metadata-version-check \
    -Xcontext-receivers \
    "${KT_SOURCES[@]}"

# 5b. Compile Java extension sources (injected into target APK)
ANDROID_JAR="${LIBS_DIR}/android.jar"
if [ ! -f "${ANDROID_JAR}" ]; then
    echo "Downloading android framework stubs (android.jar)..."
    curl -fSL -o "${ANDROID_JAR}" "https://repo1.maven.org/maven2/com/google/android/android/4.1.1.4/android-4.1.1.4.jar"
fi

R8_JAR="${LIBS_DIR}/r8.jar"
if [ ! -f "${R8_JAR}" ]; then
    echo "Downloading D8 compiler (r8)..."
    curl -fSL -o "${R8_JAR}" "https://dl.google.com/dl/android/maven2/com/android/tools/r8/8.2.42/r8-8.2.42.jar"
fi

JAVAC_BIN="${JAVA//java/javac}"
JAVA_BUILD_DIR="${BUILD_DIR}/java_output"
mkdir -p "${JAVA_BUILD_DIR}"
mapfile -t JAVA_SOURCES < <(find "${SCRIPT_DIR}/src/main/java" -name "*.java" 2>/dev/null | sort)
if [ ${#JAVA_SOURCES[@]} -gt 0 ]; then
    echo "Compiling Java extension sources (${#JAVA_SOURCES[@]} files)..."
    "${JAVAC_BIN}" -cp "${ANDROID_JAR}" -d "${JAVA_BUILD_DIR}" "${JAVA_SOURCES[@]}"

    echo "Compiling colorwheel.dex with D8..."
    CW_DEX_DIR="${BUILD_DIR}/dex_cw"
    rm -rf "${CW_DEX_DIR}"
    mkdir -p "${CW_DEX_DIR}"
    mapfile -t JAVA_CLASSES < <(find "${JAVA_BUILD_DIR}" -name "*.class")
    "${JAVA}" -cp "${R8_JAR}" com.android.tools.r8.D8 \
        --release \
        --min-api 26 \
        --output "${CW_DEX_DIR}" \
        "${JAVA_CLASSES[@]}" \
        --lib "${ANDROID_JAR}"
    cp "${CW_DEX_DIR}/classes.dex" "${BUILD_DIR}/colorwheel.dex"
    rm -rf "${CW_DEX_DIR}" "${JAVA_BUILD_DIR}"
fi

# 6. Create Manifest
MANIFEST_FILE="${BUILD_DIR}/MANIFEST.MF"
TIMESTAMP="$(date +%s000)"
cat << EOF > "${MANIFEST_FILE}"
Manifest-Version: 1.0
Name: Gboard Custom Patches
Description: Custom enhancement patches for Gboard (Backspace Continuous Haptics, Glide Typing Trail Customization, Enter Key Tasker Event).
Version: ${VERSION}
Timestamp: ${TIMESTAMP}
Source: https://github.com/ausamnco/gboard-enc-patches
Author: ausamnco
Contact: https://github.com/ausamnco/gboard-enc-patches/issues
Website: https://github.com/ausamnco/gboard-enc-patches
License: GPLv3
Patcher-Version: 1.8.0
EOF

# 7. Package temporary jar for D8 dexing
JAR_BIN="${JAVA//java/jar}"

TEMP_CLASSES_JAR="${BUILD_DIR}/classes-temp.jar"
"${JAR_BIN}" -cfm "${TEMP_CLASSES_JAR}" "${MANIFEST_FILE}" -C "${BUILD_DIR}" dev

# 8. Run D8 to generate classes.dex for Android ART/Dalvik runtime
echo "Compiling Dalvik executable (classes.dex) with D8..."
DEX_DIR="${BUILD_DIR}/dex_output"
rm -rf "${DEX_DIR}"
mkdir -p "${DEX_DIR}"

"${JAVA}" -cp "${R8_JAR}" com.android.tools.r8.D8 \
    --release \
    --min-api 26 \
    --output "${DEX_DIR}" \
    "${TEMP_CLASSES_JAR}" \
    --classpath "${MORPHE_JAR}"

cp "${DEX_DIR}/classes.dex" "${BUILD_DIR}/classes.dex"
rm -f "${TEMP_CLASSES_JAR}"
rm -rf "${DEX_DIR}"

# 9. Package final .mpp and .jar
MPP_OUTPUT="${DIST_DIR}/patches-${VERSION}.mpp"
JAR_OUTPUT="${DIST_DIR}/gboard-backspace-haptics.jar"

echo "Packaging final patch bundle ${MPP_OUTPUT}..."
rm -f "${MPP_OUTPUT}" "${JAR_OUTPUT}"
"${JAR_BIN}" -cfm "${MPP_OUTPUT}" "${MANIFEST_FILE}" -C "${BUILD_DIR}" dev -C "${BUILD_DIR}" classes.dex
if [ -f "${BUILD_DIR}/colorwheel.dex" ]; then
    echo "Adding colorwheel.dex to patch bundle..."
    "${JAR_BIN}" -uf "${MPP_OUTPUT}" -C "${BUILD_DIR}" colorwheel.dex
fi
if [ -d "${BUILD_DIR}/META-INF" ]; then
    "${JAR_BIN}" -uf "${MPP_OUTPUT}" -C "${BUILD_DIR}" META-INF
fi
cp "${MPP_OUTPUT}" "${JAR_OUTPUT}"

# 10. Verify using Morphe CLI
echo "Validating patch package with Morphe CLI..."
"${JAVA}" -jar "${MORPHE_JAR}" list-patches --patches="${MPP_OUTPUT}"

echo "=== Build Complete ==="
echo "Morphe Release Asset : ${MPP_OUTPUT}"
echo "Local Convenience JAR : ${JAR_OUTPUT}"
