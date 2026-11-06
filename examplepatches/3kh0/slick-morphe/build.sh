#!/usr/bin/env bash
# this is adopted from the morphe youtube implemation! thank you!
set -euo pipefail
# shellcheck source=common.sh
source "$(dirname "$(realpath "$0")")/common.sh"

version="${VERSION:-0.0.0-dev}"
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.-]+)?$ ]] || {
	echo "Invalid version: $version" >&2
	exit 1
}
bundle="$root/dist/slick-android-$version.mpp"
fonts="$root/fonts"
android_jar="$tools/platform/android-37.2/android.jar"

download morphe.jar 855dd2d6fa5ed997a5884a44f8807c9b5bc95e69b5ebd58dfd7e8b897c86e2d7 \
	https://github.com/MorpheApp/morphe-desktop/releases/download/v2.0.0/morphe-desktop-2.0.0-all.jar
download kotlin.zip 7cc140e76daf416a0424a5557f99afd7ca89ebd463ea1101261e3e01c33e75cd \
	https://github.com/JetBrains/kotlin/releases/download/v2.4.21/kotlin-compiler-2.4.21.zip
download r8.jar f8c762ff84640b10083b934a47278758a7665977e618fab0c927fff00521dea3 \
	https://dl.google.com/dl/android/maven2/com/android/tools/r8/9.5.29/r8-9.5.29.jar
download platform.zip 17af98ec1427a1fed9ea278184aba71e53b87eca103655602f9fc64ef11ea4d3 \
	https://dl.google.com/android/repository/platform-37.2_r02.zip
# lexend my beloved
sha256sum -c - <<EOF
3add53e641fbc81da64da4bb254285e2831b52b029527bc0714e2b9610832ee6  $fonts/Lexend.ttf
5da8505887d0fa7fe963445fd58852707fda34adfeb65af25c99d152bab285bd  $fonts/Lexend-OFL.txt
EOF
rm -rf "$tools/kotlinc" "$tools/platform"
unzip -qo "$tools/kotlin.zip" -d "$tools"
unzip -qo "$tools/platform.zip" -d "$tools/platform"

build="$(mktemp -d)"
trap 'rm -rf "$build"' EXIT
d8() { java -Xmx512m -cp "$tools/r8.jar" com.android.tools.r8.D8 "$@"; }

# java extension to slick-extension.dex, and its loaded into Slack by extendWith()!
printf 'package slick.android;\n\nfinal class Version {\n  static final String NAME = "%s";\n}\n' "$version" >"$build/Version.java"
javac --release 11 -cp "$android_jar" -d "$build/ext" "$root"/extension/*.java "$build/Version.java"
jar cf "$build/ext.jar" -C "$build/ext" .
d8 --min-api 32 --lib "$android_jar" --output "$build" "$build/ext.jar"
mv "$build/classes.dex" "$build/slick-extension.dex"

"$tools/kotlinc/bin/kotlinc" -J-Xmx512m -cp "$tools/morphe.jar" -jvm-target 11 -Xlambdas=class \
	"$root"/patches/*.kt -d "$build/patches.jar"
d8 --min-api 26 --lib "$JAVA_HOME" --classpath "$tools/morphe.jar" --output "$build" "$build/patches.jar"

cat >"$build/about.mf" <<EOF
Name: Slick Android patches
Description: Native Slick mods for Slack on Android via Morphe
Version: $version
Patcher-Version: 2.2.0
License: GPLv3
Source: https://github.com/3kh0/slick-morphe

EOF
jar ufm "$build/patches.jar" "$build/about.mf" -C "$build" classes.dex -C "$build" slick-extension.dex \
	-C "$fonts" Lexend.ttf -C "$fonts" Lexend-OFL.txt
mkdir -p "$(dirname "$bundle")"
cp "$build/patches.jar" "$bundle"
# patches-list.json describes the bundle for the Morphe index; release.yml commits it to main.
"$tools/kotlinc/bin/kotlinc" -J-Xmx512m -cp "$tools/morphe.jar" -jvm-target 11 \
	"$root/scripts/PatchesList.kt" -d "$build/list"
java -cp "$tools/morphe.jar:$build/list" PatchesListKt "$bundle" "$version" "$root/dist/patches-list.json"
java -jar "$tools/morphe.jar" list-patches --patches "$bundle" --with-packages --with-versions
printf '\nBuilt %s\n' "$bundle"
