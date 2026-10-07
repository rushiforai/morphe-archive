#!/usr/bin/env bash
# Public-release fallback for the official template when GitHub Packages is unavailable.
set -euo pipefail
cd "$(dirname "$0")/.."
python3 scripts/bootstrap-public.py
tool_cache="${NLZIET_TOOL_CACHE:-${HOME}/.cache/nlziet-pip-tools}"
android_jar="$tool_cache/sdk/platforms/android-36/android.jar"
desktop="$tool_cache/morphe-desktop-1.18.1-all.jar"
work=build/public-toolchain
rm -rf "$work"
mkdir -p "$work/classes/extensions" "$work/extension" "$work/extension-dex" "$work/patch-dex" patches/build/libs
javac --release 17 -cp "$android_jar" -d "$work/extension" extensions/extension/src/main/java/nl/nlziet/pip/NativePip.java
jar --create --file "$work/extension.jar" -C "$work/extension" .
java -cp "$tool_cache/r8-9.5.22.jar" com.android.tools.r8.D8 --release --min-api 29 --lib "$android_jar" --output "$work/extension-dex" "$work/extension.jar"
cp "$work/extension-dex/classes.dex" "$work/classes/extensions/extension.mpe"
"$tool_cache/kotlinc/bin/kotlinc" patches/src/main/kotlin -jvm-target 11 -classpath "$desktop:$tool_cache/gson-2.14.0.jar" -d "$work/classes"
cat > "$work/MANIFEST.MF" <<'EOF'
Manifest-Version: 1.0
Name: John's Morphe Patches
Description: Native Android PiP for inspected NLZIET 5.15.3
Version: 1.0.0
Source: https://github.com/DigitalPals/johns-morphe-patches
Author: John
License: GPLv3
Patcher-Version: 1.15.1

EOF
jar --create --file "$work/patches.jar" --manifest "$work/MANIFEST.MF" -C "$work/classes" .
java -cp "$tool_cache/r8-9.5.22.jar" com.android.tools.r8.D8 --release --min-api 26 --lib "$android_jar" --classpath "$desktop" --classpath "$tool_cache/gson-2.14.0.jar" --output "$work/patch-dex" "$work/patches.jar"
cp "$work/patches.jar" patches/build/libs/patches-1.0.0.mpp
jar --update --file patches/build/libs/patches-1.0.0.mpp -C "$work/patch-dex" .
java -jar "$desktop" list-patches --patches patches/build/libs/patches-1.0.0.mpp
sha256sum patches/build/libs/patches-1.0.0.mpp
