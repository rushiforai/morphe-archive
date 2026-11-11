"""Generate golden vectors by executing the REAL scene bytes (host interpreter, not Bionic).

  python -B -I tools/gen_golden.py <stock-5002527-libvrlink_scene.so> <legacy-5002395-libvrlink_scene.so> <out.json>

* quad:   stock 5002527 routine at 0x10e71c (head matrix + eye pose + FOV -> XrCompositionLayerQuad).
* fovea:  legacy 5002395 FlipFrame range 0x10e650..0x10e7a8 (rect shorts + full FOV -> fovea FOV).
The output file is committed so tests run without any local decoded tree. math.tan/atan on doubles
rounded to float stand in for Bionic tanf/atanf (documented caveat; error well below 1e-6).
"""
import hashlib
import json
import math
import random
import struct
import sys
import os

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'tests'))
from a64emu import Cpu, load_shared_object, RET_MAGIC, f32  # noqa: E402

BASE = 0x10000000
TANF, ATANF = 0x20000000, 0x20000004


def new_cpu(path):
    data = open(path, 'rb').read()
    cpu = Cpu()
    exports, undefined = load_shared_object(cpu, data, BASE, {'tanf': TANF, 'atanf': ATANF})
    cpu.hooks[TANF] = lambda c: c.ws('s0', math.tan(c.rs('s0')))
    cpu.hooks[ATANF] = lambda c: c.ws('s0', math.atan(c.rs('s0')))
    return cpu, hashlib.sha256(data).hexdigest().upper()


def rot_from_axis_angle(ax, ang):
    n = math.sqrt(sum(a * a for a in ax))
    x, y, z = [a / n for a in ax]
    c, s = math.cos(ang), math.sin(ang)
    C = 1 - c
    return [[c + x * x * C, x * y * C - z * s, x * z * C + y * s],
            [y * x * C + z * s, c + y * y * C, y * z * C - x * s],
            [z * x * C - y * s, z * y * C + x * s, c + z * z * C]]


def gen_quad(path, rng, count):
    cpu, sha = new_cpu(path)
    M, E, F, Q = 0x40000000, 0x40001000, 0x40002000, 0x40003000
    for a in (M, E, F, Q):
        cpu.mem.map(a, 0x1000)
    cases, branch_seen = [], set()
    while len(cases) < count:
        ax = [rng.uniform(-1, 1) for _ in range(3)]
        if len(cases) % 4 == 1:
            ax = [1, 0.05, 0.02]
        elif len(cases) % 4 == 2:
            ax = [0.03, 1, 0.04]
        elif len(cases) % 4 == 3:
            ax = [0.02, 0.05, 1]
        ang = rng.uniform(0.1, 3.1)
        R = rot_from_axis_angle(ax, ang)
        p = [rng.uniform(-2, 2) for _ in range(3)]
        ex = [rng.uniform(-1, 1) for _ in range(3)]
        ea = rng.uniform(-0.3, 0.3)
        qe = [math.sin(ea / 2) * ex[i] / 1.8 for i in range(3)] + [0.0]
        n = math.sqrt(sum(v * v for v in qe) + 1)
        qe = [v / n for v in qe[:3]] + [1 / n]
        pe = [rng.uniform(-0.04, 0.04), rng.uniform(-0.01, 0.01), rng.uniform(-0.01, 0.01)]
        fov = [rng.uniform(-1.1, -0.3), rng.uniform(0.3, 1.1), rng.uniform(0.3, 1.1), rng.uniform(-1.1, -0.3)]
        flat = [R[0][0], R[0][1], R[0][2], p[0], R[1][0], R[1][1], R[1][2], p[1], R[2][0], R[2][1], R[2][2], p[2]]
        flat = [f32(v) for v in flat]
        tr = flat[0] + flat[5] + flat[10]
        branch = 0 if tr > 0 else 1 if (flat[0] > flat[5] and flat[0] > flat[10]) else 2 if flat[5] > flat[10] else 3
        branch_seen.add(branch)
        cpu.mem.write(M, b'\0' * 0x100)
        cpu.mem.write(M + 4, struct.pack('<12f', *flat))
        cpu.mem.write(E, struct.pack('<7f', *qe, *pe))
        cpu.mem.write(F, struct.pack('<4f', *fov))
        cpu.mem.write(Q, b'\0' * 0x70)
        cpu.sp = 0x7F000000
        cpu.call(BASE + 0x10E71C, [M, E, F, Q])
        out = struct.unpack('<4f3f2f', cpu.mem.read(Q + 0x48, 16) + cpu.mem.read(Q + 0x58, 12) + cpu.mem.read(Q + 0x64, 8))
        cases.append({'matrix': flat, 'eye': list(struct.unpack('<7f', struct.pack('<7f', *qe, *pe))),
                      'fov': list(struct.unpack('<4f', struct.pack('<4f', *fov))), 'branch': branch,
                      'orientation': list(out[0:4]), 'position': list(out[4:7]), 'size': list(out[7:9])})
    assert branch_seen == {0, 1, 2, 3}, branch_seen
    return {'source_sha256': sha, 'routine': '0x10e71c', 'cases': cases}


