import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile

HERE = Path(__file__).parent


def load(name):
    spec = importlib.util.spec_from_file_location(name, HERE / (name + ".py"))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


split = load("split_bundles")
verify = load("verify_split_bundles")


class SplitBundlesTest(unittest.TestCase):
    def test_split_preserves_payloads_and_excludes_other_apps(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            original = root / "full.mpp"
            with zipfile.ZipFile(original, "w") as z:
                z.writestr("META-INF/MANIFEST.MF", "Manifest-Version: 1.0\r\nName: Penguin Patches\r\n\r\n")
                z.writestr("io/github/pengusto/patches/finamp/FinampNativePatchKt.class", b"individual")
                z.writestr("io/github/pengusto/patches/finamp/FinampCompositionKt.class", b"shared")
                z.writestr("io/github/pengusto/patches/calendar/Calendar.class", b"calendar")
                for mask in sorted(split.EXPECTED_MASKS):
                    z.writestr(f"finamp/1.0.1/arm64-v8a/{mask}.pfd", str(mask).encode())
                z.writestr("extensions/calendar.mpe", b"extension")
                z.writestr("classes.dex", b"dex\nold")
            d8 = root / "d8"
            d8.write_text("#!/bin/sh\nwhile [ \"$1\" != --output ]; do shift; done\nprintf 'dex\\nnew' > \"$2/classes.dex\"\n")
            d8.chmod(0o755)
            compact = root / "compiled"
            compact_entry = compact / "io/github/pengusto/patches/finamp/FinampCompactPatchKt.class"
            compact_entry.parent.mkdir(parents=True)
            compact_entry.write_bytes(b"complete")
            for kind in ("standard", "finamp", "finamp-individual", "combined"):
                output = root / (kind + ".mpp")
                split.make_bundle(original, output, kind, d8, root / "android.jar", root / "classpath.jar", compact)
                verify.verify(original, output, kind, compact)
                with zipfile.ZipFile(output) as z:
                    names = set(z.namelist())
                    self.assertEqual("finamp/1.0.1/arm64-v8a/1.pfd" in names, kind == "finamp-individual")
                    self.assertEqual(split.ALL_FIXES_DELTA in names, kind != "standard")
                    self.assertEqual("io/github/pengusto/patches/finamp/FinampNativePatchKt.class" in names, kind == "finamp-individual")
                    self.assertEqual("io/github/pengusto/patches/finamp/FinampCompactPatchKt.class" in names, kind in ("finamp", "combined"))
                    self.assertEqual("extensions/calendar.mpe" in names, kind in ("standard", "combined"))
                    self.assertEqual("io/github/pengusto/patches/calendar/Calendar.class" in names, kind in ("standard", "combined"))
            subprocess.run([sys.executable, str(HERE / "verify_split_bundles.py"), "--full", str(original),
                            "--standard", str(root / "standard.mpp"), "--finamp", str(root / "finamp.mpp"),
                            "--finamp-individual", str(root / "finamp-individual.mpp"),
                            "--combined", str(root / "combined.mpp"), "--compact-classes", str(compact)],
                           check=True, capture_output=True, text=True)

    def test_verifier_rejects_a_changed_payload(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            full = root / "full.mpp"
            bad = root / "standard.mpp"
            with zipfile.ZipFile(full, "w") as z:
                z.writestr("META-INF/MANIFEST.MF", "Name: Penguin Patches\r\n")
                z.writestr("io/github/pengusto/patches/finamp/A.class", b"a")
                z.writestr("finamp/1.0.1/1.pfd", b"native")
                z.writestr("extensions/calendar.mpe", b"correct")
                z.writestr("classes.dex", b"dex\nfull")
            with zipfile.ZipFile(bad, "w") as z:
                z.writestr("META-INF/MANIFEST.MF", "Name: Penguin Patches - Standard\r\n")
                z.writestr("extensions/calendar.mpe", b"wrong")
                z.writestr("classes.dex", b"dex\nnew")
            with self.assertRaisesRegex(ValueError, "changed entry"):
                verify.verify(full, bad, "standard")

    def test_existing_finamp_url_points_to_compact_and_individual_is_separate(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            full = root / "full.mpp"
            with zipfile.ZipFile(full, "w") as z:
                z.writestr("META-INF/MANIFEST.MF", "Name: Penguin Patches\r\n")
                z.writestr("io/github/pengusto/patches/finamp/FinampNativePatchKt.class", b"individual")
                z.writestr("io/github/pengusto/patches/finamp/FinampCompositionKt.class", b"shared")
                z.writestr("io/github/pengusto/patches/calendar/Calendar.class", b"calendar")
                for mask in sorted(split.EXPECTED_MASKS):
                    z.writestr(f"finamp/1.0.1/arm64-v8a/{mask}.pfd", str(mask).encode())
                z.writestr("classes.dex", b"dex\nfull")
            compact = root / "compiled"
            entry = compact / "io/github/pengusto/patches/finamp/FinampCompactPatchKt.class"
            entry.parent.mkdir(parents=True)
            entry.write_bytes(b"complete")
            d8 = root / "d8"
            d8.write_text("#!/bin/sh\nwhile [ \"$1\" != --output ]; do shift; done\nprintf 'dex\\nnew' > \"$2/classes.dex\"\n")
            d8.chmod(0o755)
            meta = root / "input.json"
            meta.write_text(json.dumps({"version": "9.0.0", "description": "notes", "download_url":
                                        "https://github.com/x/y/releases/download/v9.0.0/patches-9.0.0.mpp"}))
            out, md = root / "out", root / "metadata"
            out.mkdir()
            args = ["split", "--bundle", str(full), "--version", "9.0.0", "--metadata", str(meta),
                    "--output-dir", str(out), "--metadata-dir", str(md), "--d8", str(d8),
                    "--android-jar", str(root / "android.jar"), "--classpath", str(root / "classpath.jar"),
                    "--compact-classes", str(compact)]
            with patch.object(sys, "argv", args):
                split.main()
            finamp = json.loads((md / "finamp/patches-bundle.json").read_text())
            individual = json.loads((md / "finamp-individual/patches-bundle.json").read_text())
            self.assertTrue(finamp["download_url"].endswith("/patches-finamp-9.0.0.mpp"))
            self.assertTrue(individual["download_url"].endswith("/patches-finamp-individual-9.0.0.mpp"))
            with zipfile.ZipFile(out / "patches-finamp-9.0.0.mpp") as z:
                self.assertNotIn("finamp/1.0.1/arm64-v8a/1.pfd", z.namelist())
            with zipfile.ZipFile(out / "patches-finamp-individual-9.0.0.mpp") as z:
                self.assertIn("finamp/1.0.1/arm64-v8a/1.pfd", z.namelist())

    def test_compact_rejects_an_incomplete_or_changed_selection_matrix(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            full = root / "full.mpp"
            with zipfile.ZipFile(full, "w") as z:
                z.writestr("io/github/pengusto/patches/finamp/FinampCompositionKt.class", b"shared")
                z.writestr(split.ALL_FIXES_DELTA, b"all")
            compact = root / "compiled"
            entry = compact / "io/github/pengusto/patches/finamp/FinampCompactPatchKt.class"
            entry.parent.mkdir(parents=True)
            entry.write_bytes(b"complete")
            with self.assertRaisesRegex(ValueError, "selection matrix"):
                split.make_bundle(full, root / "compact.mpp", "combined",
                                  root / "d8", root / "android.jar", root / "classpath.jar", compact)


if __name__ == "__main__":
    unittest.main()
