"""Destructive fixture tests restricted to the dedicated, disposable Issue #8 AVD."""
import argparse
import json
import subprocess
import time
from pathlib import Path
from datetime import datetime, timezone

p = argparse.ArgumentParser()
p.add_argument('--adb', required=True)
p.add_argument('--serial', required=True)
p.add_argument('--avd', choices=['GeminiPatch_Issue8_API31', 'GeminiPatch_Issue8_API36'], default='GeminiPatch_Issue8_API36')
p.add_argument('--monolithic-google', action='store_true', help='Google input contains its resources; do not install the API36 resource split')
p.add_argument('--bad-apk', required=True)
p.add_argument('--baseline-apk', required=True)
p.add_argument('--dist', required=True)
p.add_argument('--probe', required=True)
p.add_argument('--report-dir', required=True)
a = p.parse_args()
assert a.serial.startswith('emulator-'), 'Refusing physical devices'
out = Path(a.report_dir); out.mkdir(parents=True, exist_ok=True)
dist = Path(a.dist)
results = []

def adb(*args, timeout=180):
    return subprocess.run([a.adb, '-s', a.serial, *args], capture_output=True, text=True, timeout=timeout)

def record(name, command, predicate=lambda r: r.returncode == 0):
    r = adb(*command)
    (out / (name + '.txt')).write_text(r.stdout + r.stderr)
    ok = bool(predicate(r))
    results.append({'test': name, 'passed': ok, 'returnCode': r.returncode})
    print(f'{name}: {"PASS" if ok else "FAIL"}', flush=True)
    assert ok, f'{name} failed; see {out / (name + ".txt")}\n' + (r.stdout + r.stderr)[:1500]
    return r.stdout + r.stderr

assert adb('shell', 'getprop', 'ro.kernel.qemu').stdout.strip() == '1'
assert adb('emu', 'avd', 'name').stdout.splitlines()[0] == a.avd
expected_sdk = '31' if a.avd.endswith('API31') else '36'
assert adb('shell', 'getprop', 'ro.build.version.sdk').stdout.strip() == expected_sdk
assert 'uid=2000(shell)' in adb('shell', 'id').stdout, 'Use normal shell, not adb root'
completed = False
original = 'com.google.android.googlequicksearchbox'
clone = original + '.morphe'
def resumed_activities(text):
    # API31 uses mResumedActivity:, while newer releases expose topResumedActivity=.
    return [line for line in text.splitlines() if any(marker in line for marker in
        ('topResumedActivity=', 'mResumedActivity:', 'mResumedActivity='))]

def clone_is_resumed(text):
    return any(clone+'/' in line for line in resumed_activities(text))

def install_google(apk):
    if a.monolithic_google:
        return ['install', '--no-incremental', '-r', str(apk)]
    return ['install-multiple', '--no-incremental', '-r', str(apk), str(dist/'split_config.xxhdpi.apk')]
