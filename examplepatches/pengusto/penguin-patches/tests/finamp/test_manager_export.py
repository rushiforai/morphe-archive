"""An asynchronous Save must not accept an empty, growing, or unsigned APK."""
from pathlib import Path
import subprocess
import tempfile
import unittest
import xml.etree.ElementTree as ET
from unittest.mock import patch

from manager_case import pull_verified_export, wait_for_export, verify_save_directory


class ExportTests(unittest.TestCase):
    def test_save_destination_is_independent_of_picker_search_location(self):
        root = ET.Element('hierarchy')
        for name in ('Downloads', 'finamp-manager-test'):
            ET.SubElement(root, 'node', {'package': 'com.android.documentsui',
                                        'resource-id': 'com.android.documentsui:id/breadcrumb_text', 'text': name})
        self.assertEqual(verify_save_directory(root, '/sdcard/Download/finamp-manager-test'),
                         '/sdcard/Download/finamp-manager-test')
        with self.assertRaises(RuntimeError):
            verify_save_directory(root, '/sdcard/Download')
        ET.SubElement(root, 'node', {'package': 'com.android.documentsui',
                                    'resource-id': 'com.android.documentsui:id/breadcrumb_text', 'text': 'another-folder'})
        with self.assertRaises(RuntimeError):
            verify_save_directory(root, '/sdcard/Download/finamp-manager-test')

    def test_waits_through_missing_empty_and_growing_document(self):
        class UI:
            sizes = iter(['', '0', '3', '3', '6', '6', '6', '6'])

            def adb(self, *args, **kwargs):
                return next(self.sizes)

        with patch('manager_case.time.sleep'):
            self.assertEqual(wait_for_export(UI(), '/test.apk'), 6)

    def test_empty_document_times_out(self):
        class UI:
            def adb(self, *args, **kwargs):
                return '0'

        with patch('manager_case.time.monotonic', side_effect=[0, 0, 1, 2]), \
                patch('manager_case.time.sleep'), self.assertRaises(RuntimeError):
            wait_for_export(UI(), '/test.apk', timeout=2)

    def test_truncated_or_unsigned_pull_is_rejected(self):
        class UI:
            def adb(self, *args, **kwargs):
                Path(args[2]).write_bytes(b'apk')

        with tempfile.TemporaryDirectory() as directory:
            target = Path(directory) / 'export.apk'
            with patch('manager_case.wait_for_export', return_value=6), \
                    patch('manager_case.subprocess.check_output') as verify, \
                    self.assertRaises(RuntimeError):
                pull_verified_export(UI(), '/test.apk', target, Path('/apksigner'))
            verify.assert_not_called()
            with patch('manager_case.wait_for_export', return_value=3), \
                    patch('manager_case.subprocess.check_output',
                          side_effect=subprocess.CalledProcessError(1, 'apksigner')), \
                    self.assertRaises(subprocess.CalledProcessError):
                pull_verified_export(UI(), '/test.apk', target, Path('/apksigner'))

    def test_accepts_supported_signer_formats_and_rejects_distinct_signers(self):
        class UI:
            def adb(self, *args, **kwargs):
                Path(args[2]).write_bytes(b'apk')

        signer = 'a' * 64
        signatures = [f'Signer #1 certificate SHA-256 digest: {signer}\n',
                      f'V2 Signer: certificate SHA-256 digest: {signer}\n',
                      f'V3.0 Signer: certificate SHA-256 digest: {signer}\n']
        with tempfile.TemporaryDirectory() as directory, patch('manager_case.wait_for_export', return_value=3):
            target = Path(directory) / 'export.apk'
            for signature in signatures:
                with self.subTest(signature=signature), patch('manager_case.subprocess.check_output', return_value=signature):
                    self.assertEqual(pull_verified_export(UI(), '/test.apk', target, Path('/apksigner'))['signer_sha256'], signer)
            with patch('manager_case.subprocess.check_output', return_value=signatures[0] + signatures[1].replace(signer, 'b' * 64)):
                with self.assertRaises(RuntimeError):
                    pull_verified_export(UI(), '/test.apk', target, Path('/apksigner'))
