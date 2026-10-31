#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Save from Manager's actual Android picker, wait, pull and verify the APK."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time
import ui as fixture

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb', required=True)
p.add_argument('--apksigner', required=True)
p.add_argument('--name', required=True)
a = p.parse_args()
if not re.fullmatch(r'komikku-manager-[a-z0-9-]+\.apk', a.name): p.error('Unique fixture APK filename required')
base = fixture.base
base.PACKAGE = 'com.android.documentsui'
ui = base.Android(adb=a.adb, out=base.OUT_ROOT / 'ui')
remote = '/sdcard/Download/' + a.name
out = base.REPO_ROOT / '.scratch/komikku/artifacts' / a.name
if out.exists() or ui.adb('shell', 'ls', remote, check=False).strip(): raise ValueError('Refusing stale export')
ui.type_text(a.name, index=0, replace=True)
ui.tap('SAVE')
size = 0
stable = 0
deadline = time.monotonic() + 120
while time.monotonic() < deadline:
    raw = ui.adb('shell', 'stat', '-c', '%s', remote, check=False).strip()
    new = int(raw) if raw.isdecimal() else 0
    stable = stable + 1 if new > 0 and new == size else 0
    if stable >= 4: break
    size = new
    time.sleep(.5)
else: raise RuntimeError('No stable positive Manager export')
ui.adb('pull', remote, out, timeout=60)
verified = subprocess.check_output([a.apksigner, 'verify', '--print-certs', str(out)], text=True)
assert '5bcbdaac2aebee68090aa00926622ccb5439ad0bec86d3d219ad0b74036d3628' in verified, 'Unexpected signing key'
record = {'bytes': out.stat().st_size, 'sha256': hashlib.sha256(out.read_bytes()).hexdigest(),
          'stableSamples': stable, 'actualExportPath': remote, 'signatureVerified': True}
(base.OUT_ROOT / (a.name + '.json')).write_text(json.dumps(record, indent=2) + '\n')
(base.OUT_ROOT / (a.name + '.signer.txt')).write_text(verified)
print(json.dumps(record))
