#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
baseline="$source_dir/../v1.10.1"
output=${1:?output directory required}
java_smali=${2:?D8-disassembled development helper smali directory required}
tools_dir=${3:-}
version=${4:?patch version required}
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
mkdir -p "$work/payloads" "$output"
cp -a "$baseline/helpers" "$work/payloads/helpers"
cp -a "$baseline/method-delta" "$work/payloads/method-delta"
python3 "$source_dir/patch-payloads.py" "$work/payloads" "$version"
test -f "$java_smali/e/e/a/Dev111.smali"
cp -a "$java_smali/." "$work/payloads/helpers/"
if [[ -z "$tools_dir" ]]; then
    tools_dir="$work/tools"
    mkdir -p "$tools_dir"
    mvn -q -B -f "$baseline/pom.xml" dependency:copy-dependencies -DoutputDirectory="$tools_dir"
fi
for part in helpers.mpe method-delta.dex; do
    java -cp "$tools_dir/*" org.jf.smali.Main assemble --jobs 1 "$work/payloads/${part%.*}" -o "$output/$part"
done
python3 "$source_dir/verify-overlay.py" "$work/payloads" "$output"
