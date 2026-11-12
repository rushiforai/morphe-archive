"""Real Google permission-UI regression; clears only a dedicated AVD's test clone.

Requires microG RE installed without accounts, original v0.3.3 and candidate
Google exports, and the supported Gemini launcher. No permission is auto-granted
on physical devices: this runner refuses them before any mutation.
"""
import argparse
import hashlib
import json
import re
import subprocess
import time
import xml.etree.ElementTree as ET
from pathlib import Path

p = argparse.ArgumentParser()
for option in ['adb', 'serial', 'baseline-apk', 'fixed-apk', 'gemini-apk', 'report-dir']:
    p.add_argument('--' + option, required=True)
p.add_argument('--microg-apk', help='Optional original microG APK for uninstall/reinstall recovery checks on the test AVD')
p.add_argument('--verify-upgrade', action='store_true', help='Require same-key baseline/fixed exports and verify an authorized in-place update')
a = p.parse_args()
assert a.serial.startswith('emulator-'), 'Refusing physical devices'
out = Path(a.report_dir)
out.mkdir(parents=True, exist_ok=True)
clone = 'com.google.android.googlequicksearchbox.morphe'
provider = 'app.revanced.android.gms'
accounts = 'android.permission.GET_ACCOUNTS'
extended = 'app.revanced.gms.EXTENDED_ACCESS'
title = 'Account access for Gemini'
tests = []
ui_count = 0


def adb(*args):
    r = subprocess.run([a.adb, '-s', a.serial, *args], capture_output=True, text=True, timeout=120)
    if r.returncode != 0:
        (out / 'adb-last-error.txt').write_text(r.stdout + r.stderr)
        raise AssertionError((args, (r.stdout + r.stderr)[:1600]))
    return r.stdout


assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
avd = adb('emu', 'avd', 'name').splitlines()[0]
assert avd in ['GeminiPatch_Issue8_API31', 'GeminiPatch_Issue8_API36']
sdk = adb('shell', 'getprop', 'ro.build.version.sdk').strip()
assert sdk == ('31' if avd.endswith('API31') else '36')
assert 'uid=2000(shell)' in adb('shell', 'id')
account_counts = re.findall(r'(?m)^\s*Accounts:\s*(\d+)', adb('shell', 'dumpsys', 'account'))
assert account_counts and all(int(count) == 0 for count in account_counts), 'Refusing to clear test apps while Android accounts exist'
assert 'package:' in adb('shell', 'pm', 'path', provider), 'Install microG RE first'
inputs = {name: hashlib.sha256(Path(path).read_bytes()).hexdigest() for name, path in [
    ('baseline', a.baseline_apk), ('fixed', a.fixed_apk), ('gemini', a.gemini_apk)]}
if a.microg_apk:
    inputs['microg'] = hashlib.sha256(Path(a.microg_apk).read_bytes()).hexdigest()


def check(name, passed):
    tests.append({'test': name, 'passed': bool(passed)})
    (out / 'results.json').write_text(json.dumps({
        'avd': avd, 'sdk': sdk, 'inputs': inputs, 'tests': tests,
    }, indent=2) + '\n')
    print(name + ': ' + ('PASS' if passed else 'FAIL'), flush=True)
    assert passed, name


def ui():
    global ui_count
    adb('shell', 'uiautomator', 'dump', '/sdcard/issue8-permission-ui.xml')
    xml = adb('shell', 'cat', '/sdcard/issue8-permission-ui.xml')
    ui_count += 1
    (out / f'ui-{ui_count:03}.xml').write_text(xml)
    return list(ET.fromstring(xml).iter('node'))


def contains(nodes, text):
    return any(text in n.get('text', '') for n in nodes)


def wait_text(text):
    deadline = time.monotonic() + 40
    while time.monotonic() < deadline:
        nodes = ui()
        if contains(nodes, text):
            return nodes
        time.sleep(0.3)
    raise AssertionError('UI did not show ' + text)


def wait_absent(text):
    deadline = time.monotonic() + 25
    while time.monotonic() < deadline:
        if not contains(ui(), text):
            return
        time.sleep(0.3)
    raise AssertionError('UI did not dismiss ' + text)


