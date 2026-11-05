#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
output=${1:?output directory required}
if [[ $# -eq 2 ]]; then
    tools=$2
else
    tools=$(mktemp -d)
    trap 'rm -rf "$tools"' EXIT
    mvn -q -B -f "$source_dir/pom.xml" dependency:copy-dependencies -DoutputDirectory="$tools"
fi
mkdir -p "$output"
for part in helpers.mpe method-delta.dex; do
    java -cp "$tools/*" org.jf.smali.Main assemble "$source_dir/${part%.*}" -o "$output/$part"
done
