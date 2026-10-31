"""Komikku catalogue documentation uses the real installed-APK pair."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]

class KomikkuPreviewTest(unittest.TestCase):
    def test_pair_and_guide_are_directly_embedded(self):
        data = {'version': 'candidate', 'patches': [{
            'name': 'Keep local manga in exclusion searches', 'description': 'Retain unrelated local manga',
            'default': False, 'compatiblePackages': [{'packageName': 'app.komikku', 'name': 'Komikku',
                                                    'targets': [{'version': '1.14.1'}]}]}]}
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            (tmp / 'metadata.json').write_text(json.dumps(data))
            (tmp / 'README.md').write_text((ROOT / 'README.md').read_text())
            command = [sys.executable, str(ROOT / '.github/scripts/generate_patches_readme.py'),
                       'pengusto/penguin-patches', 'dev', str(tmp / 'metadata.json'), str(tmp / 'README.md')]
            subprocess.run(command, check=True, capture_output=True)
            rendered = (tmp / 'README.md').read_text()
            self.assertIn('docs/KOMIKKU.md', rendered)
            previews = rendered.split('<!-- PATCHES_PREVIEWS_START -->')[1].split('<!-- PATCHES_PREVIEWS_END -->')[0]
            for side in ('before', 'after'):
                self.assertIn(f'src="tests/komikku/evidence/2026-10-30/{side}.png"', previews)
                self.assertTrue((ROOT / f'tests/komikku/evidence/2026-10-30/{side}.png').is_file())
            self.assertIn('actual Morphe Manager 2.2.0 JVM export', previews)
            self.assertIn('1 patch · 1 app', rendered)
            subprocess.run(command, check=True, capture_output=True)
            self.assertEqual((tmp / 'README.md').read_text(), rendered)

if __name__ == '__main__': unittest.main()
