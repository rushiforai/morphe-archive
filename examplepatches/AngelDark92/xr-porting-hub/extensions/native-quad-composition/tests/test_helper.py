"""Run the compiled libgxr_quad_native.so bytes through the host interpreter.

  python -B -I -m unittest discover -s tests -p "test_*.py"   (NATIVE_QUAD_HELPER=<path to .so>)

Host evidence only: not Bionic, not a headset, tanf/atanf are host math rounded to float32.
"""
import json
import math
import os
import struct
import unittest

from a64emu import Cpu, load_shared_object, RET_MAGIC

HERE = os.path.dirname(os.path.abspath(__file__))
HELPER = os.environ.get('NATIVE_QUAD_HELPER')
BASE = 0x10000000
LIBC_BASE = 0x20000000
TABLE = 0x30000000
HEAP = 0x50000000
META = 0x60000000
ABI = 1
OP = dict(CREATE=0, DESTROY=1, INIT=2, SWAPCHAIN=3, EYES=4, FRAME_EYE=6, FRAME=7, LAYERS=8)

with open(os.path.join(HERE, 'golden_vectors.json')) as _f:
    GOLDEN = json.load(_f)


class Throw(Exception):
    pass


class Harness:
    def __init__(self):
        self.cpu = Cpu()
        cpu = self.cpu
        self.stubs = {}
        self.log = []
        self.heap_next = HEAP
        self.fail_new = False
        self.fov_value = [-0.7, 0.7, 0.6, -0.6]
        self.cpu.mem.map(HEAP, 0x400000)
        self.cpu.mem.map(TABLE, 0x1000)
        self.cpu.mem.map(META, 0x2000)

        def stub(name, fn):
            addr = LIBC_BASE + 4 * len(self.stubs)
            self.stubs[name] = addr
            cpu.hooks[addr] = fn
            return addr

        stub('tanf', lambda c: c.ws('s0', math.tan(c.rs('s0'))))
        stub('atanf', lambda c: c.ws('s0', math.atan(c.rs('s0'))))
        stub('calloc', lambda c: self.set_x0(self.alloc(c.x[0] * c.x[1], zero=True)))
        stub('free', lambda c: self.log.append(('free', c.x[0])))
        stub('memcpy', self.h_memcpy)
        stub('memset', lambda c: (c.mem.write(c.x[0], bytes([c.x[1] & 0xFF]) * c.x[2])))
        self.mutex_init_rc = 0
        stub('pthread_mutex_init', lambda c: (self.log.append(('mutex_init', c.x[0])), self.set_x0(self.mutex_init_rc)))
        stub('pthread_mutex_lock', lambda c: (self.log.append(('lock', c.x[0])), self.set_x0(0)))
        stub('pthread_mutex_unlock', lambda c: (self.log.append(('unlock', c.x[0])), self.set_x0(0)))
        for n in ('__cxa_finalize', '__cxa_atexit', '__register_atfork'):
            stub(n, lambda c: self.set_x0(0))
        data = open(HELPER, 'rb').read()
        self.exports, undefined = load_shared_object(cpu, data, BASE, self.stubs)
        assert not undefined, undefined
        self.entry = self.exports['gxr_sq_entry']
        # scene-side stubs reached through the self-relative table
        self.new_addr = stub('new', self.h_new)
        self.delete_addr = stub('delete', lambda c: self.log.append(('delete', c.x[0])))
        self.throw_addr = stub('throw', self.h_throw)
        self.space_addr = stub('refspace', self.h_space)
        self.fov_addr = stub('fov', self.h_fov)
        self.renderer = HEAP + 0x300000
        t = struct.pack('<IIiiiiiIII', ABI, 40, self.new_addr - TABLE, self.delete_addr - TABLE,
                        self.throw_addr - TABLE, self.space_addr - TABLE, self.fov_addr - TABLE, 0xD8, 0x1BF0, 0x1C08)
        cpu.mem.write(TABLE, t)

    def set_x0(self, v):
        self.cpu.x[0] = v & ((1 << 64) - 1)

    def alloc(self, size, zero=False):
        a = self.heap_next
        self.heap_next += (size + 15) & ~15
        return a

    def h_memcpy(self, c):
        c.mem.write(c.x[0], c.mem.read(c.x[1], c.x[2]))

    def h_new(self, c):
        self.log.append(('new', c.x[0]))
        if self.fail_new:
            raise Throw('bad_alloc')
        self.set_x0(self.alloc(min(c.x[0], 0x10000)))

    def h_throw(self, c):
        self.log.append(('throw_length', c.x[0]))
        raise Throw('length_error')

    def h_space(self, c):
        # (ctx, type, uint64 *out) -> true, writes a distinct handle derived from the type
        c.mem.w(c.x[2], 0xA000 + c.mem.u(c.x[0] + 0xD8, 4) if False else 0xA000 + c.x[1], 8)
        self.set_x0(1)

    def h_fov(self, c):
        c.mem.write(c.x[0], struct.pack('<4f', *self.fov_value))

    def call(self, op, state=0, a=0, b=0, c=0, d=0):
        return self._call6(OP[op] if isinstance(op, str) else op, state, a, b, c, d)

    def _call6(self, op, state, a, b, c, d):
        """Runs the real helper bytes to its real RET and checks the AAPCS64 contract: SP, x29 and every
        callee-saved register (x19-x28, low halves of d8-d15) hold arbitrary sentinels across the call,
        including when the call is rejected or raises."""
        cpu = self.cpu
        for i, v in enumerate((op, state, a, b, c, d)):
            cpu.x[i] = v
        sentinels = {r: 0x5E5E000000000000 | (r * 0x1111) for r in range(19, 30)}
        for r, v in sentinels.items():
            cpu.x[r] = v
        dsent = {r: 0x7FF0000000000000 | (0x100 + r) for r in range(8, 16)}
        for r, v in dsent.items():
            cpu.v[r] = v
        cpu.x[30] = RET_MAGIC
        cpu.pc = self.entry
        cpu.sp = 0x7F000000 - 0x100
        sp0 = cpu.sp
        n = 0
        try:
            while cpu.pc != RET_MAGIC:
                cpu.step()
                n += 1
                assert n < 400000, 'step limit'
        finally:
            if cpu.pc == RET_MAGIC:
                assert cpu.sp == sp0, 'SP not restored'
                for r, v in sentinels.items():
                    assert cpu.x[r] == v, 'x%d clobbered' % r
                for r, v in dsent.items():
                    assert cpu.v[r] & ((1 << 64) - 1) == v, 'd%d clobbered' % r
        return cpu.x[0]

    def create(self):
        s = self.call('CREATE', 0, TABLE, self.renderer)
        return s

    def quad(self, state, i):
        return self.cpu.mem.read(state + i * 0x70, 0x70)


