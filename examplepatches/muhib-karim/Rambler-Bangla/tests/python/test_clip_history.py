"""Run the real pure-Java history policy/store without Android or third-party libraries."""
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[2]
PKG = Path('com/akshaykadam/pixelboard/extension/rambler')


class ClipHistoryTests(unittest.TestCase):
    @unittest.skipUnless(shutil.which('javac') and shutil.which('java'), 'JDK required for JVM harness')
    def test_store_and_privacy_contract(self):
        with tempfile.TemporaryDirectory() as tmp:
            sources = [ROOT / 'extension-src' / PKG / name for name in
                       ('ClipHistoryStore.java', 'ClipHistoryPolicy.java', 'ClipHistoryGboardPrivacy.java')]
            sources.extend(sorted((ROOT / 'tests/java/clipboard-fixture').glob('*.java')))
            sources.append(ROOT / 'tests/java' / PKG / 'ClipHistoryStoreTest.java')
            compiled = subprocess.run(['javac', '-J-Xmx256m', '--release', '8', '-d', tmp,
                                       *map(str, sources)], capture_output=True, text=True)
            self.assertEqual(compiled.returncode, 0, compiled.stderr)
            ran = subprocess.run(['java', '-Xmx256m', '-cp', tmp,
                                  'com.akshaykadam.pixelboard.extension.rambler.ClipHistoryStoreTest'],
                                 capture_output=True, text=True)
            self.assertEqual(ran.returncode, 0, ran.stderr)
            self.assertIn('history assertions passed', ran.stdout)
