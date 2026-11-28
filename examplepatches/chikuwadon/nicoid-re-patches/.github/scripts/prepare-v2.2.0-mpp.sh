#!/usr/bin/env bash
# Prepare the exact reviewed v2.2.0 MPP in the conventional release locations.
# This entry point only builds and validates; it never creates a tag or Release.
set -euo pipefail
[[ $# == 2 ]] || { echo "Usage: $0 LOCKED_INPUT_DIR JAVA21_HOME" >&2; exit 2; }
ROOT=$(cd "$(dirname "$0")/../.." && pwd -P)
INPUT=$(realpath "$1")
J21=$(realpath "$2")
cd "$ROOT"
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]2[.]0[[:space:]]*$' gradle.properties
test -x "$J21/bin/java"
test -x "$J21/bin/javac"
R="$ROOT/porting/revisions/v2.2.0-recovery"
V="$ROOT/porting/revisions/v2.2.0-jvm-review"
test -s "$R/build-ci.sh"
test -s "$V/stage-reviewed-notices.py"
python3 "$R/prepare-ci-inputs.py" --verify-only "$INPUT"
W=$(mktemp -d)
trap 'rm -rf "$W"' EXIT
./gradlew :patches:rebuildV220Ci --no-daemon \
  "-PnicoidV220InputDir=$INPUT" "-PnicoidV220Output=$W/build" "-PnicoidV220JavaHome=$J21"
B="$W/build"
CANDIDATE="$B/patches-2.2.0.mpp"
python3 "$V/stage-reviewed-notices.py" "$B/nicoid-re-v2.2.0-reconstructed-unpublished.mpp" "$ROOT" "$R" "$V" "$CANDIDATE"
python3 .github/scripts/verify_android_mpp.py "$CANDIDATE" 2.2.0
RUNNER_TEMP="$W" python3 .github/scripts/verify-release-mpp.py record 2.2.0 "$CANDIDATE"
CP=$(cat "$B/runtimeClasspath.cp")
G=$(cat "$B/patchListGeneratorClasspath.cp")
mkdir -p "$W/metadata/patches"
(cd "$W/metadata/patches"; "$J21/bin/java" -cp "$B/classes:$CP:$G" util.PatchListGeneratorKt "$CANDIDATE")
python3 - "$W/metadata/patches-list.json" <<'PY'
import json,sys
p=json.load(open(sys.argv[1],encoding='utf-8'))
assert p['version']=='2.2.0' and len(p['patches'])==1
q=p['patches'][0]
assert q['name']=='nicoid Re'
assert any(c['packageName']=='com.sauzask.nicoid' and c['apkFileType']=='APK' and
           any(t['version']=='6.49' for t in c['targets']) for c in q['compatiblePackages'])
print('PASS generated canonical patch metadata')
PY
RUNNER_TEMP="$W" python3 .github/scripts/verify-release-mpp.py check 2.2.0 "$CANDIDATE"
# Do not invoke the older Gradle Android/jvm packaging paths after this.
# Do not modify the checked-in baseline DEX, needed for the cumulative rebuild.
mkdir -p patches/build/libs
python3 - "$CANDIDATE" "$W/metadata/patches-list.json" <<'PY'
import os,sys,tempfile,shutil
from pathlib import Path
for src,dst in zip(map(Path,sys.argv[1:]),map(Path,['patches/build/libs/patches-2.2.0.mpp','patches-list.json'])):
    with tempfile.NamedTemporaryFile(dir=dst.parent,delete=False) as f:
        tmp=Path(f.name)
        try:
            with src.open('rb') as s: shutil.copyfileobj(s,f)
            f.flush()
            os.fchmod(f.fileno(),0o644)
            os.fsync(f.fileno())
        except BaseException:
            tmp.unlink(missing_ok=True)
            raise
    try: os.replace(tmp,dst)
    finally: tmp.unlink(missing_ok=True)
PY
RUNNER_TEMP="$W" python3 .github/scripts/verify-release-mpp.py check 2.2.0 patches/build/libs/patches-2.2.0.mpp
echo 'PASS conventional release paths; no tag or release created'