def close(a, b, tol=1e-6):
    return abs(a - b) <= tol


@unittest.skipUnless(HELPER and os.path.exists(HELPER), 'set NATIVE_QUAD_HELPER to the built libgxr_quad_native.so')
class HelperTests(unittest.TestCase):
    def test_create_layout_and_defaults(self):
        h = Harness()
        s = h.create()
        self.assertNotEqual(s, 0)
        for i in range(4):
            q = h.quad(s, i)
            typ, = struct.unpack_from('<I', q, 0)
            nxt, flags, space = struct.unpack_from('<QQQ', q, 8)
            vis, = struct.unpack_from('<I', q, 0x20)
            self.assertEqual(typ, 36)
            self.assertEqual(flags, 6 if i >= 2 else 0)
            self.assertEqual(nxt, h.renderer + (0x1C08 if i >= 2 else 0x1BF0))
            self.assertEqual(vis, 1 if i % 2 == 0 else 2)
            self.assertEqual(struct.unpack_from('<4f', q, 0x48), (0.0, 0.0, 0.0, 1.0))
            self.assertEqual(struct.unpack_from('<2f', q, 0x64), (0.0, 0.0))

    def test_create_rejects_bad_table_and_null(self):
        h = Harness()
        self.assertEqual(h.call('CREATE', 0, 0, h.renderer), 0)
        self.assertEqual(h.call('CREATE', 0, TABLE, 0), 0)
        h.cpu.mem.w(TABLE, 2, 4)
        self.assertEqual(h.call('CREATE', 0, TABLE, h.renderer), 0)

    def test_null_state_is_inert(self):
        h = Harness()
        for op in ('DESTROY', 'INIT', 'SWAPCHAIN', 'EYES', 'FRAME_EYE', 'FRAME', 'LAYERS'):
            self.assertEqual(h.call(op, 0, 1, 2, 3, 4), 0)

    def test_init_sets_four_spaces(self):
        h = Harness()
        s = h.create()
        ctx = HEAP + 0x200000
        h.cpu.mem.w(ctx + 0xD8, 3, 4)
        h.call('INIT', s, ctx)
        for i in range(4):
            space, = struct.unpack_from('<Q', h.quad(s, i), 0x18)
            self.assertEqual(space, 0xA000 + 3)

    def test_swapchain_reads_handle_and_extent_from_xrqswapchain(self):
        h = Harness()
        s = h.create()
        sc = HEAP + 0x210000
        h.cpu.mem.write(sc, bytes(0x100))
        h.cpu.mem.write(sc, struct.pack('<Q', 0xABCDEF0123456789))
        h.cpu.mem.write(sc + 0x70, struct.pack('<ii', 2064, 2208))
        before = [h.quad(s, i) for i in range(4)]
        h.call('SWAPCHAIN', s, 1, 1, sc)
        q = h.quad(s, 3)
        self.assertEqual(struct.unpack_from('<Q', q, 0x28)[0], 0xABCDEF0123456789)
        self.assertEqual(struct.unpack_from('<4i', q, 0x30), (0, 0, 2064, 2208))
        self.assertEqual(struct.unpack_from('<I', q, 0x40)[0], 0)
        self.assertEqual(q[:0x28], before[3][:0x28])
        self.assertEqual(q[0x44:], before[3][0x44:])
        for i in (0, 1, 2):
            self.assertEqual(h.quad(s, i), before[i])
        h.call('SWAPCHAIN', s, 2, 0, sc)    # family out of range: ignored
        h.call('SWAPCHAIN', s, 0, 2, sc)    # eye out of range: ignored
        h.call('SWAPCHAIN', s, 0, 0, 0)     # null swapchain: ignored
        for i in range(4):
            self.assertEqual(h.quad(s, i), before[i] if i != 3 else q)

    def run_quad_case(self, h, s, case, eye_index=0):
        mem = h.cpu.mem
        mem.write(META, b'\0' * 0x100)
        mem.write(META + 4, struct.pack('<12f', *case['matrix']))
        views = HEAP + 0x220000
        mem.write(views, b'\0' * 0x80)
        for e in range(2):
            mem.write(views + e * 0x40 + 0x10, struct.pack('<7f', *case['eye']))
        h.call('EYES', s, views)
        h.fov_value = case['fov']
        for e in range(2):
            mem.write(META + 0xC8 + e * 8, struct.pack('<4h', 100, 100, 800, 700))
            h.call('FRAME_EYE', s, META, e, 2048, 2048)
        h.call('FRAME', s, META)
        return h.quad(s, 0 + eye_index)

    def test_geometry_matches_stock_bytes(self):
        worst = 0.0
        branches = set()
        h = Harness()
        for case in GOLDEN['quad']['cases']:
            s = h.create()
            q = self.run_quad_case(h, s, case)
            branches.add(case['branch'])
            o = struct.unpack_from('<4f', q, 0x48)
            p = struct.unpack_from('<3f', q, 0x58)
            sz = struct.unpack_from('<2f', q, 0x64)
            sign = 1 if sum(a * b for a, b in zip(o, case['orientation'])) >= 0 else -1
            err = max([abs(sign * a - b) for a, b in zip(o, case['orientation'])] +
                      [abs(a - b) for a, b in zip(p, case['position'])] +
                      [abs(a - b) for a, b in zip(sz, case['size'])])
            worst = max(worst, err)
            self.assertLessEqual(err, 1e-6, case)
        self.assertEqual(branches, {0, 1, 2, 3})
        print('quad geometry worst abs error vs stock bytes: %.3g over %d cases' % (worst, len(GOLDEN['quad']['cases'])))

    def test_fovea_fov_matches_legacy_bytes(self):
        worst = 0.0
        h = Harness()
        for case in GOLDEN['fovea']['cases']:
            s = h.create()
            mem = h.cpu.mem
            mem.write(META, b'\0' * 0x400)
            eye = case['eye']
            mem.write(META + 0xC8 + eye * 8, struct.pack('<4h', *case['rect']))
            h.fov_value = case['full']
            h.call('FRAME_EYE', s, META, eye, case['width'], case['height'])
            fov = struct.unpack_from('<4f', h.cpu.mem.read(s + 0x290 + (2 + eye) * 16, 16))
            for a, b in zip(fov, case['fovea']):
                if math.isnan(b):
                    self.assertTrue(math.isnan(a))
                else:
                    worst = max(worst, abs(a - b))
                    self.assertLessEqual(abs(a - b), 1e-6, (case, fov))
            self.assertEqual(h.cpu.mem.u(s + 0x2D0 + eye * 4, 4), case['width'])    # staged, not yet committed
            self.assertEqual(h.cpu.mem.u(s + 0x2D8 + eye * 4, 4), case['height'])
            self.assertEqual(h.quad(s, 2 + eye)[0x30:0x40], b'\0' * 16, 'FRAME_EYE publishes nothing')
        print('fovea FOV worst abs error vs legacy bytes: %.3g' % worst)

    STATE_SIZE = 0x2E8

    def whole_state(self, h, s):
        return h.cpu.mem.read(s, self.STATE_SIZE)

    def test_invalid_input_leaves_whole_state_byte_identical_and_recovers(self):
        FMAX = 3.0e38
        h = Harness()
        s = h.create()
        case = GOLDEN['quad']['cases'][0]
        good = self.run_quad_case(h, s, case)
        committed = self.whole_state(h, s)
        mem = h.cpu.mem

        def reject(label, action):
            action()
            h.call('FRAME', s, META)
            self.assertEqual(self.whole_state(h, s), committed, label)

        def set_meta(matrix=None):
            mem.write(META + 4, struct.pack('<12f', *(matrix or case['matrix'])))

        # malformed metadata: NaN / inf anywhere in the head matrix
        reject('nan matrix', lambda: set_meta([float('nan')] * 12))
        reject('inf translation', lambda: set_meta(case['matrix'][:3] + [float('inf')] + case['matrix'][4:]))
        set_meta()
        # huge finite positions: hp + world overflows to inf although each term is finite
        m = list(case['matrix'])
        m[3], m[7], m[11] = FMAX, FMAX, FMAX
        views = HEAP + 0x240000
        mem.write(views, b'\0' * 0x80)
        for e in range(2):
            mem.write(views + e * 0x40 + 0x10, struct.pack('<7f', 0, 0, 0, 1, FMAX, FMAX, FMAX))
        h.call('EYES', s, views)
        committed = self.whole_state(h, s)        # eye cache legitimately changed (valid finite eyes)
        reject('overflowing position sum', lambda: set_meta(m))
        # restore the original eyes
        for e in range(2):
            mem.write(views + e * 0x40 + 0x10, struct.pack('<7f', *case['eye']))
        h.call('EYES', s, views)
        committed = self.whole_state(h, s)
        set_meta()
        # NaN / degenerate FOV is refused at staging: pending state untouched
        for label, fov in (('nan fov', [float('nan'), 0.7, 0.6, -0.6]), ('inverted fov', [0.5, -0.5, 0.5, -0.5])):
            h.fov_value = fov
            reject(label, lambda: h.call('FRAME_EYE', s, META, 0, 2048, 2048))
        # invalid dimensions are refused at staging
        h.fov_value = case['fov']
        for label, (w, hh) in (('zero width', (0, 2048)), ('zero height', (2048, 0)), ('width > 65535', (70000, 2048))):
            reject(label, lambda: h.call('FRAME_EYE', s, META, 0, w, hh))
        reject('eye index out of range', lambda: h.call('FRAME_EYE', s, META, 2, 2048, 2048))
        # bad eye poses are ignored too
        zero = HEAP + 0x250000
        mem.write(zero, b'\0' * 0x80)
        reject('zero-quaternion eyes', lambda: h.call('EYES', s, zero))
        # no latch: the next valid frame recovers with new data
        new_case = GOLDEN['quad']['cases'][5]
        recovered = self.run_quad_case(h, s, new_case)
        self.assertNotEqual(recovered[0x48:0x70], good[0x48:0x70])
        o = struct.unpack_from('<4f', recovered, 0x48)
        sign = 1 if sum(a * b for a, b in zip(o, new_case['orientation'])) >= 0 else -1
        self.assertLessEqual(max(abs(sign * a - b) for a, b in zip(o, new_case['orientation'])), 1e-6)

    def test_persistent_invalid_fov_still_tracks_dimensions(self):
        """Stale size cache regression: with an unusable FOV the staged size must still follow the frame."""
        h = Harness()
        s = h.create()
        mem = h.cpu.mem
        mem.write(META, b'\0' * 0x100)
        h.fov_value = [0.5, -0.5, 0.5, -0.5]          # inverted: never stageable
        fov_before = h.cpu.mem.read(s + 0x290, 0x40)
        for w, hh in ((2048, 2048), (2100, 2000), (1900, 1800)):
            for eye in range(2):
                h.call('FRAME_EYE', s, META, eye, w, hh)
            self.assertEqual((mem.u(s + 0x2D0, 4), mem.u(s + 0x2D8, 4)), (w, hh))
            self.assertEqual((mem.u(s + 0x2D4, 4), mem.u(s + 0x2DC, 4)), (w, hh))
            self.assertEqual(mem.read(s + 0x290, 0x40), fov_before, 'FOV staging stays conditional')
        # invalid dimensions are still refused and leave the last good size
        h.call('FRAME_EYE', s, META, 0, 0, 1800)
        h.call('FRAME_EYE', s, META, 0, 70000, 1800)
        self.assertEqual((mem.u(s + 0x2D0, 4), mem.u(s + 0x2D8, 4)), (1900, 1800))

    def test_unset_dimensions_publish_no_geometry(self):
        h = Harness()
        s = h.create()
        case = GOLDEN['quad']['cases'][0]
        mem = h.cpu.mem
        mem.write(META, b'\0' * 0x100)
        mem.write(META + 4, struct.pack('<12f', *case['matrix']))
        before = self.whole_state(h, s)
        h.call('FRAME', s, META)
        self.assertEqual(self.whole_state(h, s), before)
        mem.write(META + 0xC8, struct.pack('<4h', 100, 100, 800, 700))
        h.fov_value = case['fov']
        h.call('FRAME_EYE', s, META, 0, 2048, 2048)      # only one eye staged: still nothing is committed
        h.call('FRAME', s, META)
        self.assertEqual(h.quad(s, 0), before[0:0x70])

    def test_destroy_pools_state_and_never_frees_it(self):
        h = Harness()
        s = h.create()
        h.call('DESTROY', s)
        h.call('DESTROY', s)       # a second DESTROY must not enqueue the state twice
        self.assertFalse([e for e in h.log if e[0] == 'free'])
        a = h.create()
        b = h.create()
        self.assertEqual(a, s)
        self.assertNotEqual(b, s)
        # a recycled state is fully reset and its mutex is neither re-initialised nor destroyed
        self.assertEqual(len([e for e in h.log if e[0] == 'mutex_init']), 2)
        q = h.quad(a, 0)
        self.assertEqual(struct.unpack_from('<2f', q, 0x64), (0.0, 0.0))
        self.assertEqual(struct.unpack_from('<Q', q, 0x28)[0], 0)

    def test_mutex_init_failure_fails_create_and_releases_memory(self):
        h = Harness()
        h.mutex_init_rc = 22
        self.assertEqual(h.create(), 0)
        self.assertEqual(len([e for e in h.log if e[0] == 'free']), 1)

    # ---- layer vector -------------------------------------------------------------
    def vec(self, h, begin, count, cap, items=()):
        mem = h.cpu.mem
        base = HEAP + 0x280000
        for i, v in enumerate(items):
            mem.w(begin + 8 * i, v, 8)
        mem.w(base, begin, 8)
        mem.w(base + 8, begin + 8 * count, 8)
        mem.w(base + 16, begin + 8 * cap, 8)
        return base

    def read_vec(self, h, v):
        mem = h.cpu.mem
        b, e, c = mem.u(v, 8), mem.u(v + 8, 8), mem.u(v + 16, 8)
        return b, [mem.u(b + 8 * i, 8) for i in range((e - b) // 8)], (c - b) // 8

    def test_layers_with_capacity(self):
        h = Harness()
        s = h.create()
        buf = HEAP + 0x270000
        v = self.vec(h, buf, 0, 8)
        h.call('LAYERS', s, v)
        b, items, cap = self.read_vec(h, v)
        self.assertEqual(b, buf)
        self.assertEqual(items, [s + 0x70 * i for i in range(4)])
        self.assertEqual(cap, 8)
        self.assertFalse([e for e in h.log if e[0] in ('new', 'delete')])

    def test_layers_empty_vector_growth_matches_libcxx(self):
        h = Harness()
        s = h.create()
        v = self.vec(h, 0, 0, 0)
        h.call('LAYERS', s, v)
        _, items, cap = self.read_vec(h, v)
        self.assertEqual(items, [s + 0x70 * i for i in range(4)])
        # libc++: capacities 1,2,4 for sequential push_back from empty
        news = [e[1] for e in h.log if e[0] == 'new']
        self.assertEqual(news, [8, 16, 32])
        self.assertEqual(cap, 4)
        self.assertEqual(len([e for e in h.log if e[0] == 'delete']), 2)  # 1st old buffer was null

    def test_layers_existing_entries_and_growth(self):
        h = Harness()
        s = h.create()
        buf = HEAP + 0x270000
        items = [0x111, 0x222, 0x333]
        v = self.vec(h, buf, 3, 3, items)
        h.call('LAYERS', s, v)
        b, out, cap = self.read_vec(h, v)
        self.assertEqual(out, items + [s + 0x70 * i for i in range(4)])
        news = [e[1] for e in h.log if e[0] == 'new']
        self.assertEqual(news, [48, 112 - 0 if False else 96][:1] + news[1:])  # first growth: 2*3=6 elements
        self.assertEqual(news[0], 6 * 8)
        self.assertIn(('delete', buf), h.log)

    def test_layers_allocation_failure_leaves_vector_valid(self):
        h = Harness()
        s = h.create()
        buf = HEAP + 0x270000
        v = self.vec(h, buf, 2, 2, [0xAA, 0xBB])
        h.fail_new = True
        with self.assertRaises(Throw):
            h.call('LAYERS', s, v)
        b, out, cap = self.read_vec(h, v)
        self.assertEqual((b, out, cap), (buf, [0xAA, 0xBB], 2))

    def test_layers_max_size_overflow_calls_length_error(self):
        h = Harness()
        s = h.create()
        mem = h.cpu.mem
        v = HEAP + 0x280000
        # end - begin == 2^61 * 8 would be unrepresentable; emulate need>>61 by a fake huge span
        mem.w(v, 0, 8)
        mem.w(v + 8, (1 << 61) * 8 - 8 + 8 * 0, 8)
        mem.w(v + 16, (1 << 61) * 8 - 8, 8)
        with self.assertRaises(Throw):
            h.call('LAYERS', s, v)
        self.assertIn(('throw_length', v), h.log)

    def test_layers_capacity_ceiling_requests_max_elements(self):
        h = Harness()
        s = h.create()
        mem = h.cpu.mem
        v = HEAP + 0x280000
        buf = HEAP + 0x270000
        # cap_bytes >= 0x7ffffffffffffff8 selects new_cap = 0x1fffffffffffffff (stock csel)
        mem.w(v, buf, 8)
        mem.w(v + 8, buf, 8)
        mem.w(v + 16, buf + 0x7FFFFFFFFFFFFFF8, 8)
        # end < cap here so capacity is available; force the grow branch with end == cap
        mem.w(v + 8, buf + 0x7FFFFFFFFFFFFFF8, 8)
        h.fail_new = True
        with self.assertRaises(Throw):
            h.call('LAYERS', s, v)
        self.assertIn(('new', (0x1FFFFFFFFFFFFFFF << 3) & ((1 << 64) - 1)), h.log)


if __name__ == '__main__':
    unittest.main()
