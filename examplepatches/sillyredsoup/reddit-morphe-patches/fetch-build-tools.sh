#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
tools_dir="$repo_dir/.local-tools"
mkdir -p "$tools_dir"

download() {
    local url="$1" target="$2"
    if [[ ! -s "$target" ]]; then
        curl --fail --location --retry 3 --output "$target.tmp" "$url"
        mv "$target.tmp" "$target"
    fi
}

download "https://github.com/MorpheApp/morphe-desktop/releases/download/v1.17.0/morphe-desktop-1.17.0-all.jar" "$tools_dir/morphe-desktop.jar"
download "https://dl.google.com/dl/android/maven2/com/android/tools/r8/9.4.27/r8-9.4.27.jar" "$tools_dir/r8.jar"
download "https://repo.maven.apache.org/maven2/com/google/android/android/4.1.1.4/android-4.1.1.4.jar" "$tools_dir/android.jar"
