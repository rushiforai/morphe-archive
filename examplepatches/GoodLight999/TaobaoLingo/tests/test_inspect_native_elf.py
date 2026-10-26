#!/usr/bin/env python3
"""Native inventory smoke on a locally compiled shared object, not Taobao."""
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "inspect_native_elf.py"


@unittest.skipUnless(shutil.which("gcc") and shutil.which("readelf"),
                     "gcc/binutils not installed")
class NativeELFInventoryTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.dir = Path(self.temp.name)
        self.apk = self.dir / "fixture.apk"
        self.output = self.dir / "report.json"

    def run_inventory(self, *extra):
        return subprocess.run(
            [sys.executable, str(SCRIPT), str(self.apk),
             "--json-out", str(self.output), *extra],
            capture_output=True, text=True, check=False,
        )

    def test_native_needed_and_jni_symbol(self):
        source = self.dir / "fixture.c"
        source.write_text(
            '#include <stdio.h>\n'
            'int JNI_OnLoad(void *vm, void *reserved) { '
            'puts("DinamicX"); return 0x10006; }\n'
        )
        shared = self.dir / "libfixture.so"
        subprocess.run(["gcc", "-shared", "-fPIC", "-o", str(shared),
                        str(source)], check=True)
        with ZipFile(self.apk, "w") as out:
            out.write(shared, "lib/arm64-v8a/libfixture.so")
            out.writestr("assets/other", b"not-a-native-library")
        done = self.run_inventory()
        self.assertEqual(done.returncode, 0, done.stderr)
        report = json.loads(self.output.read_text())
        self.assertEqual(report["library_count"], 1)
        library = report["libraries"]["lib/arm64-v8a/libfixture.so"]
        self.assertIn("JNI_OnLoad", library["jni_exports"])
        self.assertIn("DinamicX", library["markers"])
        self.assertIn("libc.so.6", library["needed"])
        self.assertNotIn("error", library)

    def test_non_elf_is_explicitly_invalid(self):
        with ZipFile(self.apk, "w") as out:
            out.writestr("lib/arm64-v8a/libbad.so", b"NOT_AN_ELF")
        done = self.run_inventory()
        self.assertEqual(done.returncode, 0, done.stderr)
        report = json.loads(self.output.read_text())
        self.assertEqual(report["libraries"]["lib/arm64-v8a/libbad.so"]["error"],
                         "No ELF magic")


if __name__ == "__main__":
    unittest.main()
