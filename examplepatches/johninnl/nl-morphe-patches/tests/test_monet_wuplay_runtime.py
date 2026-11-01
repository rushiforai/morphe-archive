"""Run the actual adapter/subscription against the reviewed Monet 1.1.0 ABI."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
FIXTURES = ROOT / 'tests/fixtures/monet-wuplay'
EXTENSION = ROOT / 'extensions/monet-wuplay/src/main/java/nl/johninnl/monetwuplay/MonetWuplayCatalogs.java'


class MonetWuplayRuntimeTests(unittest.TestCase):
    def test_native_picker_refresh_membership_and_lifecycle(self):
        self.assertTrue(EXTENSION.exists(), 'Dedicated Monet Wuplay extension is not implemented')
        with tempfile.TemporaryDirectory() as directory:
            subprocess.run(['javac', '-d', directory, str(FIXTURES / 'RuntimeVerifier.java')], check=True, capture_output=True)
            result = subprocess.run(['java', '-cp', directory, 'RuntimeVerifier', str(EXTENSION), directory,
                                     str(FIXTURES / 'Fixture.java')], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
