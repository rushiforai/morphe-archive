"""Compare APKs exported by Android Morphe Manager on the disposable API31 AVD.

This removes the Google clone from this test AVD, including its test-only data.
Build/export both APKs in Manager first; this script does not emulate patching.
"""
import argparse
import hashlib
import json
import subprocess
import time
from datetime import datetime, timezone
from pathlib import Path

p = argparse.ArgumentParser()
p.add_argument('--adb', required=True)
p.add_argument('--serial', required=True)
p.add_argument('--baseline-apk', required=True, help='Google exported with public v0.3.2 MPP')
p.add_argument('--fixed-apk', required=True, help='Google exported with candidate MPP')
p.add_argument('--probe', required=True)
p.add_argument('--report-dir', required=True)
a = p.parse_args()
assert a.serial.startswith('emulator-'), 'Refusing physical devices'
out = Path(a.report_dir)
out.mkdir(parents=True, exist_ok=True)
clone = 'com.google.android.googlequicksearchbox.morphe'
records = []


def adb(*args):
    return subprocess.run([a.adb, '-s', a.serial, *args], capture_output=True,
                          text=True, timeout=180)


assert adb('shell', 'getprop', 'ro.kernel.qemu').stdout.strip() == '1'
assert adb('emu', 'avd', 'name').stdout.splitlines()[0] == 'GeminiPatch_Issue8_API31'
assert adb('shell', 'getprop', 'ro.build.version.sdk').stdout.strip() == '31'
assert 'uid=2000(shell)' in adb('shell', 'id').stdout, 'Use normal shell, not adb root'
inputs = {name: hashlib.file_digest(Path(path).open('rb'), 'sha256').hexdigest()
          for name, path in [('baseline', a.baseline_apk), ('fixed', a.fixed_apk), ('probe', a.probe)]}


def record(name, command, predicate=lambda r: r.returncode == 0):
    result = adb(*command)
    (out / (name + '.txt')).write_text(result.stdout + result.stderr)
    passed = bool(predicate(result))
    records.append({'test': name, 'passed': passed, 'returnCode': result.returncode})
    (out / 'results.json').write_text(json.dumps({
        'time': datetime.now(timezone.utc).isoformat(), 'serial': a.serial,
        'avd': 'GeminiPatch_Issue8_API31', 'apkSha256': inputs, 'tests': records,
    }, indent=2) + '\n')
    print(name + ': ' + ('PASS' if passed else 'FAIL'), flush=True)
    assert passed, f'{name} failed; see {out / (name + ".txt")}'
    return result.stdout + result.stderr


# All destructive actions below are guarded by the exact AVD checks above.
present = adb('shell', 'pm', 'path', clone)
if 'package:' in present.stdout:
    record('remove_previous_test_clone', ['uninstall', clone])
record('install_manager_v032', ['install', '--no-incremental', a.baseline_apk])
record('install_probe', ['install', '--no-incremental', '-r', a.probe])
record('clear_baseline_crash_buffer', ['logcat', '-b', 'crash', '-c'])
receiver = clone + '/com.google.android.apps.gsa.staticplugins.searchwidget.GoogleSearchWidgetProvider'
record('start_baseline_widget', ['shell', 'am', 'broadcast', '-a',
       'app.geminipatch.CONTRACT_PROBE', '-n', receiver])
time.sleep(3)
record('manager_v032_verifyerror_reproduced', ['logcat', '-d', '-b', 'crash', '-v', 'brief'],
       lambda r: 'Process: ' + clone in r.stdout and 'java.lang.VerifyError' in r.stdout
       and 'register index out of range (1 >= 1)' in r.stdout)
probe = ['shell', 'am', 'instrument', '-w', '-e', 'expected', 'normalized',
         'app.geminipatch.contractprobe/.ProcessNameProbe']
record('baseline_provider_rejected', probe,
       lambda r: 'java.lang.VerifyError' in r.stdout
       and 'register index out of range (1 >= 1)' in r.stdout)
record('install_manager_fixed', ['install', '--no-incremental', '-r', a.fixed_apk])
record('fixed_first_cached_seeded_process_names', probe,
       lambda r: r.returncode == 0 and 'INSTRUMENTATION_RESULT: result=PASS' in r.stdout
       and 'INSTRUMENTATION_CODE: -1' in r.stdout)
record('stop_fixed_before_widget', ['shell', 'am', 'force-stop', clone])
record('clear_fixed_crash_buffer', ['logcat', '-b', 'crash', '-c'])
record('start_fixed_widget', ['shell', 'am', 'broadcast', '-a',
       'app.geminipatch.CONTRACT_PROBE', '-n', receiver])
record('launch_fixed_google', ['shell', 'am', 'start', '-W', '-n',
       clone + '/com.google.android.googlequicksearchbox.SearchActivity'],
       lambda r: r.returncode == 0 and 'Status: ok' in r.stdout)
time.sleep(5)
record('fixed_google_has_no_runtime_crash', ['logcat', '-d', '-b', 'crash', '-v', 'brief'],
       lambda r: 'Process: ' + clone not in r.stdout)
record('fixed_google_process_running', ['shell', 'pidof', clone + ':googleapp'],
       lambda r: r.returncode == 0 and r.stdout.strip().isdigit())
record('remove_manager_signed_test_clone', ['uninstall', clone])
