"""Offline GLSL syntax/interface checks for both independently selected video layers.

Production keeps Valve's ES300 uniform-location dialect. Strict ES300 results for
stock and rewritten sources are reported separately; only diagnostic copies of BOTH
stages use ES310. This is not Android driver execution, APK, headset, or panel proof.
The 5001712 decoded input is an analysis reconstruction.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def pinned_slice(binary, region):
    start = int(region['file_offset'], 16)
    data = binary[start:start + region['size']]
    if len(data) != region['size'] or sha256(data) != region['sha256']:
        raise ValueError(f"Source region does not match its pin at {start:#x}")
    return data


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--glslang', type=Path, required=True)
    parser.add_argument('--rewriter', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument('--layouts', type=Path,
                        help='Layout JSON; default is the original blue-noise native-layouts.json')
    args = parser.parse_args()
    root = args.root.resolve()
    layouts = args.layouts or root / 'diagnostics/steamlink-blue-noise-ditering/native-layouts.json'
    layout_bytes = layouts.read_bytes()
    metadata = json.loads(layout_bytes)
    expected_bases = {('2.0.20', '5001712'), ('2.0.22', '5002244'), ('2.0.23', '5002363')}
    bases = metadata['bases']
    if len(bases) != 3 or {(b['version_name'], b['version_code']) for b in bases} != expected_bases:
        raise ValueError('Expected the three exact verified Steam Link bases')
    args.output.mkdir(parents=True, exist_ok=True)
    report = {
        'boundary': __doc__.strip(), 'input_scope': metadata['scope'],
        'layout_sha256': sha256(layout_bytes),
        'rewriter_sha256': sha256(args.rewriter.read_bytes()),
        'cases': [],
    }
    diagnostic_results = []
    wrappers = set()

    def compile_case(label, kind, *files):
        result = subprocess.run([str(args.glslang), '-l', *map(str, files)],
                                capture_output=True, text=True)
        report['cases'].append({
            'case': label, 'kind': kind, 'exit_code': result.returncode,
            'output': result.stdout + result.stderr,
            'source_sha256': [sha256(p.read_bytes()) for p in files],
        })
        return result.returncode

    for base in bases:
        binary = (root / base['file']).read_bytes()
        if len(binary) != base['file_size'] or sha256(binary) != base['sha256']:
            raise ValueError(f"Decoded input does not match its pin: {base['file']}")
        prefix = pinned_slice(binary, base['stock_prefix'])
        if len(prefix) != 1087:
            raise ValueError('Unexpected shared shader prefix size')
        # Both programs use this stock video vertex interface. Keep original source
        # untouched and promote only the diagnostic copy together with its fragment.
        candidates = []
        start = 0
        while (start := binary.find(b'#version 300 es', start)) >= 0:
            source = binary[start:binary.index(b'\0', start)]
            if b'out vec2 uvmask;' in source and b'gl_VertexID' in source:
                candidates.append(source.decode('ascii'))
            start += 1
        if len(candidates) != 1:
            raise ValueError(f"Expected one video vertex shader for {base['version_code']}")
        vertex = args.output / f"{base['version_code']}-diagnostic310.vert"
        vertex.write_text(candidates[0].replace('#version 300 es', '#version 310 es', 1), encoding='ascii')

        for layer, suffix_key, size in [('fovea', 'fovea', 296), ('background', 'base', 29)]:
            label = f"{base['version_code']}-{layer}"
            suffix = pinned_slice(binary, base['suffixes'][suffix_key])
            if len(suffix) != size:
                raise ValueError(f'Unexpected suffix size for {label}')
            stock = args.output / f'{label}-stock.frag'
            stock.write_bytes(prefix + suffix)
            modified = args.output / f'{label}-blue.frag'
            command = [str(args.rewriter), str(stock), str(modified)]
            if layer == 'background':
                command.append('background')
            subprocess.run(command, check=True)
            # Record inherited strict-dialect failures, never count them as passes.
            compile_case(label + '-production-stock', 'strict-production-es300', stock)
            compile_case(label + '-production-blue', 'strict-production-es300', modified)
            text = modified.read_text(encoding='ascii')
            fragment = args.output / f'{label}-diagnostic310.frag'
            fragment.write_text(text.replace('#version 300 es', '#version 310 es', 1), encoding='ascii')
            diagnostic_results.append(compile_case(label + '-diagnostic310-link',
                                                  'diagnostic-es310', vertex, fragment))
            wrappers.add(text[text.index('layout(location=14) uniform highp sampler2D SL_blueNoise;'):])

    # The same production wrapper must serve all six sources. Compile its arithmetic
    # once against a core ES300 interface, without Valve's uniform-location dialect.
    if len(wrappers) != 1:
        raise ValueError('The layer rewrites did not preserve one common quantizer')
    wrapper = wrappers.pop().replace('layout(location=14) ', '').replace('layout(location=15) ', '')
    isolated = args.output / 'isolated-quantizer300.frag'
    isolated.write_text('#version 300 es\nprecision highp float;\nout vec4 color;\n'
                        'void SL_originalMain(){color=vec4(.5,.5,.5,1.);}\n' + wrapper, encoding='ascii')
    diagnostic_results.append(compile_case('isolated-core300-quantizer', 'isolated-es300', isolated))
    report['glslang_version'] = subprocess.check_output([str(args.glslang), '--version'], text=True)
    report['diagnostic_checks_passed'] = all(code == 0 for code in diagnostic_results)
    (args.output / 'syntax-report.json').write_text(json.dumps(report, indent=2) + '\n', encoding='utf-8')
    if not report['diagnostic_checks_passed']:
        raise SystemExit('FAIL: see syntax-report.json for diagnostic shader failures')
    print('PASS: 6 diagnostic ES310 stage pairs and one shared isolated ES300 quantizer. '
          'Strict production ES300 results recorded separately; no driver execution.')


if __name__ == '__main__':
    main()
