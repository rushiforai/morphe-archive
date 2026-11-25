#!/usr/bin/env python3
"""Bounded Frida observation of Gboard on the explicitly owned Parakeet emulator only.

Attaches the call-through agent to every Gboard process (spawn gating catches restarts),
optionally arms the labelled microphone stimulus from a 16 kHz mono 16-bit WAV, writes
events.jsonl and metadata.json, and always unloads, detaches and resumes on exit. A detach
or a missing hook is recorded as a coverage failure; the run is then incomplete.
"""
import argparse
import hashlib
import json
import queue
import signal
import subprocess
import time
import wave
from pathlib import Path

import frida

SERIAL = 'emulator-5600'
AVD = 'gboard_parakeet_api34'
PACKAGES = ('app.morphe.android.inputmethod.latin', 'com.google.android.inputmethod.latin')
FORWARD = ('tcp:28111', 'tcp:27042')

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb', type=Path, required=True)
p.add_argument('--agent', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--stop-file', type=Path, required=True)
p.add_argument('--stimulus', type=Path, help='16 kHz mono 16-bit WAV fed to the Parakeet microphone thread')
p.add_argument('--arm-file', type=Path, help='arm the stimulus only once this file exists')
p.add_argument('--seconds', type=int, default=600)
p.add_argument('--package', choices=PACKAGES, default=PACKAGES[0], help='patched Gboard package to observe')
a = p.parse_args()
if not 30 <= a.seconds <= 900:
    raise SystemExit('--seconds must be between 30 and 900')


def adb(*args):
    return subprocess.run([str(a.adb), '-s', SERIAL, *map(str, args)], check=True, capture_output=True,
                          text=True, timeout=15).stdout.strip()


if adb('emu', 'avd', 'name').splitlines()[0] != AVD or adb('shell', 'id', '-u') != '0':
    raise SystemExit('Wrong owned tracing target')
if not any(row.split() == [SERIAL, *FORWARD] for row in adb('forward', '--list').splitlines()):
    raise SystemExit('Expected owned loopback forward is absent')

samples = None
if a.stimulus:
    with wave.open(str(a.stimulus)) as w:
        if (w.getframerate(), w.getnchannels(), w.getsampwidth()) != (16000, 1, 2):
            raise SystemExit('Stimulus must be 16 kHz mono 16-bit')
        raw = w.readframes(w.getnframes())
    samples = [int.from_bytes(raw[i:i + 2], 'little', signed=True) for i in range(0, len(raw), 2)]

a.output.mkdir(parents=True, exist_ok=True)
source = a.agent.read_text()
metadata = {
    'frida_version': frida.__version__,
    'agent_sha256': hashlib.sha256(source.encode()).hexdigest(),
    'stimulus_sha256': hashlib.sha256(a.stimulus.read_bytes()).hexdigest() if a.stimulus else None,
    'target': a.package, 'attachments': [], 'cleanup_errors': [],
}
events = queue.Queue()
sessions, scripts, gated = {}, {}, set()
stopping = False
lost = False
armed = False
log = (a.output / 'events.jsonl').open('w')


def write(event):
    event['host_unix_ms'] = time.time_ns() // 1_000_000
    log.write(json.dumps(event, default=str) + '\n')
    log.flush()


def stop(*_):
    global stopping
    stopping = True


signal.signal(signal.SIGTERM, stop)
signal.signal(signal.SIGINT, stop)


def fail(reason):
    global lost
    if not lost:
        lost = True
        metadata['coverage_failure'] = reason
        write({'event': 'coverage-failed', 'reason': reason})


def ours(name):
    return name == a.package


device = frida.get_device_manager().add_remote_device('127.0.0.1:' + FORWARD[0].split(':')[1])


def attach(pid, name):
    if pid in sessions:
        return
    session = device.attach(pid)
    sessions[pid] = session
    session.on('detached', lambda reason, crash: events.put(('detach', pid, name, reason, crash)))
    script = session.create_script(source, name='parakeet-agent')
    script.on('message', lambda message, data: events.put(('message', pid, name, message)))
    script.load()
    scripts[pid] = script
    metadata['attachments'].append({'pid': pid, 'process': name})
    write({'event': 'attached', 'pid': pid, 'process': name})


try:
    device.on('spawn-added', lambda spawn: events.put(('spawn', spawn.pid, spawn.identifier)))
    device.enable_spawn_gating()
    # Frida names running Android apps by their label, so find existing Gboard processes by pid.
    for pid in adb('shell', 'pidof', a.package).split():
        attach(int(pid), a.package)
    (a.output / 'observer-ready').write_text('observation active\n')
    deadline = time.monotonic() + a.seconds
    while not stopping and not a.stop_file.exists() and time.monotonic() < deadline:
        if samples is not None and not armed and scripts and (a.arm_file is None or a.arm_file.exists()):
            for pid, script in list(scripts.items()):
                script.exports_sync.stimulus(samples)
                write({'event': 'stimulus-sent', 'pid': pid, 'samples': len(samples)})
            armed = True
        try:
            kind, pid, name, *body = events.get(timeout=0.1)
        except queue.Empty:
            continue
        if kind == 'spawn':
            gated.add(pid)
            try:
                if ours(name):
                    attach(pid, name)
                    armed = False
            finally:
                device.resume(pid)
                gated.discard(pid)
        elif kind == 'message':
            message = body[0]
            if message.get('type') == 'send':
                payload = message['payload']
                write(dict(payload, pid=pid))
                if payload.get('event') == 'hook-failed':
                    fail('hook failed: ' + payload.get('target', '?'))
            else:
                write({'event': 'script-error', 'pid': pid, 'detail': message.get('description')})
                fail('script error')
        elif kind == 'detach':
            reason, crash = body
            write({'event': 'detached', 'pid': pid, 'reason': str(reason), 'crash': str(crash) if crash else None})
            sessions.pop(pid, None)
            scripts.pop(pid, None)
            if not stopping:
                fail('detached: ' + str(reason))
finally:
    for pid, script in list(scripts.items()):
        try:
            script.unload()
        except Exception as e:  # noqa: BLE001 - every cleanup failure is recorded
            metadata['cleanup_errors'].append(f'unload {pid}: {e}')
    for pid, session in list(sessions.items()):
        try:
            session.detach()
        except Exception as e:  # noqa: BLE001
            metadata['cleanup_errors'].append(f'detach {pid}: {e}')
    try:
        device.disable_spawn_gating()
    except Exception as e:  # noqa: BLE001
        metadata['cleanup_errors'].append(f'spawn gating: {e}')
    for pid in list(gated):
        try:
            device.resume(pid)
        except Exception as e:  # noqa: BLE001
            metadata['cleanup_errors'].append(f'resume {pid}: {e}')
    metadata['complete_coverage'] = not lost and bool(metadata['attachments'])
    (a.output / 'metadata.json').write_text(json.dumps(metadata, indent=2))
    log.close()
