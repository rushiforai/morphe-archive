"""Replay the v1.2.1 VerifyError and verify the corrected generated class on emulator ART.

Compile ArtMenuProbe.java with javac --release 8, then d8 --min-api 26.
An explicit emulator serial is required. This does not install/launch YouTube, use an
account, call a translation API, or claim visual/player acceptance.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb', required=True)
p.add_argument('--serial', required=True)
p.add_argument('--probe-dex', required=True, type=Path)
p.add_argument('--before-apk', required=True, type=Path)
p.add_argument('--after-apk', required=True, type=Path)
p.add_argument('--output', required=True, type=Path)
a = p.parse_args()
if not a.serial.startswith('emulator-'):
    p.error('Use an explicitly selected disposable emulator, not a personal phone')

def adb(*args, check=True):
    result = subprocess.run([a.adb, '-s', a.serial, *args], capture_output=True, text=True, encoding='utf-8', errors='replace')
    if check and result.returncode:
        raise RuntimeError(result.stdout + result.stderr)
    return result

assert adb('get-state').stdout.strip() == 'device'
a.output.mkdir(parents=True, exist_ok=True)
prefix = '/data/local/tmp/caption-menu-art'
adb('push', str(a.probe_dex.resolve()), prefix + '-probe.dex')
results = {}
for label, apk in [('before', a.before_apk), ('after', a.after_apk)]:
    digest = hashlib.sha256(apk.read_bytes()).hexdigest()
    remote = prefix + '-' + digest[:16] + '.apk'
    adb('push', str(apk.resolve()), remote)
    run = adb('shell', 'CLASSPATH=' + prefix + '-probe.dex:' + remote + ' dalvikvm -Xverify:all ArtMenuProbe', check=False)
    text = run.stdout + run.stderr
    (a.output / (label + '.log')).write_text(text, encoding='utf-8')
    results[label] = {'sha256': digest, 'exit_code': run.returncode, 'log': label + '.log'}
    if label == 'before':
        assert run.returncode != 0 and 'VerifyError' in text and 'nativeContainer' in text and 'java.lang.Object' in text, text
    else:
        assert run.returncode == 0 and 'ART_MENU_INVOKE_PASS' in text and 'VerifyError' not in text, text
report = {'sdk': adb('shell', 'getprop', 'ro.build.version.sdk').stdout.strip(),
          'abi': adb('shell', 'getprop', 'ro.product.cpu.abi').stdout.strip(),
          'serial': a.serial, 'old_error_reproduced': True, 'fixed_invocation_passed': True,
          'ui_tap_through_tested': False, 'paid_api_called': False, 'results': results}
(a.output / 'report.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
print(json.dumps(report, indent=2))
