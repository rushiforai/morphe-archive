#!/usr/bin/env bash
#
# Create the standard versioned working directory for one app version:
#
#   .tmp/<app>/<version>/
#     in/            stock APK/APKM/XAPK
#     out/           patched APK(s), apply log, result JSON
#     decompiled/    jadx/apktool output
#     harness/       scripts, pulled files, dumps
#     screenshots/   verification captures
#
# The command is idempotent. It prints the absolute path where the stock APK should
# be placed, so an agent can scaffold the folder and hand that path to the user.

set -euo pipefail

usage() {
    cat <<'EOF'
Usage: tools/new-workdir.sh <app> <version>

Create .tmp/<app>/<version>/{in,out,decompiled,harness,screenshots} and print
the folder where the stock APK/APKM/XAPK should be placed.

Example:
    tools/new-workdir.sh solid_explorer 3.6.5
EOF
}

if [[ $# -eq 1 && ( "$1" == "-h" || "$1" == "--help" ) ]]; then
    usage
    exit 0
fi
if [[ $# -ne 2 ]]; then
    usage >&2
    exit 1
fi

app=$1
version=$2

# Keep paths inside .tmp/<app>/<version>/ and reject traversal or shell-hostile names.
case "$app" in
    "" | "." | ".." | *[!A-Za-z0-9._-]*)
        echo "error: invalid app name: $app" >&2
        exit 1
        ;;
esac
case "$version" in
    "" | "." | ".." | *[!A-Za-z0-9._+-]*)
        echo "error: invalid version: $version" >&2
        exit 1
        ;;
esac

root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
base="$root/.tmp/$app/$version"

mkdir -p "$base"/in "$base"/out "$base"/decompiled "$base"/harness "$base"/screenshots

echo "Working directory: $base"
echo
echo "Put the stock APK/APKM/XAPK here, keeping its original filename:"
echo "  $base/in/"
echo

files=()
for file in "$base"/in/*; do
    [[ -f "$file" ]] || continue
    files+=("$file")
done

if [[ ${#files[@]} -eq 0 ]]; then
    echo "The folder is empty. Once the APK is in place, run:"
    echo "  python3 tools/verify_fingerprints.py \"$base/in/<file>\""
else
    echo "Already present:"
    for file in "${files[@]}"; do
        echo "  $(basename "$file")"
    done
fi
