"""Failures the independent native verifier must catch before it can certify an APK."""
import struct
import unittest
import hashlib
import importlib.util
import json
from pathlib import Path
from unittest.mock import patch

try:
    from tvgids_native_contracts import executable_offset, native_layout
except ModuleNotFoundError:
    executable_offset = native_layout = None

try:
    from tvgids_native_vm import DartMachine, FunctionRange
except ModuleNotFoundError:
    DartMachine = FunctionRange = None


def image(wide=True, machine=None):
    """One file-backed executable range; virtual/file offsets deliberately differ."""
    data = bytearray(512)
    data[:7] = b'\x7fELF' + bytes([2 if wide else 1, 1, 1])
    struct.pack_into('<HHI', data, 16, 3, machine or (183 if wide else 40), 1)
    if wide:
        struct.pack_into('<Q', data, 32, 64)
        struct.pack_into('<HHH', data, 52, 64, 56, 1)
        struct.pack_into('<IIQQQQQQ', data, 64, 1, 5, 256, 0x1000, 0x1000, 32, 64, 1)
    else:
        struct.pack_into('<I', data, 28, 52)
        struct.pack_into('<HHH', data, 40, 52, 32, 1)
        struct.pack_into('<IIIIIIII', data, 52, 1, 256, 0x1000, 0x1000, 32, 64, 5, 1)
    return data


class TvgidsNativeContracts(unittest.TestCase):
    def setUp(self):
        self.assertIsNotNone(native_layout, 'TVgids independent ELF verifier is missing')

    def test_file_offsets_come_from_load_segment_on_each_abi(self):
        for abi, wide, machine in [('arm64-v8a', True, 183), ('armeabi-v7a', False, 40), ('x86_64', True, 62)]:
            with self.subTest(abi=abi):
                layout = native_layout(image(wide, machine), abi)
                self.assertEqual(executable_offset(layout, 0x1008, 4), 264)
                self.assertEqual(executable_offset(layout, 0x101c, 4), 284)

    def test_tracking_ownership_cannot_allow_partial_or_unowned_changes(self):
        from tvgids_native_contracts import verify_ad_output
        original=image();owner_hash=hashlib.sha256(original[256:288]).hexdigest()
        def edit(at,after):
            return dict(name='synthetic',address=0x1000,size=32,sha256=owner_hash,
                        at=at,before='00000000',after=after)
        data={'tvgids_ad_native_edits.json':{'arm64-v8a':[edit(0x1000,'01020304')]},
              'tvgids_tracking_native_edits.json':{'arm64-v8a':[edit(0x1008,'05060708')]}}
        expected=hashlib.sha256(original).hexdigest()
        output=bytearray(original);output[256:260]=bytes.fromhex('01020304');output[264:268]=bytes.fromhex('05060708')
        with patch.object(Path,'read_text',autospec=True,side_effect=lambda p:json.dumps(data[p.name])):
            verify_ad_output('arm64-v8a',original,output,expected,tracking=True)
            with self.assertRaisesRegex(AssertionError,'outside declared ownership'):
                verify_ad_output('arm64-v8a',original,output,expected)
            partial=bytearray(output);partial[264:268]=b'\0'*4
            with self.assertRaisesRegex(AssertionError,'effect missing'):
                verify_ad_output('arm64-v8a',original,partial,expected,tracking=True)
            unowned=bytearray(output);unowned[280]=1
            with self.assertRaisesRegex(AssertionError,'outside declared ownership'):
                verify_ad_output('arm64-v8a',original,unowned,expected,tracking=True)
            data['tvgids_tracking_native_edits.json']['arm64-v8a'][0]['at']=0x1000
            with self.assertRaisesRegex(AssertionError,'Overlapping'):
                verify_ad_output('arm64-v8a',original,output,expected,tracking=True)

    def test_memory_only_tail_and_cross_segment_range_are_rejected(self):
        layout = native_layout(image(), 'arm64-v8a')
        for address, size in [(0x1020, 4), (0x101c, 8), (0xffc, 4), (0x1000, 0), (-1, 4), (2**64-2, 4)]:
            with self.subTest(address=address, size=size), self.assertRaises(AssertionError):
                executable_offset(layout, address, size)

    def test_consent_ownership_requires_tracking_and_both_regions(self):
        from tvgids_native_contracts import verify_ad_output
        original = image()
        digest = hashlib.sha256(original).hexdigest()
        owner_hash = hashlib.sha256(original[256:288]).hexdigest()
        def edit(at, after):
            return dict(name='controlled owner', address=0x1000, size=32, sha256=owner_hash,
                        at=at, before='00000000', after=after)
        ads = [edit(0x1000, '01020304')]
        tracking = [edit(0x1004, '05060708')]
        consent = [edit(0x1008, '090a0b0c'), edit(0x1010, '0d0e0f10')]
        data = {'tvgids_ad_native_edits.json': {'arm64-v8a': ads},
                'tvgids_tracking_native_edits.json': {'arm64-v8a': tracking},
                'tvgids_consent_native_edits.json': {'arm64-v8a': consent}}
        output = bytearray(original)
        for row in ads+tracking+consent:
            offset = 256+row['at']-0x1000
            output[offset:offset+4] = bytes.fromhex(row['after'])
        with patch.object(Path, 'read_text', autospec=True, side_effect=lambda p: json.dumps(data[p.name])):
            verify_ad_output('arm64-v8a', original, output, digest, tracking=True, consent=True)
            with self.assertRaisesRegex(AssertionError, 'requires tracking'):
                verify_ad_output('arm64-v8a', original, output, digest, consent=True)
            for offset in (264, 272):
                partial = bytearray(output)
                partial[offset:offset+4] = b'\0'*4
                with self.assertRaisesRegex(AssertionError, 'effect missing'):
                    verify_ad_output('arm64-v8a', original, partial, digest, tracking=True, consent=True)
            with self.assertRaisesRegex(AssertionError, 'outside declared ownership'):
                verify_ad_output('arm64-v8a', original, output, digest, tracking=True)
            data['tvgids_consent_native_edits.json']['arm64-v8a'][0]['at'] = 0x1004
            with self.assertRaisesRegex(AssertionError, 'Overlapping'):
                verify_ad_output('arm64-v8a', original, output, digest, tracking=True, consent=True)

    def test_non_executable_and_ambiguous_mappings_are_rejected(self):
        data = image()
        struct.pack_into('<I', data, 68, 4)
        with self.assertRaisesRegex(AssertionError, 'executable'):
            executable_offset(native_layout(data, 'arm64-v8a'), 0x1000, 4)
        data = image()
        struct.pack_into('<H', data, 56, 2)
        data[120:176] = data[64:120]
        with self.assertRaisesRegex(AssertionError, 'executable'):
            executable_offset(native_layout(data, 'arm64-v8a'), 0x1000, 4)

    def test_headers_and_program_tables_are_bounded_before_reads(self):
        for wide, abi in [(False, 'armeabi-v7a'), (True, 'arm64-v8a')]:
            for position, value in [(0, 0), (4, 9), (5, 2), (6, 2), (18, 0)]:
                data = image(wide)
                data[position] = value
                with self.subTest(wide=wide, position=position), self.assertRaises(AssertionError):
                    native_layout(data, abi)
            data = image(wide)
            struct.pack_into('<Q' if wide else '<I', data, 32 if wide else 28, len(data)-1)
            with self.assertRaisesRegex(AssertionError, 'program'):
                native_layout(data, abi)
            for length in [0, 16, 51, 63 if wide else 52]:
                with self.subTest(wide=wide, length=length), self.assertRaises(AssertionError):
                    native_layout(image(wide)[:length], abi)

    def test_file_bounds_and_virtual_overflow_are_rejected(self):
        data = image()
        struct.pack_into('<Q', data, 64+32, 2**64-1)
        with self.assertRaises(AssertionError):
            native_layout(data, 'arm64-v8a')
        data = image()
        struct.pack_into('<Q', data, 64+16, 2**64-16)
        with self.assertRaises(AssertionError):
            native_layout(data, 'arm64-v8a')


