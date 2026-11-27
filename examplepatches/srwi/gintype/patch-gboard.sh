#!/usr/bin/env bash
set -euo pipefail

# ==============================================================================
# GinType Patcher
# Streamlined script to build patches and patch a target Gboard APK/XAPK.
# ==============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

show_help() {
  cat <<'EOF'
Usage: ./patch-gboard.sh [options] [INPUT_APK] [OUTPUT_APK] [MORPHE_CLI]

Options:
  -i, --input <path>      Input Gboard APK, APKS, APKM, or XAPK file
  -o, --output <path>     Output patched APK path (default: ./gintype-patched.apk)
  -m, --morphe <path>     Path to Morphe CLI JAR or executable
  -p, --patches <path>    Path to built .mpp patches bundle
  -r, --rename            Enable "Package Rename" for side-by-side installation
      --app-name <name>   Custom app name when using --rename (implies --rename)
  -f, --force             Bypass Morphe target version check
  -b, --build             Force rebuild of extension and patches bundle
  --skip-build            Skip building patches bundle if .mpp already exists
  -h, --help              Show this help message

Environment Variables:
  INPUT_APK               Default input APK/APKS/XAPK if not passed as argument
  OUTPUT_APK              Default output APK path
  MORPHE_CLI              Path to Morphe CLI JAR or executable
  JAVA_HOME               Path to JDK 21+ installation

Examples:
  ./patch-gboard.sh
  ./patch-gboard.sh base.apk
  ./patch-gboard.sh -r -i ~/Downloads/gboard.xapk -m morphe-cli.jar
  ./patch-gboard.sh --rename --app-name "Gboard Dev" -o ./gboard-side-by-side.apk
EOF
}

# Parse options
INPUT_ARG=""
OUTPUT_ARG=""
MORPHE_ARG=""
PATCHES_ARG=""
FORCE_BUILD=false
SKIP_BUILD=false
RENAME_PACKAGE=false
APP_NAME=""
FORCE_PATCH=false

POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -i|--input)
      INPUT_ARG="$2"
      shift 2
      ;;
    -o|--output)
      OUTPUT_ARG="$2"
      shift 2
      ;;
    -m|--morphe)
      MORPHE_ARG="$2"
      shift 2
      ;;
    -p|--patches)
      PATCHES_ARG="$2"
      shift 2
      ;;
    -r|--rename)
      RENAME_PACKAGE=true
      shift
      ;;
    --app-name)
      RENAME_PACKAGE=true
      APP_NAME="$2"
      shift 2
      ;;
    -f|--force)
      FORCE_PATCH=true
      shift
      ;;
    -b|--build)
      FORCE_BUILD=true
      shift
      ;;
    --skip-build)
      SKIP_BUILD=true
      shift
      ;;
    *)
      POSITIONAL_ARGS+=("$1")
      shift
      ;;
  esac
done

