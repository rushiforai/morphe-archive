#!/usr/bin/env python3
"""Run explicit synthetic model/resource checks only on the owned warning AVD."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import uuid


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--serial', choices=['emulator-5590'], default='emulator-5590')
    parser.add_argument('--target-apk', type=Path, required=True, help='Exact already-installed patched/test-signed FM APK')
    parser.add_argument('--probe-apk', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--languages', nargs='+', default=['en', 'nl'])
    args = parser.parse_args()
    if not all(re.fullmatch(r'[A-Za-z]{2,3}(?:-[A-Za-z0-9]{2,8})*', value) for value in args.languages):
        parser.error('Invalid language tag')

    def adb(*command, timeout=45):
        return subprocess.check_output([str(args.adb), '-s', args.serial, *map(str, command)], text=True, timeout=timeout).strip()

    def guard():
        if (adb('shell', 'getprop', 'ro.kernel.qemu') != '1'
                or adb('emu', 'avd', 'name').splitlines()[0] != 'native_warnings_ui_api34'
                or adb('shell', 'getprop', 'ro.build.version.sdk') != '34'
                or adb('shell', 'id', '-u') != '0'):
            raise RuntimeError('Wrong device; only the owned warning AVD is permitted')

    def installed_hash(package):
        paths = adb('shell', 'pm', 'path', package).splitlines()
        if len(paths) != 1 or not paths[0].startswith('package:'):
            raise RuntimeError('Expected one installed probe/merged-target APK')
        return adb('shell', 'sha256sum', paths[0].split(':', 1)[1]).split()[0]

    def digest(path):
        return hashlib.sha256(path.read_bytes()).hexdigest()

    args.output.mkdir(parents=True, exist_ok=True)
    result_path = args.output / 'result.json'
    previous_outputs = [*args.output.glob('*-instrumentation.txt')]
    if result_path.exists():
        previous_outputs.append(result_path)
    if previous_outputs:
        previous = args.output / 'previous-runs' / str(uuid.uuid4())
        previous.mkdir(parents=True)
        for path in previous_outputs:
            shutil.move(str(path), previous / path.name)
    guard()
    target_hash = digest(args.target_apk)
    if installed_hash('nl.flitsmeister') != target_hash:
        raise RuntimeError('Installed FM bytes differ from the supplied patched APK; no target installation is performed')
    package = adb('shell', 'dumpsys', 'package', 'nl.flitsmeister')
    version = re.search(r'versionName=(\S+)', package)
    code = re.search(r'versionCode=(\d+)(?:\s|$)', package)
    profile = (version.group(1), code.group(1)) if version and code else None
    if profile not in {('14.17', '1287'), ('15.0', '1289')}:
        raise RuntimeError('Target is not pinned FM 14.17/1287 or 15.0/1289')
    adb('install', '--no-incremental', '-r', args.probe_apk)
    probe_hash = digest(args.probe_apk)
    if installed_hash('nl.johninnl.warningprobe.fm.models') != probe_hash:
        raise RuntimeError('Installed model probe differs from the built APK')
    root = Path(__file__).resolve().parents[2]
    contract_name = 'flitsmeister15-contract.json' if profile[0] == '15.0' else 'flitsmeister-contract.json'
    contract = json.loads((root / 'tests/fixtures/navigation-warnings' / contract_name).read_text())
    expected = {'cameras': contract['enums']['Lnl/flitsmeister/fmcore/data/model/reports/SpeedCamType;'],
                'incidents': contract['enums']['Lnl/flitsmeister/fmcore/data/model/reports/IncidentType;'],
                'early': contract['enums']['Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;'],
                'services': contract['enums']['Lnl/flitsmeister/fmcore/data/model/reports/ServiceVehicle$Type;'],
                'base_types': contract['enums']['Lnl/flitsmeister/fmcore/data/model/reports/BaseReportType;']}
    expected['lane_closed'] = ['ANY_MIDDLE_LANE', 'LEFT_LANE', 'RIGHT_LANE']
    result = {'run_id': str(uuid.uuid4()), 'serial': args.serial, 'avd': 'native_warnings_ui_api34',
              'source_version': profile[0], 'source_version_code': int(profile[1]),
              'original_contract_sha256': contract['artifact_sha256'],
              'installed_target_sha256': target_hash, 'installed_probe_sha256': probe_hash, 'languages': {}}
    for language in args.languages:
        guard()
        output = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'language', language,
                     'nl.johninnl.warningprobe.fm.models/nl.johninnl.warningprobe.NativeFmModelProbe', timeout=60)
        (args.output / (language + '-instrumentation.txt')).write_text(output + '\n')
        line = next((line for line in output.splitlines() if line.startswith('INSTRUMENTATION_RESULT: fm_model_result=')), None)
        if line is None or 'INSTRUMENTATION_CODE: -1' not in output:
            raise RuntimeError('FM model probe failed; inspect the retained instrumentation output')
        report = json.loads(line.split('=', 1)[1])
        if not report.get('probe_completed') or report['process_uid'] != report['target_uid']:
            raise RuntimeError('Incomplete or wrong-UID model probe')
        if report.get('adapter_call_cases') != 170 or report['cits_roadworks'].get('category') != 'roadworks':
            raise RuntimeError('Native lane/roadworks model coverage is incomplete')
        if len(report.get('base_warning_models', [])) != 5 or len(report.get('cits_kind_labels', [])) != 4 or len(report.get('base_warning_families_captured', [])) != 12:
            raise RuntimeError('All base-warning family/model labels have not been exercised')
        for family, members in expected.items():
            if sorted(row['member'] for row in report[family]) != members:
                raise RuntimeError('Native enum coverage differs: ' + family)
        result['languages'][language] = report
    temporary = result_path.with_suffix('.new')
    temporary.write_text(json.dumps(result, indent=2, ensure_ascii=False) + '\n')
    temporary.replace(result_path)
    print(json.dumps({'probe_completed': True, 'languages': args.languages, 'inventory_per_language': 159,
                      'target_sha256': target_hash, 'acceptance_scope': 'Native models/resources and synthetic accepted adapter calls only'}))


if __name__ == '__main__':
    main()
