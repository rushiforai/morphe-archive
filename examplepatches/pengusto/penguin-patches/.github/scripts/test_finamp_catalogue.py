import shutil
import tempfile
import subprocess
import json
import sys
import unittest
from pathlib import Path

from finamp_catalogue import ROOT, SOURCE, catalogue, check_resources

class FinampCatalogueTests(unittest.TestCase):
    def test_features_and_masks_agree(self):
        name, features, mask, masks = catalogue()
        self.assertEqual(name, "Finamp Complete")
        self.assertEqual(len(masks), 2 ** len(features) - 1)
        self.assertIn(mask, masks)

    def test_inconsistent_mask_fails_before_release(self):
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp)
            for path in SOURCE.glob("*.kt"):
                shutil.copy(path, source / path.name)
            path = source / "FinampComposition.kt"
            text = path.read_text()
            current_mask = catalogue(source)[2]
            path.write_text(text.replace(f"FINAMP_COMPLETE_MASK = {current_mask}", f"FINAMP_COMPLETE_MASK = {current_mask ^ 1}"))
            with self.assertRaisesRegex(ValueError, "does not match"):
                catalogue(source)

    def test_duplicate_bit_fails_before_release(self):
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp)
            for path in SOURCE.glob("*.kt"):
                shutil.copy(path, source / path.name)
            path = source / "FinampNativePatch.kt"
            import re
            text = path.read_text()
            bits = re.findall(r'(= finampFeature\(\s*"[^"\n]+"\s*,\s*"[^"\n]*"\s*,\s*)(\d+)(\s*,\s*\))', text)
            self.assertGreaterEqual(len(bits), 2)
            path.write_text(text.replace(''.join(bits[1]), bits[1][0] + bits[0][1] + bits[1][2], 1))
            with self.assertRaisesRegex(ValueError, "unique"):
                catalogue(source)

    def test_missing_payload_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            source = ROOT / "patches/src/main/resources/finamp/1.0.1"
            target = root / "patches/src/main/resources/finamp/1.0.1"
            target.mkdir(parents=True)
            shutil.copy(source / "manifest.properties", target)
            (target / "arm64-v8a").mkdir()
            with self.assertRaisesRegex(ValueError, "payload matrix mismatch"):
                check_resources(root)

    def test_release_metadata_rejects_wrong_complete_name(self):
        with tempfile.TemporaryDirectory() as tmp:
            metadata = Path(tmp) / "patches.json"
            metadata.write_text(json.dumps({"patches": [{"name": "wrong", "compatiblePackages": [
                {"packageName": "com.unicornsonlsd.finamp"}]}]}))
            result = subprocess.run([sys.executable, str(ROOT / ".github/scripts/finamp_catalogue.py"),
                                     "--metadata", str(metadata)], text=True, capture_output=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("must expose exactly", result.stderr)