@unittest.skipUnless(importlib.util.find_spec('unicorn'), 'CPU fixtures require the isolated native verification environment')
class TvgidsCpuContracts(unittest.TestCase):
    def setUp(self):
        self.assertIsNotNone(DartMachine, 'TVgids bounded machine-code executor is missing')

    def fixture(self, code):
        data = image(True, 62)
        data[256:256+len(code)] = code
        owner = FunctionRange('controlled CPU fixture', 0x1000, len(code), hashlib.sha256(code).hexdigest())
        return data, owner

    def test_actual_cpu_follows_argument_branch_and_restores_stack(self):
        # test rdi,rdi; jz zero; mov eax,1; ret; zero: xor eax,eax; ret
        data, owner = self.fixture(bytes.fromhex('4885ff7406b801000000c331c0c3'))
        for argument, want in [(0, 0), (1, 1)]:
            vm = DartMachine('x86_64', data, [owner])
            vm.register('rdi', argument)
            self.assertEqual(vm.run(owner.address), want)

    def test_unknown_call_and_invalid_instruction_fail_closed(self):
        for code, reason in [(bytes.fromhex('e80b000000c3'), 'Unmodeled native entry'),
                             (bytes.fromhex('0f0b'), 'native CPU')]:
            data, owner = self.fixture(code)
            with self.subTest(reason=reason), self.assertRaisesRegex(AssertionError, reason):
                DartMachine('x86_64', data, [owner]).run(owner.address)

    def test_range_hash_cannot_certify_other_instructions(self):
        data, owner = self.fixture(bytes.fromhex('31c0c3'))
        data[256] ^= 1
        with self.assertRaisesRegex(AssertionError, 'function hash'):
            DartMachine('x86_64', data, [owner])


if __name__ == '__main__':
    unittest.main()
