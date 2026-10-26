#!/usr/bin/env python3
"""Apply Feeder #391 and exercise native UI/save on an explicitly owned disposable AVD.

No uninstall, data clearing, compatibility override, downloading or publishing.
Only the exact project-release F-Droid APK is accepted. Artifacts stay ignored.
"""
import argparse
import hashlib
import json
import os
import re
import sqlite3
import subprocess
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'com.nononsenseapps.feeder'
SHA = '3e03c3f9fd3ac6131eea56e513b129c71df11dadfccb836221480f9204f50766'
CERT = 'c5eeff22488135ffc2583c3a43b053a161ca869862961ab8534f44c75fd57d97'
PATCH = 'Zoom article images'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('original', 'mpp', 'desktop', 'sdk', 'java-home', 'keystore', 'artifacts'):
        p.add_argument('--' + name, required=True, type=Path)
    for name in ('serial', 'avd-name', 'key-alias'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--baseline', action='store_true')
    p.add_argument('--installed-suite', action='store_true', help='Run tests against this harness-owned patched APK without another update')
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args(); out = a.artifacts.resolve()
    assert a.serial.startswith('emulator-') and out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    tools, api = a.sdk / 'build-tools/36.0.0', a.sdk / 'platforms/android-35/android.jar'

    def run(*command, timeout=300, check=True):
        return subprocess.run(list(map(str, command)), env=env, check=check,
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)

    def adb(*command, binary=False):
        data = run(a.sdk / 'platform-tools/adb', '-s', a.serial, *command).stdout
        return data if binary else data.decode()

    def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest()

    def cert(apk):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', apk).stdout.decode()).group(1)

    def payload(apk):
        with zipfile.ZipFile(apk) as z:
            return {n: hashlib.sha256(z.read(n)).hexdigest() for n in z.namelist()
                    if not n.startswith('META-INF/') and not n.endswith('/')}

    assert digest(a.original) == SHA and cert(a.original) == CERT
    identity = run(tools / 'aapt2', 'dump', 'badging', a.original).stdout.decode()
    assert "name='com.nononsenseapps.feeder'" in identity and "versionName='2.25.0'" in identity and "versionCode='4191'" in identity
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    sign = [tools / 'apksigner', 'sign', '--ks', a.keystore, '--ks-pass', 'pass:android',
            '--key-pass', 'pass:android', '--ks-key-alias', a.key_alias]
    baseline = out / 'original-resigned.apk'
    run(*sign, '--out', baseline, a.original)
    test_cert = cert(baseline)
    assert test_cert != CERT and payload(a.original) == payload(baseline)
    ownership = out / 'owned-apks.json'
    owned = json.loads(ownership.read_text()) if ownership.exists() else []
    if 'package:' + PKG in adb('shell', 'pm', 'list', 'packages', PKG).splitlines():
        installed = adb('shell', 'pm', 'path', PKG).strip()
        assert len(installed.splitlines()) == 1 and installed.startswith('package:')
        prior = out / 'installed-before.apk'
        adb('pull', installed.removeprefix('package:'), prior)
        assert cert(prior) == test_cert
        assert payload(prior) == payload(a.original) or digest(prior) in owned, 'Unowned Feeder installation'

    def install(apk):
        print(adb('install', '-r', apk).strip(), flush=True)
        owned.append(digest(apk)); ownership.write_text(json.dumps(sorted(set(owned)), indent=2))

    classes, dex = out / 'test-classes', out / 'test-dex'
    classes.mkdir(exist_ok=True); dex.mkdir(exist_ok=True)
    run(a.java_home / 'bin/javac', '-cp', api, '-d', classes, ROOT / 'tests/feeder/FeederAcceptance.java')
    run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
    tests = out / 'acceptance.apk'; tests.unlink(missing_ok=True)
    run(tools / 'aapt2', 'link', '-I', api, '--manifest', ROOT / 'tests/feeder/AcceptanceManifest.xml', '-o', tests)
    with zipfile.ZipFile(tests, 'a') as z: z.write(dex / 'classes.dex', 'classes.dex')
    run(*sign, tests)
    print(adb('install', '-r', tests).strip(), flush=True)

    def instrument(mode):
        output = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'disposable', 'true',
            '-e', 'mode', mode, 'io.github.pengusto.patches.feeder.acceptance/'
            'io.github.pengusto.patches.feeder.tests.FeederAcceptance')
        (out / (mode + '.txt')).write_text(output)
        print(output, flush=True)
        (out / (mode + '-logcat.txt')).write_text(adb('logcat', '-d', '-v', 'threadtime'))
        assert 'INSTRUMENTATION_CODE: -1' in output and 'PASS:' in output, output
        for label in (('before',) if mode == 'baseline' else ('after', 'zoomed', 'link-menu')):
            (out / (label + '.png')).write_bytes(adb('exec-out', 'su', '0', 'cat',
                '/data/user/0/' + PKG + '/cache/penguin391-' + label + '.png', binary=True))

    if a.installed_suite:
        assert digest(prior) in owned and payload(prior) == payload(out / 'patched.apk')
        instrument('suite')
        return

    if a.baseline:
        install(baseline); instrument('baseline')

    def snapshot(label):
        adb('shell', 'am', 'force-stop', PKG)
        saved = out / label; saved.mkdir(exist_ok=True)
        result = dict(databases={}, preferences={}, datastore={})
        for directory in ('databases', 'shared_prefs', 'files/datastore'):
            location = '/data/user/0/' + PKG + '/' + directory
            proc = run(a.sdk / 'platform-tools/adb', '-s', a.serial, 'shell', 'su', '0', 'ls', location, check=False)
            if proc.returncode: continue
            names = proc.stdout.decode().split()
            for name in names:
                path = saved / directory / name; path.parent.mkdir(parents=True, exist_ok=True)
                path.write_bytes(adb('exec-out', 'su', '0', 'cat', location + '/' + name, binary=True))
                if directory == 'shared_prefs': result['preferences'][name] = path.read_bytes().hex()
                elif directory == 'files/datastore': result['datastore'][name] = digest(path)
            if directory == 'databases':
                for name in ('rssDatabase',):
                    if name not in names: continue
                    with sqlite3.connect(saved / directory / name) as db:
                        tables = db.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name").fetchall()
                        result['databases'][name] = {table: sorted(db.execute('SELECT * FROM "' + table.replace('"', '""') + '"').fetchall(), key=repr) for (table,) in tables}
        articles = adb('shell', 'su', '0', 'ls', '/data/user/0/' + PKG + '/files/articles').split()
        result['articles'] = {name: hashlib.sha256(adb('exec-out', 'su', '0', 'cat',
            '/data/user/0/' + PKG + '/files/articles/' + name, binary=True)).hexdigest() for name in articles}
        return result

    before = snapshot('before-update')
    unsigned, patched, report = out / 'unsigned.apk', out / 'patched.apk', out / 'patch.json'
    proc = run(a.java_home / 'bin/java', '-Xmx3g', '-jar', a.desktop, 'patch', a.original,
               '-p', a.mpp, '--exclusive', '-e', PATCH, '--unsigned', '-o', unsigned,
               '-r', report, '-t', out / 'patch-work', check=False)
    output = proc.stdout.decode(); (out / 'patch.log').write_text(output)
    assert proc.returncode == 0, output
    data = json.loads(report.read_text()); assert not data['failedPatches'] and len(data['appliedPatches']) == 1
    run(*sign, '--out', patched, unsigned); assert cert(patched) == test_cert
    # Check actual shipped APIs before starting the app, including R8 facade removal.
    run(a.java_home / 'bin/javac', '-cp', a.desktop, '-d', classes, ROOT / 'tests/feeder/VerifyFeederApk.java')
    check = run(a.java_home / 'bin/java', '-cp', str(a.desktop)+os.pathsep+str(classes), 'VerifyFeederApk', patched,
                'Lio/github/pengusto/patches/extension/feeder/').stdout.decode()
    (out / 'linkage.txt').write_text(check); print(check, flush=True)
    install(patched)
    assert before == snapshot('after-update'), 'Same-key update changed database rows, preferences or datastore'
    marker = 'PenguinFeeder391-' + str(os.getpid())
    adb('shell', 'log', '-t', 'PenguinFeederAcceptance', marker)
    instrument('suite')
    logs = adb('logcat', '-d', '-v', 'threadtime'); assert marker in logs
    logs = logs.split(marker, 1)[1]; (out / 'logcat.txt').write_text(logs)
    assert not re.search(r'FATAL EXCEPTION|VerifyError|NoSuchMethodError|NoSuchFieldError|IllegalAccessError|PenguinImageZoom.*failed', logs), 'Runtime/linkage error'
    summary = dict(originalSha256=SHA, mppSha256=digest(a.mpp), patchedSha256=digest(patched),
                   certificate=test_cert, sameKeyUpdatePreservedData=True, outcome='PASS')
    (out / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n'); print(json.dumps(summary, indent=2), flush=True)


if __name__ == '__main__': main()
