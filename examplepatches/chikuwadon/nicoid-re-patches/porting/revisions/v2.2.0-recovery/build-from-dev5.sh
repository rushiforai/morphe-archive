#!/usr/bin/env bash
set -euo pipefail
# Rebuild the cumulative smali from the original dev.5 checkout, then compile all JVM sources and package.
# Usage: build-from-dev5.sh FIXED_INPUT_ZIP JVM_INPUT_ZIP RUNTIME_INPUT_ZIP NEW_OUTPUT_DIR
# Does not publish, write into patches/build/libs, change metadata or use the dev.110/formal MPP as build inputs.
T=$(realpath "$(dirname "$0")"); ROOT=$(realpath "$T/../../.."); F=$(realpath "$1"); J=$(realpath "$2"); U=$(realpath "$3"); O=$(realpath -m "$4"); test ! -e "$O"
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
python3 - "$T" "$F" "$TMP" <<'PY'
from pathlib import Path,PurePosixPath
import hashlib,json,sys,zipfile,stat
T,F,TMP=map(Path,sys.argv[1:]);lock=json.loads((T/'locks/archive-lock.json').read_text()); assert hashlib.sha256(F.read_bytes()).hexdigest()==lock['fixed_zip_sha256']
with zipfile.ZipFile(F) as z:
 assert z.testzip() is None
 names=[i.filename for i in z.infolist() if not i.is_dir()];assert len(names)==len(set(names))
 for i in z.infolist():
  p=PurePosixPath(i.filename);assert not p.is_absolute() and '..' not in p.parts and '\\' not in i.filename and not stat.S_ISLNK(i.external_attr>>16)
 z.extractall(TMP/'fixed')
PY
python3 "$T/bridge/rebuild_bridge.py" "$ROOT" "$TMP/fixed" "$TMP/bridge"
mkdir "$TMP/reconstructed"
cp -a "$T/build.sh" "$T/locks" "$T/metadata" "$T/source" "$TMP/reconstructed/"
cp -a "$TMP/bridge/smali" "$TMP/reconstructed/"
bash "$TMP/reconstructed/build.sh" "$F" "$J" "$U" "$O"
