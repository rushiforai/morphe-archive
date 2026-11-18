"""Run actual KIJK DEX policy fixtures on an explicitly selected task emulator.

This isolates policy return/queue/callback contracts. It does not test playback,
DRM, login, notification delivery, or comprehensive real-application networking.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import uuid

from atv_smali import class_methods

ROOT = Path(__file__).resolve().parent


def run(command, **kwargs):
    result = subprocess.run([str(x) for x in command], capture_output=True, text=True, **kwargs)
    if result.returncode:
        raise RuntimeError(f'Command failed: {command[0]}\n{result.stdout}\n{result.stderr}')
    return result.stdout


def registration_methods(root):
    owner = 'Lcom/nakko/android/radio10gold/businesslogic/manager/D;'
    candidates = []
    for path in root.glob('smali*/com/nakko/android/radio10gold/businesslogic/manager/D*.smali'):
        with path.open() as stream:
            if stream.readline().rstrip().endswith(' ' + owner):
                candidates.append(path)
    assert len(candidates) == 1, 'Need exact original/decoded KIJK Salesforce manager'
    return class_methods(candidates[0])


def verify_push_preservation(original, patched):
    before, after = registration_methods(original), registration_methods(patched)
    assert before.keys() == after.keys(), 'Salesforce manager method inventory changed'
    contracts = json.loads((ROOT / 'kijk_mobile_contracts.json').read_text())
    contract = next(c for c in contracts if c['owner'].endswith('/manager/D;') and
                    c['signature'].startswith('k('))
    edited = contract['owner'] + '->' + contract['signature']
    for name, rows in before.items():
        expected = list(rows)
        if name == edited:
            assert len(contract['replacements']) == 2
            for change in contract['replacements']:
                assert change['with'] == 'nop'
                indices = [i for i, row in enumerate(expected) if row == change['instruction']]
                assert len(indices) == 1
                expected[indices[0]] = 'nop'
        assert after[name] == expected, 'Functional Salesforce manager changed: ' + name
    assert any('->setProfileId$default(' in row for row in after[edited])
    assert any('->mp(' in row for row in after[edited])
    print('PASS static complete D.o/D.w preservation and D.k only two optional identifier calls', flush=True)


def compile_probes(local, android, d8, java_home):
    classes, dex = local / 'classes', local / 'dex'
    classes.mkdir()
    dex.mkdir()
    run([java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android,
         '-d', classes, ROOT / 'KijkMobileProbe.java'])
    run([d8, '--min-api', '26', '--lib', android, '--output', dex, *classes.rglob('*.class')],
        env=dict(os.environ, JAVA_HOME=str(java_home)))

    # Compile-only signatures are deliberately excluded from both emitted DEXes.
    # Helpers resolve their superclass from the actual APK in a child loader.
    stub_sources, stub_classes = local / 'stub-source', local / 'stub-classes'
    stub_classes.mkdir()
    stubs = {
        'com/tealium/internal/a.java': 'package com.tealium.internal; public abstract class a { public abstract boolean b(); public abstract boolean c(); }',
        'com/google/firebase/perf/e.java': '''package com.google.firebase.perf;
public class e {
 public e(com.google.firebase.g a, com.google.firebase.inject.b b,
 com.google.firebase.installations.k c, com.google.firebase.inject.b d,
 com.google.firebase.perf.config.RemoteConfigManager e,
 com.google.firebase.perf.config.a f, com.google.firebase.perf.session.SessionManager g) {}
 public synchronized void i(Boolean enabled) {}
}''',
    }
    for name in ['com/google/firebase/g', 'com/google/firebase/inject/b',
                 'com/google/firebase/installations/k', 'com/google/firebase/perf/config/RemoteConfigManager',
                 'com/google/firebase/perf/config/a', 'com/google/firebase/perf/session/SessionManager']:
        package, cls = name.rsplit('/', 1)
        stubs[name + '.java'] = f'package {package.replace("/", ".")}; public class {cls} {{}}'
    for name, body in stubs.items():
        target = stub_sources / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(body)
    run([java_home / 'bin/javac', '-source', '8', '-target', '8', '-d', stub_classes,
         *stub_sources.rglob('*.java')])
    sources, output, helper_dex = local / 'helper-source', local / 'helper-classes', local / 'helper-dex'
    sources.mkdir()
    output.mkdir()
    helper_dex.mkdir()
    (sources / 'PerfSink.java').write_text('''package fixture;
public class PerfSink extends com.google.firebase.perf.e {
 public int calls; public Boolean value;
 public PerfSink() { super(null,null,null,null,null,null,null); }
 @Override public synchronized void i(Boolean enabled) {calls++;value=enabled;}
}''')
    (sources / 'Connected.java').write_text('''package fixture;
public class Connected extends com.tealium.internal.a {
 @Override public boolean b() {return true;}
 @Override public boolean c() {return true;}
}''')
    run([java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', stub_classes,
         '-d', output, *sources.glob('*.java')])
    assert {p.name for p in output.rglob('*.class')} == {'PerfSink.class', 'Connected.class'}
    run([d8, '--min-api', '26', '--lib', android, '--output', helper_dex, *output.rglob('*.class')],
        env=dict(os.environ, JAVA_HOME=str(java_home)))
    return dex / 'classes.dex', helper_dex / 'classes.dex'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--serial')
    parser.add_argument('--apk', required=True, type=Path)
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--original-decoded', type=Path)
    parser.add_argument('--patched-decoded', type=Path)
    parser.add_argument('--compile-only', action='store_true', help='Compile fixtures without any ADB/device calls')
    parser.add_argument('--sdk', type=Path, default=Path.home() / 'Library/Android/sdk')
    parser.add_argument('--java-home', type=Path, default=Path('/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home'))
    args = parser.parse_args()
    if not args.apk.is_file() or not (args.ads or args.tracking):
        parser.error('Provide an existing APK and at least one selection')
    if not args.compile_only and not re.fullmatch(r'emulator-\d+', args.serial or ''):
        parser.error('Select the dedicated task emulator explicitly; physical devices are outside this runner')
    if bool(args.original_decoded) != bool(args.patched_decoded):
        parser.error('Provide both decoded directories for preservation verification')
    if args.tracking and not args.compile_only and not args.original_decoded:
        parser.error('Tracking fixtures require --original-decoded and --patched-decoded for complete push preservation checks')
    if args.original_decoded:
        verify_push_preservation(args.original_decoded, args.patched_decoded)
    def version(path):
        return tuple(map(int, re.findall(r'\d+', path.parent.name)))
    android = max((args.sdk / 'platforms').glob('android-*/android.jar'), key=version)
    d8 = max((args.sdk / 'build-tools').glob('*/d8'), key=version)
    with tempfile.TemporaryDirectory(prefix='kijk-art-') as temporary:
        dex, helper = compile_probes(Path(temporary), android, d8, args.java_home)
        if args.compile_only:
            print('PASS host javac/D8 API26-compatible fixture compilation; no device calls')
            return
        adb = args.sdk / 'platform-tools/adb'
        if run([adb, '-s', args.serial, 'get-state']).strip() != 'device':
            raise RuntimeError('Explicit emulator unavailable')
        api = int(run([adb, '-s', args.serial, 'shell', 'getprop', 'ro.build.version.sdk']).strip())
        if api < 26:
            raise RuntimeError('KIJK fixture requires API26 or newer')
        remote = '/data/local/tmp/kijk-probe-' + uuid.uuid4().hex
        paths = [remote + suffix for suffix in ('.apk', '.dex', '-helpers.dex')]
        try:
            for source, destination in zip((args.apk, dex, helper), paths):
                run([adb, '-s', args.serial, 'push', source, destination])
            run([adb, '-s', args.serial, 'shell', 'chmod', '444', *paths])
            print('APK SHA256:', hashlib.sha256(args.apk.read_bytes()).hexdigest(), 'API:', api, flush=True)
            output = run([adb, '-s', args.serial, 'shell', 'CLASSPATH=' + paths[1], 'app_process',
                          '/system/bin', 'KijkMobileProbe', paths[0], str(args.ads).lower(),
                          str(args.tracking).lower(), paths[2]], timeout=60)
            print(output, end='')
            expected = (2 if args.ads else 0) + (15 if args.tracking else 0)
            assert f'PASS: {expected} actual KIJK APK ART fixture groups; no playback assertion' in output
        finally:
            run([adb, '-s', args.serial, 'shell', 'rm', '-f', *paths])


if __name__ == '__main__':
    main()
