#!/usr/bin/env python3
"""Run original-bytecode lifecycle spikes only on the owned warning emulator."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import uuid
import zipfile

TARGETS = {
    'vela': ('app.vela', 'f168bc730568b98ee8132131658d9220ef5be3557af41fd373bdaf104c31b20f'),
    'maps': ('com.google.android.apps.maps', '81506a2c54fc9a8faca34c18af7619d9c9d26cbfbe799b66884a59ac17791004'),
}
ADAPTER_SCENARIOS = frozenset(('adapter_system', 'adapter_neural', 'adapter_tone', 'adapter_all'))


def digest(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def verify_emulator(serial, qemu, avd_name):
    if serial != 'emulator-5580' or qemu.strip() != '1':
        raise ValueError('Native spike requires its owned emulator-5580 instance')
    names = [name.strip() for name in avd_name.splitlines() if name.strip() and name.strip() != 'OK']
    if names != ['native_warnings_api34']:
        raise ValueError('Native spike requires its owned native_warnings_api34 AVD')


def prepare_output(output):
    """Archive old evidence before any action; publish a new result only on success."""
    output.mkdir(parents=True, exist_ok=True)
    run_id = uuid.uuid4().hex
    previous = [output / name for name in ['result.json', 'instrumentation.txt'] if (output / name).exists()]
    if previous:
        archive = output / 'previous-runs' / run_id
        archive.mkdir(parents=True)
        for path in previous:
            path.replace(archive / path.name)
    return run_id


def verify_entries(original, signed, allowed_changes=()):
    def members(archive):
        result = {}
        for entry in archive.infolist():
            if entry.is_dir():
                if entry.file_size != 0:
                    raise ValueError('Malformed nonempty ZIP directory entry: ' + entry.filename)
                # apksigner may omit empty directory records; they contain no application bytes.
                continue
            name = entry.filename
            if name == 'stamp-cert-sha256' or re.fullmatch(r'META-INF/(?:MANIFEST\.MF|[^/]+\.(?:SF|RSA|DSA|EC))', name, re.I):
                continue
            if name in result:
                raise ValueError('Duplicate ZIP application entry: ' + name)
            result[name] = hashlib.sha256(archive.read(entry)).hexdigest()
        return result
    with zipfile.ZipFile(original) as before, zipfile.ZipFile(signed) as after:
        first, second = members(before), members(after)
    changed = sorted(name for name in first.keys() | second.keys() if first.get(name) != second.get(name))
    if set(changed) - set(allowed_changes):
        raise ValueError(f'Test signing changed original application entries: {changed}')


def verify_resigned(original, signed):
    verify_entries(original, signed)


def parse_result(text, expected_scenario=None):
    match = re.search(r'^INSTRUMENTATION_RESULT: native_warning_result=(.+)$', text, re.M)
    if not match:
        raise ValueError('Native instrumentation produced no complete result')
    result = json.loads(match.group(1))
    uid = result.get('process_uid')
    if result.get('probe_completed') is not True or not isinstance(uid, int) or uid < 10000 or uid != result.get('target_uid'):
        raise ValueError('Native probe did not complete in the target app UID')
    scenario = result.get('scenario')
    adapter_requested = isinstance(expected_scenario, str) and expected_scenario.startswith('adapter_')
    adapter_reported = isinstance(scenario, str) and scenario.startswith('adapter_')
    if adapter_requested or adapter_reported:
        if (scenario not in ADAPTER_SCENARIOS or result.get('target_package') != 'app.vela'
                or result.get('probe_status') != 'passed'
                or (expected_scenario is not None and scenario != expected_scenario)):
            raise ValueError('Vela adapter acceptance requires the exact requested scenario and probe_status=passed')
    if (result.get('probe_status') in ('failed', 'blocked', 'inconclusive') or result.get('status') in ('blocked', 'inconclusive')
            or any(case.get('status') in ('blocked', 'inconclusive') or case.get('observation_timed_out') is True
                   or case.get('native_callback_forward_failures', 0) != 0 or case.get('terminal_callback') == 'onError'
                   for case in result.get('cases', []))
            or result.get('fenced_suite_expectations_met') is False):
        raise ValueError('Native probe reported failed/inconclusive observations; inspect the saved instrumentation')
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk', type=Path, required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--target', choices=TARGETS, required=True)
    parser.add_argument('--original', type=Path, required=True)
    parser.add_argument('--probe', type=Path, required=True)
    parser.add_argument('--key', type=Path, required=True)
    parser.add_argument('--alias', default='native-warning-test')
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--scenario', default='baseline')
    parser.add_argument('--candidate', type=Path, help='Private Vela three-hook fence candidate; only scenario=fenced')
    args = parser.parse_args()
    if args.scenario.startswith('adapter_'):
        if args.scenario not in ADAPTER_SCENARIOS or args.target != 'vela':
            parser.error('Adapter scenarios require Vela and adapter_system, adapter_neural or adapter_all')
    run_id = prepare_output(args.output)
    tools = args.sdk / 'build-tools/36.0.0'
    adb_path = args.sdk / 'platform-tools/adb'

    def adb(*command, timeout=180):
        result = subprocess.run([str(adb_path), '-s', args.serial, *map(str, command)],
                                capture_output=True, text=True, timeout=timeout)
        if result.returncode:
            raise ValueError(f'ADB {command[0]} failed: {result.stdout.strip()} {result.stderr.strip()}')
        return result.stdout

    verify_emulator(args.serial, adb('shell', 'getprop', 'ro.kernel.qemu'), adb('emu', 'avd', 'name'))
    if adb('shell', 'getprop', 'sys.boot_completed').strip() != '1':
        raise ValueError('Owned emulator has not finished booting')
    package, expected_hash = TARGETS[args.target]
    if digest(args.original) != expected_hash:
        raise ValueError('Native spike needs the pinned original application APK')
    source = args.original
    if args.candidate:
        if args.target != 'vela' or args.scenario != 'fenced':
            raise ValueError('Private candidate mode requires Vela and scenario=fenced')
        import build_fenced_vela
        import inspect_bindings
        fixture = Path(__file__).resolve().parents[2] / 'tests/fixtures/navigation-warnings'
        selection = json.loads((fixture / 'vela-selection.json').read_text())
        selection['include_instructions'] = True
        detail = args.output / 'detail-selection.json'
        detail.write_text(json.dumps(selection))
        first = inspect_bindings.inspect(args.original, detail)
        second = inspect_bindings.inspect(args.candidate, detail)
        build_fenced_vela.verify_edits(first, second)
        verify_entries(args.original, args.candidate, allowed_changes=('classes.dex', 'classes3.dex'))
        source = args.candidate
    signed = args.output / 'target-test-signed.apk'
    subprocess.run([str(tools / 'apksigner'), 'sign', '--ks', str(args.key), '--ks-key-alias', args.alias,
                    '--ks-pass', 'pass:android', '--key-pass', 'pass:android', '--out', str(signed), str(source)], check=True)
    subprocess.run([str(tools / 'apksigner'), 'verify', str(signed)], check=True)
    verify_resigned(source, signed)
    for apk in [signed, args.probe]:
        adb('install', '--no-incremental', '-r', apk)
        print('Installed test APK: ' + apk.name, flush=True)
    installed = {}
    for name, apk in [(package, signed), ('nl.johninnl.warningprobe.' + args.target, args.probe)]:
        paths = [line.removeprefix('package:') for line in adb('shell', 'pm', 'path', name).splitlines()
                 if line.startswith('package:')]
        if len(paths) != 1:
            raise ValueError(f'Native spike expected one installed base APK for {name}')
        actual = adb('shell', 'sha256sum', paths[0]).split()[0]
        if actual != digest(apk):
            raise ValueError(f'Installed APK bytes differ for {name}')
        installed[name] = actual
    component = 'nl.johninnl.warningprobe.' + args.target + '/nl.johninnl.warningprobe.NativeWarningProbe'
    text = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'scenario', args.scenario, component)
    (args.output / 'instrumentation.txt').write_text(text)
    result = parse_result(text, args.scenario)
    if result.get('target_package') != package:
        raise ValueError('Native result came from a different target package')
    result.update(original_sha256=expected_hash, test_signed_sha256=digest(signed),
                  probe_sha256=digest(args.probe), serial=args.serial, original_entries_unchanged=args.candidate is None,
                  private_native_edits_verified=3 if args.candidate else 0, installed_apk_sha256=installed, run_id=run_id)
    temporary = args.output / ('result.' + run_id + '.tmp')
    temporary.write_text(json.dumps(result, indent=2) + '\n')
    temporary.replace(args.output / 'result.json')
    print(json.dumps({'target': package, 'probe_completed': True, 'scenario': args.scenario,
                      'status': result.get('status', result.get('probe_status')),
                      'fenced_suite_expectations_met': result.get('fenced_suite_expectations_met'),
                      'cases': [{key: case.get(key) for key in ['name', 'case', 'status', 'stale_delayed_dispatch_reproduced']
                                 if key in case} for case in result.get('cases', [])],
                      'report': str(args.output / 'result.json')}), flush=True)


if __name__ == '__main__':
    main()
