#!/usr/bin/env python3
"""Wait for Android document export, then retain only a signature-verified APK."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--serial', required=True); p.add_argument('--avd', required=True)
p.add_argument('--remote', required=True); p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
if not a.serial.startswith('emulator-') or not re.fullmatch(r'/sdcard/Download/[A-Za-z0-9/._-]+\.apk', a.remote):
    p.error('Disposable emulator and explicit Downloads APK required')
root = (Path(__file__).resolve().parents[2] / '.scratch/mihon').resolve()
if not a.output.resolve().is_relative_to(root) or a.output.exists(): p.error('Fresh Mihon scratch output required')
def adb(*args):
    return subprocess.run(['adb', '-s', a.serial, *map(str,args)], capture_output=True, check=True, timeout=60).stdout
assert adb('emu', 'avd', 'name').decode().splitlines()[0] == a.avd
assert adb('shell', 'getprop', 'ro.hardware').strip() == b'ranchu'
deadline = time.monotonic() + 60
previous = 0; stable = 0
while time.monotonic() < deadline:
    try: size = int(adb('shell', 'stat', '-c', '%s', a.remote).strip())
    except subprocess.CalledProcessError: size = 0
    stable = stable + 1 if size > 0 and size == previous else 0
    if stable >= 3: break
    previous = size; time.sleep(0.5)
else: raise RuntimeError('Export never reached a positive stable size')
a.output.parent.mkdir(parents=True, exist_ok=True)
temporary = a.output.with_suffix('.partial.apk')
if temporary.exists(): p.error('Stale partial export requires inspection')
adb('pull', a.remote, temporary)
signer = subprocess.run(['apksigner', 'verify', '--print-certs', str(temporary)], check=True, capture_output=True, text=True)
assert temporary.stat().st_size == size
temporary.rename(a.output)
record = {'remote': a.remote, 'bytes': size, 'stableObservations': stable,
          'apkSha256': hashlib.sha256(a.output.read_bytes()).hexdigest(), 'signer': signer.stdout.strip()}
a.output.with_suffix('.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record))
