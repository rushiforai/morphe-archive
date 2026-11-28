"""Builder diagnostics must survive subprocess validation failures."""
import io
import hashlib
import json
import subprocess
import sys
import tempfile
import unittest
from contextlib import redirect_stdout
from pathlib import Path
from unittest.mock import patch
from urllib.error import HTTPError, URLError

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build


class FixtureDownloadTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.destination = Path(self.directory.name) / "downloads" / "original.apkm"
        self.payload = b"pinned fixture bytes"
        self.fixture = {"version": "5.28.5.0", "url": "https://example.test/original.apkm",
                        "sha256": hashlib.sha256(self.payload).hexdigest()}

    def test_verified_download_and_cache_reuse(self):
        with patch.object(build, "urlopen", return_value=io.BytesIO(self.payload)) as download:
            build.fetch_fixture(self.fixture, self.destination)
            build.fetch_fixture(self.fixture, self.destination)
        self.assertEqual(self.destination.read_bytes(), self.payload)
        download.assert_called_once()
        self.assertFalse(self.destination.with_suffix(".apkm.partial").exists())

    def test_bad_download_never_enters_cache(self):
        with patch.object(build, "urlopen", return_value=io.BytesIO(b"changed bytes")), \
             self.assertRaisesRegex(ValueError, "5.28.5.0 checksum changed"):
            build.fetch_fixture(self.fixture, self.destination)
        self.assertFalse(self.destination.exists())
        self.assertFalse(self.destination.with_suffix(".apkm.partial").exists())

    def test_cached_checksum_mismatch_remains_fatal(self):
        self.destination.parent.mkdir()
        self.destination.write_bytes(b"corrupt cached file")
        with patch.object(build, "urlopen") as download, self.assertRaisesRegex(ValueError, "checksum changed"):
            build.fetch_fixture(self.fixture, self.destination)
        download.assert_not_called()

    def test_interrupted_transfer_retries_without_partial_prefix(self):
        class Interrupted(io.BytesIO):
            def read(self, size=-1):
                if self.tell():
                    raise ConnectionResetError("connection lost")
                return super().read(4)
        with patch.object(build, "urlopen", side_effect=[Interrupted(self.payload), io.BytesIO(self.payload)]) as download, \
             patch.object(build.time, "sleep"):
            build.fetch_fixture(self.fixture, self.destination)
        self.assertEqual(download.call_count, 2)
        self.assertEqual(self.destination.read_bytes(), self.payload)

    def test_transport_retries_are_bounded(self):
        with patch.object(build, "urlopen", side_effect=URLError("offline")) as download, \
             patch.object(build.time, "sleep"), self.assertRaisesRegex(RuntimeError, "5.28.5.0"):
            build.fetch_fixture(self.fixture, self.destination)
        self.assertEqual(download.call_count, 3)
        self.assertFalse(self.destination.exists())

    def test_http_retry_policy(self):
        for status, attempts in [(403, 1), (404, 1), (429, 3), (503, 3)]:
            with self.subTest(status=status), \
                 patch.object(build, "urlopen", side_effect=HTTPError(self.fixture["url"], status, "failed", {}, None)) as download, \
                 patch.object(build.time, "sleep"), self.assertRaises(RuntimeError):
                build.fetch_fixture(self.fixture, self.destination)
            self.assertEqual(download.call_count, attempts)
            self.assertFalse(self.destination.exists())

    def test_all_pinned_fixtures_use_repository_release_assets(self):
        fixtures = json.loads((build.ROOT / "ci/compatibility_fixtures.json").read_text())
        for fixture in fixtures:
            expected = f"waze-{fixture['version']}-original-arm64{fixture.get('extension', '.apkm')}"
            self.assertEqual(fixture["url"], "https://github.com/aaayd/waze-custom-patches/releases/download/"
                             "ci-compatibility-fixtures-v1/" + expected)
            self.assertRegex(fixture["sha256"], r"^[0-9a-f]{64}$")


class CommandDiagnosticsTests(unittest.TestCase):
    def test_captured_success_returns_output(self):
        with redirect_stdout(io.StringIO()):
            output = build.run(sys.executable, "-c", "print('validated')", capture=True)
        self.assertEqual(output.strip(), "validated")

    def test_captured_output_uses_utf8_independent_of_windows_code_page(self):
        # UTF-8 for U+010D includes 0x8d, which is undefined in Windows cp1252.
        with redirect_stdout(io.StringIO()):
            output = build.run(sys.executable, "-c",
                               "import sys; sys.stdout.buffer.write(bytes([0xc4, 0x8d]))",
                               capture=True)
        self.assertEqual(output, "\u010d")

    def test_captured_failure_logs_stdout_and_stderr_and_preserves_exit_code(self):
        log = io.StringIO()
        with redirect_stdout(log), self.assertRaises(subprocess.CalledProcessError) as failure:
            build.run(sys.executable, "-c",
                      "import sys; print('package mismatch'); print('signer rejected', file=sys.stderr); sys.exit(17)",
                      capture=True)
        self.assertEqual(failure.exception.returncode, 17)
        self.assertIn("package mismatch", failure.exception.stdout)
        self.assertIn("signer rejected", failure.exception.stdout)
        # These are output lines, not merely words in the logged command.
        self.assertIn("\npackage mismatch\n", log.getvalue())
        self.assertIn("\nsigner rejected\n", log.getvalue())


if __name__ == "__main__":
    unittest.main()