def gen_fovea(path, rng, count):
    cpu, sha = new_cpu(path)
    META, REND = 0x40000000, 0x40010000
    cpu.mem.map(META, 0x1000)
    cpu.mem.map(REND, 0x4000)
    cases = []
    START, END, FOVFN = BASE + 0x10E634, BASE + 0x10E7A8, BASE + 0x10EFEC
    for i in range(count):
        eye = i & 1
        width, height = rng.randint(800, 4096), rng.randint(800, 4096)
        full = [rng.uniform(-1.0, -0.4), rng.uniform(0.4, 1.0), rng.uniform(0.4, 1.0), rng.uniform(-1.0, -0.4)]
        full = list(struct.unpack('<4f', struct.pack('<4f', *full)))
        rect = [rng.randint(-200, 600), rng.randint(-200, 600), rng.randint(300, 1500), rng.randint(300, 1500)]
        cpu.mem.write(META, b'\0' * 0x1000)
        cpu.mem.write(META + 0xC8 + eye * 8, struct.pack('<4h', *rect))
        # the scene's FOV routine is replaced by a hook that returns `full` in x0 (the destination)
        def fovhook(c, full=full):
            c.mem.write(c.x[0], struct.pack('<4f', *full))
        cpu.hooks[FOVFN] = fovhook
        end_state = {}

        def endhook(c):
            end_state['done'] = True
            c.x[30] = RET_MAGIC
        cpu.hooks[END] = endhook
        cpu.sp = 0x7F000000 - 0x1000
        cpu.x[19] = REND
        cpu.x[20] = META
        cpu.x[21] = eye
        cpu.x[22] = META + eye * 8 + 0xC8
        cpu.x[26] = REND
        cpu.x[27] = META + eye * 64
        cpu.x[24], cpu.x[23] = width, height
        cpu.v[10] = struct.unpack('<I', struct.pack('<f', float(width)))[0]
        cpu.v[9] = struct.unpack('<I', struct.pack('<f', float(height)))[0]
        cpu.x[30] = RET_MAGIC
        cpu.pc = START
        # registers the real code expects: x8 = x20 + eye*8 (set at 0x10e634), sp+0x50 matrix scratch
        while cpu.pc != RET_MAGIC:
            cpu.step()
        out = struct.unpack('<4f', cpu.mem.read(REND + 0x1AFC, 16))
        cases.append({'width': width, 'height': height, 'rect': rect, 'eye': eye, 'full': full, 'fovea': list(out)})
    return {'source_sha256': sha, 'range': '0x10e650..0x10e7a8', 'cases': cases}


def main():
    stock, legacy, out = sys.argv[1:4]
    rng = random.Random(0x5EED)
    doc = {'quad': gen_quad(stock, rng, 240), 'fovea': gen_fovea(legacy, rng, 120)}
    with open(out, 'w', newline='\n') as f:
        json.dump(doc, f, indent=1)
        f.write('\n')
    print('quad cases', len(doc['quad']['cases']), 'fovea cases', len(doc['fovea']['cases']))


main()
