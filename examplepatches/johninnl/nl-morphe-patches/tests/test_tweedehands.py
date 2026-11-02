"""Genuine-artifact regressions for the Belgian original and retained behavior."""
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET

from verify_dumpert import Smali
from verify_tweedehands import A, verify


@unittest.skipUnless(os.environ.get('TWEEDEHANDS_FIXTURES'),
                     'Set TWEEDEHANDS_FIXTURES to the ignored genuine extraction')
class GenuineOriginalTests(unittest.TestCase):
    def setUp(self):
        self.fixtures = Path(os.environ['TWEEDEHANDS_FIXTURES'])
        self.root = self.fixtures / 'decoded'
        self.apk = self.fixtures / 'xapk/be.tweedehands.m.apk'

    def test_original_bytecode_manifest_and_package_are_pinned(self):
        verify(self.root, set(), self.apk)

    def test_unvalidated_build_is_rejected(self):
        with tempfile.TemporaryDirectory() as scratch:
            root = Path(scratch)
            shutil.copyfile(self.root / 'AndroidManifest.xml', root / 'AndroidManifest.xml')
            metadata = (self.root / 'apktool.yml').read_text()
            (root / 'apktool.yml').write_text(metadata.replace('versionCode: 633464', 'versionCode: 633465'))
            with self.assertRaisesRegex(AssertionError, 'Unaudited 2dehands build'):
                verify(root, set(), self.apk)

    def test_manifest_privilege_mutation_is_rejected_before_code_access(self):
        with tempfile.TemporaryDirectory() as scratch:
            root = Path(scratch)
            tree = ET.parse(self.root / 'AndroidManifest.xml')
            tree.getroot().find('application').set(A + 'debuggable', 'true')
            tree.write(root / 'AndroidManifest.xml')
            with self.assertRaisesRegex(AssertionError, 'original manifest changed'):
                verify(root, set(), self.apk)

    def test_retained_listing_getter_mutation_is_rejected(self):
        original = Smali.body
        owner = 'Lcom/horizon/android/feature/search/search/model/FlexibleSearchResponse;'
        def changed(source, actual_owner, signature):
            body = original(source, actual_owner, signature)
            if (actual_owner, signature) == (owner, 'getItems()Ljava/util/List;'):
                body = body.replace('return-object p0', 'const/4 p0, 0x0\n    return-object p0')
            return body
        with patch.object(Smali, 'body', changed):
            with self.assertRaisesRegex(AssertionError, 'retained graph changed'):
                verify(self.root, set(), self.apk)

    def test_same_metadata_does_not_admit_another_apk(self):
        with tempfile.TemporaryDirectory() as scratch:
            apk = Path(scratch) / 'changed.apk'
            apk.write_bytes(self.apk.read_bytes() + b'changed')
            with self.assertRaisesRegex(AssertionError, 'Original Belgian APK changed'):
                verify(self.root, set(), apk)


if __name__ == '__main__':
    unittest.main()
