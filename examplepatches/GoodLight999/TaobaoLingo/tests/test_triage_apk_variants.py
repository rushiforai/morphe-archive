#!/usr/bin/env python3
"""Fast deterministic fixtures for APK triage (synthetic ZIPs, not Taobao)."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "triage_apk_variants.py"
ELF = b"\x7fELF\x02\x01" + bytes(12) + b"\xb7\x00" + bytes(50)


def write(path, *, dex=b"same-dex", lib=ELF, assets=b"same-assets", sig=b"original"):
    with ZipFile(path, "w") as z:
        z.writestr("classes.dex", b"base")
        z.writestr("classes6.dex", dex)
        z.writestr("lib/arm64-v8a/libfoo.so", lib)
        z.writestr("assets/mytaobao/mtb_2025.json", assets)
        z.writestr("resources.arsc", b"same-resources")
        z.writestr("AndroidManifest.xml", b"same-manifest")
        z.writestr("META-INF/TEST.RSA", sig)


class ThreeVariantTriageTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.folder = Path(self.temp.name)
        self.original = self.folder / "original.apk"
        self.resigned = self.folder / "resigned.apk"
        self.patched = self.folder / "patched.apk"
        self.report = self.folder / "result.json"
        self.markdown = self.folder / "result.md"

    def run_triage(self, *extra):
        return subprocess.run(
            [sys.executable, str(SCRIPT), str(self.original), str(self.resigned),
             str(self.patched), "--json-out", str(self.report),
             "--markdown-out", str(self.markdown), *extra],
            capture_output=True, text=True, check=False,
        )

    def test_expected_three_way_diff(self):
        write(self.original)
        write(self.resigned, sig=b"replacement")
        write(self.patched, dex=b"four-method-patch", sig=b"replacement")
        result = self.run_triage("--strict-control", "--strict-native")
        self.assertEqual(result.returncode, 0, result.stderr)
        doc = json.loads(self.report.read_text())
        self.assertFalse(doc["original_hash_matches_studied_version"])
        self.assertEqual(doc["comparisons"]["original -> resigned_only"]
                         ["non_signature_changes"], [])
        self.assertEqual(doc["comparisons"]["resigned_only -> patched"]
                         ["non_signature_changes"], ["classes6.dex"])
        self.assertIn("native_library", {x["category"] for x in
                                         __import__("importlib").import_module(
                                             "scripts.triage_apk_variants"
                                         ).scan(self.original)["entries"].values()})
        self.assertIn("classes6.dex", self.markdown.read_text())

    def test_control_detects_resource_rewrite(self):
        write(self.original)
        write(self.resigned, assets=b"modified")
        write(self.patched)
        result = self.run_triage("--strict-control")
        self.assertEqual(result.returncode, 1, result.stderr)
        doc = json.loads(self.report.read_text())
        self.assertEqual(doc["comparisons"]["original -> resigned_only"]
                         ["non_signature_changes"],
                         ["assets/mytaobao/mtb_2025.json"])

    def test_native_change_is_not_ignored(self):
        write(self.original)
        write(self.resigned)
        write(self.patched, lib=ELF + b"modified")
        result = self.run_triage("--strict-native")
        self.assertEqual(result.returncode, 1, result.stderr)
        doc = json.loads(self.report.read_text())
        self.assertEqual(doc["comparisons"]["original -> patched"]
                         ["native_library_changes"], ["lib/arm64-v8a/libfoo.so"])

    def test_duplicate_names_fail_closed(self):
        write(self.original)
        write(self.resigned)
        write(self.patched)
        # Simulate malformed ZIP; scanner must refuse ambiguous name resolution.
        from zipfile import ZipFile
        import warnings
        with warnings.catch_warnings():
            warnings.simplefilter("ignore", UserWarning)
            with ZipFile(self.original, "a") as z:
                z.writestr("classes.dex", b"duplicate")
        self.assertEqual(self.run_triage().returncode, 2)


if __name__ == "__main__":
    unittest.main()
