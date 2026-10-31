#!/usr/bin/env bash
# ==============================================================================
# Shared helpers for every build script in this repository.
#
# Provides:
#   - path/tool discovery (java, kotlinc, d8, patcher jar, APKEditor)
#   - input provisioning (Gboard base APK, PixelBoard APK, PixelBoard .mpp)
#   - signing + Morphe patcher invocation
#
# Override any default with an environment variable, e.g.
#   JAVA_HOME=... KOTLINC=... SIGNING_KEY=pixelboard ./scripts/build-all.sh
# ==============================================================================

set -euo pipefail

LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$(cd "$LIB_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$SCRIPTS_DIR/.." && pwd)"

# shellcheck source=../pins.env
source "$SCRIPTS_DIR/pins.env"

SIBLING_DIR="${SIBLING_DIR:-$PROJECT_ROOT/../PixelBoard}"
INPUT_DIR="${INPUT_DIR:-$PROJECT_ROOT/input}"
OUTPUT_DIR="${OUTPUT_DIR:-$PROJECT_ROOT/output}"
TOOLS_DIR="${TOOLS_DIR:-$PROJECT_ROOT/tools}"
BUILD_DIR="${BUILD_DIR:-$PROJECT_ROOT/build/local}"
MPP_OUT="${MPP_OUT:-$PROJECT_ROOT/patches/GboardClipboardHistory.mpp}"

PIXELBOARD_REPO="${PIXELBOARD_REPO:-Akshayykadam/PixelBoard}"
PIXELBOARD_TAG="${PIXELBOARD_TAG:-$PIXELBOARD_RELEASE_TAG}"
PIXELBOARD_MPP_TAG="${PIXELBOARD_MPP_TAG:-$PIXELBOARD_RELEASE_TAG}"

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*" >&2; }
warn() { printf '\033[1;33mWARN:\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[1;31mERR:\033[0m %s\n' "$*" >&2; exit 1; }

# ---------------------------------------------------------------- downloads ---
# verify_sha256 <file> <expected>
# Compares the digest of <file> with <expected>. Fails closed.
verify_sha256() {
    local file="$1" expected="$2" actual
    [[ -f "$file" ]] || die "cannot verify missing file: $file"
    actual="$(shasum -a 256 "$file" | awk '{print $1}')"
    if [[ "$actual" != "$expected" ]]; then
        die "checksum mismatch for $file
     expected $expected
     actual   $actual
     Refusing to continue. Delete the file and retry, or update scripts/pins.env after checking the source."
    fi
}

# download_pinned <url> <dest> <expected sha256>
# Downloads to a temporary file, verifies the digest, then moves it into place.
# A partial or tampered download never reaches <dest>.
download_pinned() {
    local url="$1" dest="$2" expected="$3" tmp
    tmp="$dest.part"
    rm -f "$tmp"
    log "downloading $(basename "$dest")"
    if ! curl -fL --retry 3 --proto '=https' --tlsv1.2 -o "$tmp" "$url"; then
        rm -f "$tmp"
        die "download failed: $url"
    fi
    if ! verify_sha256 "$tmp" "$expected"; then
        rm -f "$tmp"
        die "discarded download with unexpected digest: $url"
    fi
    mv -f "$tmp" "$dest"
}

# ---------------------------------------------------------------- java ------
find_java() {
    if [[ -n "${JAVA_HOME:-}" && -x "$JAVA_HOME/bin/java" ]]; then
        echo "$JAVA_HOME/bin/java"; return 0
    fi
    for candidate in \
        "/opt/homebrew/opt/openjdk/bin/java" \
        "/opt/homebrew/opt/openjdk@21/bin/java" \
        "/Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java" \
        "$(/usr/libexec/java_home -v 21 2>/dev/null || true)/bin/java" \
        "$(command -v java 2>/dev/null || true)"; do
        [[ -n "$candidate" && -x "$candidate" ]] || continue
        ver=$("$candidate" -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1 || true)
        [[ -n "$ver" && "$ver" -ge 21 ]] && { echo "$candidate"; return 0; }
    done
    return 1
}

# ---------------------------------------------------------------- tools -----
find_kotlinc() {
    for candidate in \
        "${KOTLINC:-}" \
        "$SIBLING_DIR/scratch/kotlinc/bin/kotlinc" \
        "$(command -v kotlinc 2>/dev/null || true)"; do
        [[ -n "$candidate" && -x "$candidate" ]] && { echo "$candidate"; return 0; }
    done
    return 1
}

