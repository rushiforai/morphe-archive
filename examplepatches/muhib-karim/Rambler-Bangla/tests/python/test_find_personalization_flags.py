"""Synthetic-only tests. No Google binary or decompiled content."""
import contextlib
import hashlib
import importlib.util
import io
from pathlib import Path
import struct
import tempfile
import unittest
import zipfile

PATH = Path(__file__).resolve().parents[2] / 'scripts/find_personalization_flags.py'
spec = importlib.util.spec_from_file_location('personalization_analysis', PATH)
scanner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(scanner)


def dex(strings):
    blob = bytearray(0x70 + 4 * len(strings))
    blob[:8] = b'dex\n039\0'
    struct.pack_into('<II', blob, 0x38, len(strings), 0x70)
    for i, value in enumerate(strings):
        raw = value.encode('utf-8')
        assert len(raw) < 128
        struct.pack_into('<I', blob, 0x70 + 4*i, len(blob))
        blob.extend(bytes([len(value)]) + raw + b'\0')
    struct.pack_into('<III', blob, 0x20, len(blob), 0x70, 0x12345678)
    return bytes(blob)


class PersonalizationAnalysisTests(unittest.TestCase):
    def apk(self, members):
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        path = Path(temp.name) / 'synthetic.apk'
        with zipfile.ZipFile(path, 'w') as archive:
            for name, value in members.items():
                archive.writestr(name, value)
        return str(path)

    def test_string_table(self):
        self.assertEqual(scanner.parse_dex_strings(dex(['hello', 'world'])), ['hello', 'world'])

    def test_ui_and_candidate_are_separate(self):
        result = scanner.scan_dex('classes.dex', dex(['Contact names', 'test_contact_names_enabled']))
        self.assertEqual(len(result['ui_hits']), 1)
        self.assertEqual(len(result['key_candidates']), 1)

    def test_no_match_is_valid_report_not_feature_absence(self):
        path = self.apk({'classes.dex': dex(['unrelated'])})
        report = scanner.scan_apk(path)
        self.assertEqual(report['results'][0]['ui_hits'], [])
        self.assertIn('No hits do not prove absence', report['note'])

    def test_multidex_and_input_hash(self):
        path = self.apk({'classes.dex': dex([]), 'classes2.dex': dex(['Voice correction list'])})
        report = scanner.scan_apk(path)
        self.assertEqual(len(report['dex_scanned']), 2)
        self.assertEqual(report['apk_sha256'], hashlib.sha256(Path(path).read_bytes()).hexdigest())

    def test_resource_utf8_and_utf16_leads(self):
        path = self.apk({'classes.dex': dex([]), 'resources.arsc':
                        b'Contact names' + 'Clear all collected words'.encode('utf-16le')})
        self.assertEqual(len(scanner.scan_apk(path)['resource_ui_hits']), 2)

    def test_invalid_zip(self):
        with self.assertRaises(ValueError):
            scanner.scan_apk(str(PATH))

    def test_no_dex(self):
        with self.assertRaises(LookupError):
            scanner.scan_apk(self.apk({'manifest.txt': b'fixture'}))

    def test_invalid_dex(self):
        with self.assertRaises(ValueError):
            scanner.parse_dex_strings(b'not dex')

    def test_unsupported_version(self):
        blob = bytearray(dex([])); blob[4:7] = b'041'
        with self.assertRaises(ValueError):
            scanner.parse_dex_strings(blob)

    def test_inconsistent_size(self):
        blob = bytearray(dex([])); struct.pack_into('<I', blob, 0x20, 9999)
        with self.assertRaises(ValueError):
            scanner.parse_dex_strings(blob)

    def test_string_table_overrun(self):
        blob = bytearray(dex([])); struct.pack_into('<I', blob, 0x38, 100)
        with self.assertRaises(ValueError):
            scanner.parse_dex_strings(blob)

    def test_string_offset_into_header(self):
        blob = bytearray(dex(['x'])); struct.pack_into('<I', blob, 0x70, 8)
        with self.assertRaises(ValueError):
            scanner.parse_dex_strings(blob)

    def test_unterminated_string(self):
        blob = bytearray(dex(['x'])); blob[-1] = 1
        with self.assertRaises(ValueError):
            scanner.parse_dex_strings(blob)

    def test_uleb_overflow(self):
        with self.assertRaises(ValueError):
            scanner._uleb128(b'\xff\xff\xff\xff\x10', 0)

    def test_cli_malformed_second_dex_writes_no_report(self):
        path = self.apk({'classes.dex': dex(['Contact names']), 'classes2.dex': b'bad'})
        output = io.StringIO()
        with contextlib.redirect_stdout(output), contextlib.redirect_stderr(io.StringIO()):
            self.assertEqual(scanner.main(['scanner', path]), 2)
        self.assertEqual(output.getvalue(), '')
