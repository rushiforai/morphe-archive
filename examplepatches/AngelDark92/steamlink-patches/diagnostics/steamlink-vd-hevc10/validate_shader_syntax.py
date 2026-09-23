"""Check assembled production shaders without altering the APK shader dialect.

Strict ES300 rejects Valve's inherited standalone-uniform locations. Record that
failure, then promote BOTH stages only in diagnostic copies to test syntax/linking.
This is not Android driver, live shader, decoder, or visible banding validation.
"""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

root = Path(__file__).resolve().parents[2]
assembled = root / 'build/vd-sdr-glsl'
output = root / 'build/vd-sdr-glsl-check'
output.mkdir(parents=True, exist_ok=True)
compiler = root / 'build/tooling/bin/glslang.exe'
report = {'boundary': __doc__.strip(), 'cases': []}
bases = [('2.0.20', '5001712'), ('2.0.22', '5002244'), ('2.0.23', '5002363')]

for version, code in bases:
    binary = (root / f'decoded-apk-android-steamlinkvr-release-base-{version}-{code}' /
              'lib/arm64-v8a/libvrlink_scene.so').read_bytes()
    candidates = []
    start = 0
    while (start := binary.find(b'#version 300 es', start)) >= 0:
        source = binary[start:binary.index(b'\0', start)]
        if b'out vec2 uvmask;' in source and b'gl_VertexID' in source:
            candidates.append(source.decode('ascii'))
        start += 1
    assert len(candidates) == 1
    vertex = output / f'{code}-diagnostic310.vert'
    vertex.write_text(candidates[0].replace('#version 300 es', '#version 310 es', 1), encoding='ascii')
    baseline = (assembled / f'{code}-neutral-off.opaque.glsl').read_bytes()
    for depth in ['8bit', '10bit']:
        assert (assembled / f'{code}-neutral-fovea-input-{depth}.opaque.glsl').read_bytes() == baseline
    assert (assembled / f'{code}-neutral-fovea-input-8bit.masked.glsl').read_bytes() == (
        assembled / f'{code}-neutral-fovea-input-10bit.masked.glsl').read_bytes()
    for label in ['off.opaque', 'off.masked', 'fovea-input-8bit.masked', 'fovea-input-10bit.masked']:
        source = (assembled / f'{code}-neutral-{label}.glsl').read_text(encoding='ascii')
        fragment = output / f'{code}-{label}.frag'
        fragment.write_text(source, encoding='ascii')
        strict = subprocess.run([str(compiler), '-S', 'frag', str(fragment)], capture_output=True, text=True)
        diagnostic = output / f'{code}-{label}-diagnostic310.frag'
        diagnostic.write_text(source.replace('#version 300 es', '#version 310 es', 1), encoding='ascii')
        linked = subprocess.run([str(compiler), '-l', str(vertex), str(diagnostic)], capture_output=True, text=True)
        report['cases'].append({'base': f'{version}/{code}', 'variant': label,
            'production_source_sha256': hashlib.sha256(fragment.read_bytes()).hexdigest(),
            'strict_es300_exit': strict.returncode, 'strict_es300_output': strict.stdout + strict.stderr,
            'diagnostic_es310_exit': linked.returncode, 'diagnostic_es310_output': linked.stdout + linked.stderr})
        if linked.returncode:
            print(linked.stdout + linked.stderr)
            sys.exit(linked.returncode)

report['glslang_version'] = subprocess.check_output([str(compiler), '--version'], text=True)
(root / 'diagnostics/steamlink-vd-hevc10/shader-syntax-validation.json').write_text(
    json.dumps(report, indent=2) + '\n', encoding='utf8')
print('PASS: 12 diagnostic stage pairs; opaque byte equality and identical 8-/10-bit sources. '
      'Inherited strict ES300 failures recorded; production driver acceptance untested.')
