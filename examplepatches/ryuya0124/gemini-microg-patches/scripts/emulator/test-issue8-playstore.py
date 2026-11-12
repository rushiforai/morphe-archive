"""Before/after update-blocking checks on the signed-in, dedicated Play Store AVD.

Only .morphe test clones and the test probe are installed/removed. Never clear
Play Store, Google Play services, account data, or the official app packages.
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
for option in ['adb', 'serial', 'fixtures', 'fixed-gemini', 'fixed-google', 'probe', 'report-dir']:
    p.add_argument('--' + option, required=True)
p.add_argument('--lower-update-apk', help='Same-key lower-version APK for the installer downgrade check; defaults to google-low.apk')
p.add_argument('--aapt2', help='APK package validator; defaults to SDK build-tools/36.0.0/aapt2')
a = p.parse_args()
assert a.serial == 'emulator-5584', 'Refusing other devices'
out = Path(a.report_dir); out.mkdir(parents=True, exist_ok=True)
fixtures = Path(a.fixtures)
google = 'com.google.android.googlequicksearchbox.morphe'
gemini = 'com.google.android.apps.bard.morphe'
entry = gemini + '/com.google.android.apps.bard.shellapp.BardEntryPointActivity'
tests = []; ui_count = 0
aapt2 = a.aapt2 or str(Path(a.adb).resolve().parents[1]/'build-tools/36.0.0/aapt2')


def adb(*args):
    return subprocess.run([a.adb, '-s', a.serial, *map(str, args)], capture_output=True, text=True, timeout=180)


def command(*args):
    r = adb(*args)
    assert r.returncode == 0, (args, (r.stdout + r.stderr)[:1500])
    return r.stdout


assert command('emu', 'avd', 'name').splitlines()[0] == 'GeminiPatch_PlayStore_API31'
assert command('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
assert command('shell', 'getprop', 'ro.build.version.sdk').strip() == '31'
assert 'uid=2000(shell)' in command('shell', 'id')
assert 'package:' in command('shell', 'pm', 'path', 'com.android.vending')
counts = re.findall(r'(?m)^\s*Accounts:\s*(\d+)', command('shell', 'dumpsys', 'account'))
assert counts and sum(map(int, counts)) > 0, 'User must sign in manually before testing Play Store'
hashes = {name: hashlib.sha256(Path(path).read_bytes()).hexdigest() for name, path in [
    ('fixedGemini', a.fixed_gemini), ('fixedGoogle', a.fixed_google), ('probe', a.probe)]}


def check(name, passed):
    tests.append({'test': name, 'passed': bool(passed)})
    (out/'results.json').write_text(json.dumps({'avd': 'GeminiPatch_PlayStore_API31',
        'sha256': hashes, 'tests': tests}, indent=2)+'\n')
    print(name+': '+('PASS' if passed else 'FAIL'), flush=True)
    assert passed, name


def ui():
    global ui_count
    command('shell', 'uiautomator', 'dump', '/sdcard/issue8-store-test.xml')
    xml = command('shell', 'cat', '/sdcard/issue8-store-test.xml')
    ui_count += 1
    # Signed-in UI XML stays local; never print account labels or upload screenshots.
    (out/f'ui-{ui_count:03}.xml').write_text(xml)
    return list(ET.fromstring(xml).iter('node'))


def wait_text(text):
    deadline = time.monotonic()+35
    while time.monotonic() < deadline:
        nodes = ui()
        if any(text in n.get('text', '') for n in nodes): return nodes
        time.sleep(0.3)
    raise AssertionError('Missing UI text: '+text)


def tap(text):
    nodes = ui()
    hits = [n for n in nodes if n.get('text') == text and n.get('bounds') != '[0,0][0,0]']
    assert len(hits) == 1
    x1,y1,x2,y2 = map(int,re.findall(r'\d+',hits[0].get('bounds')))
    command('shell','input','tap',(x1+x2)//2,(y1+y2)//2)


def remove(pkg):
    assert pkg in [google, gemini], 'Only disposable clone data may be removed'
    if 'package:'+pkg in command('shell','pm','list','packages',pkg).splitlines(): command('uninstall',pkg)


def install(pkg, *apks):
    for apk in apks:
        assert apk_package(apk) == pkg, 'Refusing an APK outside the requested test clone'
    remove(pkg)
    command('install-multiple' if len(apks)>1 else 'install','--no-incremental',*apks)


def launch():
    command('shell','am','force-stop',gemini)
    command('shell','am','start','-W','-n',entry)


def version(pkg):
    text = command('shell','dumpsys','package',pkg)
    return int(re.search(r'versionCode=(\d+)',text).group(1))


def apk_package(path):
    result=subprocess.run([aapt2,'dump','badging',str(path)],capture_output=True,text=True,timeout=60)
    assert result.returncode==0
    return re.search(r"package: name='([^']+)'",result.stdout).group(1)


def probe(name, target=gemini, original='345', expected='scoped'):
    r = command('shell','am','instrument','-w','-e','target',target,'-e','original',original,
                '-e','expected',expected,'app.geminipatch.contractprobe/.UniversalVersionProbe')
    (out/(name+'.txt')).write_text(r)
    check(name,'INSTRUMENTATION_RESULT: result=PASS' in r and 'INSTRUMENTATION_CODE: -1' in r)


def store(pkg, text, name):
    command('shell','am','start','-W','-a','android.intent.action.VIEW','-d','market://details?id='+pkg,'-p','com.android.vending')
    nodes = wait_text(text)
    check(name,any(text in n.get('text','') for n in nodes))


def google_resumed(name):
    deadline=time.monotonic()+25
    while time.monotonic()<deadline:
        state=command('shell','dumpsys','activity','activities')
        resumed=[line for line in state.splitlines() if 'mResumedActivity:' in line]
        if any(google+'/' in line for line in resumed): break
        time.sleep(0.3)
    check(name,any(google+'/' in line for line in resumed))


official_before = {pkg: version(pkg) for pkg in [google.removesuffix('.morphe'),gemini.removesuffix('.morphe')]}
assert apk_package(a.probe)=='app.geminipatch.contractprobe'
command('install','--no-incremental','-r',a.probe)
install(google,a.fixed_google)
install(gemini,fixtures/'gemini-universal.apk',fixtures/'gemini-xxhdpi.apk')
probe('baseline_foreign_google_version_corrupted',expected='broken')
launch(); wait_text('Update your Google app')
check('baseline_reported_update_screen_reproduced',True)
tap('Go to Play Store'); wait_text('Item not found')
check('baseline_cta_actual_store_not_found',True)

install(gemini,a.fixed_gemini)
check('fixed_gemini_is_base_only',len(command('shell','pm','path',gemini).splitlines())==1)
probe('fixed_gemini_own_foreign_and_major_versions')
probe('fixed_google_own_foreign_and_major_versions',target=google,original='301831138')
command('logcat','-b','crash','-c')
launch(); google_resumed('both_update_blocked_launches_google')
check('both_installed_codes_remain_maximum',version(google)==2147483647 and version(gemini)==2147483647)
store(google,'Item not found','google_clone_has_no_store_listing')
store(gemini,'Item not found','gemini_clone_has_no_store_listing')
store(google.removesuffix('.morphe'),'Open','official_google_store_listing_opens')
store(gemini.removesuffix('.morphe'),'Open','official_gemini_store_listing_opens')
check('official_packages_not_changed',{pkg:version(pkg) for pkg in official_before}==official_before)

lower_update=a.lower_update_apk or fixtures/'google-low.apk'
assert apk_package(lower_update) in [google,gemini], 'Refusing a lower update to an official app'
r=adb('install','--no-incremental','-r',lower_update)
(out/'downgrade.txt').write_text(r.stdout+r.stderr)
check('maximum_code_still_rejects_ordinary_lower_update',r.returncode!=0 and 'INSTALL_FAILED_VERSION_DOWNGRADE' in r.stdout+r.stderr)
install(google,fixtures/'google-low.apk')
launch(); wait_text('Update your Google app')
check('genuinely_low_google_code_still_requires_update',True)
remove(google)
launch(); wait_text('Download or enable the Google app')
check('missing_google_still_requires_install',True)
check('base_only_error_screens_do_not_crash',('Process: '+gemini) not in command('logcat','-d','-b','crash','-v','brief'))

install(google,a.fixed_google)
install(gemini,fixtures/'gemini-normal.apk')
check('without_universal_gemini_code_unchanged',version(gemini)==345)
launch(); google_resumed('google_only_update_blocked_launches_google')
install(google,fixtures/'google-normal.apk')
install(gemini,a.fixed_gemini)
probe('gemini_only_update_blocking_preserves_normal_google')
launch(); google_resumed('gemini_only_update_blocked_launches_google')
check('final_google_gemini_no_fatal_crash',all('Process: '+pkg not in command('logcat','-d','-b','crash','-v','brief') for pkg in [google,gemini]))
after_counts=re.findall(r'(?m)^\s*Accounts:\s*(\d+)',command('shell','dumpsys','account'))
check('signed_in_accounts_preserved',after_counts==counts)
