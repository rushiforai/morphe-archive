"""Black-box regression checks for split/native/asset preservation."""
import io
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile
from build_pizza_native_delta import encode

LIBRARY = "lib/arm64-v8a/libcocos2dcpp.so"


def archive(entries):
    data = io.BytesIO()
    with zipfile.ZipFile(data, "w") as output:
        for name, value in entries.items():
            output.writestr(name, value)
    return data.getvalue()


class AssetPreservationTests(unittest.TestCase):
    def verify(self, patched_entries, extra_split=None, delta=None, visibility=None, native_deltas=None, standalone=False):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            splits = {"base.apk": archive({"assets/base": b"base"}),
                      "split_native.apk": archive({LIBRARY: b"native"}),
                      "split_assets.apk": archive({"assets/save-template": b"initial"})}
            if extra_split:
                splits["split_conflict.apk"] = archive(extra_split)
            original = archive({"AndroidManifest.xml": b"manifest", **self.originals()}) if standalone else archive(splits)
            (root / "original.apkm").write_bytes(original)
            (root / "patched.apk").write_bytes(archive(patched_entries))
            arguments = [sys.executable, str(Path(__file__).with_name("verify_pizza_assets.py")),
                         str(root / "original.apkm"), str(root / "patched.apk")]
            if delta is not None:
                (root / "bootstrap.gz").write_bytes(delta)
                arguments += ["--bootstrap-delta", str(root / "bootstrap.gz")]
            if visibility is not None:
                (root / "visibility.json").write_text(json.dumps(visibility))
                arguments += ["--store-visibility", str(root / "visibility.json")]
            for index, (name, value) in enumerate((native_deltas or {}).items()):
                path = root / f"native-{index}.gz"
                path.write_bytes(value)
                arguments += ["--native-delta", f"{name}={path}"]
            return subprocess.run(arguments,
                                  capture_output=True, text=True)

    def originals(self):
        return {"assets/base": b"base", LIBRARY: b"native",
                "assets/save-template": b"initial"}

    def test_preserved_all_splits(self):
        result = self.verify(self.originals())
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('"verified_assets": 2', result.stdout)

    def test_standalone_full_apk_preserves_assets_and_native(self):
        result = self.verify(self.originals(), standalone=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('"input_apks": 1', result.stdout)
        entries = self.originals() | {LIBRARY: b"wrong"}
        self.assertNotEqual(self.verify(entries, standalone=True).returncode, 0)

    def test_changed_native_library_fails(self):
        entries = self.originals()
        entries[LIBRARY] = b"changed"
        self.assertNotEqual(self.verify(entries).returncode, 0)

    def test_missing_asset_split_fails(self):
        entries = self.originals()
        del entries["assets/save-template"]
        self.assertNotEqual(self.verify(entries).returncode, 0)

    def test_conflicting_input_splits_fail(self):
        self.assertNotEqual(self.verify(self.originals(), {"assets/base": b"conflict"}).returncode, 0)

    def test_exact_bootstrap_reconstruction_passes(self):
        entries = self.originals()
        entries[LIBRARY] = b"restored"
        result = self.verify(entries, delta=encode(b"native", b"restored"))
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_bootstrap_does_not_allow_arbitrary_native_changes(self):
        entries = self.originals()
        entries[LIBRARY] = b"wrong"
        self.assertNotEqual(self.verify(entries, delta=encode(b"native", b"restored")).returncode, 0)

    def test_bootstrap_does_not_allow_asset_changes(self):
        entries = self.originals()
        entries[LIBRARY] = b"restored"
        entries["assets/save-template"] = b"wrong"
        self.assertNotEqual(self.verify(entries, delta=encode(b"native", b"restored")).returncode, 0)

    def test_bootstrap_for_different_input_fails(self):
        self.assertNotEqual(self.verify(self.originals(), delta=encode(b"other", b"native")).returncode, 0)

    def test_multiple_reviewed_native_libraries(self):
        other = "lib/arm64-v8a/libunity.so"
        entries = self.originals() | {LIBRARY: b"restored", other: b"unity restored"}
        deltas = {LIBRARY: encode(b"native", b"restored"), other: encode(b"unity", b"unity restored")}
        result = self.verify(entries, {other: b"unity"}, native_deltas=deltas)
        self.assertEqual(result.returncode, 0, result.stderr)
        entries[other] = b"incorrect reconstruction"
        self.assertNotEqual(self.verify(entries, {other: b"unity"}, native_deltas=deltas).returncode, 0)

    def test_native_delta_requires_actual_original_library(self):
        result = self.verify(self.originals(), native_deltas={
            "lib/arm64-v8a/absent.so": encode(b"native", b"restored")})
        self.assertNotEqual(result.returncode, 0)

    def visibility(self):
        return {"input_sha256": hashlib.sha256(b"restored").hexdigest(),
                "output_sha256": hashlib.sha256(b"hidden").hexdigest()}

    def test_reviewed_visibility_after_bootstrap_passes(self):
        entries = self.originals()
        entries[LIBRARY] = b"hidden"
        result = self.verify(entries, delta=encode(b"native", b"restored"), visibility=self.visibility())
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_visibility_requires_matching_input(self):
        entries = self.originals()
        entries[LIBRARY] = b"hidden"
        self.assertNotEqual(self.verify(entries, visibility=self.visibility()).returncode, 0)

    def test_visibility_rejects_unrelated_asset_change(self):
        entries = self.originals()
        entries[LIBRARY] = b"hidden"
        entries["assets/save-template"] = b"changed"
        self.assertNotEqual(self.verify(entries, delta=encode(b"native", b"restored"),
                                       visibility=self.visibility()).returncode, 0)


if __name__ == "__main__":
    unittest.main()
