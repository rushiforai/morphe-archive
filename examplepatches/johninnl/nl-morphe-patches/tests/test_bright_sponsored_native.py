"""Static contracts for the Bright advertorial leaf; no target or CPU execution.

Pass --original /path/to/libapp.so to verify exact publisher preimages as well.
The readable assembly is assembled with the existing clang and compared with
production bytes. No emulator or additional package is required.
"""
import argparse
import hashlib
from pathlib import Path
import re
import shutil
import struct
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
BASE = 0x4549ec
HOOK = 0x499fc8
RETURNS = {0x49a018, 0x499fcc}
ORIGINAL = None


def elf_sections(data):
    offset = struct.unpack_from('<Q', data, 40)[0]
    width, count = struct.unpack_from('<HH', data, 58)
    return [struct.unpack_from('<IIQQQQIIQQ', data, offset + width * i) for i in range(count)]


def signed(value, bits):
    return value - (1 << bits) if value & (1 << (bits - 1)) else value


class SponsoredNativeContract(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = (ROOT / 'patches/src/main/kotlin/patches/bright/SponsoredNative.kt').read_text()
        payload = cls.source.split('private val sponsoredLeafCode = nativeBytes(', 1)[1].split('\n)', 1)[0]
        cls.code = bytes.fromhex(''.join(re.findall(r'"([0-9a-f]+)"', payload)))
        cls.words = struct.unpack('<' + 'I' * (len(cls.code) // 4), cls.code)

    def test_assembly_matches_production_bytes(self):
        clang = shutil.which('clang')
        self.assertIsNotNone(clang, 'Existing clang is required for the assembly contract')
        with tempfile.TemporaryDirectory(prefix='bright-sponsored-assembly-') as directory:
            target = Path(directory) / 'leaf.o'
            subprocess.run([clang, '--target=aarch64-linux-android24', '-c',
                            str(ROOT / 'tests/fixtures/bright-sponsored-filter.s'), '-o', str(target)], check=True)
            data = target.read_bytes()
            executable = [section for section in elf_sections(data) if section[1] == 1 and section[2] & 4]
            self.assertEqual(len(executable), 1)
            section = executable[0]
            self.assertEqual(data[section[4] + BASE:section[4] + section[5]], self.code)
        self.assertEqual(len(self.code), 0x18c)
        self.assertEqual(hashlib.sha256(self.code).hexdigest(), '3bb6b1f807be3db8d880a570fbaab8232001744689ed1f845fc62cb9f042337f')

    def test_leaf_has_only_bounded_reads_scratch_writes_and_original_continuations(self):
        branches, writes, reads = [], [], []
        for index, word in enumerate(self.words):
            address = BASE + index * 4
            if word & 0xfc000000 == 0x14000000:  # B, never BL
                branches.append((address, address + signed(word & 0x3ffffff, 26) * 4))
            elif word & 0xff000010 == 0x54000000:  # B.eq / B.ne
                self.assertIn(word & 15, (0, 1))
                branches.append((address, address + signed((word >> 5) & 0x7ffff, 19) * 4))
            elif word & 0x7f000000 == 0x36000000:  # TBZ for tagged-pointer checks
                branches.append((address, address + signed((word >> 5) & 0x3fff, 14) * 4))
            elif word & 0xffe00c00 in (0xf8400000, 0xb8400000, 0x78400000, 0x38400000):
                writes.append((address, word & 31))
                reads.append(word & 0xffe00c00)
            elif word & 0xff200000 == 0x8b000000 or word & 0xffc00000 == 0xd3400000:
                writes.append((address, word & 31))  # ADD / UBFX
            elif word & 0xffe0fc1f == 0x6b00001f or word & 0xffc0001f in (0x7100001f, 0xf100001f):
                pass  # CMP writes condition flags only
            else:
                self.fail(f'Unexpected instruction or safepoint at {address:#x}: {word:#010x}')
        self.assertEqual({target for _, target in branches if not BASE <= target < BASE + len(self.code)}, RETURNS)
        for source, target in branches:
            self.assertEqual(target % 4, 0)
            self.assertTrue(target in RETURNS or source < target < BASE + len(self.code),
                            'Every internal branch is forward: bounded leaf, no loops')
        self.assertEqual([(at, register) for at, register in writes if register not in (16, 17)], [(BASE + 0x184, 1)])
        self.assertEqual(reads.count(0x78400000), 11)  # TwoByteString character reads
        self.assertEqual(reads.count(0x38400000), 11)  # OneByteString character reads
        self.assertEqual(self.code[-8:-4].hex(), 'a1035df8')  # Displaced age load replayed
        self.assertEqual(0x14000000 | (((BASE - HOOK) >> 2) & 0x3ffffff), 0x17feea89)

    def test_exact_metadata_checks_fail_open_and_keep_age_filter(self):
        assembly = (ROOT / 'tests/fixtures/bright-sponsored-filter.s').read_text()
        self.assertIn('cmp x17, #398', assembly)  # Actual BuiltNewsCategory layout
        self.assertIn('cmp x17, #94', assembly)
        self.assertIn('cmp x17, #95', assembly)
        self.assertEqual(assembly.count('cmp w17, #22'), 2)  # Smi length eleven
        for width in ('ldurb', 'ldurh'):
            offsets = [15 + i * (2 if width == 'ldurh' else 1) for i in range(11)]
            for offset, character in zip(offsets, 'advertorial'):
                self.assertIn(f'{width} w17, [x16, #{offset}]\ncmp w17, #{ord(character)}\nb.ne pass', assembly)
        self.assertGreaterEqual(assembly.count('b.eq pass'), 3)  # Null record/category/functionality
        self.assertEqual(assembly.count('tbz w16, #0, pass'), 2)  # Unknown immediate values
        self.assertIn('ldur x1, [x29, #-0x30]', assembly)
        self.assertNotIn('newsTitle', assembly)

    def test_original_executable_body_hooks_and_complete_functions(self):
        if ORIGINAL is None:
            self.skipTest('Pass --original for publisher ELF preimage checks')
        data = ORIGINAL.read_bytes()
        phoff = struct.unpack_from('<Q', data, 32)[0]
        width, count = struct.unpack_from('<HH', data, 54)
        segments = [struct.unpack_from('<IIQQQQQQ', data, phoff + width * i) for i in range(count)]
        def original(address, size):
            matches = [entry for entry in segments if entry[0] == 1 and entry[1] & 1
                       and entry[3] <= address and address + size <= entry[3] + entry[5]]
            self.assertEqual(len(matches), 1)
            segment = matches[0]
            offset = segment[2] + address - segment[3]
            return data[offset:offset + size]
        self.assertEqual(hashlib.sha256(original(0x499d74, 0x10b0)).hexdigest(),
                         'aa64da5687cb64bdb91ee85da537b1eb88a71ccd6f059da73aec0b33eacd480f')
        self.assertEqual(original(HOOK, 4).hex(), 'a1035df8')
        self.assertEqual(hashlib.sha256(original(0x4549dc, 0x2bc)).hexdigest(),
                         '0b7b2e7d43f8af48c952c7a0b6423e5fd08a14e53b5f19b4d03251045c7381a0')
        before = self.source.split('private val sponsoredLeafOriginal = nativeBytes(', 1)[1].split('\n)', 1)[0]
        self.assertEqual(original(BASE, len(self.code)), bytes.fromhex(''.join(re.findall(r'"([0-9a-f]+)"', before))))
        self.assertEqual(original(0x4549e8, 4).hex(), 'a1831ff8')
        self.assertEqual(original(0x454c70, 4).hex(), 'e00316aa')
        # Audit every original direct control-flow instruction in executable
        # segments. The sole incoming edge is the banner's own overflow retry,
        # also unreachable once entry branches directly to its genuine tail.
        incoming = []
        for segment in segments:
            if segment[0] != 1 or not segment[1] & 1:
                continue
            for delta in range(0, segment[5] - 3, 4):
                source = segment[3] + delta
                word = struct.unpack_from('<I', data, segment[2] + delta)[0]
                target = None
                if word & 0x7c000000 == 0x14000000:
                    target = source + signed(word & 0x3ffffff, 26) * 4
                elif word & 0xff000010 == 0x54000000 or word & 0x7e000000 == 0x34000000:
                    target = source + signed((word >> 5) & 0x7ffff, 19) * 4
                elif word & 0x7e000000 == 0x36000000:
                    target = source + signed((word >> 5) & 0x3fff, 14) * 4
                if target is not None and BASE <= target < BASE + len(self.code) and not BASE <= source < BASE + len(self.code):
                    incoming.append((source, target))
        self.assertEqual(incoming, [(0x454c84, 0x4549f8)])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--original', type=Path)
    args, remaining = parser.parse_known_args()
    ORIGINAL = args.original
    unittest.main(argv=[__file__, *remaining])
