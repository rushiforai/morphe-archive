#!/usr/bin/env python3
"""Run SHA-bound Vela adapter instrumentation on its already-installed owned AVD target.

This runner installs only the reflection-only helper. It never installs, resigns,
clears data, grants permissions to, or changes settings of the target application.
"""
import argparse
import json
from pathlib import Path
import re
import subprocess
import sys
import run_native_probe as base

PACKAGE = 'app.vela'
PROBE_PACKAGE = 'nl.johninnl.warningprobe.vela'
COMPONENT = PROBE_PACKAGE + '/nl.johninnl.warningprobe.NativeWarningProbe'
INITIAL_ADAPTER_CANDIDATE = '15669aae34d65964a1c55ce3e3a3ee52bcbaf6548cadaa3200ddcdccde9ae2f0'
SYSTEM_CASES = frozenset(('system_baseline', 'system_cancel_pending', 'system_cancel_active',
                          'system_regenerate_current_step', 'system_regenerate_after_passage'))
NEURAL_CASES = frozenset(('neural_baseline', 'neural_cancel_pending', 'neural_cancel_active'))
TONE_CASES = frozenset(('tone_without_tts', 'tone_baseline', 'tone_cancel_pending', 'tone_cancel_active',
                        'tone_native_mute_caps', 'tone_focus_balance'))
DEVICE_PROFILES = {'vela': ('emulator-5582', 'native_warnings_vela_api34'),
                   'shared': ('emulator-5580', 'native_warnings_api34')}


def verify_device(profile, serial, qemu, avd, sdk, booted):
    names = [name.strip() for name in avd.splitlines() if name.strip() and name.strip() != 'OK']
    expected = DEVICE_PROFILES.get(profile)
    if (expected is None or serial != expected[0] or names != [expected[1]] or qemu.strip() != '1'
            or sdk.strip() != '34' or booted.strip() != '1'):
        raise ValueError('Device differs from the exact owned Vela runtime profile')


def verify_version(dump):
    if not re.search(r'\bversionName=0\.5\.2621(?:\s|$)', dump) or not re.search(r'\bversionCode=46210(?:\s|$)', dump):
        raise ValueError('Installed target must be exact Vela 0.5.2621 / 46210')
    uids = {int(value) for value in re.findall(r'\b(?:userId|appId)=(\d+)', dump)}
    if len(uids) != 1 or next(iter(uids)) < 10000:
        raise ValueError('Cannot establish the unique installed Vela application UID')
    return next(iter(uids))


def verify_probe_manifest(xml):
    package = re.findall(r'^\s*A: package="([^"]+)"', xml, re.M)
    if package != [PROBE_PACKAGE]:
        raise ValueError('Probe manifest package is not the Vela helper')
    scopes, current = [], None
    for line in xml.splitlines():
        node = re.match(r'^(\s*)E: (\S+)', line)
        if node:
            indent = len(node.group(1))
            if current is not None and indent <= current[0]:
                current = None
            if node.group(2) == 'instrumentation':
                current = (indent, {})
                scopes.append(current[1])
        elif current is not None:
            attribute = re.search(r':(name|targetPackage)\([^)]*\)="([^"]+)"', line)
            if attribute:
                current[1][attribute.group(1)] = attribute.group(2)
    if scopes != [{'name': 'nl.johninnl.warningprobe.NativeWarningProbe', 'targetPackage': PACKAGE}]:
        raise ValueError('Probe instrumentation component or target differs')


def verify_probe_classes(apk):
    root = Path(__file__).resolve().parents[2]
    sys.path.insert(0, str(root / 'tests'))
    try:
        from dex_declarations import DexDeclarations
        classes = DexDeclarations.from_apk(apk).classes
    finally:
        sys.path.pop(0)
    families = ('Lnl/johninnl/warningprobe/NativeWarningProbe', 'Lnl/johninnl/warningprobe/VelaAdapterProbe')
    if any(family + ';' not in classes for family in families):
        raise ValueError('Missing production Vela instrumentation entrypoint')
    for name in classes:
        if not any(name == family + ';' or name.startswith(family + '$') for family in families):
            raise ValueError('Production Vela helper contains an unexpected class definition: ' + name)
    return len(classes)


def signer_certificate(apksigner, apk):
    output = subprocess.check_output([str(apksigner), 'verify', '--print-certs', str(apk)], text=True)
    digests = re.findall(r'^Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]{64})$', output, re.M)
    if len(digests) != 1:
        raise ValueError('Expected exactly one verified APK signer')
    return digests[0].lower()


