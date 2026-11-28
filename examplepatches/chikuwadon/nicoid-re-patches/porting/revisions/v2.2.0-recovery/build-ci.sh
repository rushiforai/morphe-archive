#!/usr/bin/env bash
set -euo pipefail
# Independent review build: exact per-file inputs, no previous MPP or archive layout dependency.
T=$(realpath "$(dirname "$0")"); ROOT=$(realpath "$1"); INPUT=$(realpath "$2"); O=$(realpath -m "$3"); test ! -e "$O"
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
python3 "$T/prepare-ci-inputs.py" --verify-only "$INPUT"
cp "$T/bridge/rebuild_bridge.py" "$TMP/rebuild_bridge.py"
cp "$T/bridge/bridge-lock.json" "$TMP/bridge-lock.json"
cp "$T/locks/ci-fixed-lock.json" "$TMP/build-lock.json"
ln -s "$T/bridge/overlays" "$TMP/overlays"
python3 "$TMP/rebuild_bridge.py" "$ROOT" "$INPUT/fixed" "$TMP/bridge"
mkdir "$TMP/reconstructed"
cp -a "$T/locks" "$T/metadata" "$T/source" "$TMP/reconstructed/"
cp -a "$TMP/bridge/smali" "$TMP/reconstructed/"
T="$TMP/reconstructed"
mkdir -p "$O"; cd "$O"
for d in fixed jvm runtime; do ln -s "$INPUT/$d" "$d"; done
python3 - "$T" <<'PY2'
from pathlib import Path
import hashlib,sys
T=Path(sys.argv[1]); h=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
for line in (T/'locks/source-SHA256SUMS').read_text().splitlines():
 a,n=line.split(maxsplit=1);assert h(T/n)==a,n
runtime_lock={n.lstrip('./'):a for a,n in (line.split(maxsplit=1) for line in (T/'locks/runtime-SHA256SUMS').read_text().splitlines())}
for n in ['compileClasspath','runtimeClasspath','patchListGeneratorClasspath']:
 assert h(T/'locks'/(n+'.txt'))==runtime_lock[n+'.txt'],n
 rows=(T/'locks'/(n+'.txt')).read_text().splitlines();assert len(rows)==len(set(rows));assert all(x.startswith(n+'/') and (Path('runtime')/x).is_file() for x in rows);Path(n+'.cp').write_text(':'.join(str((Path('runtime')/x).resolve()) for x in rows))
print('PASS reconstructed source locks and exact classpaths')
PY2
W=$(realpath "$PWD/fixed"); I=$(realpath "$PWD/jvm"); CPG="$W/tools/assemble/*:$W/tools/dexlib2.jar:$W/libs/guava-new.jar:$W/libs/failureaccess-new.jar"
java -Xmx2g -cp "$CPG" org.jf.smali.Main assemble -a 28 -j 1 "$T/smali/helpers" -o helpers.dex
java -Xmx2g -cp "$CPG" org.jf.smali.Main assemble -a 28 -j 1 "$T/smali/method-delta" -o method-delta.dex
python3 - "$T" <<'PY'
import pathlib,hashlib,json,sys
lock=json.loads((pathlib.Path(sys.argv[1])/'locks/archive-lock.json').read_text())
for f,key in [('helpers.dex','helper_sha256'),('method-delta.dex','method_delta_sha256')]:assert hashlib.sha256(pathlib.Path(f).read_bytes()).hexdigest()==lock[key],f
print('PASS both reconstructed DEX files match audited bytes')
PY
j(){ find "$I" -name "$1" -type f -print -quit; }
K=$(j kotlin-compiler-embeddable-2.4.21.jar); S=$(j kotlin-stdlib-2.4.21.jar); RF=$(j kotlin-reflect-1.6.10.jar); C=$(j kotlinx-coroutines-core-jvm-1.8.0.jar); B=$(j kotlin-build-tools-api-2.4.21.jar); U=$(j kotlin-script-runtime-2.4.21.jar); D=$(j kotlin-daemon-embeddable-2.4.21.jar); A=$(find runtime/compileClasspath -name annotations-13.0.jar -print -quit); CP=$(cat compileClasspath.cp)
mkdir classes dex
javac --release 8 -cp "$CP" -d classes "$T/source/java/app/nicoid/patches/LegacyOkHttpPrune262.java"
javac --release 11 -cp "$CP" -d classes "$T/source/java/app/nicoid/patches/SwipeInterfaceMerge220.java"
java -Xmx2g -cp "$K:$S:$RF:$C:$B:$U:$D:$A" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -jvm-target 11 -module-name app.nicoid:patches -classpath "$CP:$PWD/classes" -d classes $(find "$T/source/kotlin" -name '*.kt' | sort)
args=(); IFS=: read -ra jars <<< "$CP"; for jar in "${jars[@]}"; do args+=(--classpath "$jar"); done
java -Xmx2g -cp "$W/libs/r8.jar" com.android.tools.r8.D8 --release --min-api 28 --lib "$W/libs/android.jar" "${args[@]}" --output dex $(find classes -name '*.class' | sort)
python3 - "$T" <<'PY'
from pathlib import Path as P
import hashlib,json,struct,zlib,sys,zipfile
T=P(sys.argv[1]); root=P('classes'); entries={str(p.relative_to(root)):p.read_bytes() for p in root.rglob('*') if p.is_file()}; entries.update({'classes.dex':P('dex/classes.dex').read_bytes(),'nicoid/helpers.mpe':P('helpers.dex').read_bytes(),'nicoid/method-delta.dex':P('method-delta.dex').read_bytes()});meta=T/'metadata'
order=(T/'locks/mpp-entries.txt').read_text().splitlines(); out=P('nicoid-re-v2.2.0-reconstructed-unpublished.mpp'); assert set(entries)<=set(order)
with zipfile.ZipFile(out,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=9) as z:
 for n in order:
  i=zipfile.ZipInfo(n,(2026,11,27,0,0,0));i.compress_type=zipfile.ZIP_DEFLATED;i.external_attr=0o100644<<16;z.writestr(i,entries[n] if n in entries else (meta/n).read_bytes(),compresslevel=9)
with zipfile.ZipFile(out) as z:
 assert z.testzip() is None
 for n in ('classes.dex','nicoid/helpers.mpe','nicoid/method-delta.dex'):
  d=z.read(n);assert d[12:32]==hashlib.sha1(d[32:]).digest() and struct.unpack_from('<I',d,8)[0]==zlib.adler32(d[12:]) and struct.unpack_from('<I',d,32)[0]==len(d)
h=hashlib.sha256(out.read_bytes()).hexdigest(); assert h==json.loads((T/'locks/archive-lock.json').read_text())['mpp_sha256'],h
print('PASS exact reproduced MPP',out.stat().st_size,h)
PY