try:
    record('original_system_package', ['shell', 'pm', 'path', original], lambda r: '/product/' in r.stdout or '/system/' in r.stdout)
    duplicate = lambda r: r.returncode != 0 and 'INSTALL_FAILED_DUPLICATE_PERMISSION' in r.stdout+r.stderr and 'already owned by '+original in r.stdout+r.stderr
    record('duplicate_permission_original_installed', ['install', '--no-incremental', a.bad_apk], duplicate)
    try:
        record('remove_original_for_user0', ['shell', 'pm', 'uninstall', '--user', '0', original], lambda r: 'Success' in r.stdout)
        record('duplicate_permission_after_user_removal', ['install', '--no-incremental', a.bad_apk], duplicate)
    finally:
        record('restore_original_for_user0', ['shell', 'cmd', 'package', 'install-existing', '--user', '0', original])
    record('install_v030_baseline_alongside_original', install_google(a.baseline_apk))
    record('install_permission_probe', ['install', '--no-incremental', '-r', a.probe])
    def probe(expected):
        def check(r):
            text = r.stdout+r.stderr
            return r.returncode == 0 and 'INSTRUMENTATION_RESULT: result=PASS' in text and 'INSTRUMENTATION_CODE: -1' in text
        return record('lens_client_'+expected, ['shell', 'am', 'instrument', '-w', '-e', 'expected', expected, 'app.geminipatch.contractprobe/.ContractProbe'], check)
    probe('denied')
    def process_probe(expected):
        return record('process_cache_'+expected, ['shell', 'am', 'instrument', '-w', '-e', 'expected', expected,
            'app.geminipatch.contractprobe/.ProcessNameProbe'],
            lambda r: r.returncode == 0 and 'INSTRUMENTATION_RESULT: result=PASS' in r.stdout and 'INSTRUMENTATION_CODE: -1' in r.stdout)
    process_probe('raw')
    record('stop_baseline_before_widget', ['shell', 'am', 'force-stop', clone])
    record('clear_crash_for_baseline', ['logcat', '-b', 'crash', '-c'])
    # A benign explicit action enters the exported receiver without spoofing a protected system broadcast.
    record('baseline_widget_probe', ['shell', 'am', 'broadcast', '-a', 'app.geminipatch.CONTRACT_PROBE', '-n', clone+'/com.google.android.apps.gsa.staticplugins.searchwidget.GoogleSearchWidgetProvider'])
    time.sleep(3)
    record('baseline_widget_crash_reproduced', ['logcat', '-d', '-b', 'crash', '-v', 'brief'], lambda r: ('Process: '+clone) in r.stdout and 'ClassCastException' in r.stdout and 'GoogleSearchWidgetProvider' in r.stdout)
    record('install_fixed_clone_alongside_original', install_google(dist/'google-login.apk'))
    probe('granted')
    process_probe('normalized')
    record('grant_fixture_accounts', ['shell', 'pm', 'grant', clone, 'android.permission.GET_ACCOUNTS'])
    record('install_fixed_gemini', ['install', '--no-incremental', '-r', str(dist/'gemini-login.apk')])
    record('clear_baseline_crash_buffer', ['logcat', '-b', 'crash', '-c'])
    record('stop_clone_before_launch', ['shell', 'am', 'force-stop', clone])
    # The original system package remains installed, but must not be needed by the launcher.
    try:
        record('disable_original_for_launch', ['shell', 'pm', 'disable-user', '--user', '0', original])
        record('launch_gemini_without_enabled_original', ['shell', 'am', 'start', '-W', '-n', 'com.google.android.apps.bard.morphe/com.google.android.apps.bard.shellapp.BardEntryPointActivity'], lambda r: r.returncode == 0 and 'Status: ok' in r.stdout)
        for attempt in range(30):
            current = adb('shell', 'dumpsys', 'activity', 'activities').stdout
            if clone_is_resumed(current):
                break
            time.sleep(0.3)
        state = record('foreground_after_launch', ['shell', 'dumpsys', 'activity', 'activities'], lambda r: r.returncode == 0 and clone_is_resumed(r.stdout))
        resumed = resumed_activities(state)
        assert any(clone in line for line in resumed), 'Cloned Google did not become the resumed activity: '+str(resumed)
        assert not any('ErrorActivity' in line for line in resumed)
        record('widget_update_broadcast', ['shell', 'am', 'broadcast', '-a', 'app.geminipatch.CONTRACT_PROBE', '-n', clone+'/com.google.android.apps.gsa.staticplugins.searchwidget.GoogleSearchWidgetProvider'])
        time.sleep(8)
        record('no_clone_fatal_crash', ['logcat', '-d', '-b', 'crash', '-v', 'brief'], lambda r: r.returncode == 0 and ('Process: '+clone) not in r.stdout)
    finally:
        record('restore_original_enabled_state', ['shell', 'pm', 'default-state', '--user', '0', original])
    completed = True
finally:
    (out/'results.json').write_text(json.dumps({'passed': completed and all(r['passed'] for r in results), 'timeUTC': datetime.now(timezone.utc).isoformat(), 'serial': a.serial, 'avd': a.avd, 'sdk': expected_sdk, 'monolithicGoogle': a.monolithic_google, 'tests': results}, indent=2)+'\n')
