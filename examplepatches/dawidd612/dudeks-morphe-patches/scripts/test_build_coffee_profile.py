import gzip
import hashlib
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile


BUILDER = Path(__file__).with_name('build_coffee_profile.py')


class ProfileGenerationTest(unittest.TestCase):
    def prepare(self, root):
        splits = root / 'splits'
        inputs = root / 'inputs'
        splits.mkdir()
        inputs.mkdir()
        embedded = io.BytesIO()
        with zipfile.ZipFile(embedded, 'w') as archive:
            archive.writestr('classes.dex', b'firebase-test-dex')
        (inputs / 'libFirebaseCppApp-test.so').write_bytes(b'ELF-prefix' + embedded.getvalue())
        with zipfile.ZipFile(splits / 'split_UnityData.apk', 'w') as archive:
            archive.writestr('assets/bin/Data/test.unity3d', b'pack-content')
        return splits

    def generate(self, evidence, splits, output, *options):
        return subprocess.run([sys.executable, str(BUILDER), str(evidence), '--splits',
                               str(splits), '--output', str(output), *options],
                              capture_output=True, text=True)

    def test_unprotected_profile_needs_no_capture_and_keeps_common_resources(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            splits = self.prepare(root)
            output = root / 'profile'
            result = self.generate(root / 'no-capture', splits, output, '--unprotected')
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual({p.name for p in output.iterdir()},
                             {'firebase-app.dex', 'asset-packs.tsv.gz', 'sha256.json'})
            self.assertEqual((output / 'firebase-app.dex').read_bytes(), b'firebase-test-dex')
            manifest = gzip.decompress((output / 'asset-packs.tsv.gz').read_bytes()).decode()
            expected = 'assets/bin/Data/test.unity3d\t' + hashlib.sha256(b'pack-content').hexdigest() + '\n'
            self.assertEqual(manifest, expected)

    def test_protected_mode_still_requires_captures(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            result = self.generate(root / 'no-capture', self.prepare(root), root / 'profile')
            self.assertNotEqual(result.returncode, 0)
            self.assertFalse((root / 'profile').exists())


if __name__ == '__main__':
    unittest.main()
