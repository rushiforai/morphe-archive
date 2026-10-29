#!/usr/bin/env python3
import hashlib
import random
import struct
import unittest
import zlib

from pfd import HEADER, MAGIC, apply_delta, make_delta


class DeltaTests(unittest.TestCase):
    def test_actual_bsdiff_round_trips_edits_and_seeks(self):
        randomizer = random.Random(104)
        old = bytes(randomizer.randrange(256) for _ in range(8192))
        cases = [(b'', b''), (b'', b'new'), (b'old', b''), (old, old),
                 (old, old[:100] + b'inserted text' + old[120:]),
                 (old, old[4096:] + old[:4096]), (old, b'x' * 4096)]
        for original, modified in cases:
            with self.subTest(lengths=(len(original), len(modified))):
                delta = make_delta(original, modified)
                self.assertEqual(apply_delta(original, delta), modified)

    def test_rejects_wrong_original_and_corruption(self):
        delta = make_delta(b'original data', b'fixed data')
        invalid = [delta[:80], b'BAD!' + delta[4:], delta + b'trailing', delta[:-1]]
        for value in invalid:
            with self.assertRaises(ValueError):
                apply_delta(b'original data', value)
        with self.assertRaises(ValueError):
            apply_delta(b'wrong input!!', delta)

    def test_rejects_oversized_or_negative_control_bounds(self):
        old, new = b'old', b'x'
        for control in [(-1, 2, 0), (2, 0, 0), (0, 2, 0)]:
            header = HEADER.pack(MAGIC, len(old), len(new), hashlib.sha256(old).digest(), hashlib.sha256(new).digest(), 24, 0, 1)
            with self.assertRaises(ValueError):
                apply_delta(old, header + zlib.compress(struct.pack('<qqq', *control) + b'x'))

    def test_rejects_false_output_hash_and_incomplete_output(self):
        old = b'base'
        header = HEADER.pack(MAGIC, len(old), 1, hashlib.sha256(old).digest(), b'\0' * 32, 24, 0, 1)
        with self.assertRaises(ValueError):
            apply_delta(old, header + zlib.compress(struct.pack('<qqq', 0, 1, 0) + b'x'))
        header = HEADER.pack(MAGIC, len(old), 1, hashlib.sha256(old).digest(), hashlib.sha256(b'x').digest(), 0, 0, 1)
        with self.assertRaises(ValueError):
            apply_delta(old, header + zlib.compress(b'x'))


if __name__ == '__main__':
    unittest.main()
