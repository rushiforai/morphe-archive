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
sys.path.insert(0,str(ROOT/".github/scripts"))
spec = importlib.util.spec_from_file_location("verify_release_mpp", SCRIPT)
assert spec and spec.loader
validator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validator)
sys.path.insert(0,str(ROOT/".github/scripts"))
from verify_android_mpp import validate_manager_dex


class ReleaseMppIntegrityTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.folder = Path(self.tmp.name)
        self.bundle = self.folder / "patches-2.1.1.mpp"
        self.baseline = self.folder / "unmodified.dex"
        self.baseline.write_bytes(b"dex\nunchanged-v2.1.0")

    def make_manager_dex(self):
        # Minimal header fixture; production validation also needs real patch symbols.
        data=bytearray(256)
        data[:8]=b"dex\n038\x00"
        data[32:36]=len(data).to_bytes(4,"little")
        data[96:100]=(1).to_bytes(4,"little")
        data.extend(b"Lapp/nicoid/patches/NicoidModPatchKt;")
        data[32:36]=len(data).to_bytes(4,"little")
        return bytes(data)

    def create_bundle(self, markers=True, stale=False, with_manager_dex=True):
        helpers = b"dex\n" + (b"2.1.0-dev.28" if stale else b"2.1.1")
        if markers:
            helpers += b"\0".join(validator.V211_MARKERS)
        with ZipFile(self.bundle, "w", compression=ZIP_DEFLATED) as output:
            if with_manager_dex:
                output.writestr("classes.dex", self.make_manager_dex())
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

    def test_missing_manager_dex_is_rejected(self):
        # Reproduces public v2.1.2 failure reported by Morphe Manager 2.6.0.
        self.create_bundle(with_manager_dex=False)
        with self.assertRaisesRegex(ValueError, "classes.dex"):
            validator.inspect(self.bundle, "2.1.1", self.baseline)

    def test_corrupt_manager_dex_is_rejected(self):
        self.create_bundle()
        with ZipFile(self.bundle, "a") as output:
            output.writestr("classes.dex", b"not-dex")
        with self.assertRaises(ValueError):
            validator.inspect(self.bundle, "2.1.1", self.baseline)

    def test_gradle_patch_list_does_not_replace_android_mpp_with_jvm_jar(self):
        gradle=(ROOT/"patches/build.gradle.kts").read_text()
        assert 'dependsOn(jvmPatchJar)' in gradle
        assert "dependsOn(build)\\n        dependsOn(prepareNicoidHelpers)" not in gradle
        assert 'startsWith("2.1.3-dev.")' in gradle

    def test_jvm_jar_is_isolated_from_android_mpp(self):
        gradle = (ROOT / "patches/build.gradle.kts").read_text()
        self.assertIn('val jvmPatchJar = tasks.register<Jar>("jvmPatchJar")', gradle)
        self.assertNotIn('tasks.named<Jar>("jar") {', gradle)
        self.assertIn('destinationDirectory.set(layout.buildDirectory.dir("jvm-libs"))', gradle)
        self.assertIn('from(sourceSets["main"].output)', gradle)
        self.assertIn('attributes["Version"] = project.version.toString()', gradle)
        self.assertIn('dependsOn(jvmPatchJar)', gradle)
        source = (ROOT / "patches/src/main/kotlin/util/PatchListGenerator.kt").read_text()
        self.assertIn('require(args.size == 1)', source)
        self.assertIn('File(args[0])', source)
        self.assertNotIn('File("build/libs/")', source)
        main = (ROOT / ".github/workflows/verify-main.yml").read_text()
        self.assertIn('generatePatchesList changed the compiled Android MPP', main)
        self.assertIn('python3 .github/scripts/verify_android_mpp.py "$bundle" "$version"', main)

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