# Map positional arguments if options were not explicitly given
if [[ -z "$INPUT_ARG" && ${#POSITIONAL_ARGS[@]} -ge 1 ]]; then
  INPUT_ARG="${POSITIONAL_ARGS[0]}"
fi
if [[ -z "$OUTPUT_ARG" && ${#POSITIONAL_ARGS[@]} -ge 2 ]]; then
  OUTPUT_ARG="${POSITIONAL_ARGS[1]}"
fi
if [[ -z "$MORPHE_ARG" && ${#POSITIONAL_ARGS[@]} -ge 3 ]]; then
  MORPHE_ARG="${POSITIONAL_ARGS[2]}"
fi

# Locate Java binary
if [[ -n "${JAVA_HOME:-}" && -x "$JAVA_HOME/bin/java" ]]; then
  JAVA_BIN="$JAVA_HOME/bin/java"
elif command -v java >/dev/null 2>&1; then
  JAVA_BIN="java"
else
  echo "Error: Java 21+ is required but not found in PATH or JAVA_HOME." >&2
  exit 1
fi

# Find or build MPP bundle
find_mpp() {
  find "$SCRIPT_DIR/patches/build/libs" -maxdepth 1 -name "patches-*.mpp" ! -name "*-sources.mpp" ! -name "*-javadoc.mpp" 2>/dev/null | sort -V | tail -n 1
}

MPP_FILE="${PATCHES_ARG:-}"
if [[ -z "$MPP_FILE" ]]; then
  EXISTING_MPP="$(find_mpp)"
  if [[ "$FORCE_BUILD" == true || -z "$EXISTING_MPP" || "$SKIP_BUILD" == false ]]; then
    echo "=== Building GinType patches bundle ==="
    ./gradlew :extensions:extension:compileReleaseJavaWithJavac :patches:buildAndroid
    EXISTING_MPP="$(find_mpp)"
  fi
  MPP_FILE="$EXISTING_MPP"
fi

if [[ -z "$MPP_FILE" || ! -f "$MPP_FILE" ]]; then
  echo "Error: Patches bundle (.mpp) not found. Run ./gradlew :patches:buildAndroid first." >&2
  exit 1
fi
echo "Patches bundle: $MPP_FILE"

# Determine output APK path
OUTPUT_APK="${OUTPUT_ARG:-${OUTPUT_APK:-"$SCRIPT_DIR/gintype-patched.apk"}}"

# Auto-detect input APK/APKS/APKM/XAPK if not provided
INPUT_APK="${INPUT_ARG:-${INPUT_APK:-}}"
if [[ -z "$INPUT_APK" ]]; then
  # Search order: script dir, current dir, Downloads, Termux storage/downloads
  CANDIDATES=(
    "$SCRIPT_DIR"/*gboard*.apk "$SCRIPT_DIR"/*gboard*.apks "$SCRIPT_DIR"/*gboard*.apkm "$SCRIPT_DIR"/*gboard*.xapk
    "$PWD"/*gboard*.apk "$PWD"/*gboard*.apks "$PWD"/*gboard*.apkm "$PWD"/*gboard*.xapk
    "${HOME}/Downloads"/*gboard*.apk "${HOME}/Downloads"/*gboard*.apks "${HOME}/Downloads"/*gboard*.apkm "${HOME}/Downloads"/*gboard*.xapk
    "${HOME}/storage/downloads"/*gboard*.apk "${HOME}/storage/downloads"/*gboard*.apks "${HOME}/storage/downloads"/*gboard*.apkm "${HOME}/storage/downloads"/*gboard*.xapk
  )
  for candidate in "${CANDIDATES[@]}"; do
    if [[ -f "$candidate" ]]; then
      base_name="$(basename "$candidate")"
      if [[ "$base_name" == *patched* || "$base_name" == *Patched* || "$candidate" == "$OUTPUT_APK" ]]; then
        continue
      fi
      INPUT_APK="$candidate"
      break
    fi
  done
fi

# Auto-detect Morphe CLI
MORPHE_CLI="${MORPHE_ARG:-${MORPHE_CLI:-}}"
if [[ -z "$MORPHE_CLI" ]]; then
  if command -v morphe-cli >/dev/null 2>&1; then
    MORPHE_CLI="$(command -v morphe-cli)"
  elif command -v morphe >/dev/null 2>&1; then
    MORPHE_CLI="$(command -v morphe)"
  else
    JAR_CANDIDATES=(
      "$SCRIPT_DIR"/morphe-cli*.jar "$SCRIPT_DIR"/morphe*.jar
      "$PWD"/morphe-cli*.jar "$PWD"/morphe*.jar
      "${HOME}/.local/bin"/morphe*.jar
      "${HOME}/bin"/morphe*.jar
      "${HOME}/Downloads"/morphe*.jar
      "${HOME}/storage/downloads"/morphe*.jar
    )
    for candidate in "${JAR_CANDIDATES[@]}"; do
      if [[ -f "$candidate" ]]; then
        MORPHE_CLI="$candidate"
        break
      fi
    done
  fi
fi

if [[ -z "$INPUT_APK" || ! -f "$INPUT_APK" ]]; then
  echo ""
  echo "=== Bundle ready, but no target Gboard APK found ==="
  echo "Patches bundle (.mpp): $MPP_FILE"
  echo "To patch an APK, specify the input file:"
  echo "  ./patch-gboard.sh /path/to/gboard-base.apk"
  echo "or place a Gboard APK in this directory or ~/Downloads."
  exit 0
fi

if [[ -z "$MORPHE_CLI" ]]; then
  echo ""
  echo "=== Input APK found ($INPUT_APK), but Morphe CLI was not found ==="
  echo "Patches bundle (.mpp): $MPP_FILE"
  echo "Please download Morphe CLI (e.g. morphe-cli.jar) and run:"
  echo "  ./patch-gboard.sh -m /path/to/morphe-cli.jar -i \"$INPUT_APK\" -o \"$OUTPUT_APK\""
  exit 0
fi

echo "=== Patching Gboard ==="
echo "Input APK:      $INPUT_APK"
echo "Patches Bundle: $MPP_FILE"
echo "Output APK:     $OUTPUT_APK"
echo "Morphe CLI:     $MORPHE_CLI"

if [[ "$MORPHE_CLI" == *.jar ]]; then
  MORPHE_CMD=("$JAVA_BIN" -jar "$MORPHE_CLI")
else
  MORPHE_CMD=("$MORPHE_CLI")
fi

PATCH_ARGS=(
  --patches="$MPP_FILE"
  --exclusive
  -e "Thicc Top Bar"
  -e "MultiGlide"
  -e "Typing Effects"
  -e "Custom Hold Popups"
)
if [[ "$RENAME_PACKAGE" == true ]]; then
  PATCH_ARGS+=(-e "Package Rename")
  if [[ -n "$APP_NAME" ]]; then
    PATCH_ARGS+=("-Oapp_display_name=$APP_NAME")
  fi
fi
if [[ "$FORCE_PATCH" == true ]]; then
  PATCH_ARGS+=(--force)
fi

"${MORPHE_CMD[@]}" patch \
  "${PATCH_ARGS[@]}" \
  -o "$OUTPUT_APK" \
  "$INPUT_APK"

echo ""
echo "=== Patching Complete! ==="
echo "Patched APK ready at: $OUTPUT_APK"