def verify_report(text, scenario, expected_uid):
    if re.search(r'^INSTRUMENTATION_CODE: -1\s*$', text, re.M) is None:
        raise ValueError('Instrumentation did not finish with RESULT_OK')
    report = base.parse_result(text, scenario)
    if report.get('process_uid') != expected_uid or report.get('target_uid') != expected_uid:
        raise ValueError('Probe did not run as the admitted installed Vela UID')
    expected = (SYSTEM_CASES if scenario == 'adapter_system' else NEURAL_CASES if scenario == 'adapter_neural'
                else TONE_CASES if scenario == 'adapter_tone' else SYSTEM_CASES | NEURAL_CASES | TONE_CASES)
    cases = report.get('cases')
    if not isinstance(cases, list) or len(cases) != len(expected) or {row.get('name') for row in cases} != expected:
        raise ValueError('Production adapter report is missing requested cases or contains duplicates')
    for case in cases:
        name = case['name']
        if name == 'tone_without_tts':
            if (case.get('system_engine_absent') is not True or case.get('neural_engine_absent') is not True
                    or case.get('speech_initialized') is not False or case.get('tone_ready') is not True):
                raise ValueError('Tone improperly depends on initialized speech')
        elif name == 'tone_native_mute_caps':
            if (case.get('alerts_only_voice_cap') != 'TONE' or case.get('fully_muted_cap') != 'SILENT'
                    or case.get('fully_muted_rejected') is not True or case.get('fully_muted_started') is not False
                    or case.get('voice_on_cap') != 'VOICE'):
                raise ValueError('Native tone mute caps were not verified')
        elif name == 'tone_focus_balance':
            if (case.get('native_count') != 0 or case.get('native_focus_held') is not False
                    or case.get('speech_engine_still_absent') is not True):
                raise ValueError('Tone native focus or engine-independence evidence is incomplete')
        elif 'regenerate_' in name:
            if (case.get('original_nav_session_used') is not True or case.get('synthetic_route') is not True
                    or case.get('fresh_fix_only_native_session_call') is not True or case.get('held_text_started') is not False
                    or not case.get('regenerated_text') or not case.get('native_tts_id')):
                raise ValueError('Native route regeneration evidence is incomplete: ' + name)
        else:
            cancelled = 'cancel_' in name
            if (case.get('accepted') is not True or case.get('quiescent') is not True
                    or case.get('terminal') != ('CANCELLED' if cancelled else 'COMPLETED')
                    or case.get('started') is not ('cancel_pending' not in name)):
                raise ValueError('Native output lifecycle evidence is incomplete: ' + name)
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--profile', choices=sorted(DEVICE_PROFILES), default='vela')
    parser.add_argument('--serial', choices=[value[0] for value in DEVICE_PROFILES.values()])
    parser.add_argument('--target-apk', type=Path, required=True, help='Exact already-installed patched/test-signed Vela APK')
    parser.add_argument('--target-sha256', default=INITIAL_ADAPTER_CANDIDATE, help='Explicit admitted candidate digest; default is the initial adapter-only candidate')
    parser.add_argument('--pre-signing-candidate', type=Path, help='Preserved candidate before changing only its signing identity')
    parser.add_argument('--pre-signing-sha256', default=INITIAL_ADAPTER_CANDIDATE)
    parser.add_argument('--probe-apk', type=Path, required=True)
    parser.add_argument('--probe-sha256', required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--scenario', choices=sorted(base.ADAPTER_SCENARIOS), default='adapter_all')
    parser.add_argument('--timeout-seconds', type=int, default=240)
    parser.add_argument('--aapt2', type=Path)
    parser.add_argument('--apksigner', type=Path)
    args = parser.parse_args()
    expected_serial, expected_avd = DEVICE_PROFILES[args.profile]
    args.serial = args.serial or expected_serial
    if args.serial != expected_serial:
        parser.error('--serial must match the explicitly selected owned profile')
    for value in (args.target_sha256, args.probe_sha256, args.pre_signing_sha256):
        if not re.fullmatch(r'[0-9a-f]{64}', value):
            parser.error('APK digests must be lowercase SHA-256 values')
    if not 30 <= args.timeout_seconds <= 600:
        parser.error('Instrumentation timeout must be 30..600 seconds')
    sdk = args.adb.resolve().parent.parent
    aapt2 = args.aapt2 or sdk / 'build-tools/36.0.0/aapt2'
    apksigner = args.apksigner or sdk / 'build-tools/36.0.0/apksigner'
    run_id = base.prepare_output(args.output)
    if base.digest(args.target_apk) != args.target_sha256 or base.digest(args.probe_apk) != args.probe_sha256:
        raise ValueError('Supplied candidate/probe bytes differ from their admitted SHA-256 values')
    class_count = verify_probe_classes(args.probe_apk)
    manifest = subprocess.check_output([str(aapt2), 'dump', 'xmltree', '--file', 'AndroidManifest.xml', str(args.probe_apk)], text=True)
    verify_probe_manifest(manifest)
    target_certificate = signer_certificate(apksigner, args.target_apk)
    if signer_certificate(apksigner, args.probe_apk) != target_certificate:
        raise ValueError('Candidate and same-UID instrumentation are signed by different certificates')
    signing_provenance = None
    if args.pre_signing_candidate:
        if base.digest(args.pre_signing_candidate) != args.pre_signing_sha256:
            raise ValueError('Preserved pre-signing candidate differs from its admitted SHA-256')
        base.verify_resigned(args.pre_signing_candidate, args.target_apk)
        signing_provenance = dict(pre_signing_candidate_sha256=args.pre_signing_sha256,
                                 pre_signing_certificate_sha256=signer_certificate(apksigner, args.pre_signing_candidate),
                                 test_signing_certificate_sha256=target_certificate,
                                 non_signing_zip_payloads_unchanged=True)

    def adb(*command, timeout=45):
        return subprocess.check_output([str(args.adb), '-s', args.serial, *map(str, command)], text=True, timeout=timeout).strip()

    def guard():
        verify_device(args.profile, args.serial, adb('shell', 'getprop', 'ro.kernel.qemu'), adb('emu', 'avd', 'name'),
                      adb('shell', 'getprop', 'ro.build.version.sdk'), adb('shell', 'getprop', 'sys.boot_completed'))

    def installed_hash(package):
        paths = [line.removeprefix('package:') for line in adb('shell', 'pm', 'path', package).splitlines()
                 if line.startswith('package:')]
        if len(paths) != 1 or not re.fullmatch(r'/data/app/[A-Za-z0-9_./+=~-]+/base\.apk', paths[0]):
            raise ValueError('Expected exactly one installed /data/app base APK for ' + package)
        value = adb('shell', 'sha256sum', paths[0]).split()[0]
        if not re.fullmatch(r'[0-9a-f]{64}', value):
            raise ValueError('Installed APK SHA-256 is malformed')
        return value

    guard()
    if installed_hash(PACKAGE) != args.target_sha256:
        raise ValueError('Installed Vela bytes differ; this runner never installs the target')
    target_uid = verify_version(adb('shell', 'dumpsys', 'package', PACKAGE))
    # Only the exact verified helper is installed after device/target admission.
    adb('install', '--no-incremental', '-r', args.probe_apk)
    if installed_hash(PROBE_PACKAGE) != args.probe_sha256:
        raise ValueError('Installed helper bytes differ from the admitted reflection-only probe')
    guard()
    if installed_hash(PACKAGE) != args.target_sha256:
        raise ValueError('Target changed before instrumentation')
    output = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'scenario', args.scenario, COMPONENT,
                 timeout=args.timeout_seconds)
    (args.output / 'instrumentation.txt').write_text(output + '\n')
    report = verify_report(output, args.scenario, target_uid)
    guard()
    if (installed_hash(PACKAGE) != args.target_sha256 or installed_hash(PROBE_PACKAGE) != args.probe_sha256
            or base.digest(args.target_apk) != args.target_sha256 or base.digest(args.probe_apk) != args.probe_sha256
            or args.pre_signing_candidate is not None and base.digest(args.pre_signing_candidate) != args.pre_signing_sha256
            or verify_version(adb('shell', 'dumpsys', 'package', PACKAGE)) != target_uid):
        raise ValueError('Installed or local candidate/probe identity changed during the run')
    report.update(run_id=run_id, serial=args.serial, avd=expected_avd, device_profile=args.profile, scenario=args.scenario,
                  installed_target_sha256=args.target_sha256, installed_probe_sha256=args.probe_sha256,
                  candidate_sha256=args.target_sha256, probe_sha256=args.probe_sha256,
                  original_reference_sha256=base.TARGETS['vela'][1], target_version='0.5.2621', target_version_code=46210,
                  signer_certificate_sha256=target_certificate, helper_class_definitions=class_count,
                  target_installation_performed=False, full_warning_feature_acceptance=False,
                  acceptance_scope='Patched Vela adapter engine/cancellation/regeneration synthetic cases only; source recovery/status, acoustic output and phone/car acceptance remain separate')
    if signing_provenance is not None:
        report['signing_provenance'] = signing_provenance
    temporary = args.output / ('result.' + run_id + '.tmp')
    temporary.write_text(json.dumps(report, indent=2, ensure_ascii=False) + '\n')
    temporary.replace(args.output / 'result.json')
    print(json.dumps({'probe_completed': True, 'probe_status': 'passed', 'scenario': args.scenario,
                      'target_sha256': args.target_sha256, 'probe_sha256': args.probe_sha256,
                      'cases': [case['name'] for case in report['cases']], 'report': str(args.output / 'result.json')}))


if __name__ == '__main__':
    main()
