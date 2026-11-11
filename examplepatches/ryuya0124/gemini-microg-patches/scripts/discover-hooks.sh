#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
[[ $# -eq 1 ]] || fail "Usage: $0 APK"
require_file "$1"
dexkit="$ROOT/tools/dexkit-src/dexkit/build"
[[ -d "$dexkit/library" ]] || fail 'Run scripts/setup-dexkit.sh first.'
native="$(find "$dexkit/library" -maxdepth 1 -type f \( -name 'libdexkit.dylib' -o -name 'libdexkit.so' \) -print -quit)"
[[ -n "$native" ]] || fail 'Run scripts/setup-dexkit.sh first (macOS/Linux).'
commit="$(git -C "$ROOT/tools/dexkit-src" rev-parse HEAD)"
[[ "$commit" == c9cd12a14b75409bebd2f73e4dfc5ff575df3eb8 ]] || fail 'DexKit revision mismatch'
classpath="$dexkit/libs/dexkit.jar:$dexkit/libs/flatbuffers-java-23.5.26.jar:$MORPHE"
rules="$ROOT/config/hook-discovery.tsv"
source_file="$ROOT/analysis/dexkit/DexkitDiscover.kt"
key="$(python3 - "$1" "$rules" "$source_file" "$commit" "$native" "$dexkit/libs/dexkit.jar" <<'PY'
import hashlib, pathlib, sys
hashes = [hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest() for p in [*sys.argv[1:4], *sys.argv[5:]]]
print(hashlib.sha256(('report-v1\n' + '\n'.join(hashes) + '\n' + sys.argv[4]).encode()).hexdigest())
PY
)"
cache="$BUILD_DIR/discovery/$key.json"
if [[ -f "$cache" ]]; then
  printf 'Cached discovery: %s\n' "$cache"
  exit 0
fi
mkdir -p "$BUILD_DIR/discovery"
"$KOTLINC" "$source_file" -cp "$classpath" -d "$BUILD_DIR/dexkit-discover.jar"
staging="$(mktemp "$BUILD_DIR/discovery/report.XXXXXX")"
trap 'rm -f "$staging"' EXIT
"$JAVA" --enable-native-access=ALL-UNNAMED -cp "$BUILD_DIR/dexkit-discover.jar:$classpath" DexkitDiscoverKt "$1" "$rules" "$staging" "$native"
python3 - "$staging" "$1" "$rules" "$commit" <<'PY'
import hashlib, json, pathlib, sys
p = pathlib.Path(sys.argv[1]); d = json.loads(p.read_text())
d.update(apkSha256=hashlib.sha256(pathlib.Path(sys.argv[2]).read_bytes()).hexdigest(),
         rulesSha256=hashlib.sha256(pathlib.Path(sys.argv[3]).read_bytes()).hexdigest(), dexkitCommit=sys.argv[4])
p.write_text(json.dumps(d, indent=2) + '\n')
PY
mv "$staging" "$cache"
printf 'Discovery report: %s\n' "$cache"
