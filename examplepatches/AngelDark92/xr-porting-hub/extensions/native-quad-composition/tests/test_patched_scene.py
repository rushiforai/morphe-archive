"""Execute the PATCHED bytes of libvrlink_scene.so (exact decoded base + build_patch_tables plan) together
with the REAL compiled helper, in the host interpreter.

  NATIVE_QUAD_HELPER=<libgxr_quad_native.so> NATIVE_QUAD_PLAN=<plan dir> NATIVE_QUAD_BASES=5002395,5001712 \
  python -B -I -m unittest discover -s tests -p "test_patched_scene.py"

Host evidence only (no Bionic, no headset). The decoded libraries are not tracked inputs, so the tests are
skipped when they are absent; a skip is not compatibility proof. Every scene function reached through the
PLT is a recording stub; only the patched scene instructions of the slice under test and the compiled helper run.
"""
import json
import math
import os
import struct
import sys
import unittest

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(HERE, '..', 'tools'))
from a64emu import Cpu, Fault, RET_MAGIC, load_shared_object  # noqa: E402

HELPER = os.environ.get('NATIVE_QUAD_HELPER')
PLAN = os.environ.get('NATIVE_QUAD_PLAN')
BASES = [int(x) for x in (os.environ.get('NATIVE_QUAD_BASES') or '5001712,5001812,5001968,5002244,5002363,5002395').split(',')]
try:
    import scene_lib
    from scene_lib import Scene  # noqa: E402
except ImportError:  # capstone/pyelftools missing; other errors must fail discovery
    Scene = None
    scene_lib = None

SB = 0x40000000          # scene load bias
HB = 0x10000000          # helper load bias
HOOK = 0x20000000
HEAP = 0x60000000
REND = 0x70000000        # renderer object
META = 0x71000000
VEC = 0x72000000
CTX = 0x73000000
TLS = 0x74000000
CANARY = 0xC0FFEE
EYES = [(0.0, 0.0, 0.0, 1.0, -0.032, 0.0, 0.0), (0.0, 0.0, 0.0, 1.0, 0.032, 0.0, 0.0)]


def available():
    return bool(HELPER and PLAN and Scene is not None and os.path.exists(HELPER) and
                all(os.path.exists(scene_lib.lib_path(b)) and os.path.exists(os.path.join(PLAN, '%d.json' % b)) for b in BASES))


