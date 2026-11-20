#!/usr/bin/env bash
set -euo pipefail

if [[ $# != 2 ]]; then
    printf 'Usage: %s /path/to/morphe-desktop-2.2.0-all.jar /path/to/gradle-9.8.2\n' "$0" >&2
    exit 2
fi

desktop_jar=$(realpath "$1")
gradle_home=$(realpath "$2")
sdk_root=${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Android/Sdk}}
java_bin=${JAVA_HOME:+$JAVA_HOME/bin/}java
jar_bin=${JAVA_HOME:+$JAVA_HOME/bin/}jar
if [[ -n ${JAVA_HOME:-} && ! -x "$jar_bin" ]]; then jar_bin=$(command -v jar); fi
project_dir=$(cd -- "$(dirname -- "$0")" && pwd)
version=$(<"$project_dir/VERSION")
bundle_name="deezer-local-$version.mpp"
mkdir -p "$project_dir/build"
work_dir=$(mktemp -d "$project_dir/build/.work.XXXXXXXX")
trap 'rm -rf -- "$work_dir"' EXIT

mkdir -p "$work_dir/classes"
"$java_bin" -cp "$gradle_home/lib/*" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler \
    -no-stdlib -no-reflect -language-version 2.2 -api-version 2.2 -jvm-target 17 -classpath "$desktop_jar" \
    -d "$work_dir/classes" "$project_dir"/src/*.kt
"$jar_bin" --create --file "$work_dir/patch-classes.jar" -C "$work_dir/classes" .
"$sdk_root/build-tools/36.1.0/d8" --release --min-api 26 \
    --lib "$sdk_root/platforms/android-34/android.jar" --classpath "$desktop_jar" \
    --output "$work_dir" "$work_dir/patch-classes.jar"

cat > "$work_dir/manifest.mf" <<MANIFEST
Manifest-Version: 1.0
Name: Deezer Local Patches
Version: $version
Patcher-Version: 2.4.0

MANIFEST
"$jar_bin" --create --file "$work_dir/$bundle_name" \
    --manifest "$work_dir/manifest.mf" -C "$work_dir/classes" . -C "$work_dir" classes.dex
mv -- "$work_dir/$bundle_name" "$project_dir/build/$bundle_name"
printf '%s\n' "$project_dir/build/$bundle_name"
