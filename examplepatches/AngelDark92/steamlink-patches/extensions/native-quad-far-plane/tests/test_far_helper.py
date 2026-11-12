"""Run the far-plane variant of libgxr_quad_native.so through the host interpreter.

  python -B -I -m unittest discover -s tests -p "test_*.py"
      (NATIVE_QUAD_FAR_HELPER=<far build>; NATIVE_QUAD_HELPER=<same build> for the scene tests)

The tracked helper carries one writable record: a 15-byte ASCII marker plus NUL at -16, one
little-endian float32 distance at +0x1c30 and one settings byte at +0x1c34 (0 = keep the renderer's
layer chain, 1 = strip a leading XrCompositionLayerSettingsFB node). Every test rewrites those bytes
in a temporary copy so the tracked payload is never modified. Host evidence only: not Bionic, not a
headset.
"""
import os
import shutil
import struct
import tempfile
import unittest

from test_helper import GOLDEN, HEAP, META, STOCK_DISTANCE, Harness, expected_quad

HERE = os.path.dirname(os.path.abspath(__file__))
FAR = os.environ.get('NATIVE_QUAD_FAR_HELPER')
SLOT = 0x1C30
SETTINGS = 0x1C34
MARKER = b'GXRQUADDIST16M0'
BUILD_ID = b'GXR-NATIVE-QUAD-1.3-FARPLANE-ABI1'
FB_SETTINGS = 1000204000
QUAD = 36


def _require(path):
    return path and os.path.exists(path)


def run_quad_case(harness, state, case, eye_index=0):
    """Same staging as test_helper.HelperTests.run_quad_case, usable with any loaded helper."""
    mem = harness.cpu.mem
    mem.write(META, b'\0' * 0x100)
    mem.write(META + 4, struct.pack('<12f', *case['matrix']))
    views = HEAP + 0x220000
    mem.write(views, b'\0' * 0x80)
    for e in range(2):
        mem.write(views + e * 0x40 + 0x10, struct.pack('<7f', *case['eye']))
    harness.call('EYES', state, views)
    harness.fov_value = case['fov']
    for e in range(2):
        mem.write(META + 0xC8 + e * 8, struct.pack('<4h', 100, 100, 800, 700))
        harness.call('FRAME_EYE', state, META, e, 2048, 2048)
    harness.call('FRAME', state, META)
    return harness.quad(state, eye_index)


