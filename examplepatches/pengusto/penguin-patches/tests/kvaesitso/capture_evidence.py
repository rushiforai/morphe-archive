#!/usr/bin/env python3
"""Capture matched #1504 evidence on an existing owned disposable AVD.

Reuses the real UI regression and synthetic notes from Morphe acceptance.
Publishes nothing; never uninstalls, clears data or injects a replacement UI.
"""
import argparse
import hashlib
import json
import os
import re
import shutil
import sqlite3
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'de.mm20.launcher2.release'
DATA = '/data/user/0/' + PKG
ORIGINAL_SHA = '55e4a287f1198be22f040c2ad1443f5861b58b1d1394d7377221f1ad4448b810'
PATCHED_SHA = 'b839eadef569a74181ef6714030cf58454ffcff0e91d147ab755fa6fd5f541b8'
OFFICIAL_CERT = 'bf65bbd617997397800d02e0ac2e45cee153151518545c23ef66b3cb2cfdf7bc'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('sdk', 'java-home', 'original', 'baseline', 'patched', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    for name in ('serial', 'avd-name'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    p.add_argument('--expected-patched-sha', default=PATCHED_SHA,
                   help='Pinned SHA-256 of the same-key patched APK to capture; defaults to the reviewed prototype')
    a = p.parse_args()
    assert a.serial.startswith('emulator-')
    out = a.artifacts.resolve()
    assert out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    (out / 'summary.json').unlink(missing_ok=True)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    tools = a.sdk / 'build-tools/36.0.0'

    def run(*args, check=True, timeout=60):
        return subprocess.run(list(map(str, args)), env=env, capture_output=True,
                              check=check, timeout=timeout)

    def adb(*args, binary=False):
        data = run(a.sdk / 'platform-tools/adb', '-s', a.serial, *args).stdout
        return data if binary else data.decode()

    def sha(path):
        return hashlib.sha256(path.read_bytes()).hexdigest()

    def certificate(path):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', path).stdout.decode())[1]

    def payload(path):
        with zipfile.ZipFile(path) as z:
            return {n: z.read(n) for n in z.namelist()
                    if not n.startswith('META-INF/') and not n.endswith('/')}

    assert sha(a.original) == ORIGINAL_SHA and sha(a.patched) == a.expected_patched_sha
    assert certificate(a.original) == OFFICIAL_CERT
    cert = certificate(a.baseline)
    assert cert == certificate(a.patched) and cert != OFFICIAL_CERT
    assert payload(a.original) == payload(a.baseline)
    for apk in (a.original, a.baseline, a.patched):
        info = run(tools / 'aapt2', 'dump', 'badging', apk).stdout.decode()
        assert "name='" + PKG + "'" in info and "versionName='1.41.0'" in info
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    installed = adb('shell', 'pm', 'path', PKG).strip().removeprefix('package:')
    installed_sha = hashlib.sha256(adb('exec-out', 'cat', installed, binary=True)).hexdigest()
    assert installed_sha in {sha(a.baseline), PATCHED_SHA, a.expected_patched_sha}, 'Unowned installation'

    def stop():
        adb('shell', 'am', 'force-stop', PKG)

    def settings():
        stop()
        return adb('exec-out', 'su', '0', 'cat', DATA + '/files/datastore/settings.json', binary=True)

    def widgets(label):
        stop()
        folder = out / label
        folder.mkdir(exist_ok=True)
        for suffix in ('', '-wal', '-shm'):
            local = folder / ('room' + suffix)
            local.unlink(missing_ok=True)
            result = run(a.sdk / 'platform-tools/adb', '-s', a.serial, 'exec-out',
                         'su', '0', 'cat', DATA + '/databases/room' + suffix, check=False)
            if result.returncode == 0:
                local.write_bytes(result.stdout)
        with sqlite3.connect(folder / 'room') as db:
            return db.execute('SELECT * FROM Widget ORDER BY id').fetchall()

    def regression(label, original=False):
        result = run(sys.executable, ROOT / 'tests/kvaesitso/menu_regression.py',
                     '--adb', a.sdk / 'platform-tools/adb', '--serial', a.serial,
                     '--package', PKG, '--button', 'hidden', '--layout', 'separate',
                     '--start-page', 'home', '--artifacts', out / label,
                     check=False, timeout=300)
        output = result.stdout.decode() + result.stderr.decode()
        (out / (label + '.log')).write_text(output)
        assert 'Verified edit button preference: hidden' in output, output
        if original:
            assert result.returncode != 0 and 'FAIL #1504:' in output, output
        else:
            assert result.returncode == 0 and 'PASS:' in output, output
        print(('REPRODUCED' if original else 'PASS') + ': ' + label, flush=True)

    initial_settings = settings()
    initial_rows = widgets('initial')
    assert any('Penguin1504MorpheOne' in str(row) for row in initial_rows), 'Owned synthetic fixture required'
    adb('shell', 'cmd', 'statusbar', 'collapse')
    adb('logcat', '-b', 'crash', '-c')
    try:
        adb('install', '-r', a.baseline)
        regression('original', original=True)
        before = settings()
        assert widgets('original-rows') == initial_rows, 'Original navigation changed widgets'
        configured = json.loads(before)
        assert configured['widgetsEditButton'] is False and configured['homeScreenWidgets'] is False
        adb('install', '-r', a.patched)
        assert widgets('updated-rows') == initial_rows, 'Same-key update changed widgets'
        assert json.loads(settings()) == configured, 'Same-key update changed settings'
        regression('patched')
        assert widgets('after-rows') == initial_rows, 'Editor navigation changed widgets'
        assert json.loads(settings()) == configured, 'Editor navigation changed settings'
        for target, source in (('before', 'original/menu'), ('after', 'patched/menu'),
                               ('editor', 'patched/editor')):
            shutil.copyfile(out / (source + '.png'), out / (target + '.png'))
    finally:
        stop()
        adb('install', '-r', a.patched)
        if settings() != initial_settings:
            backup = out / 'settings-original.json'
            backup.write_bytes(initial_settings)
            adb('push', backup, '/data/local/tmp/penguin-kvaesitso-evidence-settings.json')
            adb('shell', 'su', '0', 'cp', '/data/local/tmp/penguin-kvaesitso-evidence-settings.json',
                DATA + '/files/datastore/settings.json')
            adb('shell', 'rm', '-f', '/data/local/tmp/penguin-kvaesitso-evidence-settings.json')
        assert settings() == initial_settings, 'Initial settings were not restored'
        assert widgets('final-rows') == initial_rows, 'Widget data changed'
        adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.MAIN',
            '-c', 'android.intent.category.HOME', '-p', PKG)
    crashes = adb('logcat', '-b', 'crash', '-d')
    (out / 'crash.log').write_text(crashes)
    assert 'FATAL EXCEPTION' not in crashes and 'Fatal signal' not in crashes
    summary = dict(outcome='PASS', originalSha256=ORIGINAL_SHA, baselineSha256=sha(a.baseline),
                   patchedSha256=sha(a.patched), testCertificateSha256=cert,
                   originalHiddenButtonFailureReproduced=True, patchedMenuEditorDoneBackPassed=True,
                   sameKeyUpdateRetainedWidgetRows=True, sameKeyUpdateRetainedSettings=True,
                   editorNavigationRetainedWidgetRows=True, initialSettingsRestored=True,
                   screenshots={name: sha(out / (name + '.png')) for name in ('before', 'after', 'editor')})
    (out / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == '__main__':
    main()
