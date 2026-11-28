#!/usr/bin/env bash
set -euo pipefail
# Usage: bash verify.sh BUILD_DIR STOCK_NICOID_APK REFERENCE_FORMAL_CANDIDATE_MPP NEW_TEST_DIR
T=$(realpath "$(dirname "$0")"); B=$(realpath "$1"); APK=$(realpath "$2"); REF=$(realpath "$3"); O=$(realpath -m "$4"); test ! -e "$O"; mkdir -p "$O"; cd "$O"
python3 - "$T" "$B" "$APK" "$REF" <<'PY'
from pathlib import Path
import hashlib,json,sys
T,B,A,R=map(Path,sys.argv[1:]); h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert h(A)=='17fc6b46228af184437ade7e6f5573915bc655b86996307ff3270fdf35279cce'
assert h(B/'nicoid-re-v2.2.0-reconstructed-unpublished.mpp')==json.loads((T/'locks/archive-lock.json').read_text())['mpp_sha256']
assert h(R)==json.loads((T/'locks/archive-lock.json').read_text())['reference_mpp_sha256']
PY
CP=$(cat "$B/runtimeClasspath.cp"); G=$(cat "$B/patchListGeneratorClasspath.cp"); W="$B/fixed"; CPG="$W/tools/assemble/*:$W/tools/dexlib2.jar:$W/libs/guava-new.jar:$W/libs/failureaccess-new.jar"; M="$B/nicoid-re-v2.2.0-reconstructed-unpublished.mpp"
mkdir metadata; (cd metadata; java -cp "$B/classes:$CP:$G" util.PatchListGeneratorKt "$M")
python3 - <<'PY'
import json
p=json.load(open('patches-list.json')); assert p['version']=='2.2.0' and len(p['patches'])==1; r=p['patches'][0];assert r['name']=='nicoid Re'; assert any(c['packageName']=='com.sauzask.nicoid' and any(t['version']=='6.49' for t in c['targets']) for c in r['compatiblePackages']);print('PASS patch metadata 2.2.0 / 1 patch / 6.49')
PY
javac -cp "$CP" -d . "$T/tests/Probe250.java"
java -Xmx3g -cp ".:$CP" Probe250 "$APK" "$REF" reference
java -Xmx3g -cp ".:$CP" Probe250 "$APK" "$M" actual
javac -cp "$CPG" -d . "$T/tests/ClassCompare117.java"
java -Xmx3g -cp ".:$CPG" ClassCompare117 reference actual
python3 - <<'PY'
from pathlib import Path
import hashlib
h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest(); a=Path('reference');b=Path('actual'); f=lambda p:{x.name:h(x) for x in p.glob('classes*.dex')}; assert f(a)==f(b) and len(f(a))==4
f=lambda d:{str(p.relative_to(d)):h(p) for p in d.rglob('*') if p.is_file()}; u=f(a/'work/patched/other');v=f(b/'work/patched/other');assert u==v and len(u)==1191;print('PASS four DEX files and 1191 resources byte-identical')
PY
