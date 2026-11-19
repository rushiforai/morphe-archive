#!/usr/bin/env python3
"""Source-level regression tests for the stable MPP publication contract."""
from __future__ import annotations

import importlib.util
import json
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZipFile

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / ".github/scripts/verify-release-mpp.py"
spec = importlib.util.spec_from_file_location("verify_release_mpp", SCRIPT)
assert spec and spec.loader
validator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validator)


class ReleaseMppIntegrityTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.folder = Path(self.tmp.name)
        self.bundle = self.folder / "patches-2.1.1.mpp"
        self.baseline = self.folder / "unmodified.dex"
        self.baseline.write_bytes(b"dex\nunchanged-v2.1.0")

    def create_bundle(self, markers=True, stale=False):
        helpers = b"dex\n" + (b"2.1.0-dev.28" if stale else b"2.1.1")
        if markers:
            helpers += b"\0".join(validator.V211_MARKERS)
        with ZipFile(self.bundle, "w", compression=ZIP_DEFLATED) as output:
            output.writestr("META-INF/MANIFEST.MF", "Manifest-Version: 1.0\nVersion: 2.1.1\n")
            output.writestr("nicoid/helpers.mpe", helpers)
            output.writestr("nicoid/method-delta.dex", b"dex\nnative")
            output.writestr("nicoid/resources.zip", b"resources")
            output.writestr("nicoid/input-hashes.txt", b"approved")

    def test_valid_staged_mpp(self):
        self.create_bundle()
        report = validator.inspect(self.bundle, "2.1.1", self.baseline)
        self.assertEqual(report["version"], "2.1.1")
        self.assertEqual(len(report["sha256"]), 64)

    def test_unstaged_mpp_is_rejected(self):
        self.create_bundle(markers=False)
        with self.assertRaisesRegex(ValueError, "Missing v2.1.1 helper"):
            validator.inspect(self.bundle, "2.1.1", self.baseline)

    def test_old_runtime_version_is_rejected(self):
        self.create_bundle(stale=True)
        with self.assertRaisesRegex(ValueError, "runtime version is missing"):
            validator.inspect(self.bundle, "2.1.1", self.baseline)

    def test_post_staging_overwrite_is_rejected(self):
        self.create_bundle()
        env = {**os.environ, "RUNNER_TEMP": str(self.folder)}
        def run(phase):
            return subprocess.run([sys.executable, str(SCRIPT), phase, "2.1.1",
                                   str(self.bundle)], env=env, text=True,
                                  capture_output=True, check=False)
        self.assertEqual(run("record").returncode, 0)
        self.assertEqual(run("check").returncode, 0)
        with ZipFile(self.bundle, "a") as output:
            output.writestr("post-stage-change", b"regression")
        self.assertNotEqual(run("check").returncode, 0)

    def test_release_configuration_never_runs_gradle_publish(self):
        cfg = json.loads((ROOT / ".releaserc").read_text(encoding="utf-8"))
        self.assertNotIn("gradle-semantic-release-plugin", cfg["plugins"])
        exec_config = next(plugin[1] for plugin in cfg["plugins"]
                           if isinstance(plugin, list) and plugin[0] == "@semantic-release/exec")
        self.assertIn("verify-release-mpp.py record", exec_config["prepareCmd"])
        self.assertIn("verify-release-mpp.py check", exec_config["publishCmd"])
        self.assertIn("Unapproved release", exec_config["prepareCmd"])


if __name__ == "__main__":
    unittest.main()
