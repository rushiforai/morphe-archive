#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIST_DIR="${SCRIPT_DIR}/dist"
BUILD_DIR="${SCRIPT_DIR}/build/classes"
LIBS_DIR="${SCRIPT_DIR}/libs"

echo "=== Building Glyphchemy Patches Suite ==="

# 1. Resolve Version from gradle.properties
VERSION="$(grep -m1 '^version=' "${SCRIPT_DIR}/gradle.properties" | cut -d'=' -f2 | tr -d ' ')"
echo "Target Patch Version: ${VERSION}"

# 2. Resolve Java
if [ -n "${JAVA_HOME:-}" ] && [ -x "${JAVA_HOME}/bin/java" ]; then
    JAVA="${JAVA_HOME}/bin/java"
elif [ -x "${HOME}/.local/jdk-21/bin/java" ]; then
    JAVA="${HOME}/.local/jdk-21/bin/java"
elif command -v java >/dev/null 2>&1; then
    JAVA="$(command -v java)"
else
    echo "Error: Java 21+ is required but not found." >&2
    exit 1
fi
echo "Using Java: $("${JAVA}" -version 2>&1 | head -n 1)"

# 3. Resolve Kotlin compiler
# The ported NL patches use Kotlin 2.2 context parameters, so the compiler is pinned to 2.2.20.
KOTLIN_VERSION="2.2.20"
mkdir -p "${LIBS_DIR}"
fetch_jar() {
    local target="${LIBS_DIR}/$1"
    if [ ! -f "${target}" ]; then
        echo "Downloading $1..."
        curl -fsSL -o "${target}" "$2"
    fi
}
fetch_jar "kotlin-compiler-embeddable-${KOTLIN_VERSION}.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-compiler-embeddable/${KOTLIN_VERSION}/kotlin-compiler-embeddable-${KOTLIN_VERSION}.jar"
fetch_jar "kotlin-stdlib-${KOTLIN_VERSION}.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-stdlib/${KOTLIN_VERSION}/kotlin-stdlib-${KOTLIN_VERSION}.jar"
fetch_jar "kotlin-reflect-${KOTLIN_VERSION}.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-reflect/${KOTLIN_VERSION}/kotlin-reflect-${KOTLIN_VERSION}.jar"
fetch_jar "kotlin-script-runtime-${KOTLIN_VERSION}.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-script-runtime/${KOTLIN_VERSION}/kotlin-script-runtime-${KOTLIN_VERSION}.jar"
fetch_jar "kotlin-daemon-embeddable-${KOTLIN_VERSION}.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlin/kotlin-daemon-embeddable/${KOTLIN_VERSION}/kotlin-daemon-embeddable-${KOTLIN_VERSION}.jar"
fetch_jar "kotlinx-coroutines-core-jvm-1.10.2.jar" "https://repo1.maven.org/maven2/org/jetbrains/kotlinx/kotlinx-coroutines-core-jvm/1.10.2/kotlinx-coroutines-core-jvm-1.10.2.jar"
fetch_jar "trove4j.jar" "https://repo1.maven.org/maven2/org/jetbrains/intellij/deps/trove4j/1.0.20200330/trove4j-1.0.20200330.jar"
fetch_jar "annotations-26.0.2.jar" "https://repo1.maven.org/maven2/org/jetbrains/annotations/26.0.2/annotations-26.0.2.jar"
KOTLIN_COMPILER_JARS=(
    "kotlin-compiler-embeddable-${KOTLIN_VERSION}.jar"
    "kotlin-stdlib-${KOTLIN_VERSION}.jar"
    "kotlin-reflect-${KOTLIN_VERSION}.jar"
    "kotlin-script-runtime-${KOTLIN_VERSION}.jar"
    "kotlin-daemon-embeddable-${KOTLIN_VERSION}.jar"
    "kotlinx-coroutines-core-jvm-1.10.2.jar"
    "trove4j.jar"
    "annotations-26.0.2.jar"
)
echo "Using Kotlin Compiler: ${KOTLIN_VERSION}"

# 4. Resolve Morphe CLI / Patcher Framework
mkdir -p "${LIBS_DIR}"
MORPHE_JAR="${LIBS_DIR}/morphe-cli.jar"
if [ ! -f "${MORPHE_JAR}" ]; then
    if [ -n "${MORPHE_CLI_JAR:-}" ] && [ -f "${MORPHE_CLI_JAR}" ]; then
        cp "${MORPHE_CLI_JAR}" "${MORPHE_JAR}"
    elif [ -f "${HOME}/.local/morphe/morphe-cli.jar" ]; then
        cp "${HOME}/.local/morphe/morphe-cli.jar" "${MORPHE_JAR}"
    else
        echo "Downloading morphe-desktop jar..."
        curl -fSL -o "${MORPHE_JAR}" "https://github.com/MorpheApp/morphe-desktop/releases/download/v2.1.1/morphe-desktop-2.1.1-all.jar"
    fi
