"""Offline GLSL checks. Production source retains Valve's ES300 uniform-location dialect.

Both stages are promoted to 310 ONLY in diagnostic copies for the strict compiler.
This is syntax/interface evidence, never Galaxy XR driver or live-shader proof.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--glslang', type=Path, required=True)
    parser.add_argument('--rewriter', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    args.output.mkdir(parents=True, exist_ok=True)
    report = {'boundary': __doc__.strip(), 'cases': []}

    def compile_case(label, *files):
        command = [str(args.glslang), '-l', *map(str, files)]
        result = subprocess.run(command, capture_output=True, text=True)
        row = {'case': label, 'exit_code': result.returncode,
               'output': result.stdout + result.stderr,
               'source_sha256': [hashlib.sha256(p.read_bytes()).hexdigest() for p in files]}
        report['cases'].append(row)
        return result.returncode

    for base in json.loads((Path(__file__).parent / 'native-layouts.json').read_text())['bases']:
        binary = (root / base['file']).read_bytes()
        assert hashlib.sha256(binary).hexdigest() == base['sha256']
        prefix = int(base['stock_prefix']['file_offset'], 16)
        suffix = int(base['suffixes']['fovea']['file_offset'], 16)
        stock = args.output / (base['version_code'] + '-stock.frag')
        stock.write_bytes(binary[prefix:prefix+1087] + binary[suffix:suffix+296])
        modified = args.output / (base['version_code'] + '-blue.frag')
        subprocess.run([str(args.rewriter), str(stock), str(modified)], check=True)
        # Record the inherited strict ES300 failure for both original and generated source.
        compile_case(base['version_code'] + '-production-stock', stock)
        compile_case(base['version_code'] + '-production-blue', modified)
        candidates = []
        start = 0
        while (start := binary.find(b'#version 300 es', start)) >= 0:
            text = binary[start:binary.index(b'\0', start)]
            if b'out vec2 uvmask;' in text and b'gl_VertexID' in text:
                candidates.append(text.decode('ascii'))
            start += 1
        assert len(candidates) == 1
        vertex = args.output / (base['version_code'] + '-diagnostic310.vert')
        fragment = args.output / (base['version_code'] + '-diagnostic310.frag')
        vertex.write_text(candidates[0].replace('#version 300 es', '#version 310 es', 1))
        fragment.write_text(modified.read_text().replace('#version 300 es', '#version 310 es', 1))
        assert compile_case(base['version_code'] + '-diagnostic310-link', vertex, fragment) == 0

    # Extract exactly the production wrapper arithmetic, giving it a core ES300 interface.
    text = modified.read_text()
    wrapper = text[text.index('layout(location=14) uniform highp sampler2D SL_blueNoise;'):]
    wrapper = wrapper.replace('layout(location=14) ', '').replace('layout(location=15) ', '')
    isolated = args.output / 'isolated-quantizer300.frag'
    isolated.write_text('#version 300 es\nprecision highp float;\nout vec4 color;\n'
                        'void SL_originalMain(){color=vec4(.5,.5,.5,1.);}\n' + wrapper)
    assert compile_case('isolated-core300-quantizer', isolated) == 0
    report['glslang_version'] = subprocess.check_output([str(args.glslang), '--version'], text=True)
    (args.output / 'syntax-report.json').write_text(json.dumps(report, indent=2) + '\n')
    print('PASS: 3 diagnostic ES310 stage pairs and isolated ES300 quantizer. '
          'Production ES300 dialect failures recorded separately; no driver execution.')


if __name__ == '__main__':
    main()
