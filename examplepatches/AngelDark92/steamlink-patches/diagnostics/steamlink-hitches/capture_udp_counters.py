"""Bounded read-only Android socket/UDP sampling; shares an already authorized ADB session.

Reads counters, never packet payloads. Does not change receive buffers or stop ADB;
the owning live capture must stop its ADB server after all collectors finish.
"""
import argparse
import json
from pathlib import Path
import subprocess
import time

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb', type=Path, required=True)
p.add_argument('--serial', required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--samples', type=int, default=400)
a = p.parse_args()
if not 10 <= a.samples <= 1200:
    p.error('--samples must be 10..1200 (100 ms sleep plus read overhead)')
if a.output.exists() and (not a.output.is_dir() or any(a.output.iterdir())):
    p.error('--output must be new or empty')
a.output.mkdir(parents=True, exist_ok=True)
command = ('n=0; while [ "$n" -lt ' + str(a.samples) + ' ]; do '
           'echo SAMPLE; date +%s.%N || exit 1; '
           'cat /proc/net/udp /proc/net/udp6 /proc/net/snmp || exit 1; '
           'n=$((n+1)); sleep 0.1 || exit 1; done')
started = time.time()
timeout_s = 30 + a.samples
timed_out = False
with (a.output/'counters.txt').open('wb') as f:
    try:
        result = subprocess.run([str(a.adb.resolve()), '-s', a.serial, 'shell', command],
                                stdout=f, stderr=subprocess.STDOUT, timeout=timeout_s,
                                creationflags=getattr(subprocess, 'CREATE_NO_WINDOW', 0))
        exit_code = result.returncode
    except subprocess.TimeoutExpired:
        timed_out = True
        exit_code = 124
    except OSError as exc:
        f.write(str(exc).encode('utf-8', errors='replace'))
        exit_code = 1
(a.output/'result.json').write_text(json.dumps({'host_start_epoch':started,
    'host_end_epoch':time.time(), 'samples_requested':a.samples,
    'exit_code':exit_code, 'timed_out':timed_out, 'timeout_s':timeout_s,
    'device_command':command,
    'interpretation':'Per-socket drops and system UDP buffer errors are counters; use deltas and stable socket identity.'}, indent=2))
raise SystemExit(exit_code)
