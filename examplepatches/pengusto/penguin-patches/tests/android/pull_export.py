#!/usr/bin/env python3
"""Pull a completed Manager export from the disposable penguin emulator."""
import argparse
from pathlib import Path
import subprocess
import time
import zipfile

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('device_path')
p.add_argument('output', type=Path)
p.add_argument('--serial', default='emulator-5580')
a = p.parse_args()
if not a.device_path.startswith('/sdcard/Download/penguin-'):
    p.error('Use an owned penguin export directory')

def adb(*args, **kw):
    return subprocess.run(['adb', '-s', a.serial, *args], check=True, capture_output=True, **kw)

if adb('shell', 'getprop', 'ro.hardware', text=True).stdout.strip() != 'ranchu':
    raise RuntimeError('This harness only owns the disposable emulator')
if adb('shell', 'am', 'get-current-user', text=True).stdout.strip() != '0':
    raise RuntimeError('Fixture ownership is limited to Android user 0')
a.output.parent.mkdir(parents=True, exist_ok=True)
tmp = a.output.with_suffix('.pending.apk')
deadline = time.monotonic() + 60
prior = None
while time.monotonic() < deadline:
    size = adb('shell', 'stat', '-c', '%s', a.device_path, text=True).stdout.strip()
    if size.isdigit() and int(size) > 0 and size == prior:
        adb('pull', a.device_path, str(tmp))
        try:
            with zipfile.ZipFile(tmp) as apk:
                if apk.testzip() is not None:
                    raise zipfile.BadZipFile('CRC mismatch')
            subprocess.run(['apksigner', 'verify', str(tmp)], check=True, capture_output=True)
            tmp.replace(a.output)
            print(str(a.output))
            break
        except (zipfile.BadZipFile, subprocess.CalledProcessError):
            pass
    prior = size
    time.sleep(0.3)
else:
    raise TimeoutError('Manager export did not finish as a valid signed APK')
