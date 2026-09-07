#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
python3 - "$ROOT" <<'PY'
from pathlib import Path
import hashlib, sys
root = Path(sys.argv[1])
for line in (root / 'config/inputs.sha256').read_text().splitlines():
    expected, name = line.split()
    path = root / 'inputs' / name
    if not path.is_file():
        raise SystemExit('Missing input: ' + str(path))
    if hashlib.sha256(path.read_bytes()).hexdigest() != expected:
        raise SystemExit('Unsupported input/checksum mismatch: ' + name)
    print('Verified input:', name)
PY