class World:
    def __init__(self, base):
        self.base = base
        with open(os.path.join(PLAN, '%d.json' % base)) as f:
            self.plan = json.load(f)
        self.sc = Scene(base)
        self.d = self.plan['derived']
        self.spec = self.plan['spec']
        self.SV = self.spec['SV']
        data = bytearray(self.sc.data)
        for p in self.plan['patches']:
            off = self.sc.va2off(p['address'])
            assert data[off:off + p['length']] == bytes.fromhex(p['original']), p['name']
            data[off:off + p['length']] = bytes.fromhex(p['patched'])
        self.patched = bytes(data)
        self.cpu = Cpu()
        cpu = self.cpu
        cpu.tpidr = TLS
        for a, n in ((HEAP, 0x1000000), (REND, 0x4000), (META, 0x1000), (VEC, 0x1000), (CTX, 0x4000), (TLS, 0x1000),
                     (HOOK, 0x4000), (0x21000000, 0x1000)):
            cpu.mem.map(a, n)
        cpu.mem.map(0x7EFD0000, 0x30000)
        self.heap_next = HEAP
        self.calls, self.logs, self.deleted = [], [], []
        self.dlsym_entry = True
        self.dlopen_ok = True
        self.fail_new = False
        self.hookmap, self.helper_libc = {}, {}

        def resolver(name):
            if name not in self.hookmap:
                addr = HOOK + 4 * len(self.hookmap)
                self.hookmap[name] = addr
                cpu.hooks[addr] = lambda c, n=name: self.generic(c, n)
            return self.hookmap[name]

        self.resolver = resolver

        def hres(name):
            if name not in self.helper_libc:
                addr = 0x21000000 + 4 * len(self.helper_libc)
                self.helper_libc[name] = addr
                cpu.hooks[addr] = lambda c, n=name: self.libc(c, n)
            return self.helper_libc[name]

        with open(HELPER, 'rb') as f:
            data_h = f.read()
        self.hexports, _ = load_shared_object(cpu, data_h, HB, hres)
        self.entry = self.hexports['gxr_sq_entry']
        overrides = {n: resolver(n) for n in set(self.sc.plt_names.values()) if n}
        self.exports, _ = load_shared_object(cpu, self.patched, SB, resolver, overrides)
        cpu.mem.w(TLS + 0x28, CANARY, 8)
        self.stack = 0x7EFF0000
        self.eye_poses = list(EYES)

    # ---- stubs -----------------------------------------------------------------------------------
    def alloc(self, n):
        a = self.heap_next
        self.heap_next += (n + 15) & ~15
        return a

    @staticmethod
    def ret(c, v):
        c.x[0] = v & ((1 << 64) - 1)

    def libc(self, c, name):
        if name == 'calloc':
            self.ret(c, self.alloc(c.x[0] * c.x[1]))
        elif name == 'free':
            self.calls.append(('free', c.x[0]))
        elif name == 'memcpy':
            c.mem.write(c.x[0], c.mem.read(c.x[1], c.x[2]))
        elif name == 'memset':
            c.mem.write(c.x[0], bytes([c.x[1] & 0xFF]) * c.x[2])
        elif name == 'tanf':
            c.ws('s0', math.tan(c.rs('s0')))
        elif name == 'atanf':
            c.ws('s0', math.atan(c.rs('s0')))
        elif name.startswith('pthread_mutex'):
            self.calls.append((name,))
            self.ret(c, 0)
        else:
            self.ret(c, 0)

    @staticmethod
    def cstr(c, a):
        out = bytearray()
        while True:
            b = c.mem.read(a + len(out), 1)[0]
            if b == 0:
                return out.decode()
            out.append(b)

    def generic(self, c, n):
        if n == 'dlsym':
            sym = self.cstr(c, c.x[1])
            self.calls.append(('dlsym', c.x[0], sym))
            if sym == 'dlopen':
                self.ret(c, self.resolver('__dlopen_stub'))
            elif sym == 'gxr_sq_entry':
                self.ret(c, self.entry if self.dlsym_entry else 0)
            else:
                self.ret(c, 0)
        elif n == '__dlopen_stub':
            self.calls.append(('dlopen', self.cstr(c, c.x[0]), c.x[1]))
            self.ret(c, 0x1234 if self.dlopen_ok else 0)
        elif n == '__android_log_print':
            self.logs.append((c.x[0], self.cstr(c, c.x[1]), self.cstr(c, c.x[2])))
            self.ret(c, 0)
        elif n == '_Znwm':
            self.calls.append(('new', c.x[0]))
            if self.fail_new:
                raise Fault('bad_alloc')
            self.ret(c, self.alloc(c.x[0]))
        elif n == '_ZdlPv':
            self.deleted.append(c.x[0])
        elif n == 'memcpy':
            c.mem.write(c.x[0], c.mem.read(c.x[1], c.x[2]))
        elif n.startswith('_Z28XRQCreateProjectionViewLayer'):
            view = c.x[2]
            c.mem.write(view, struct.pack('<I', 0x30) + b'\0' * 0x5C)
            c.mem.write(view + 0x40, struct.pack('<QQ', 0xC0DE0000 + c.x[1] % 0x10000, 0))
            c.mem.write(view + 0x50, struct.pack('<II', 111, 222))
            self.calls.append(('cpvl', c.x[1]))
            self.ret(c, 1)
        elif n.startswith('_Z20XRQGetReferenceSpace'):
            c.mem.w(c.x[2], 0xA000 + c.x[1], 8)
            self.ret(c, 1)
        elif n == 'tanf':
            c.ws('s0', math.tan(c.rs('s0')))
        elif n == 'atanf':
            c.ws('s0', math.atan(c.rs('s0')))
        elif n.startswith('_ZNK28XRQAcquireSwapchainImageRAII21GetAcquiredImageIndex'):
            self.ret(c, REND + 0x3F00)
        elif n.startswith('_ZN28XRQAcquireSwapchainImageRAIIC1'):
            c.mem.w(c.x[0], c.x[1], 8)
            self.calls.append(('acquire_sc', c.x[1]))
        elif n.startswith('_ZN28XRQAcquireSwapchainImageRAIID1'):
            self.calls.append(('release_sc', c.mem.u(c.x[0], 8)))
        elif n == 'xrDestroySwapchain':
            self.calls.append(('destroy_sc', c.x[0]))
            self.ret(c, 0)
        elif n.startswith('_Z18XRQCreateSwapchain'):
            w, h = struct.unpack('<II', c.mem.read(c.x[1], 8))
            sc = c.x[2]
            c.mem.write(sc, struct.pack('<Q', 0xC0DE0000 + sc % 0x10000))
            c.mem.write(sc + 0x70, struct.pack('<II', w, h))
            self.calls.append(('create_sc', sc))
            self.ret(c, 1)
        elif 'LocateViews' in n:
            begin = c.mem.u(c.x[3], 8)
            for e in range(2):
                c.mem.write(begin + e * 0x40 + 0x10, struct.pack('<7f', *self.eye_poses[e]))
            self.ret(c, 1)
        else:
            self.calls.append(('ext', n))
            self.ret(c, 0)

    # ---- driving ---------------------------------------------------------------------------------
    def run(self, start, regs=None, stop=None, max_steps=3_000_000):
        cpu = self.cpu
        for i in range(31):
            cpu.x[i] = 0
        for k, v in (regs or {}).items():
            cpu.x[int(k[1:])] = v
        cpu.sp = self.stack
        if stop is not None:
            cpu.hooks[SB + stop] = lambda c: c.x.__setitem__(30, RET_MAGIC)
        cpu.x[30] = RET_MAGIC
        cpu.pc = SB + start
        n = 0
        while cpu.pc != RET_MAGIC:
            cpu.step()
            n += 1
            if n > max_steps:
                raise Fault('step limit')
        if stop is not None:
            del cpu.hooks[SB + stop]

    def regs_ctor(self):
        self.run(self.plan['labels']['t_ctor'], {'x19': REND, 'x26': TLS})

    def sv(self):
        return struct.unpack('<QQ', self.cpu.mem.read(REND + self.SV, 16))

    def helper_call(self, op, state, a=0, b=0, c=0, d=0):
        cpu = self.cpu
        for i, v in enumerate((op, state, a, b, c, d)):
            cpu.x[i] = v
        cpu.x[30] = RET_MAGIC
        cpu.pc = self.entry
        cpu.sp = self.stack
        while cpu.pc != RET_MAGIC:
            cpu.step()
        return cpu.x[0]

    def forbidden(self, addr):
        off = addr - REND
        return any(lo <= off < hi for lo, hi in self.spec['forbidden'])

    def watch(self):
        bad = []
        self.cpu.mem.watch = lambda a, n: bad.append((hex(a - REND), n)) if self.forbidden(a) else None
        return bad

    def func(self, key):
        return self.exports[{'init': '_ZN14QSVLRendererXR4InitERK10XRQContext',
                             'setup': '_ZN14QSVLRendererXR15SetupSwapchainsERK10XRQContextjj9AtlasMode',
                             'flip': '_ZN14QSVLRendererXR9FlipFrameERK10XRQContextPll'}[key]] - SB

    def e2h(self):
        return [v for k, v in self.exports.items() if 'GetEyeToHeadTransform' in k][0] - SB

    def flip_slices(self):
        """(loop_head, post_loop) for the per-eye loop and (after RenderSpecificPrep, after last pose site)."""
        flip = self.func('flip')
        eye = self.spec['eye_reg'].replace('w', 'x')
        ins = self.sc.dis(flip, 0xB00)
        a, b = self.d['flip_eye']
        head = [i for i in ins if i.address < a and i.mnemonic == 'mov' and i.op_str == '%s, xzr' % eye][-1].address
        prep = [i for i in ins if i.mnemonic == 'bl' and 'RenderSpecificPrep' in (self.sc.plt_stub_name(i.operands[0].imm) or '')][0].address
        return head, b + 0x14, prep + 4, self.d['flip_pose'][-1] + 0xC