fi
echo "Using Morphe Framework: ${MORPHE_JAR}"

# 4b. Resolve Gson (used by the ported NL patches for version bindings)
GSON_JAR="${LIBS_DIR}/gson.jar"
if [ ! -f "${GSON_JAR}" ]; then
    echo "Downloading Gson..."
    curl -fSL -o "${GSON_JAR}" "https://repo1.maven.org/maven2/com/google/code/gson/gson/2.10.1/gson-2.10.1.jar"
fi
if [[ "${OSTYPE:-}" == msys* || "${OSTYPE:-}" == cygwin* || "${OS:-}" == Windows_NT ]]; then
    CLASSPATH_SEP=";"
else
    CLASSPATH_SEP=":"
fi
if [ "${CLASSPATH_SEP}" = ";" ]; then
    # Native java.exe needs Windows paths; MSYS would mangle a ';' separated POSIX list.
    PATCH_CLASSPATH="$(cygpath -w "${MORPHE_JAR}");$(cygpath -w "${GSON_JAR}")"
else
    PATCH_CLASSPATH="${MORPHE_JAR}${CLASSPATH_SEP}${GSON_JAR}"
fi

# Prepare folders
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"
mkdir -p "${DIST_DIR}"

# 5. Compile Kotlin sources (relative paths keep the command line under the Windows limit)
echo "Compiling Kotlin sources..."
cd "${SCRIPT_DIR}"
# Fail if a feature is implemented twice in different source groups: only one copy is
# wired into the bundle, so edits to the other would be silently ignored.
bash "${SCRIPT_DIR}/tools/check-duplicate-sources.sh"
# Compile per package group: a single invocation for the whole tree
# exceeds the Windows command-line limit once both ported suites exist.
KT_GROUPS=()
for group_dir in src/main/kotlin/*/; do
    [ -d "${group_dir}" ] && KT_GROUPS+=("${group_dir%/}")
done
KOTLINC_CP=""
for compiler_jar in "${KOTLIN_COMPILER_JARS[@]}"; do
    if [ "${CLASSPATH_SEP}" = ";" ]; then
        compiler_jar_path="$(cygpath -w "${LIBS_DIR}/${compiler_jar}")"
    else
        compiler_jar_path="${LIBS_DIR}/${compiler_jar}"
    fi
    if [ -z "${KOTLINC_CP}" ]; then
        KOTLINC_CP="${compiler_jar_path}"
    else
        KOTLINC_CP="${KOTLINC_CP}${CLASSPATH_SEP}${compiler_jar_path}"
    fi
done
for kt_group in "${KT_GROUPS[@]}"; do
    mapfile -t KT_SOURCES < <(find "${kt_group}" -name "*.kt" | sort)
    echo "  ${kt_group} (${#KT_SOURCES[@]} files)"
    "${JAVA}" -cp "${KOTLINC_CP}" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler \
        -cp "${PATCH_CLASSPATH}" \
        -d "${BUILD_DIR}" \
        -jvm-target 11 \
        -Xskip-metadata-version-check \
        -Xcontext-parameters \
        "${KT_SOURCES[@]}"
done

# 5a. Verify the Smart bar case swipe hook before anything is packaged: the invoke it injects
# must pass the commit funnel's CharSequence parameter, never the flags int. Shipping the wrong
# register builds and patches fine, then crashes the keyboard on every input field (VerifyError).
echo "Checking Smart bar case swipe hook register..."
bash "${SCRIPT_DIR}/tools/check-case-swipe-hook.sh" \
    "${SCRIPT_DIR}" \
    "${JAVA}" \
    "${JAVA//java/javac}" \
    "${BUILD_DIR}" \
    "${LIBS_DIR}/kotlin-stdlib-${KOTLIN_VERSION}.jar" \
    "${BUILD_DIR}/case-swipe-check"

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
mapfile -t JAVA_SOURCES < <(find "src/main/java" -name "*.java" 2>/dev/null | sort)
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
Name: Glyphchemy
Description: Glyphchemy, a bespoke Morphe patch collection for Gboard: typing and gesture improvements, themes and visual effects, voice typing, clipboard and toolbar tools, layouts, privacy switches and settings screens.
Version: ${VERSION}
Timestamp: ${TIMESTAMP}
Source: https://github.com/assc0d3r/ART-GLIDGE-CUSTOMIZATION
Author: assc0d3r
Contact: https://github.com/assc0d3r/ART-GLIDGE-CUSTOMIZATION/issues
Website: https://github.com/assc0d3r/ART-GLIDGE-CUSTOMIZATION
License: GPLv3
Patcher-Version: 1.8.0
EOF

# 7. Package temporary jar for D8 dexing
JAR_BIN="${JAVA//java/jar}"

TEMP_CLASSES_JAR="${BUILD_DIR}/classes-temp.jar"
CLASS_DIRS=()
for class_root in app dev patches; do
    [ -d "${BUILD_DIR}/${class_root}" ] && CLASS_DIRS+=(-C "${BUILD_DIR}" "${class_root}")
done
"${JAR_BIN}" -cfm "${TEMP_CLASSES_JAR}" "${MANIFEST_FILE}" ${CLASS_DIRS[@]+"${CLASS_DIRS[@]}"}

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

# 8b. Copy patch resource trees into the bundle
RESOURCE_ROOTS=()
if [ -d "${SCRIPT_DIR}/src/main/resources" ]; then
    for resource_dir in "${SCRIPT_DIR}/src/main/resources"/*/; do
        resource_name="$(basename "${resource_dir}")"
        cp -r "${resource_dir}" "${BUILD_DIR}/"
        RESOURCE_ROOTS+=("${resource_name}")
        echo "Bundling resources: ${resource_name}"
    done