def click(text=None, suffix=None):
    nodes = ui()
    hits = [n for n in nodes if (text is not None and n.get('text') == text)
            or (suffix is not None and n.get('resource-id', '').endswith(suffix))]
    if not hits and suffix == ':id/permission_deny_button':
        hits = [n for n in nodes if n.get('resource-id', '').endswith(':id/permission_deny_and_dont_ask_again_button')]
    hits = [n for n in hits if n.get('bounds') != '[0,0][0,0]']
    assert len(hits) == 1, [(n.get('text'), n.get('bounds')) for n in hits]
    x1, y1, x2, y2 = map(int, re.findall(r'\d+', hits[0].get('bounds')))
    adb('shell', 'input', 'tap', str((x1 + x2) // 2), str((y1 + y2) // 2))
    if suffix is not None and suffix.startswith(':id/permission_'):
        messages = [n.get('text') for n in nodes if n.get('resource-id', '').endswith(':id/permission_message')]
        assert len(messages) == 1
        wait_absent(messages[0])


def grants():
    state = adb('shell', 'dumpsys', 'package', clone)
    return tuple(bool(re.search(re.escape(permission) + r': granted=true', state))
                 for permission in [accounts, extended])


def launch():
    adb('shell', 'am', 'force-stop', clone)
    adb('shell', 'am', 'force-stop', 'com.google.android.apps.bard.morphe')
    adb('shell', 'am', 'start', '-W', '-n',
        'com.google.android.apps.bard.morphe/com.google.android.apps.bard.shellapp.BardEntryPointActivity')


def no_prompt(name):
    for _ in range(2):
        nodes = ui()
        check(name + f'_{_}', not contains(nodes, title)
              and not any(n.get('resource-id', '').endswith(':id/permission_message') for n in nodes))
        time.sleep(0.5)


def fresh(granted=()):
    assert 'Success' in adb('shell', 'pm', 'clear', clone)
    for permission in granted:
        adb('shell', 'pm', 'grant', clone, permission)
    launch()


def allow_contacts():
    wait_text('access your contacts')
    click(suffix=':id/permission_allow_button')


def allow_extended():
    wait_text('unknown action')
    click(suffix=':id/permission_allow_button')


def remove_clone():
    if 'package:' + clone in adb('shell', 'pm', 'list', 'packages', clone).splitlines():
        adb('uninstall', clone)


adb('shell', 'pm', 'enable', '--user', '0', provider)
adb('install', '--no-incremental', '-r', a.gemini_apk)
remove_clone()
adb('install', '--no-incremental', a.baseline_apk)
adb('logcat', '-b', 'crash', '-c')
fresh()
check('baseline_unexplained_contacts', contains(wait_text('access your contacts'), 'access your contacts'))
allow_contacts()
check('baseline_unknown_action_reproduced', contains(wait_text('unknown action'), 'unknown action'))
click(suffix=':id/permission_deny_button')
check('baseline_extended_denied', grants() == (True, False))
launch()
check('baseline_reprompts_after_denial', contains(wait_text('unknown action'), 'unknown action'))
click(suffix=':id/permission_deny_button')
if a.verify_upgrade:
    adb('shell', 'pm', 'grant', clone, accounts)
    adb('shell', 'pm', 'grant', clone, extended)
    previous_uid = adb('shell', 'pm', 'list', 'packages', '-U', clone).strip()
    adb('install', '--no-incremental', '-r', a.fixed_apk)
    check('upgrade_keeps_existing_uid', adb('shell', 'pm', 'list', 'packages', '-U', clone).strip() == previous_uid)
    check('upgrade_keeps_existing_permission_grants', grants() == (True, True))
    launch()
    no_prompt('authorized_upgrade_does_not_interrupt_startup')
remove_clone()
adb('install', '--no-incremental', a.fixed_apk)

fresh()
nodes = wait_text(title)
check('explanation_names_both_permissions', contains(nodes, 'Contacts and an unknown action'))
check('explanation_does_not_grant_permissions', grants() == (False, False))
click(text='Not now')
wait_absent(title)
check('not_now_keeps_permissions_denied', grants() == (False, False))
launch()
no_prompt('not_now_persists_across_restart')

fresh()
wait_text(title)
adb('shell', 'input', 'keyevent', 'BACK')
wait_absent(title)
launch()
no_prompt('back_respects_decision')
check('back_keeps_permissions_denied', grants() == (False, False))

fresh()
wait_text(title)
adb('shell', 'input', 'keyevent', 'HOME')
adb('shell', 'am', 'start', '-W', '-n',
    'com.google.android.apps.bard.morphe/com.google.android.apps.bard.shellapp.BardEntryPointActivity')
check('explanation_survives_background_resume', contains(wait_text(title), title))
click(text='Continue')
allow_contacts()
allow_extended()
check('continue_allows_both_permissions', grants() == (True, True))
launch()
no_prompt('granted_permissions_do_not_prompt_again')

fresh([accounts])
wait_text(title)
click(text='Continue')
nodes = wait_text('unknown action')
check('only_missing_extended_is_requested', not contains(nodes, 'access your contacts'))
allow_extended()
check('accounts_pregranted_result', grants() == (True, True))

fresh([extended])
wait_text(title)
click(text='Continue')
allow_contacts()
check('only_missing_accounts_is_requested', grants() == (True, True))
no_prompt('extended_pregranted_no_second_request')

fresh([accounts, extended])
no_prompt('pregranted_no_explanation_or_request')

fresh()
wait_text(title)
click(text='Continue')
wait_text('access your contacts')
click(suffix=':id/permission_deny_button')
allow_extended()
check('system_accounts_denial_respected', grants() == (False, True))
launch()
no_prompt('system_accounts_denial_not_repeated')

fresh()
wait_text(title)
click(text='Continue')
allow_contacts()
wait_text('unknown action')
click(suffix=':id/permission_deny_button')
check('system_extended_denial_respected', grants() == (True, False))
launch()
no_prompt('system_extended_denial_not_repeated')
adb('shell', 'pm', 'grant', clone, extended)
launch()
no_prompt('manual_settings_recovery')
check('manual_settings_grants_restored', grants() == (True, True))
adb('shell', 'pm', 'revoke', clone, extended)
launch()
no_prompt('later_revocation_not_overridden')
check('later_revocation_stays_denied', grants() == (True, False))

try:
    adb('shell', 'pm', 'disable-user', '--user', '0', provider)
    fresh()
    no_prompt('disabled_microg_no_unusable_request')
    check('disabled_microg_no_permissions_granted', grants() == (False, False))
finally:
    adb('shell', 'pm', 'enable', '--user', '0', provider)
launch()
check('microg_enabled_later_can_retry_setup', contains(wait_text(title), title))
click(text='Not now')
wait_absent(title)
if a.microg_apk:
    try:
        adb('uninstall', provider)
        fresh()
        no_prompt('missing_microg_no_unusable_request')
        check('missing_microg_no_permissions_granted', grants() == (False, False))
    finally:
        adb('install', '--no-incremental', a.microg_apk)
    launch()
    check('microg_installed_later_can_retry_setup', contains(wait_text(title), title))
    click(text='Not now')
    wait_absent(title)
if sdk == '36':
    try:
        assert 'Success' in adb('shell', 'pm', 'clear', clone)
        adb('shell', 'cmd', 'locale', 'set-app-locales', clone, '--user', '0', '--locales', 'ja-JP')
        launch()
        japanese_title = 'Geminiのアカウントへのアクセス'
        nodes = wait_text(japanese_title)
        check('japanese_account_explanation', contains(nodes, '「不明な操作」'))
        click(text='後で')
        wait_absent(japanese_title)
        check('japanese_not_now_keeps_permissions_denied', grants() == (False, False))
    finally:
        adb('shell', 'cmd', 'locale', 'set-app-locales', clone, '--user', '0', '--locales', 'en-US')
    launch()
    no_prompt('decision_survives_locale_change')
crash = adb('logcat', '-d', '-b', 'crash', '-v', 'brief')
(out / 'crash-buffer.txt').write_text(crash)
check('no_google_clone_fatal_crash', 'Process: ' + clone not in crash)
remove_clone()
