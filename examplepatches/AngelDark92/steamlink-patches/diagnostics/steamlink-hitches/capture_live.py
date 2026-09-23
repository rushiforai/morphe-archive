"""Bounded passive Steam Link hitch capture. No app restart, install, or settings changes.

Collects logcat, memory/pressure/thermal samples and optional system Perfetto.
ADB is stopped on exit unless --keep-adb is supplied for an ongoing investigation.
"""
from pathlib import Path
import argparse
import datetime as dt
import json
import subprocess
import sys
import time

parser = argparse.ArgumentParser()
parser.add_argument('--adb', required=True, type=Path)
parser.add_argument('--serial', required=True)
parser.add_argument('--output', required=True, type=Path)
parser.add_argument('--seconds', type=int, default=300)
parser.add_argument('--interval', type=int, default=10)
parser.add_argument('--trace-seconds', type=int, default=90)
parser.add_argument('--keep-adb', action='store_true')
parser.add_argument('--detailed-memory', action='store_true', help='Request app heap/object details; may trigger explicit GC and affect frame timing')
args = parser.parse_args()
if not 10 <= args.seconds <= 1800:
    parser.error('--seconds must be between 10 and 1800')
if not 5 <= args.interval <= 60:
    parser.error('--interval must be between 5 and 60')
if not 0 <= args.trace_seconds <= args.seconds:
    parser.error('--trace-seconds must be between 0 and --seconds')
out = args.output.resolve()
if out.exists() and (not out.is_dir() or any(out.iterdir())):
    parser.error('--output must be a new or empty directory; existing capture evidence will not be overwritten')
