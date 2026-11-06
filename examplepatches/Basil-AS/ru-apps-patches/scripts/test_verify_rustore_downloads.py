import hashlib
import json
import tempfile
import unittest
import zipfile
from pathlib import Path

from verify_rustore_downloads import MatrixError, load_matrix, verify_download


class VerifyRustoreDownloadsTests(unittest.TestCase):
    def write_matrix(self, directory: Path, content: str) -> Path:
        path = directory / "matrix.tsv"
        path.write_text(content, encoding="utf-8")
        return path

    def write_apk_fixture(self, path: Path, payload: bytes) -> None:
        with zipfile.ZipFile(path, "w") as archive:
            archive.writestr("AndroidManifest.xml", payload)

    def test_rejects_missing_required_column(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self.write_matrix(
                Path(tmp),
                "package\tapp_name\tsource_version\tsplit_set\tsha256\tacquisition_status\n"
                "com.example\tExample\t1\tbase\t" + "0" * 64 + "\tverified\n",
            )

            with self.assertRaisesRegex(MatrixError, "version_code"):
                load_matrix(path)

    def test_rejects_duplicate_packages(self):
        row = "com.example\tExample\t1\t123\tbase\t" + "0" * 64 + "\tverified\n"
        with tempfile.TemporaryDirectory() as tmp:
            path = self.write_matrix(
                Path(tmp),
                "package\tapp_name\tsource_version\tversion_code\tsplit_set\tsha256\tacquisition_status\n"
                + row
                + row,
            )

            with self.assertRaisesRegex(MatrixError, "duplicate package"):
                load_matrix(path)

    def test_verifies_sha256_for_downloader_output(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            apk = root / "com.example" / "example.apk"
            apk.parent.mkdir()
            self.write_apk_fixture(apk, b"not-an-executable-apk-fixture")
            digest = hashlib.sha256(apk.read_bytes()).hexdigest()
            (apk.parent / "info.json").write_text(
                json.dumps({"packageName": "com.example", "versionName": "1.2.3", "versionCode": 123}),
                encoding="utf-8",
            )
            row = {
                "package": "com.example",
                "app_name": "Example",
                "source_version": "1.2.3",
                "version_code": "123",
                "split_set": "example",
                "sha256": digest,
                "acquisition_status": "verified",
            }

            evidence = verify_download(row, root)

            self.assertEqual(evidence["package"], "com.example")
            self.assertEqual(evidence["sha256"], digest)
            self.assertEqual(evidence["apk_files"], ["example.apk"])

    def test_rejects_sha256_mismatch(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            apk = root / "com.example" / "example.apk"
            apk.parent.mkdir()
            self.write_apk_fixture(apk, b"changed")
            (apk.parent / "info.json").write_text(
                json.dumps({"packageName": "com.example", "versionName": "1.2.3", "versionCode": 123}), encoding="utf-8"
            )
            row = {
                "package": "com.example",
                "app_name": "Example",
                "source_version": "1.2.3",
                "version_code": "123",
                "split_set": "base",
                "sha256": "0" * 64,
                "acquisition_status": "verified",
            }

            with self.assertRaisesRegex(MatrixError, "sha256 mismatch"):
                verify_download(row, root)

    def test_rejects_truncated_apk(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            apk = root / "com.example" / "example.apk"
            apk.parent.mkdir()
            apk.write_bytes(b"PK\x03\x04truncated")
            (apk.parent / "info.json").write_text(
                json.dumps({"packageName": "com.example", "versionName": "1.2.3", "versionCode": 123}), encoding="utf-8"
            )
            row = {
                "package": "com.example",
                "app_name": "Example",
                "source_version": "1.2.3",
                "version_code": "123",
                "split_set": "example",
                "sha256": hashlib.sha256(apk.read_bytes()).hexdigest(),
                "acquisition_status": "verified",
            }

            with self.assertRaisesRegex(MatrixError, "not a valid ZIP/APK"):
                verify_download(row, root)

    def test_rejects_version_name_mismatch(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            apk = root / "com.example" / "example.apk"
            apk.parent.mkdir()
            self.write_apk_fixture(apk, b"fixture")
            (apk.parent / "info.json").write_text(
                json.dumps({"packageName": "com.example", "versionName": "1.2.4", "versionCode": 123}),
                encoding="utf-8",
            )
            row = {
                "package": "com.example",
                "source_version": "1.2.3",
                "version_code": "123",
                "split_set": "example",
                "sha256": hashlib.sha256(apk.read_bytes()).hexdigest(),
            }

            with self.assertRaisesRegex(MatrixError, "version mismatch"):
                verify_download(row, root)

    def test_rejects_version_code_mismatch(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            apk = root / "com.example" / "example.apk"
            apk.parent.mkdir()
            self.write_apk_fixture(apk, b"fixture")
            (apk.parent / "info.json").write_text(
                json.dumps({"packageName": "com.example", "versionName": "1.2.3", "versionCode": 124}),
                encoding="utf-8",
            )
            row = {
                "package": "com.example",
                "source_version": "1.2.3",
                "version_code": "123",
                "split_set": "example",
                "sha256": hashlib.sha256(apk.read_bytes()).hexdigest(),
            }

            with self.assertRaisesRegex(MatrixError, "versionCode mismatch"):
                verify_download(row, root)

    def test_rejects_non_numeric_verified_version_code(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = self.write_matrix(
                Path(tmp),
                "package\tapp_name\tsource_version\tversion_code\tsplit_set\tsha256\tacquisition_status\n"
                "com.example\tExample\t1\tlatest\tbase\t" + "0" * 64 + "\tverified\n",
            )

            with self.assertRaisesRegex(MatrixError, "invalid version_code"):
                load_matrix(path)

if __name__ == "__main__":
    unittest.main()