class FarHelperTests(unittest.TestCase):
    def setUp(self):
        self.scratch = tempfile.mkdtemp(prefix='gxr-far-helper-')
        self.addCleanup(shutil.rmtree, self.scratch, True)

    def variant(self, distance, settings=0):
        data = bytearray(open(FAR, 'rb').read())
        self.assertEqual(data[SLOT - 16:SLOT - 1], MARKER)
        self.assertEqual(data[SLOT - 1], 0)
        struct.pack_into('<f', data, SLOT, distance)
        data[SETTINGS] = settings
        path = os.path.join(self.scratch, 'far-%s-%s.so' % (distance, settings))
        with open(path, 'wb') as handle:
            handle.write(data)
        return path

    def quad(self, helper, case):
        harness = Harness(helper)
        state = harness.create()
        self.assertNotEqual(state, 0)
        return harness, run_quad_case(harness, state, case)

    def chain(self, harness, offset, typ, successor):
        node = harness.renderer + offset
        harness.cpu.mem.write(node, struct.pack('<II', typ, 0))
        harness.cpu.mem.write(node + 8, struct.pack('<Q', successor))
        return node

    def next_of(self, harness, state, index):
        return harness.cpu.mem.u(state + index * 0x70 + 8, 8)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_tracked_payload_layout_and_identity(self):
        data = open(FAR, 'rb').read()
        self.assertEqual(data.find(MARKER), data.rfind(MARKER), 'marker must be unique')
        self.assertEqual(data[SLOT - 16:SLOT - 1], MARKER)
        self.assertEqual(data[SLOT - 1], 0, 'marker must be NUL-terminated')
        self.assertEqual(data[SLOT:SLOT + 4], struct.pack('<f', STOCK_DISTANCE))
        self.assertEqual(data[SETTINGS], 0, 'default settings mode must be keep')
        self.assertIn(BUILD_ID, data)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_default_slot_geometry_matches_the_head_only_model(self):
        for case in GOLDEN['quad']['cases'][::10]:
            _, quad = self.quad(FAR, case)
            want_o, want_p, want_sz = expected_quad(case)
            self.assertLessEqual(max(abs(a - b) for a, b in zip(struct.unpack_from('<4f', quad, 0x48), want_o)), 1e-6)
            self.assertLessEqual(max(abs(a - b) for a, b in zip(struct.unpack_from('<3f', quad, 0x58), want_p)), 1e-6)
            self.assertLessEqual(max(abs(a - b) for a, b in zip(struct.unpack_from('<2f', quad, 0x64), want_sz)), 1e-6)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_orientation_matches_and_position_size_scale_by_distance(self):
        # Zero the head and eye translations so the composed position is exactly the scaled local
        # offset; orientation must not depend on the distance at all.
        for case in GOLDEN['quad']['cases'][::20]:
            matrix = list(case['matrix'])
            matrix[3] = matrix[7] = matrix[11] = 0.0
            eye = list(case['eye'])
            eye[4] = eye[5] = eye[6] = 0.0
            centred = dict(case, matrix=matrix, eye=eye)
            _, expected = self.quad(self.variant(STOCK_DISTANCE), centred)
            for distance in (16, 64, 250):
                _, actual = self.quad(self.variant(distance), centred)
                self.assertEqual(expected[0x48:0x58], actual[0x48:0x58], 'orientation is distance independent')
                ratio = distance / STOCK_DISTANCE
                expected_position = struct.unpack_from('<3f', expected, 0x58)
                actual_position = struct.unpack_from('<3f', actual, 0x58)
                for a, b in zip(actual_position, expected_position):
                    self.assertLessEqual(abs(a - b * ratio), 1e-5 * max(1.0, abs(b * ratio)),
                                         (distance, actual_position))
                expected_size = struct.unpack_from('<2f', expected, 0x64)
                actual_size = struct.unpack_from('<2f', actual, 0x64)
                for a, b in zip(actual_size, expected_size):
                    self.assertLessEqual(abs(a - b * ratio), 1e-5 * max(1.0, abs(b * ratio)),
                                         (distance, actual_size))
                self.assertNotEqual(struct.unpack_from('<2f', actual, 0x64), (0.0, 0.0))

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_out_of_range_slot_makes_create_return_zero(self):
        for bad in (0.5, 0.0, 1001.0, 1.0e9, float('inf'), float('nan'), -16.0):
            harness = Harness(self.variant(bad))
            self.assertEqual(harness.create(), 0, bad)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_range_edges_are_accepted(self):
        for good in (1.0, 1000.0):
            harness = Harness(self.variant(good))
            self.assertNotEqual(harness.create(), 0, good)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_option_distances_create_and_move_geometry(self):
        case = GOLDEN['quad']['cases'][0]
        sizes = {}
        for distance in (16, 64, 250):
            harness, quad = self.quad(self.variant(distance), case)
            sizes[distance] = struct.unpack_from('<2f', quad, 0x64)
            self.assertGreater(sizes[distance][0], 0.0)
        self.assertLess(sizes[16][0], sizes[64][0])
        self.assertLess(sizes[64][0], sizes[250][0])

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_settings_keep_preserves_and_none_strips_the_fb_node(self):
        for settings, strip in ((0, False), (1, True)):
            harness = Harness(self.variant(STOCK_DISTANCE, settings))
            succ_base = HEAP + 0x350000
            succ_fovea = HEAP + 0x350100
            node_base = self.chain(harness, 0x1BF0, FB_SETTINGS, succ_base)
            node_fovea = self.chain(harness, 0x1C08, FB_SETTINGS, succ_fovea)
            state = harness.create()
            self.assertNotEqual(state, 0, settings)
            for index, node, successor in ((0, node_base, succ_base), (1, node_base, succ_base),
                                           (2, node_fovea, succ_fovea), (3, node_fovea, succ_fovea)):
                self.assertEqual(self.next_of(harness, state, index), successor if strip else node, (settings, index))

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_settings_none_leaves_an_unrelated_chain_alone(self):
        harness = Harness(self.variant(STOCK_DISTANCE, 1))
        succ_base = HEAP + 0x350000
        succ_fovea = HEAP + 0x350100
        node_base = self.chain(harness, 0x1BF0, QUAD, succ_base)
        node_fovea = self.chain(harness, 0x1C08, QUAD, succ_fovea)
        state = harness.create()
        self.assertNotEqual(state, 0)
        for index, node in ((0, node_base), (1, node_base), (2, node_fovea), (3, node_fovea)):
            self.assertEqual(self.next_of(harness, state, index), node, index)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_settings_none_accepts_a_null_successor(self):
        harness = Harness(self.variant(STOCK_DISTANCE, 1))
        self.chain(harness, 0x1BF0, FB_SETTINGS, 0)
        self.chain(harness, 0x1C08, FB_SETTINGS, 0)
        state = harness.create()
        self.assertNotEqual(state, 0)
        for index in range(4):
            self.assertEqual(self.next_of(harness, state, index), 0, index)

    @unittest.skipUnless(_require(FAR), 'set NATIVE_QUAD_FAR_HELPER to the far build')
    def test_invalid_settings_mode_fails_create(self):
        for bad in (2, 255):
            harness = Harness(self.variant(STOCK_DISTANCE, bad))
            self.assertEqual(harness.create(), 0, bad)


if __name__ == '__main__':
    unittest.main()