find_d8() {
    local sdk="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-$HOME/Library/Android/sdk}}"
    local d8
    d8=$(ls -1 "$sdk"/build-tools/*/d8 2>/dev/null | sort -V | tail -1 || true)
    [[ -n "$d8" ]] && { echo "$d8"; return 0; }
    return 1
}

find_android_jar() {
    local sdk="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-$HOME/Library/Android/sdk}}"
    local jar
    jar=$(ls -1d "$sdk"/platforms/android-3[4-9]*/android.jar 2>/dev/null | sort -V | tail -1 || true)
    [[ -n "$jar" ]] && { echo "$jar"; return 0; }
    return 1
}

find_apkeditor() {
    for candidate in \
        "${APKEDITOR:-}" \
        "$SIBLING_DIR/scratch/APKEditor.jar" \
        "$TOOLS_DIR/APKEditor.jar"; do
        [[ -n "$candidate" && -f "$candidate" ]] && { echo "$candidate"; return 0; }
    done
    return 1
}

find_aapt2() {
    local sdk="${ANDROID_SDK_ROOT:-${ANDROID_HOME:-$HOME/Library/Android/sdk}}"
    local bin
    bin=$(ls -1 "$sdk"/build-tools/*/aapt2 2>/dev/null | sort -V | tail -1 || true)
    [[ -n "$bin" ]] && { echo "$bin"; return 0; }
    return 1
}

# Morphe patcher jar: prefer the local sibling checkout, fall back to the
# upstream PixelBoard repository (tools/patcher.jar is tracked there).
# The upstream URL points at a commit and the download is checked against a
# pinned sha256, so a moved branch cannot feed code to the build.
ensure_patcher_jar() {
    if [[ -f "$TOOLS_DIR/patcher.jar" ]]; then
        verify_sha256 "$TOOLS_DIR/patcher.jar" "$PATCHER_JAR_SHA256"
        echo "$TOOLS_DIR/patcher.jar"; return 0
    fi
    if [[ -f "$SIBLING_DIR/tools/patcher.jar" ]]; then
        log "copying patcher.jar from $SIBLING_DIR/tools"
        mkdir -p "$TOOLS_DIR"
        cp "$SIBLING_DIR/tools/patcher.jar" "$TOOLS_DIR/patcher.jar"
        verify_sha256 "$TOOLS_DIR/patcher.jar" "$PATCHER_JAR_SHA256"
        echo "$TOOLS_DIR/patcher.jar"; return 0
    fi
    mkdir -p "$TOOLS_DIR"
    download_pinned \
        "https://raw.githubusercontent.com/$PIXELBOARD_REPO/$PATCHER_JAR_COMMIT/tools/patcher.jar" \
        "$TOOLS_DIR/patcher.jar" \
        "$PATCHER_JAR_SHA256"
    echo "$TOOLS_DIR/patcher.jar"
}

# -------------------------------------------------------------- keystore ---
# Keystore passwords are not stored in this repository. Resolution order:
#   1. $KEYSTORE_PASSWORD                       (environment)
#   2. $KEYSTORE_PASSWORD_FILE                  (file holding the password)
#   3. $TOOLS_DIR/patcher-data/keystore-<alias>.password  (gitignored local file)
# A missing keystore is created with a random password that is written to the
# local password file with 0600 permissions.
#
# Signing key selection:
#   SIGNING_KEY=clipboard   (default) own key, tools/patcher-data/clipboard.keystore
#   SIGNING_KEY=pixelboard  legacy key shared with the PixelBoard project
#
# The two keys are separate on purpose. A keyboard holds every keystroke and
# the full clipboard, so a leaked signing key must not be reusable by another
# project. Switching between the two keys changes the app signature and the
# system asks for an uninstall before the new build can be installed.
LEGACY_PASSWORDS=("pixelboard" "clipboard" "password" "changeit")

keystore_password_file_default() {
    echo "$TOOLS_DIR/patcher-data/keystore-$1.password"
}

resolve_keystore_password() {
    local alias="$1"
    local fallback
    fallback="$(keystore_password_file_default "$alias")"

    if [[ -n "${KEYSTORE_PASSWORD:-}" ]]; then
        KEYSTORE_PASSWORD="$KEYSTORE_PASSWORD"
        KEYSTORE_PASSWORD_SOURCE="environment"
    elif [[ -n "${KEYSTORE_PASSWORD_FILE:-}" ]]; then
        [[ -f "$KEYSTORE_PASSWORD_FILE" ]] \
            || die "KEYSTORE_PASSWORD_FILE does not exist: $KEYSTORE_PASSWORD_FILE"
        KEYSTORE_PASSWORD="$(head -n 1 "$KEYSTORE_PASSWORD_FILE" | tr -d '\r\n')"
        KEYSTORE_PASSWORD_SOURCE="$KEYSTORE_PASSWORD_FILE"
    elif [[ -f "$fallback" ]]; then
        KEYSTORE_PASSWORD="$(head -n 1 "$fallback" | tr -d '\r\n')"
        KEYSTORE_PASSWORD_SOURCE="$fallback"
    else
        KEYSTORE_PASSWORD=""
        KEYSTORE_PASSWORD_SOURCE=""
    fi

    if [[ -z "$KEYSTORE_PASSWORD" && ! -f "$KEYSTORE_PATH" ]]; then
        # Fresh keystore. Generate a random password and store it locally.
        KEYSTORE_PASSWORD="$(head -c 32 /dev/urandom | od -An -tx1 | tr -d ' \n')"
        KEYSTORE_PASSWORD_SOURCE="$fallback (generated)"
        mkdir -p "$(dirname "$fallback")"
        (umask 077 && printf '%s\n' "$KEYSTORE_PASSWORD" > "$fallback")
        log "generated a new keystore password, stored in $fallback"
    fi

    [[ -n "$KEYSTORE_PASSWORD" ]] \
        || die "no password for keystore '$alias'. Set KEYSTORE_PASSWORD, point KEYSTORE_PASSWORD_FILE at a file, or create $fallback (chmod 600)."

    log "keystore password for '$alias' comes from $KEYSTORE_PASSWORD_SOURCE"

    local legacy
    for legacy in "${LEGACY_PASSWORDS[@]}"; do
        if [[ "$KEYSTORE_PASSWORD" == "$legacy" ]]; then
            warn "keystore password for '$alias' is a well known default. Rotate it before publishing builds."
            break
        fi
    done

    KEYSTORE_KEY_PASSWORD="${KEYSTORE_KEY_PASSWORD:-$KEYSTORE_PASSWORD}"
}

resolve_keystore() {
    local key="${SIGNING_KEY:-clipboard}"
    case "$key" in
        clipboard)
            SIGNER_NAME="GboardClipboard"
            KEYSTORE_PATH="${KEYSTORE_PATH:-$TOOLS_DIR/patcher-data/clipboard.keystore}"
            KEYSTORE_ALIAS="clipboard"
            ;;
        pixelboard)
            SIGNER_NAME="PixelBoard"
            KEYSTORE_PATH="${KEYSTORE_PATH:-$SIBLING_DIR/tools/patcher-data/pixelboard.keystore}"
            KEYSTORE_ALIAS="pixelboard"
            ;;
        *)
            die "unknown SIGNING_KEY '$key' (expected clipboard or pixelboard)"
            ;;
    esac
    resolve_keystore_password "$KEYSTORE_ALIAS"
    if [[ ! -f "$KEYSTORE_PATH" ]]; then
        log "generating keystore $KEYSTORE_PATH"
        mkdir -p "$(dirname "$KEYSTORE_PATH")"
        (umask 077 && keytool -genkeypair \
            -keystore "$KEYSTORE_PATH" -alias "$KEYSTORE_ALIAS" \
            -keyalg RSA -keysize 2048 -validity 10000 \
            -storepass "$KEYSTORE_PASSWORD" -keypass "$KEYSTORE_KEY_PASSWORD" \
            -dname "CN=$SIGNER_NAME, OU=Keyboard, O=OpenSource, L=Unknown, ST=Unknown, C=US" \
            >/dev/null 2>&1)
    fi
}

# ---------------------------------------------------------------- inputs ----
# Gboard base APK. Priority:
#   1. $INPUT_DIR/gboard-merged.apk (already merged, preferred)
#   2. $INPUT_DIR/splits/*.apk merged on the fly with APKEditor
#   3. $GBOARD_APK (explicit override)
#   4. the pinned base from the build-inputs release, checked against its digest
ensure_gboard_apk() {
    if [[ -n "${GBOARD_APK:-}" && -f "$GBOARD_APK" ]]; then
        echo "$GBOARD_APK"; return 0
    fi
    local merged="$INPUT_DIR/gboard-merged.apk"
    if [[ -f "$merged" ]]; then
        verify_sha256 "$merged" "$GBOARD_BASE_APK_SHA256"
        echo "$merged"; return 0
    fi
    if [[ -d "$INPUT_DIR/splits" ]]; then
        log "merging Gboard splits from $INPUT_DIR/splits"
        local editor
        editor=$(find_apkeditor) || die "APKEditor.jar not found (needed to merge splits)"
        local merged_out="$INPUT_DIR/gboard-merged.apk"
        rm -rf "$BUILD_DIR/splits-merge"
        "$JAVA_BIN" -jar "$editor" m \
            -i "$INPUT_DIR/splits" \
            -o "$merged_out" >/dev/null 2>&1 || die "APKEditor merge failed"
        echo "$merged_out"; return 0
    fi
    mkdir -p "$INPUT_DIR"
    download_pinned "$GBOARD_BASE_APK_URL" "$merged" "$GBOARD_BASE_APK_SHA256"
    echo "$merged"
}

# Latest released PixelBoard APK (release asset).
ensure_pixelboard_apk() {
    local target="$INPUT_DIR/$PIXELBOARD_APK_ASSET"
    if [[ -f "$target" ]]; then
        verify_sha256 "$target" "$PIXELBOARD_APK_SHA256"
        echo "$target"; return 0
    fi
    mkdir -p "$INPUT_DIR"
    download_pinned \
        "https://github.com/$PIXELBOARD_REPO/releases/download/$PIXELBOARD_TAG/$PIXELBOARD_APK_ASSET" \
        "$target" \
        "$PIXELBOARD_APK_SHA256"
    echo "$target"
}

# PixelBoard patch bundle (.mpp) used for the combined builds.
ensure_pixelboard_mpp() {
    local target="$INPUT_DIR/$PIXELBOARD_MPP_ASSET"
    if [[ -f "$target" ]]; then
        verify_sha256 "$target" "$PIXELBOARD_MPP_SHA256"
        echo "$target"; return 0
    fi
    mkdir -p "$INPUT_DIR"
    download_pinned \
        "https://github.com/$PIXELBOARD_REPO/releases/download/$PIXELBOARD_MPP_TAG/$PIXELBOARD_MPP_ASSET" \
        "$target" \
        "$PIXELBOARD_MPP_SHA256"
    echo "$target"
}

# ---------------------------------------------------------------- patcher ---
# run_patcher <output apk> <result json> <apk> [-- extra morphe args ...]
# Extra args are passed straight through to `morphe-desktop patch`.
run_patcher() {
    local out="$1"; shift
    local result="$1"; shift
    local apk="$1"; shift

    mkdir -p "$OUTPUT_DIR" "$TOOLS_DIR/patcher-data/tmp"
    "$JAVA_BIN" -jar "$PATCHER_JAR" patch \
        --keystore="$KEYSTORE_PATH" \
        --keystore-password="$KEYSTORE_PASSWORD" \
        --keystore-entry-alias="$KEYSTORE_ALIAS" \
        --keystore-entry-password="$KEYSTORE_KEY_PASSWORD" \
        -t="$TOOLS_DIR/patcher-data/tmp" \
        --signer="$SIGNER_NAME" \
        -o="$out" \
        -r="$result" \
        "$@" \
        "$apk"
}

# Common tool bootstrap, call once per script.
init_tools() {
    JAVA_BIN="${JAVA_BIN:-$(find_java || true)}"
    [[ -n "$JAVA_BIN" ]] || die "Java 21+ not found (set JAVA_HOME)"

    PATCHER_JAR="${PATCHER_JAR:-$(ensure_patcher_jar)}"
    D8_BIN="${D8_BIN:-$(find_d8 || true)}"
    ANDROID_JAR="${ANDROID_JAR:-$(find_android_jar || true)}"

    mkdir -p "$OUTPUT_DIR" "$INPUT_DIR" "$TOOLS_DIR" "$BUILD_DIR"
    resolve_keystore
}