out.mkdir(parents=True, exist_ok=True)
prefix = [str(args.adb.resolve()), '-s', args.serial]
package = 'com.valvesoftware.steamlinkvr'
flags = getattr(subprocess, 'CREATE_NO_WINDOW', 0)
run_id = dt.datetime.now(dt.timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')
remote_trace = f'/data/misc/perfetto-traces/gxr-hitches-{run_id}.pftrace'
commands = []
memory_options = [] if args.detailed_memory else ['--local']

def adb(*command, timeout=20):
    started = time.time()
    try:
        result = subprocess.run(prefix + list(command), capture_output=True, timeout=timeout, creationflags=flags)
        text = result.stdout.decode('utf-8', 'replace')
        error = result.stderr.decode('utf-8', 'replace')
        code = result.returncode
    except (subprocess.TimeoutExpired, OSError) as exc:
        text, error, code = '', f'{type(exc).__name__}: {exc}', -1
    commands.append({'host_epoch': started, 'elapsed_s': time.time()-started,
                     'command': list(command), 'exit': code, 'stderr': error})
    return text

def save(name, *command):
    text = adb(*command)
    (out / name).write_text(text, encoding='utf-8')
    return text


def read_pid():
    text = adb('shell', 'pidof', package).strip()
    tokens = text.split()
    valid = commands[-1]['exit'] == 0 and len(tokens) == 1 and tokens[0].isdigit() and int(tokens[0]) > 0
    return tokens[0] if valid else None, text


trace_pulled = False
trace_verified_size = None
trace_pull_attempts = []
capture_status = 'incomplete'
pid_changed = False


def pull_trace():
    """Publish only a successful, stable, size-verified transfer; retain failures."""
    global trace_pulled, trace_verified_size
    partial = out / f'stream.pftrace.pull-{len(trace_pull_attempts) + 1}.partial'
    final = out / 'stream.pftrace'
    attempt = {'host_epoch': time.time(), 'partial_file': partial.name, 'verified': False}
    trace_pull_attempts.append(attempt)
    try:
        if final.exists() or partial.exists():
            raise RuntimeError('Refusing to overwrite an existing trace download')
        size_before = adb('shell', 'stat', '-c', '%s', remote_trace).strip()
        if commands[-1]['exit'] != 0 or not size_before.isdigit() or int(size_before) <= 0:
            raise RuntimeError('Could not obtain a positive remote trace size')
        attempt['remote_size_before'] = int(size_before)
        adb('pull', remote_trace, str(partial), timeout=60)
        if commands[-1]['exit'] != 0:
            raise RuntimeError('ADB pull failed or timed out; remote trace retained')
        size_after = adb('shell', 'stat', '-c', '%s', remote_trace).strip()
        if commands[-1]['exit'] != 0 or not size_after.isdigit():
            raise RuntimeError('Could not verify remote trace size after download')
        attempt['remote_size_after'] = int(size_after)
        attempt['local_size'] = partial.stat().st_size if partial.is_file() else None
        if not (attempt['remote_size_before'] == attempt['remote_size_after'] == attempt['local_size']):
            raise RuntimeError('Trace size mismatch or remote trace still changing; remote trace retained')
        partial.rename(final)
        trace_verified_size = attempt['local_size']
        trace_pulled = True
        attempt['verified'] = True
        return True
    except Exception as exc:
        attempt['error'] = f'{type(exc).__name__}: {exc}'
        print(f'Trace download failed: {attempt["error"]}', file=sys.stderr, flush=True)
        return False
    finally:
        (out / 'trace-download.json').write_text(json.dumps(trace_pull_attempts, indent=2), encoding='utf-8')


def record_pid_change(expected, observed, stage, partial_snapshot=None):
    global pid_changed, capture_status
    pid_changed = True
    capture_status = 'stopped_process_changed_or_unavailable'
    evidence = {'host_epoch': time.time(), 'expected_pid': expected,
                'observed_pidof': observed, 'stage': stage,
                'action': 'Stopped capture; no different process is combined with the original process'}
    if partial_snapshot is not None:
        evidence['discarded_partial_sample'] = partial_snapshot
    (out / 'pid-change.json').write_text(json.dumps(evidence, indent=2), encoding='utf-8')
    print(f'Capture stopped: expected PID {expected}, observed {observed!r} ({stage})', file=sys.stderr, flush=True)


log_process = None
log_handle = None
trace_process = None
trace_handle = None
started = time.time()
try:
    app_pid, initial_pid_text = read_pid()
    if app_pid is None:
        raise RuntimeError(f'Expected 1 running Steam Link PID; pidof returned {initial_pid_text!r}')
    (out / 'capture.json').write_text(json.dumps({'run_id':run_id, 'host_start_epoch':started,
        'serial':args.serial, 'package':package, 'initial_pid':int(app_pid),
        'seconds':args.seconds,'sample_interval_s':args.interval,'perfetto_seconds':args.trace_seconds,
        'mode':'passive; no app restart/settings changes',
        'memory_mode':'app RPC; can trigger GC' if args.detailed_memory else '--local; no app RPC'}, indent=2), encoding='utf-8')
    save('clocks-start.txt','shell','date +%s.%N; cat /proc/uptime')
    save('meminfo-before.txt','shell','dumpsys','meminfo',*memory_options,app_pid)
    log_handle = (out / 'logcat-live.txt').open('wb')
    log_process = subprocess.Popen(prefix+['logcat','-v','epoch','-T','1'], stdout=log_handle,
                                   stderr=subprocess.STDOUT, creationflags=flags)
    if args.trace_seconds:
        config = f'''buffers {{ size_kb: 131072 fill_policy: RING_BUFFER }}
duration_ms: {args.trace_seconds * 1000}
flush_period_ms: 5000
write_into_file: true
file_write_period_ms: 5000
data_sources {{ config {{ name: "linux.ftrace" ftrace_config {{
  ftrace_events: "sched/sched_switch"
  ftrace_events: "sched/sched_waking"
  ftrace_events: "power/cpu_frequency"
  ftrace_events: "power/cpu_idle"
  atrace_categories: "gfx"
  atrace_categories: "video"
  atrace_categories: "hal"
  atrace_categories: "binder_driver"
  atrace_categories: "dalvik"
  atrace_categories: "thermal"
  atrace_apps: "{package}"
  buffer_size_kb: 2048
  drain_period_ms: 250
}} }} }}
data_sources {{ config {{ name: "linux.process_stats" process_stats_config {{
  proc_stats_poll_ms: 1000 scan_all_processes_on_start: true
}} }} }}
data_sources {{ config {{ name: "linux.sys_stats" sys_stats_config {{
  stat_period_ms: 1000 meminfo_period_ms: 1000 cpufreq_period_ms: 1000
}} }} }}
data_sources {{ config {{ name: "android.surfaceflinger.frametimeline" }} }}
data_sources {{ config {{ name: "android.gpu.memory" }} }}
data_sources {{ config {{ name: "android.log" }} }}
data_sources {{ config {{ name: "track_event" track_event_config {{
  disabled_categories: "*" enabled_categories: "cpm" enabled_categories: "xrp"
}} }} }}
'''
        config_file = out / 'capture.pbtxt'
        config_file.write_text(config, encoding='utf-8')
        trace_handle = (out / 'perfetto-command.txt').open('wb')
        trace_process = subprocess.Popen(prefix+['shell','perfetto','--txt','-c','-','-o',remote_trace],
            stdin=subprocess.PIPE, stdout=trace_handle, stderr=subprocess.STDOUT, creationflags=flags)
        trace_process.stdin.write(config.encode('utf-8'))
        trace_process.stdin.close()
    sample_index = 0
    with (out / 'samples.jsonl').open('w',encoding='utf-8') as samples:
        while time.time()-started <= args.seconds:
            begin = time.time()
            current_pid, observed_pid = read_pid()
            if current_pid != app_pid:
                record_pid_change(app_pid, observed_pid, 'before sample')
                break
            snapshot = {'host_epoch':begin, 'elapsed_s':begin-started, 'pid':current_pid}
            snapshot['meminfo'] = adb('shell','dumpsys','meminfo',*memory_options,current_pid)
            snapshot['system'] = adb('shell',f'date +%s.%N; cat /proc/uptime; cat /proc/{current_pid}/status; '
                'cat /proc/pressure/memory; cat /proc/pressure/cpu; cat /proc/pressure/io; '
                'cat /proc/meminfo; cat /proc/net/dev; cat /proc/net/snmp; '
                'for f in /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq /sys/class/kgsl/kgsl-3d0/gpuclk /sys/class/kgsl/kgsl-3d0/max_gpuclk; do echo "$f"; cat "$f"; done')
            if sample_index % 3 == 0:
                snapshot['thermal'] = adb('shell','dumpsys','thermalservice')
                snapshot['surfaceflinger_meminfo'] = adb('shell','dumpsys','meminfo','--local','surfaceflinger')
            confirmed_pid, observed_pid = read_pid()
            if confirmed_pid != current_pid:
                record_pid_change(app_pid, observed_pid, 'during sample', snapshot)
                break
            snapshot['capture_cost_s'] = time.time()-begin
            samples.write(json.dumps(snapshot)+'\n'); samples.flush()
            sample_index += 1
            print(f'Sample {sample_index}: elapsed={snapshot["elapsed_s"]:.1f}s pid={current_pid} cost={snapshot["capture_cost_s"]:.2f}s',flush=True)
            if trace_process and trace_process.poll() == 0 and not trace_pull_attempts:
                pull_trace()
            remaining = started+sample_index*args.interval-time.time()
            if remaining>0: time.sleep(min(remaining,max(0,started+args.seconds-time.time())))
            if time.time() >= started+args.seconds: break
    save('clocks-end.txt','shell','date +%s.%N; cat /proc/uptime')
    if not pid_changed:
        final_pid, observed_pid = read_pid()
        if final_pid == app_pid:
            save('meminfo-after.txt','shell','dumpsys','meminfo',*memory_options,app_pid)
        else:
            record_pid_change(app_pid, observed_pid, 'before final meminfo')
    save('thermal-after.txt','shell','dumpsys','thermalservice')
    if trace_process and not pid_changed:
        trace_exit = trace_process.wait(timeout=15)
        if trace_exit != 0:
            raise RuntimeError(f'Perfetto command exited {trace_exit}; remote trace retained')
        if not trace_pulled and not pull_trace():
            raise RuntimeError('Trace download could not be verified; remote trace retained')
    if not pid_changed:
        capture_status = 'complete'
finally:
    active_error = sys.exc_info()[1]
    cleanup_errors = []
    remote_removed = False

    def cleanup_step(label, action):
        try:
            return action()
        except Exception as exc:
            message = f'{label}: {type(exc).__name__}: {exc}'
            cleanup_errors.append(message)
            print(f'Cleanup failed: {message}', file=sys.stderr, flush=True)

    def stop_process(process):
        if process and process.poll() is None:
            # Disconnect this recorder only; the remote trace has a bounded duration.
            process.terminate()
            try:
                process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait(timeout=5)

    def remove_verified_remote():
        global remote_removed
        final = out / 'stream.pftrace'
        if trace_pulled:
            if not final.is_file() or final.stat().st_size != trace_verified_size:
                raise RuntimeError('Verified local trace changed or disappeared; remote trace retained')
            adb('shell', 'rm', '-f', remote_trace)
            if commands[-1]['exit'] != 0:
                raise RuntimeError('Could not remove verified remote trace')
            remote_removed = True

    try:
        cleanup_step('stop logcat', lambda: stop_process(log_process))
        cleanup_step('stop Perfetto', lambda: stop_process(trace_process))
        for label, handle in (('close logcat output', log_handle), ('close Perfetto output', trace_handle)):
            if handle:
                cleanup_step(label, handle.close)
        cleanup_step('remote trace cleanup', remove_verified_remote)
    finally:
        try:
            cleanup_step('write command evidence', lambda: (out / 'commands.json').write_text(json.dumps(commands, indent=2), encoding='utf-8'))
        finally:
            # A recorder timeout, failed remote delete, or evidence-write failure
            # must never bypass the separately bounded ADB shutdown attempt.
            try:
                if not args.keep_adb:
                    def kill_adb():
                        result = subprocess.run([str(args.adb.resolve()), 'kill-server'], capture_output=True,
                                                timeout=10, creationflags=flags)
                        cleanup_step('write ADB cleanup evidence', lambda: (out / 'adb-cleanup.txt').write_text(
                            f'kill-server exit={result.returncode}\n' + result.stderr.decode('utf-8', 'replace'), encoding='utf-8'))
                        if result.returncode != 0:
                            raise RuntimeError(f'adb kill-server exited {result.returncode}')
                    cleanup_step('ADB kill-server', kill_adb)
            finally:
                status = {'status': capture_status, 'capture_error': str(active_error) if active_error else None,
                          'cleanup_errors': cleanup_errors, 'trace_download_verified': trace_pulled,
                          'remote_trace_removed': remote_removed,
                          'remote_trace_retained': remote_trace if trace_process and not remote_removed else None,
                          'adb_shutdown_requested': not args.keep_adb}
                cleanup_step('write final capture status', lambda: (out / 'capture-status.json').write_text(
                    json.dumps(status, indent=2), encoding='utf-8'))
                print(f'Capture {capture_status}: {out}; cleanup failures={len(cleanup_errors)}', flush=True)
    if cleanup_errors and active_error is None:
        raise RuntimeError('Capture cleanup had failures; see capture-status.json and stderr')
