#!/usr/bin/env python3
"""Run actual native FM entry probes with an isolated UID firewall and verified mute."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import threading
import time
import uuid


def firewall_cleanup_changes(before, after, chain):
    """Verify task-rule rollback while preserving netd's independent network changes."""
    def tables(text):
        result = {}; current = None
        for line in text.splitlines():
            if not line or line.startswith('#'):
                continue
            line = re.sub(r'\[\d+:\d+\]', '[COUNTERS]', line)
            if line.startswith('*'):
                current = line
                result[current] = []
            if current is not None:
                result[current].append(line)
        return result
    old, new = tables(before), tables(after)
    if old.keys() != new.keys() or '*filter' not in old:
        raise RuntimeError('Firewall table set changed unexpectedly')
    if any(chain in line for lines in new.values() for line in lines):
        raise RuntimeError('Task firewall chain or reference remains')
    changed = []
    for name in old:
        if old[name] == new[name]:
            continue
        if name not in ('*mangle','*raw'):
            raise RuntimeError('Firewall rules differ from prior state: ' + name)
        prefixes = ('-A routectrl_mangle_INPUT ', '-A wakeupctrl_mangle_INPUT ') if name=='*mangle' else ()
        # Captured API34 netd transition: Wi-Fi -> emulator Ethernet. These exact
        # idle-timer bookkeeping rules are not the source UID's OUTPUT fence.
        idle_chain,direction=('idletimer_mangle_POSTROUTING','-o') if name=='*mangle' else ('idletimer_raw_PREROUTING','-i')
        idle_rules={f'-A {idle_chain} {direction} wlan0 -j IDLETIMER --timeout 15 --label 1 --send_nl_msg',
                    f'-A {idle_chain} {direction} eth0 -j IDLETIMER --timeout 10 --label 0 --send_nl_msg'}
        stable_old = [line for line in old[name] if not line.startswith(prefixes) and line not in idle_rules]
        stable_new = [line for line in new[name] if not line.startswith(prefixes) and line not in idle_rules]
        if stable_old != stable_new:
            raise RuntimeError('Unexpected '+name.lstrip('*')+' rules changed')
        changed.append('Android netd interface marks/wakeup/idle-timer rules changed in '+name+'; preserved')
    return changed


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--serial', choices=['emulator-5582', 'emulator-5584', 'emulator-5590'], default='emulator-5584')
    parser.add_argument('--target-apk', type=Path, required=True)
    parser.add_argument('--probe-apk', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--scenarios', nargs='+', choices=['sound', 'point', 'voice', 'cits_direct', 'early_bus', 'impact', 'vri', 'cits', 'integrated_trigger', 'integrated_matrix', 'integrated_handover', 'integrated_death_recovery', 'integrated_restart_seed', 'integrated_restart_recovery', 'integrated_parked_cleanup', 'integrated_warning_suite'], default=['sound'])
    parser.add_argument('--receiver-package', default='com.google.android.apps.maps')
    parser.add_argument('--death-owner', choices=['app.vela','com.google.android.apps.maps','org.ungoogled.android.apps.maps'], default='app.vela')
    parser.add_argument('--expected-pending-attempt', default='')
    parser.add_argument('--expected-old-session', default='')
    parser.add_argument('--reviewed-stopped-output', action='store_true')
    parser.add_argument('--warning-suite-cases', choices=['all','road-service','concurrent','native-guidance','moving-camera','delayed-passage','native-zone'], default='all')
    parser.add_argument('--hold-seconds', type=int, choices=range(10, 31), default=20)
    parser.add_argument('--native-id', help='Controlled native model ID; expected warning ID is SpeedCam:<native-id>')
    parser.add_argument('--receiver-wait-seconds', '--confirm-wait-seconds', dest='receiver_wait_seconds', type=int, choices=range(30, 121), default=120)
    parser.add_argument('--trigger-family', choices=['ordinary', 'p0'], default='ordinary')
    parser.add_argument('--trigger-pattern', choices=['single', 'update', 'clear', 'repeat'], default='single')
    parser.add_argument('--event-count', type=int, choices=range(1, 101), default=1)
    parser.add_argument('--matrix-timeout-seconds', type=int, choices=range(60, 901), default=600)
    parser.add_argument('--native-spacing-ms', type=int, choices=range(1000, 5001), default=1000)
    parser.add_argument('--post-warmup-no-gps-delay-ms', type=int, default=0)
    parser.add_argument('--trace-token', help='32-hex Frida ready/lost barrier token; no stimuli before attached observation')
    args = parser.parse_args()
    if args.trace_token and not re.fullmatch(r'[a-f0-9]{32}',args.trace_token):parser.error('Invalid Frida trace token')
    if not 0 <= args.post_warmup_no_gps_delay_ms <= 12000:
        parser.error('Post-warmup no-GPS delay must be 0..12000 ms')
    if not re.fullmatch(r'[A-Za-z][A-Za-z0-9_]*(?:\.[A-Za-z][A-Za-z0-9_]*)+', args.receiver_package):
        parser.error('Invalid receiver package')
    if args.native_id and not re.fullmatch(r'[A-Za-z0-9._:-]{1,128}', args.native_id):
        parser.error('Invalid controlled native ID')
    serial = args.serial
    avd = {'emulator-5582': 'native_warnings_vela_api34', 'emulator-5584': 'native_warnings_car_api34', 'emulator-5590': 'native_warnings_ui_api34'}[serial]

    def adb(*command, check=True, timeout=60):
        return subprocess.run([str(args.adb), '-s', serial, *map(str, command)], check=check,
                              capture_output=True, text=True, timeout=timeout)

    def guard():
        if adb('shell', 'getprop', 'ro.kernel.qemu').stdout.strip() != '1' or adb('emu', 'avd', 'name').stdout.splitlines()[0] != avd or adb('shell', 'getprop', 'ro.build.version.sdk').stdout.strip() != '34':
            raise RuntimeError('Only the owned native warning AVD is authorized')
        if adb('shell', 'id', '-u').stdout.strip() != '0':
            raise RuntimeError('Owned AVD adbd must already be root for UID-only network isolation')

    def digest(path):
        return hashlib.sha256(path.read_bytes()).hexdigest()

    def installed(package):
        paths = adb('shell', 'pm', 'path', package).stdout.strip().splitlines()
        if len(paths) != 1:
            raise RuntimeError('Expected one installed APK')
        return adb('shell', 'sha256sum', paths[0].split(':', 1)[1]).stdout.split()[0]

    args.output.mkdir(parents=True, exist_ok=True)
    run_id = str(uuid.uuid4())
    run = args.output / run_id
    run.mkdir()
    shutil.copyfile(args.probe_apk, run / 'probe.apk')
    build_report = args.probe_apk.parent / 'build-report.json'
    if build_report.exists():
        shutil.copyfile(build_report, run / 'probe-build-report.json')
    source = Path(__file__).with_name('probe') / 'NativeFmCaptureProbe.java'
    if source.exists():
        shutil.copyfile(source, run / 'NativeFmCaptureProbe.java')
    guard()
    if installed('nl.flitsmeister') != digest(args.target_apk):
        raise RuntimeError('Target bytes differ; this runner never installs or substitutes the target')
    adb('install', '--no-incremental', '-r', args.probe_apk)
    if installed('nl.johninnl.warningprobe.fm.capture') != digest(args.probe_apk):
        raise RuntimeError('Installed capture probe bytes differ')
    packages = adb('shell', 'pm', 'list', 'packages', '-U', 'nl.flitsmeister').stdout
    match = re.search(r'^package:nl\.flitsmeister\s+uid:(\d+)\s*$', packages, re.MULTILINE)
    if match is None:
        raise RuntimeError('Could not determine the exact native app UID')
    uid = int(match.group(1))
    if int(adb('shell', 'stat', '-c', '%u', '/data/user/0/nl.flitsmeister').stdout.strip()) != uid:
        raise RuntimeError('Native package UID and private directory owner differ')
    if uid <= 10000:
        raise RuntimeError('Unexpected native test app UID')
    adb('shell', 'am', 'force-stop', 'nl.flitsmeister')
    lease_files = []
    for suffix in ('xml', 'xml.bak'):
        remote = '/data/user/0/nl.flitsmeister/shared_prefs/navigation_startup_lease.' + suffix
        exists = adb('shell', 'test', '-f', remote, check=False).returncode == 0
        item = {'remote': remote, 'existed': exists}
        if exists:
            local = run / ('lease-before.' + suffix)
            adb('pull', remote, local)
            item.update({'local': str(local), 'stat': adb('shell', 'stat', '-c', '%a:%u:%g', remote).stdout.strip(), 'sha256': digest(local)})
        lease_files.append(item)
    chain = 'NWFM_' + run_id.replace('-', '')[:12]
    families = []
    cleanup_errors = []
    result = {'run_id': run_id, 'serial': serial, 'avd': avd, 'uid': uid,
              'target_sha256': digest(args.target_apk), 'probe_sha256': digest(args.probe_apk), 'scenarios': {},
              'network_block': 'Dedicated IPv4/IPv6 OUTPUT reject chains for the FM UID only', 'lease_restore': 'After verified target force-stop'}
    failure = None
    try:
        guard()
        for binary in ('iptables', 'ip6tables'):
            before = adb('shell', binary + '-save').stdout
            (run / (binary + '-before.txt')).write_text(before)
            state = {'binary': binary, 'before': before, 'created': False, 'jump': False}
            families.append(state)
            adb('shell', binary, '-w', '5', '-N', chain);state['created'] = True
            adb('shell', binary, '-w', '5', '-A', chain, '-j', 'REJECT')
            adb('shell', binary, '-w', '5', '-I', 'OUTPUT', '1', '-m', 'owner', '--uid-owner', uid, '-j', chain);state['jump'] = True
            adb('shell', binary, '-w', '5', '-C', 'OUTPUT', '-m', 'owner', '--uid-owner', uid, '-j', chain)
        for scenario in args.scenarios:
            guard()
            instrument = ['shell', 'am', 'instrument', '-w', '-r', '-e', 'scenario', scenario,
                          '-e', 'receiver_package', args.receiver_package, '-e', 'hold_seconds', str(args.hold_seconds),
                          '-e', 'death_owner', args.death_owner,
                          '-e', 'warning_suite_cases', args.warning_suite_cases,
                          '-e', 'native_id', args.native_id or ('probe-integrated-' + run_id),
                          '-e', 'receiver_wait_seconds', str(args.receiver_wait_seconds),
                          '-e', 'trigger_family', args.trigger_family, '-e', 'trigger_pattern', args.trigger_pattern,
                          '-e', 'event_count', str(args.event_count), '-e', 'matrix_timeout_seconds', str(args.matrix_timeout_seconds),
                          '-e', 'native_spacing_ms', str(args.native_spacing_ms),
                          '-e', 'post_warmup_no_gps_delay_ms', str(args.post_warmup_no_gps_delay_ms),
                          'nl.johninnl.warningprobe.fm.capture/nl.johninnl.warningprobe.NativeFmCaptureProbe']
            if args.reviewed_stopped_output:
                instrument[-1:-1] = ['-e', 'reviewed_stopped_output', 'true']
            if args.trace_token:instrument[-1:-1]=['-e','trace_token',args.trace_token]
            for key, value in [('expected_pending_attempt', args.expected_pending_attempt), ('expected_old_session', args.expected_old_session)]:
                if value:
                    instrument[-1:-1] = ['-e', key, value]
            if scenario in ('integrated_trigger', 'integrated_matrix', 'integrated_handover', 'integrated_death_recovery', 'integrated_restart_seed', 'integrated_restart_recovery', 'integrated_parked_cleanup', 'integrated_warning_suite'):
                # Stream the genuine source-ready/native-event statuses so the coordinator can
                # launch the real receiver while this source process remains alive.
                process = subprocess.Popen([str(args.adb), '-s', serial, *instrument], stdout=subprocess.PIPE,
                                           stderr=subprocess.STDOUT, text=True, bufsize=1)
                duration = args.matrix_timeout_seconds if scenario in ('integrated_matrix', 'integrated_handover', 'integrated_death_recovery', 'integrated_restart_seed', 'integrated_restart_recovery', 'integrated_parked_cleanup', 'integrated_warning_suite') else args.hold_seconds
                timeout = threading.Timer(args.receiver_wait_seconds + duration + 45, process.kill)
                timeout.start()
                try:
                    lines = []
                    for line in process.stdout:
                        print(line.rstrip(), flush=True);lines.append(line)
                    process.wait();output = ''.join(lines)
                finally:
                    timeout.cancel()
            else:
                output = adb(*instrument).stdout
            (run / (scenario + '-instrumentation.txt')).write_text(output)
            line = next((line for line in output.splitlines() if line.startswith('INSTRUMENTATION_RESULT: fm_capture_result=')), None)
            report = json.loads(line.split('=', 1)[1]) if line else None
            if report is not None:
                # Preserve actual outcomes from failed native paths as well as successes.
                result['scenarios'][scenario] = report
            partial = next((row for row in output.splitlines() if row.startswith('INSTRUMENTATION_RESULT: fm_capture_partial_result=')), None)
            if partial:
                result.setdefault('partial_scenarios', {})[scenario] = json.loads(partial.split('=', 1)[1])
            if line is None or 'INSTRUMENTATION_CODE: -1' not in output or 'fm_capture_cleanup_error=' in output:
                raise RuntimeError('Actual native capture failed: ' + scenario)
            if not report.get('probe_completed') or report['process_uid'] != uid or not report['managed_mute_verified']:
                raise RuntimeError('Native capture/mute assertion failed: ' + scenario)
            if scenario in ('integrated_trigger', 'integrated_matrix', 'integrated_handover', 'integrated_death_recovery', 'integrated_restart_seed', 'integrated_restart_recovery', 'integrated_parked_cleanup', 'integrated_warning_suite'):
                if not report.get('production_endpoint_used') or report.get('test_sink_used') or report.get('raw_packet_emitted') or report.get('coverage_override_used') or not report.get('provider_native_queue_empty'):
                    raise RuntimeError('Integrated native trigger bypassed production or provider mute')
            elif report['max_active_playbacks'] != 0:
                raise RuntimeError('Native provider active playback observed: ' + scenario)
            if args.trace_token:
                # This marker is created only after native completion/mute/queue assertions.
                # It identifies the runner's deliberate terminal stop, never an app crash.
                terminal='/sdcard/Android/data/nl.flitsmeister/files/native-warning-integrated/trace-terminal-'+args.trace_token+'.request'
                adb('shell','touch',terminal)
                result['successful_capture_terminal_marker_created']=True
                result['source_stop_intent_monotonic_ns']=time.monotonic_ns()
                result['source_stop_intent_host_unix_ms']=time.time_ns()//1000000
            adb('shell', 'am', 'force-stop', 'nl.flitsmeister')
    except Exception as error:
        failure = repr(error)
    finally:
        # Kill pending native callbacks before releasing the mute lease or network fence.
        try:
            adb('shell', 'am', 'force-stop', 'nl.flitsmeister')
            processes = adb('shell', 'pidof', 'nl.flitsmeister', check=False).stdout.strip()
            if processes:
                raise RuntimeError('Target remained alive during restoration')
            for item in lease_files:
                if item['existed']:
                    adb('push', item['local'], item['remote'])
                    mode, owner, group = item['stat'].split(':')
                    adb('shell', 'chown', owner + ':' + group, item['remote'])
                    adb('shell', 'chmod', mode, item['remote'])
                    actual = adb('shell', 'sha256sum', item['remote']).stdout.split()[0]
                    if actual != item['sha256']:
                        raise RuntimeError('Original lease bytes not restored')
                else:
                    adb('shell', 'rm', '-f', item['remote'])
        except Exception as error:
            cleanup_errors.append('lease/process: ' + repr(error))
        for state in reversed(families):
            binary = state['binary']
            try:
                if state['jump']:
                    adb('shell', binary, '-w', '5', '-D', 'OUTPUT', '-m', 'owner', '--uid-owner', uid, '-j', chain)
                if state['created']:
                    adb('shell', binary, '-w', '5', '-F', chain)
                    adb('shell', binary, '-w', '5', '-X', chain)
                after = adb('shell', binary + '-save').stdout
                (run / (binary + '-after.txt')).write_text(after)
                network_changes = firewall_cleanup_changes(state['before'], after, chain)
                if network_changes:
                    result.setdefault('independent_android_network_changes', {})[binary] = network_changes
            except Exception as error:
                cleanup_errors.append(binary + ': ' + repr(error))
    result.update({'failure': failure, 'cleanup_errors': cleanup_errors, 'network_and_lease_restored': not cleanup_errors,
                   'probe_completed': failure is None and not cleanup_errors})
    (run / 'result.json').write_text(json.dumps(result, indent=2, ensure_ascii=False) + '\n')
    print(json.dumps({'run_id': run_id, 'probe_completed': result['probe_completed'], 'scenarios': list(result['scenarios']),
                      'failure': failure, 'cleanup_errors': cleanup_errors, 'result': str(run / 'result.json')}))
    if not result['probe_completed']:
        raise SystemExit(1)


if __name__ == '__main__':
    main()