fi
# Morphe extension artefacts (.rve) live at the bundle root under extensions/.
if [ -d "${SCRIPT_DIR}/src/main/extensions" ]; then
    cp -r "${SCRIPT_DIR}/src/main/extensions" "${BUILD_DIR}/"
    RESOURCE_ROOTS+=("extensions")
    echo "Bundling resources: extensions"
fi

# 8c. Unpack Gson for bundling. Patch code uses com.google.gson at finalize time (language model
# bindings, capability wiring, registry metadata) and the host CLI jar does not export it on the
# parent classloader, so a run that selects those patches dies with NoClassDefFoundError while
# writing the APK. Carrying the classes inside the bundle keeps it self-contained for the CLI and
# for Morphe Manager (which resolves its own copy first).
GSON_UNPACK="${BUILD_DIR}/gson-classes"
rm -rf "${GSON_UNPACK}"
mkdir -p "${GSON_UNPACK}"
( cd "${GSON_UNPACK}" && "${JAR_BIN}" -xf "${GSON_JAR}" )
rm -rf "${GSON_UNPACK}/META-INF" "${GSON_UNPACK}/module-info.class"
echo "Bundling Gson runtime classes"

# 9. Package final .mpp and .jar
MPP_OUTPUT="${DIST_DIR}/patches-${VERSION}.mpp"
JAR_OUTPUT="${DIST_DIR}/gboard-backspace-haptics.jar"

echo "Packaging final patch bundle ${MPP_OUTPUT}..."
rm -f "${MPP_OUTPUT}" "${JAR_OUTPUT}"
JAR_RESOURCE_ARGS=()
for resource_name in ${RESOURCE_ROOTS[@]+"${RESOURCE_ROOTS[@]}"}; do
    JAR_RESOURCE_ARGS+=(-C "${BUILD_DIR}" "${resource_name}")
done
"${JAR_BIN}" -cfm "${MPP_OUTPUT}" "${MANIFEST_FILE}" ${CLASS_DIRS[@]+"${CLASS_DIRS[@]}"} -C "${BUILD_DIR}" classes.dex ${JAR_RESOURCE_ARGS[@]+"${JAR_RESOURCE_ARGS[@]}"}
if [ -f "${BUILD_DIR}/colorwheel.dex" ]; then
    echo "Adding colorwheel.dex to patch bundle..."
    "${JAR_BIN}" -uf "${MPP_OUTPUT}" -C "${BUILD_DIR}" colorwheel.dex
fi
if [ -d "${BUILD_DIR}/META-INF" ]; then
    "${JAR_BIN}" -uf "${MPP_OUTPUT}" -C "${BUILD_DIR}" META-INF
fi
if [ -d "${GSON_UNPACK}/com" ]; then
    "${JAR_BIN}" -uf "${MPP_OUTPUT}" -C "${GSON_UNPACK}" com
fi
cp "${MPP_OUTPUT}" "${JAR_OUTPUT}"

# 10. Verify using Morphe CLI
echo "Validating patch package with Morphe CLI..."
"${JAVA}" -jar "${MORPHE_JAR}" list-patches --patches="${MPP_OUTPUT}"

echo "=== Build Complete ==="
echo "Morphe Release Asset : ${MPP_OUTPUT}"
echo "Local Convenience JAR : ${JAR_OUTPUT}"
