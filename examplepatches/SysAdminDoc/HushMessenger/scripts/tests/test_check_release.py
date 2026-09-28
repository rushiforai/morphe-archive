import copy
import hashlib
import importlib.util
import io
import json
import struct
import tempfile
import unittest
import zipfile
from contextlib import redirect_stderr
from pathlib import Path

spec = importlib.util.spec_from_file_location(
    "check_release", Path(__file__).parents[1] / "check_release.py"
)
release = importlib.util.module_from_spec(spec)
spec.loader.exec_module(release)


class ReleaseChecks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.bundle = self.root / "patches/build/libs/patches-1.2.3.mpp"
        self.bundle.parent.mkdir(parents=True)
        with zipfile.ZipFile(self.bundle, "w") as archive:
            archive.writestr(
                "META-INF/MANIFEST.MF",
                "Manifest-Version: 1.0\r\nVersion: 1.2.3\r\nTimestamp: 1790552148000\r\n\r\n",
            )
            archive.writestr("classes.dex", b"fixture")
            archive.writestr("extensions/messenger.mpe", b"fixture")
        self.digest = hashlib.sha256(self.bundle.read_bytes()).hexdigest()
        self.catalog = {
            "version": "1.2.3",
            "patches": [
                {"name": f"Control {n}", "default": True, "dependencies": []}
                for n in range(21)
            ],
        }
        self.index = {
            "version": "1.2.3",
            "created_at": "2026-09-27T23:35:48",
            "download_url": "https://github.com/SysAdminDoc/HushMessenger/releases/download/v1.2.3/patches-1.2.3.mpp",
        }
        self.write(
            "gradle.properties", "version=1.2.3\nbundleTimestampMillis=1790552148000\n"
        )
        self.write("patches-bundle.json", json.dumps(self.index))
        self.write("patches-list.json", json.dumps(self.catalog))
        self.write(
            "patches/build/reports/catalog-evidence.json",
            json.dumps(
                {
                    "bundle": self.bundle.name,
                    "sha256": self.digest,
                    "catalog": self.catalog,
                }
            ),
        )
        self.write(
            "README.md",
            f"https://img.shields.io/badge/version-1.2.3-blue\n{self.digest}  patches-1.2.3.mpp\n",
        )
        self.write("CHANGELOG.md", "# Changelog\n\n## 1.2.3 (2026-09-27)\n")
        self.write(
            "extensions/messenger/build.gradle.kts",
            "versionName = project.version.toString()\n",
        )

    def write(self, path, text):
        target = self.root / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8")

    def test_complete_release_passes_and_explicit_tag_or_checksum_mismatch_fails(self):
        self.assertIn(
            "Release metadata passed", release.verify(self.root, release_tag="v1.2.3")
        )
        with self.assertRaisesRegex(ValueError, "tag differs"):
            release.verify(self.root, release_tag="v1.2.4")
        self.write("SHA256SUMS.txt", f"{self.digest}  {self.bundle.name}\n")
        release.verify(self.root, checksums=self.root / "SHA256SUMS.txt")
        self.write("SHA256SUMS.txt", f"{'0' * 64}  {self.bundle.name}\n")
        with self.assertRaisesRegex(ValueError, "checksum file"):
            release.verify(self.root, checksums=self.root / "SHA256SUMS.txt")

    def test_changed_catalog_metadata_and_stale_artifact_evidence_fail(self):
        for key, value in [
            ("name", "Different"),
            ("default", False),
            ("category", "Changed"),
            ("dependencies", ["Different"]),
        ]:
            altered = copy.deepcopy(self.catalog)
            altered["patches"][0][key] = value
            self.write("patches-list.json", json.dumps(altered))
            with (
                self.subTest(key=key),
                self.assertRaisesRegex(ValueError, "catalog differs"),
            ):
                release.verify(self.root)
        self.write("patches-list.json", json.dumps(self.catalog))
        with self.bundle.open("ab") as handle:
            handle.write(b"changed")
        with self.assertRaisesRegex(ValueError, "evidence is stale"):
            release.verify(self.root)

    def test_version_url_timestamp_readme_and_extension_drift_fail(self):
        cases = [
            (
                "patches-bundle.json",
                json.dumps({**self.index, "version": "1.2.4"}),
                "index version",
            ),
            (
                "patches-bundle.json",
                json.dumps(
                    {
                        **self.index,
                        "download_url": self.index["download_url"].replace(
                            "v1.2.3", "v1.2.4"
                        ),
                    }
                ),
                "download URL",
            ),
            (
                "patches-bundle.json",
                json.dumps(
                    {**self.index, "created_at": self.index["created_at"] + "Z"}
                ),
                "local date-time",
            ),
            (
                "patches-bundle.json",
                json.dumps({**self.index, "created_at": "2026-09-27T23:35:49"}),
                "timestamps differ",
            ),
            (
                "README.md",
                f"https://img.shields.io/badge/version-1.2.4-blue\n{self.digest}  {self.bundle.name}\n",
                "badge",
            ),
            (
                "README.md",
                f"https://img.shields.io/badge/version-1.2.3-blue\n{'0' * 64}  {self.bundle.name}\n",
                "checksum",
            ),
            ("CHANGELOG.md", "## Unreleased\n\n## 1.2.3 (2026-09-27)\n", "changelog"),
            (
                "extensions/messenger/build.gradle.kts",
                'versionName = "1.2.2"\n',
                "Extension version",
            ),
        ]
        for path, changed, message in cases:
            original = (self.root / path).read_text(encoding="utf-8")
            self.write(path, changed)
            with (
                self.subTest(path=path, message=message),
                self.assertRaisesRegex(ValueError, message),
            ):
                release.verify(self.root)
            self.write(path, original)

    def test_cli_rejects_malformed_or_missing_evidence_without_traceback(self):
        for invalid in ['{"version": "1", "version": "2"}', "[]", "{"]:
            self.write("patches/build/reports/catalog-evidence.json", invalid)
            error = io.StringIO()
            with redirect_stderr(error):
                self.assertEqual(1, release.main(["--root", str(self.root)]))
            self.assertIn("CHECK FAILED:", error.getvalue())
            self.assertNotIn("Traceback", error.getvalue())
        self.bundle.unlink()
        error = io.StringIO()
        with redirect_stderr(error):
            self.assertEqual(1, release.main(["--root", str(self.root)]))
        self.assertIn("CHECK FAILED:", error.getvalue())

    def test_corrupt_deflate_manifest_has_a_controlled_cli_error(self):
        with zipfile.ZipFile(self.bundle) as archive:
            entries = [(name, archive.read(name)) for name in archive.namelist()]
        with zipfile.ZipFile(
            self.bundle, "w", compression=zipfile.ZIP_DEFLATED
        ) as archive:
            for name, data in entries:
                archive.writestr(name, data)
        with zipfile.ZipFile(self.bundle) as archive:
            offset = archive.getinfo("META-INF/MANIFEST.MF").header_offset
        raw = bytearray(self.bundle.read_bytes())
        name_length, extra_length = struct.unpack_from("<HH", raw, offset + 26)
        raw[offset + 30 + name_length + extra_length] = 0x07
        self.bundle.write_bytes(raw)
        error = io.StringIO()
        with redirect_stderr(error):
            self.assertEqual(1, release.main(["--root", str(self.root)]))
        self.assertIn("CHECK FAILED:", error.getvalue())
        self.assertNotIn("Traceback", error.getvalue())


if __name__ == "__main__":
    unittest.main()
