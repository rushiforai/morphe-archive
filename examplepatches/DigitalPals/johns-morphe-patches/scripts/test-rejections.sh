#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
apk="${1:?usage: scripts/test-rejections.sh patched.apk}"
tool_cache="${NLZIET_TOOL_CACHE:-${HOME}/.cache/nlziet-pip-tools}"
desktop="$tool_cache/morphe-desktop-1.18.1-all.jar"
mkdir -p build/negative-tests
javac -cp "$desktop" -d build/negative-tests tests/MakeWrongVersion.java
java -cp "build/negative-tests:$desktop" MakeWrongVersion "$apk" build/negative-tests/wrong-version.apk
for test_case in wrong-version repatch; do
    input="$apk"
    if [[ "$test_case" == wrong-version ]]; then input=build/negative-tests/wrong-version.apk; fi
    if java -Xmx2g -jar "$desktop" patch --force --patches patches/build/libs/patches-1.0.0.mpp --out "build/negative-tests/$test_case-output.apk" --result-file "build/negative-tests/$test_case-result.json" --temporary-files-path "build/negative-tests/$test_case-tmp" "$input" > "build/negative-tests/$test_case.log" 2>&1; then :; fi
 done
python3 - <<'PY'
import json
from pathlib import Path
for name, message in [('wrong-version', 'requires inspected nl.nlziet 5.15.3 (740503)'), ('repatch', 'Expected exactly one PlayerView.onPause call')]:
    result = json.loads((Path('build/negative-tests') / (name + '-result.json')).read_text())
    assert result['failedPatches'], result
    assert message in result['failedPatches'][0]['reason'], result
    assert not (Path('build/negative-tests') / (name + '-output.apk')).exists()
    print(name + ': rejected with expected error; no output APK')
PY