def mk_meta(mem, rot_y=0.3, pos=(0.1, 1.6, -0.2), rects=((100, 120, 800, 700), (140, 110, 780, 690)), dims=(2000, 1800)):
    c, s = math.cos(rot_y), math.sin(rot_y)
    head = [c, 0, s, pos[0], 0, 1, 0, pos[1], -s, 0, c, pos[2]]
    mem.write(META, b'\0' * 0x400)
    mem.write(META + 4, struct.pack('<12f', *head))
    proj = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, -1.0002, -0.2, 0, 0, -1, 0]   # symmetric 90 degree frustum
    for e in range(2):
        mem.write(META + 0x44 + e * 0x40, struct.pack('<16f', *proj))
        mem.write(META + 0xC8 + e * 8, struct.pack('<4h', *rects[e]))
    mem.write(META + 0xEA, struct.pack('<HH', *dims))
    return head


@unittest.skipUnless(available(), 'needs helper, plan and decoded scene libraries')
class PatchedSceneTests(unittest.TestCase):
    def envs(self):
        for b in BASES:
            yield b, World(b)

    def test_ctor_hook_loads_helper_and_stores_state_entry(self):
        for b, e in self.envs():
            e.regs_ctor()
            state, entry = e.sv()
            self.assertEqual(entry, e.entry, b)
            self.assertNotEqual(state, 0, b)
            self.assertEqual([c[0] for c in e.calls][:3], ['dlsym', 'dlopen', 'dlsym'], b)
            self.assertEqual(e.calls[0][1:], (0, 'dlopen'))
            self.assertEqual(e.calls[1][1:], ('libgxr_quad_native.so', 2))
            self.assertEqual(e.logs, [])
            self.assertEqual(e.cpu.x[8], CANARY, 'the replaced instruction ran')

    def test_ctor_failures_log_once_and_store_null(self):
        for b in BASES:
            for case in ('dlopen', 'entry', 'create'):
                e = World(b)
                if case == 'dlopen':
                    e.dlopen_ok = False
                elif case == 'entry':
                    e.dlsym_entry = False
                else:       # entry exists but CREATE returns null (e.g. allocation failure)
                    fake = HB + 0x100000
                    e.cpu.mem.map(fake, 0x1000)
                    e.cpu.hooks[fake] = lambda c: c.x.__setitem__(0, 0)
                    e.entry = fake
                e.regs_ctor()
                self.assertEqual(e.sv(), (0, 0), (b, case))
                self.assertEqual(len(e.logs), 1, (b, case))
                self.assertEqual(e.logs[0][0], 6)
                self.assertEqual(e.cpu.x[8], CANARY)

    def test_dtor_hook_destroys_once_and_clears(self):
        for b, e in self.envs():
            e.regs_ctor()
            state, _ = e.sv()
            e.cpu.mem.w(REND + 0x10, 0x55, 8)
            n0 = e.calls.count(('pthread_mutex_lock',))
            e.run(e.plan['labels']['t_dtor'], {'x19': REND})
            self.assertEqual(e.sv(), (0, 0))
            self.assertEqual(e.calls.count(('pthread_mutex_lock',)), n0 + 1, 'DESTROY ran (pool enqueue) exactly once')
            self.assertNotIn(('free', state), e.calls, 'states are pooled, never freed')
            self.assertEqual(e.cpu.x[0], 0x55)      # the replaced `ldr x0,[x19,#0x10]`
            e.run(e.plan['labels']['t_dtor'], {'x19': REND})
            self.assertEqual(e.calls.count(('pthread_mutex_lock',)), n0 + 1, 'slot cleared: no second DESTROY')

    def test_getlayers_pushes_four_quads_and_writes_no_old_field(self):
        for b, e in self.envs():
            e.regs_ctor()
            state, _ = e.sv()
            bad = e.watch()
            buf = e.alloc(8 * 16)
            for i, v in enumerate((buf, buf, buf + 16 * 8)):
                e.cpu.mem.w(VEC + 8 * i, v, 8)
            e.run(e.d['gl'][0], {'x0': REND, 'x1': VEC})
            e.cpu.mem.watch = None
            begin, end = e.cpu.mem.u(VEC, 8), e.cpu.mem.u(VEC + 8, 8)
            items = [e.cpu.mem.u(begin + 8 * i, 8) for i in range((end - begin) // 8)]
            self.assertEqual(items, [state + 0x70 * i for i in range(4)], b)
            self.assertEqual(bad, [], b)

    def test_getlayers_growth_from_empty_matches_stock_sequence(self):
        for b, e in self.envs():
            e.regs_ctor()
            state, _ = e.sv()
            for i in range(3):
                e.cpu.mem.w(VEC + 8 * i, 0, 8)
            e.run(e.d['gl'][0], {'x0': REND, 'x1': VEC})
            self.assertEqual([c[1] for c in e.calls if c[0] == 'new'], [8, 16, 32], b)
            begin, end = e.cpu.mem.u(VEC, 8), e.cpu.mem.u(VEC + 8, 8)
            self.assertEqual((end - begin) // 8, 4)

    def test_getlayers_with_unavailable_helper_pushes_nothing(self):
        for b in BASES:
            e = World(b)
            e.dlopen_ok = False
            e.regs_ctor()
            for i in range(3):
                e.cpu.mem.w(VEC + 8 * i, 0, 8)
            e.run(e.d['gl'][0], {'x0': REND, 'x1': VEC})
            self.assertEqual(e.cpu.mem.u(VEC + 8, 8), 0)
            self.assertFalse([c for c in e.calls if c[0] == 'new'])

    def test_getlayers_allocation_exception_propagates_without_corruption(self):
        for b, e in self.envs():
            e.regs_ctor()
            e.fail_new = True
            for i in range(3):
                e.cpu.mem.w(VEC + 8 * i, 0, 8)
            with self.assertRaises(Fault):
                e.run(e.d['gl'][0], {'x0': REND, 'x1': VEC})
            self.assertEqual(e.cpu.mem.u(VEC, 8), 0)


@unittest.skipUnless(available(), 'needs helper, plan and decoded scene libraries')
class PatchedFlowTests(unittest.TestCase):
    def setUp(self):
        self.envs = [(b, World(b)) for b in BASES]

    def test_init_writes_no_projection_header_and_sets_spaces(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, entry = e.sv()
            bad = e.watch()
            e.run(e.func('init'), {'x0': REND, 'x1': CTX}, stop=e.d['init_region'][1])
            e.cpu.mem.watch = None
            self.assertEqual(bad, [], b)
            self.assertEqual((e.cpu.x[19], e.cpu.x[21]), (CTX, REND), 'kept prologue state')
            self.assertEqual(e.cpu.mem.u(e.cpu.x[29] - 8, 8), CANARY, 'stack canary stored')
            for i in range(4):
                self.assertEqual(e.cpu.mem.u(state + 0x70 * i + 0x18, 8), 0xA000, (b, i))
            self.assertEqual(e.sv(), (state, entry))

    def test_setup_routes_swapchains_to_helper_without_projection_view_writes(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, _ = e.sv()
            e.cpu.mem.w(CTX + 0x1128, CTX + 0x800, 8)
            bad = e.watch()
            e.run(e.func('setup'), {'x0': REND, 'x1': CTX, 'x2': 2000, 'x3': 1800, 'x4': 1})
            e.cpu.mem.watch = None
            self.assertEqual(bad, [], b)
            self.assertFalse([c for c in e.calls if c[0] == 'cpvl'],
                             'XRQCreateProjectionViewLayer is never called: no projection view is built')
            created = [c[1] for c in e.calls if c[0] == 'create_sc']
            order = ('base', 'fovea')
            self.assertEqual(len(created), 4, (b, created))
            if 'setup_under' in e.d:
                self.assertTrue(all(e.cpu.mem.u(REND + off, 8) == 0 for off in (0x1638, 0x16b0)), b)
            for eye in range(2):
                for fam, name in enumerate(('base', 'fovea')):
                    sc_obj = created[eye * len(order) + order.index(name)]
                    q = e.cpu.mem.read(state + (fam * 2 + eye) * 0x70, 0x70)
                    self.assertEqual(struct.unpack_from('<Q', q, 0x28)[0], 0xC0DE0000 + (sc_obj & 0xFFFF), (b, fam, eye))
                    self.assertEqual(struct.unpack_from('<4i', q, 0x30), (0, 0, 2000, 1800))
                    self.assertEqual(struct.unpack_from('<I', q, 0x40)[0], 0)
            self.assertEqual(e.cpu.mem.u(REND + 0x15C8, 1), 1, 'swapchains-ready flag still set')

    def test_e2h_success_path_pushes_eye_poses_and_keeps_matrices(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, _ = e.sv()
            client = HEAP + 0x800000
            e.cpu.mem.map(client, 0x20000)
            e.cpu.mem.w(client + 0x138, REND, 8)
            out = e.alloc(0x100)
            e.run(e.e2h(), {'x0': client, 'x1': out})
            for eye in range(2):
                got = struct.unpack('<7f', e.cpu.mem.read(state + 0x200 + eye * 28, 28))
                self.assertEqual([round(v, 6) for v in got], [round(v, 6) for v in EYES[eye]], (b, eye))
            m = struct.unpack('<12f', e.cpu.mem.read(out, 48))
            self.assertAlmostEqual(m[3], -0.032, places=5)

    def test_e2h_without_helper_still_returns_matrices(self):
        for b in BASES:
            e = World(b)
            e.dlopen_ok = False
            e.regs_ctor()
            client = HEAP + 0x800000
            e.cpu.mem.map(client, 0x20000)
            e.cpu.mem.w(client + 0x138, REND, 8)
            out = e.alloc(0x100)
            e.run(e.e2h(), {'x0': client, 'x1': out})
            self.assertAlmostEqual(struct.unpack('<f', e.cpu.mem.read(out + 12, 4))[0], -0.032, places=5)

    def test_flip_eye_block_calls_helper_and_skips_old_fov_and_view_writes(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, _ = e.sv()
            mk_meta(e.cpu.mem)
            head, post, _, _ = e.flip_slices()
            bad = e.watch()
            e.calls.clear()
            e.run(head, {'x19': REND, 'x20': META, 'x23': 1800, 'x24': 2000, 'x25': 1}, stop=post)
            e.cpu.mem.watch = None
            self.assertEqual(bad, [], (b, bad))
            for eye in range(2):
                full = struct.unpack('<4f', e.cpu.mem.read(state + 0x290 + eye * 16, 16))     # staged FOV
                self.assertTrue(full[0] < 0 < full[1] and full[3] < 0 < full[2], (b, eye, full))
                fovea = struct.unpack('<4f', e.cpu.mem.read(state + 0x290 + (2 + eye) * 16, 16))
                self.assertTrue(all(abs(v) < 3.2 for v in fovea), (b, fovea))
                self.assertEqual((e.cpu.mem.u(state + 0x2D0 + eye * 4, 4), e.cpu.mem.u(state + 0x2D8 + eye * 4, 4)),
                                 (2000, 1800))
                cache = e.cpu.mem.read(REND + self.cache_off(e) + eye * 8, 8)
                self.assertEqual(cache, e.cpu.mem.read(META + 0xC8 + eye * 8, 8), 'rect cache stored for the next frame')

    @staticmethod
    def cache_off(e):
        return e.spec['FLIP_CACHE_OFF']

    def run_size_compare(self, e, w, h, atlas=1):
        head, _, _, _ = e.flip_slices()
        ins = e.sc.dis(e.d['dim_w'], 0x40)
        atlas_off = [int(i.op_str.split('#')[1].rstrip(']'), 16) for i in ins
                     if i.mnemonic == 'ldr' and i.op_str.startswith('w10, [x19, #')][0]
        e.cpu.mem.w(REND + atlas_off, 1, 4)           # cached atlas mode is always 1; `atlas` is the new frame's
        e.calls.clear()
        e.run(e.d['dim_w'], {'x19': REND, 'x23': h, 'x24': w, 'x25': atlas}, stop=head)
        return [c for c in e.calls if c[0] == 'ext' and 'SetupSwapchains' in c[1]]

    def test_size_cache_compare_uses_helper_staged_size_not_old_view_extent(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, _ = e.sv()
            mk_meta(e.cpu.mem)
            for eye in range(2):
                e.helper_call(6, state, META, eye, 2000, 1800)
            self.assertEqual(self.run_size_compare(e, 2000, 1800), [], (b, 'same size: no swapchain regeneration'))
            self.assertTrue(self.run_size_compare(e, 2100, 1800), (b, 'width changed'))
            self.assertTrue(self.run_size_compare(e, 2000, 1700), (b, 'height changed'))
            self.assertTrue(self.run_size_compare(e, 2000, 1800, atlas=2), (b, 'atlas mode changed'))

    def test_persistent_invalid_fov_does_not_cause_repeated_swapchain_recreation(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, _ = e.sv()
            mk_meta(e.cpu.mem)
            # NaN projection matrices: the scene's own FOV routine yields an unusable FOV every frame
            for eye in range(2):
                e.cpu.mem.write(META + 0x44 + eye * 0x40, struct.pack('<16f', *([float('nan')] * 16)))
            for w, h in ((2000, 1800), (2100, 1800)):
                for eye in range(2):
                    e.helper_call(6, state, META, eye, w, h)
                # first frame at a new size regenerates once (the scene then caches nothing: it asks the helper)
                self.assertEqual(self.run_size_compare(e, w, h), [], (b, w, h, 'stale size cache'))
            self.assertTrue(self.run_size_compare(e, 2200, 1800), (b, 'real size change must still regenerate'))

    def test_size_cache_compare_without_helper_reports_unchanged(self):
        for b in BASES:
            e = World(b)
            e.dlopen_ok = False
            e.regs_ctor()
            self.assertEqual(self.run_size_compare(e, 2000, 1800), [], b)

    def test_flip_pose_sites_call_helper_frame_exactly_once(self):
        for b, e in self.envs:
            e.regs_ctor()
            state, _ = e.sv()
            mk_meta(e.cpu.mem)
            _, _, start, stop = e.flip_slices()
            # point every swapchain image array the slice dereferences at mapped zero memory
            for i in e.sc.dis(SB * 0 + start, stop - start):
                if i.mnemonic == 'ldr' and i.op_str.startswith('x9, [x19, #'):
                    e.cpu.mem.w(REND + int(i.op_str.split('#')[1].rstrip(']'), 16), REND + 0x3F10, 8)
            e.cpu.mem.w(REND + 0x15A8, REND + 0x3D00, 8)
            for eye in range(2):
                e.helper_call(6, state, META, eye, 2000, 1800)
            views = e.alloc(0x80)
            for eye in range(2):
                e.cpu.mem.write(views + eye * 0x40 + 0x10, struct.pack('<7f', *EYES[eye]))
            e.helper_call(4, state, views)
            bad = e.watch()
            e.calls.clear()
            e.run(start, {'x19': REND, 'x20': META, 'x21': HEAP + 0x900000, 'x28': TLS}, stop=stop)
            e.cpu.mem.watch = None
            self.assertEqual(bad, [], (b, bad))
            q0 = struct.unpack('<4f3f', e.cpu.mem.read(state + 0x48, 16) + e.cpu.mem.read(state + 0x58, 12))
            self.assertTrue(all(v == v for v in q0))
            self.assertNotEqual(q0[4:], (0.0, 0.0, 0.0), 'pose written by FRAME')
            self.assertEqual(len([c for c in e.calls if c[0] == 'ext' and 'RenderSpecific' in c[1]]), 4)
            acquired = [c[1] for c in e.calls if c[0] == 'acquire_sc']
            released = [c[1] for c in e.calls if c[0] == 'release_sc']
            self.assertEqual(len(acquired), 4, (b, acquired))
            self.assertEqual(released, acquired, b)
            if 'flip_under' in e.d:
                self.assertFalse(set(acquired) & {REND + 0x1638, REND + 0x16b0}, b)
            self.assertEqual([c for c in e.calls if c[0].startswith('pthread_mutex')],
                             [('pthread_mutex_lock',), ('pthread_mutex_unlock',)], b)
            self.assertFalse([c for c in e.calls if c[0] == 'cpvl'], 'old pose-helper address is never entered')

    def test_recreated_renderer_reuses_reset_state_and_new_settings_pointers(self):
        for b, e in self.envs:
            e.regs_ctor()
            old_state, _ = e.sv()
            mk_meta(e.cpu.mem)
            for eye in range(2):
                e.helper_call(6, old_state, META, eye, 2000, 1800)
            e.helper_call(7, old_state, META)
            e.run(e.plan['labels']['t_dtor'], {'x19': REND})
            new_renderer = REND + 0x2000
            e.run(e.plan['labels']['t_ctor'], {'x19': new_renderer, 'x26': TLS})
            state, entry = struct.unpack('<QQ', e.cpu.mem.read(new_renderer + e.SV, 16))
            self.assertEqual(state, old_state, b)
            self.assertEqual(entry, e.entry, b)
            for index in range(4):
                next_off = e.spec['NEXT_BASE' if index < 2 else 'NEXT_FOVEA']
                self.assertEqual(e.cpu.mem.u(state + index * 0x70 + 8, 8), new_renderer + next_off)
                self.assertEqual(e.cpu.mem.u(state + index * 0x70 + 0x28, 8), 0)
                self.assertEqual(e.cpu.mem.read(state + index * 0x70 + 0x64, 8), b'\0' * 8)
            self.assertEqual(e.cpu.mem.read(state + 0x2d0, 16), b'\0' * 16)


CALLEE_SAVED = list(range(19, 29)) + [29]


def run_abi(w, start, regs, stop=None, allow=(), keep_fp=True):
    """Run a thunk with arbitrary sentinels in every callee-saved register, x29, d8-d15 and SP, to the REAL
    return (RET_MAGIC through x30) or to `stop`, and assert that nothing outside `allow` changed.
    Registers given in `regs` are inputs and are expected to keep their value unless listed in `allow`."""
    cpu = w.cpu
    for i in range(31):
        cpu.x[i] = 0
    sent = {r: 0x5E5E000000000000 | (r * 0x1111) for r in CALLEE_SAVED}
    for r in CALLEE_SAVED:
        cpu.x[r] = sent[r]
    for k, v in regs.items():
        n = int(k[1:])
        cpu.x[n] = v
        if n in sent:
            sent[n] = v
    dsent = {r: 0x7FF0000000000000 | (0x100 + r) for r in range(8, 16)}
    for r, v in dsent.items():
        cpu.v[r] = v
    cpu.sp = w.stack - 0x40
    sp0 = cpu.sp
    cpu.x[30] = RET_MAGIC
    if stop is not None:
        cpu.hooks[SB + stop] = lambda c: c.x.__setitem__(30, RET_MAGIC)
    cpu.pc = SB + start
    n = 0
    while cpu.pc != RET_MAGIC:
        cpu.step()
        n += 1
        if n > 3_000_000:
            raise Fault('step limit')
    if stop is not None:
        del cpu.hooks[SB + stop]
    assert cpu.sp == sp0, 'SP changed'
    for r in CALLEE_SAVED:
        if r not in allow:
            assert cpu.x[r] == sent[r], 'x%d clobbered: %#x != %#x' % (r, cpu.x[r], sent[r])
    for r, v in dsent.items():
        assert cpu.v[r] & ((1 << 64) - 1) == v, 'd%d clobbered' % r


@unittest.skipUnless(available(), 'needs helper, plan and decoded scene libraries')
class PatchedAbiTests(unittest.TestCase):
    """AAPCSv64 preservation across every thunk, on the real return path (no halt at RET)."""

    def setUp(self):
        self.worlds = [(b, World(b)) for b in BASES]

    def test_tail_called_and_called_thunks_preserve_everything(self):
        for b, w in self.worlds:
            lab = w.plan['labels']
            run_abi(w, lab['t_ctor'], {'x19': REND, 'x26': TLS})
            state, _ = w.sv()
            mk_meta(w.cpu.mem)
            for i in range(3):
                w.cpu.mem.w(VEC + 8 * i, 0, 8)
            run_abi(w, w.d['gl'][0], {'x0': REND, 'x1': VEC, 'x19': 0x1234})      # x19 = arbitrary sentinel
            run_abi(w, lab['t_frame'], {'x19': REND, 'x0': META})
            for name in ('t_setup_base', 't_setup_fovea'):
                sc = HEAP + 0x700000
                w.cpu.mem.map(sc, 0x1000)
                w.cpu.mem.write(sc, struct.pack('<Q', 0xFEED))
                w.cpu.mem.write(sc + 0x70, struct.pack('<II', 640, 480))
                run_abi(w, lab[name], {'x19': REND, 'x0': CTX, 'x1': sc, 'x2': 1})
            run_abi(w, lab['t_dtor'], {'x19': REND})

    def test_failed_load_paths_preserve_everything(self):
        for b in BASES:
            for case in ('dlopen', 'entry'):
                w = World(b)
                w.dlopen_ok = case != 'dlopen'
                w.dlsym_entry = case != 'entry'
                run_abi(w, w.plan['labels']['t_ctor'], {'x19': REND, 'x26': TLS})
                self.assertEqual(w.sv(), (0, 0))
                # with a null helper every other thunk is a no-op that still returns cleanly
                run_abi(w, w.plan['labels']['t_frame'], {'x19': REND, 'x0': META})
                run_abi(w, w.plan['labels']['t_setup_base'], {'x19': REND, 'x0': CTX, 'x1': 0, 'x2': 0})
                run_abi(w, w.plan['labels']['t_dtor'], {'x19': REND})

    def test_inline_edits_preserve_all_registers_they_do_not_define(self):
        for b, w in self.worlds:
            w.regs_ctor()
            d = w.d
            client = HEAP + 0x800000
            w.cpu.mem.map(client, 0x20000)
            w.cpu.mem.w(client + 0x138, REND, 8)
            views = w.alloc(0x80)
            for e in range(2):
                w.cpu.mem.write(views + e * 0x40 + 0x10, struct.pack('<7f', *EYES[e]))
            sub = w.plan['derived']['e2h_renderer_sub']
            regs = {'x8': views, 'x20': client, 'x21': client + sub + 0x138}
            run_abi(w, w.plan['labels']['t_e2h'], regs, stop=d['e2h_ret'])
            # Init: defines x19 (=ctx), x21 (=this); x23 is the TLS pointer input, x29 a valid frame pointer
            w.cpu.mem.map(0x7EFE0000, 0x10000)
            run_abi(w, d['init_region'][0], {'x0': REND, 'x1': CTX, 'x23': TLS, 'x29': 0x7EFE8000},
                    stop=d['init_region'][1], allow=(19, 21, 29))
            # Flip eye block: defines only the cache pointer register
            mk_meta(w.cpu.mem)
            cache = int(w.spec['cache_reg'][1:])
            eyew = int(w.spec['eye_reg'][1:])
            run_abi(w, d['flip_eye'][0], {'x19': REND, 'x20': META, eyew_name(w): 1, 'x23': 1800, 'x24': 2000,
                                          'x8': REND + 8},
                    stop=d['flip_eye'][1], allow=(cache,))


def eyew_name(w):
    return w.spec['eye_reg'].replace('w', 'x')


if __name__ == '__main__':
    unittest.main()
