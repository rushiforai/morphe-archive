#!/usr/bin/env bash
# Builds dist/tiktok-tweaks.mpp. Needs bash, curl, unzip and a JDK 17 or newer.
set -euo pipefail
cd "$(dirname "$0")"

VERSION=${VERSION:-0.0.0-dev}
T=tools
CLI=$T/morphe-desktop-2.1.1-all.jar
R8=$T/r8.jar
ANDROID=$T/android34/android.jar

fetch() { # path url sha256
    [ -f "$1" ] || curl -fsSL -o "$1" "$2"
    echo "$3  $1" | sha256sum -c --quiet -
}

mkdir -p "$T" dist
fetch "$CLI" https://github.com/MorpheApp/morphe-desktop/releases/download/v2.1.1/morphe-desktop-2.1.1-all.jar \
    3a2efefd567b44dde15971a58d5aa649a32aba30781d3400dc08d688c720168f
fetch "$R8" https://storage.googleapis.com/r8-releases/raw/8.13.17/r8.jar \
    98b7741c0ed50bf86174bea93a62d1879e838fae6d7166fd4fac2787e11b3572
fetch "$T/platform-34.zip" https://dl.google.com/android/repository/platform-34-ext7_r03.zip \
    16fdb74c55e59ae3ef52def135aec713508467bd56d7dabcd8c9be31fa8b20f3
[ -f "$ANDROID" ] || unzip -o -q -j "$T/platform-34.zip" '*/android.jar' -d "$T/android34"

OUT=build/out
rm -rf "$OUT"
mkdir -p "$OUT"/{stubs,extension,patches,dex-ext,dex-patch,res/extensions}

javac --release 11 -nowarn -d "$OUT/stubs" $(find stubs/src -name '*.java')
javac --release 11 -nowarn -cp "$OUT/stubs:$ANDROID" -d "$OUT/extension" $(find extension/src -name '*.java')
javac --release 11 -nowarn -cp "$CLI" -d "$OUT/patches" $(find patches/src -name '*.java')

jar --create --file "$OUT/extension.jar" -C "$OUT/extension" .
jar --create --file "$OUT/patches.jar" -C "$OUT/patches" .

java -Xmx2g -cp "$R8" com.android.tools.r8.D8 --release --min-api 23 \
    --lib "$ANDROID" --classpath "$OUT/stubs" --output "$OUT/dex-ext" "$OUT/extension.jar"
java -Xmx2g -cp "$R8" com.android.tools.r8.D8 --release --min-api 26 \
    --classpath "$CLI" --output "$OUT/dex-patch" "$OUT/patches.jar"

cp "$OUT/dex-ext/classes.dex" "$OUT/res/extensions/tiktok.mpe"
printf 'Manifest-Version: 1.0\nName: TikTok Tweaks\nDescription: Patches for TikTok\nVersion: %s\nAuthor: inxomnyaa\nLicense: GPL-3.0-only\nPatcher-Version: 2.3.0\n\n' "$VERSION" > "$OUT/MANIFEST.MF"
jar --create --file dist/tiktok-tweaks.mpp --manifest "$OUT/MANIFEST.MF" \
    -C "$OUT/patches" . -C "$OUT/dex-patch" . -C "$OUT/res" .
ls -la dist/tiktok-tweaks.mpp
