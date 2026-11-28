#!/usr/bin/env bash
# Fetch the local toolchain into tools/. Nothing is installed system-wide.
#
#   scripts/bootstrap.sh              # JDK, apktool, jadx, signing tools
#   scripts/bootstrap.sh --keystore   # also generate a signing keystore (gitignored)
#
# Everything lands in tools/, which is gitignored: the repository stays source-only.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOLS="$ROOT/tools"
mkdir -p "$TOOLS"

JDK_DIR="$TOOLS/jdk"
APKTOOL="$TOOLS/apktool.jar"
JADX_DIR="$TOOLS/jadx"
BUILD_TOOLS="$TOOLS/android/build-tools"

log() { printf '\033[1m==\033[0m %s\n' "$*"; }

fetch() { # url dest
    local url="$1" dest="$2"
    if [ -s "$dest" ]; then
        log "already present: $(basename "$dest")"
        return
    fi
    log "downloading $(basename "$dest")"
    curl -fL --retry 3 --connect-timeout 20 -o "$dest.part" "$url"
    mv "$dest.part" "$dest"
}

sha256_of() { sha256sum "$1" | awk '{print $1}'; }

log "JDK 17"
if [ ! -x "$JDK_DIR/bin/java" ]; then
    fetch "https://api.adoptium.net/v3/binary/latest/17/ga/linux/x64/jdk/hotspot/normal/eclipse" \
        "$TOOLS/jdk.tar.gz"
    mkdir -p "$JDK_DIR"
    tar xzf "$TOOLS/jdk.tar.gz" -C "$JDK_DIR" --strip-components=1
    rm -f "$TOOLS/jdk.tar.gz"
fi
"$JDK_DIR/bin/java" -version 2>&1 | head -1

log "apktool (also provides smali/baksmali/dexlib2)"
fetch "https://github.com/iBotPeaches/Apktool/releases/download/v2.11.1/apktool_2.11.1.jar" "$APKTOOL"

log "jadx (optional, for readable Java when cross-checking)"
if [ ! -x "$JADX_DIR/bin/jadx" ]; then
    fetch "https://github.com/skylot/jadx/releases/download/v1.5.2/jadx-1.5.2.zip" "$TOOLS/jadx.zip"
    mkdir -p "$JADX_DIR"
    unzip -q -o "$TOOLS/jadx.zip" -d "$JADX_DIR"
    chmod +x "$JADX_DIR/bin/jadx" 2>/dev/null || true
    rm -f "$TOOLS/jadx.zip"
fi

log "Android build-tools (zipalign, apksigner)"
if [ ! -x "$BUILD_TOOLS/apksigner" ]; then
    fetch "https://dl.google.com/android/repository/build-tools_r35_linux.zip" "$TOOLS/build-tools.zip"
    mkdir -p "$TOOLS/android"
    unzip -q -o "$TOOLS/build-tools.zip" -d "$TOOLS/android"
    rm -f "$TOOLS/build-tools.zip"
    # the archive extracts to a platform-named directory; normalise it
    found="$(find "$TOOLS/android" -maxdepth 2 -name apksigner -printf '%h\n' | head -1)"
    if [ -n "$found" ] && [ "$found" != "$BUILD_TOOLS" ]; then
        mkdir -p "$BUILD_TOOLS"
        cp -a "$found/." "$BUILD_TOOLS/"
    fi
fi
chmod +x "$BUILD_TOOLS/apksigner" "$BUILD_TOOLS/zipalign" 2>/dev/null || true

if [ "${1:-}" = "--keystore" ]; then
    log "signing keystore"
    KS="$TOOLS/patch.keystore"
    if [ -f "$KS" ]; then
        log "keystore already exists: $KS"
    else
        "$JDK_DIR/bin/keytool" -genkeypair -v \
            -keystore "$KS" -alias wispr-patch -keyalg RSA -keysize 4096 -validity 10000 \
            -storepass patchpass -keypass patchpass \
            -dname "CN=Wispr Flow patch, OU=local, O=local, L=local, ST=local, C=FR"
        log "keystore: $KS (password: patchpass — local testing only, never commit it)"
    fi
fi

log "done. Records of what was downloaded (compute and keep these if you mirror them):"
for f in "$APKTOOL" "$BUILD_TOOLS/apksigner"; do
    [ -f "$f" ] && printf '  %s  %s\n' "$(sha256_of "$f")" "${f#"$TOOLS"/}"
done
