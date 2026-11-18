"""Capture original-signed Coffee initialization in an explicitly muted test AVD.

Requires local frida, pyelftools, tools/frida-agent (esbuild/Java bridge), and
tools/frida-server on the disposable emulator. Never clears data or installs.
Inventory comes from InspectCoffeeUpdate; all evidence remains private.
"""
import argparse
import json
from pathlib import Path
import subprocess
import threading
import frida
from elftools.elf.elffile import ELFFile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--evidence', required=True, type=Path)
    parser.add_argument('--inputs', required=True, type=Path)
    parser.add_argument('--inventory', required=True, type=Path)
    parser.add_argument('--label', required=True)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--avd', required=True)
    args = parser.parse_args()
    if not args.label.replace('-', '').replace('_', '').isalnum():
        raise ValueError('Label must be a simple filename')
    repo = Path(__file__).resolve().parent.parent
    subprocess.run(['pwsh', '-NoProfile', '-File', str(repo / 'scripts/Start-CoffeeMutedEmulator.ps1'),
                    '-VerifyOnly', '-Avd', args.avd, '-Port', args.serial.removeprefix('emulator-')], check=True)
    libraries, holders = {}, {}
    for name in ('libunity.so', 'libil2cpp.so'):
        args.evidence.mkdir(parents=True, exist_ok=True)
        original = (args.inputs / name).read_bytes()
        evidence_input = args.evidence / name
        if evidence_input.exists() and evidence_input.read_bytes() != original:
            raise ValueError('Evidence directory belongs to another library build')
        evidence_input.write_bytes(original)
        with (args.inputs / name).open('rb') as stream:
            libraries[name] = [[s['p_vaddr'], s['p_filesz']] for s in ELFFile(stream).iter_segments() if s['p_type'] == 'PT_LOAD']
    for row in args.inventory.read_text().splitlines():
        if row.startswith('FIELD ') and row.endswith('Ljava/lang/String;'):
            _, owner, field, _ = row.split()
            holders.setdefault(owner[1:-1].replace('/', '.'), []).append(field)
    if not holders:
        raise ValueError('No constant-holder inventory')
    args.evidence.mkdir(parents=True, exist_ok=True)
    source = (repo / 'scripts/coffee_capture_agent.js').read_text().replace('__LIBRARIES__', json.dumps(libraries)).replace('__HOLDERS__', json.dumps(holders))
    agent_source = repo / 'tools/frida-agent/coffee-update-generated.js'
    agent_source.write_text(source)
    agent = args.evidence / 'capture-agent.js'
    subprocess.run([str(repo / 'tools/frida-agent/node_modules/.bin/esbuild.cmd'), str(agent_source),
                    '--bundle', '--platform=neutral', '--outfile=' + str(agent.resolve())], check=True)
    complete = threading.Event()
    received, errors = set(), []
    device = frida.get_device(args.serial, timeout=10)
    pid = device.spawn(['com.tapblaze.coffeebusiness'])
    session = device.attach(pid)
    script = session.create_script(agent.read_text())
    with (args.evidence / (args.label + '-trace.jsonl')).open('w') as log:
        def receive(message, data):
            log.write(json.dumps(message) + '\n')
            log.flush()
            payload = message.get('payload', {})
            if message['type'] == 'error':
                errors.append(message)
                complete.set()
            if data:
                name = (f"{payload['name']}-{payload['phase']}-{payload['index']}.bin"
                        if payload['kind'] == 'native' else f"dex-{payload['address']}.dex")
                (args.evidence / (args.label + '-' + name)).write_bytes(data)
            if payload.get('kind') == 'values':
                (args.evidence / (args.label + '-values.json')).write_text(json.dumps(payload['values'], indent=2))
            if payload.get('kind') == 'maps':
                received.add(payload['name'])
                if received == set(libraries):
                    complete.set()
        script.on('message', receive)
        script.load()
        device.resume(pid)
        try:
            if not complete.wait(120):
                raise TimeoutError('Both complete library captures were not received')
            if errors:
                raise RuntimeError(errors)
        finally:
            session.detach()
    print('Captured both libraries: ' + args.label)


if __name__ == '__main__':
    main()
