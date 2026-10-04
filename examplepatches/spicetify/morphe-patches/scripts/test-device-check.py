import argparse
import hashlib
import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location("device_check", Path(__file__).with_name("device-check.py"))
device = importlib.util.module_from_spec(spec)
spec.loader.exec_module(device)


class DeviceCheckTest(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.addCleanup(self.folder.cleanup)
        self.apk = Path(self.folder.name) / "candidate.apk"
        self.apk.write_bytes(b"new apk")
        self.args = argparse.Namespace(adb="adb", serial="chosen-device", apk=self.apk,
            sha256=device.digest(self.apk), aapt2="aapt2", apksigner="apksigner",
            version="9.1.80.2221", install=True, album_id=None)
        self.commands = []
        self.installed = b"old apk"
        self.split = False

    def fake_run(self, command, timeout=60):
        self.commands.append(command)
        if command[0] == "aapt2":
            return "package: name='com.spotify.music' versionCode='145767611' versionName='9.1.80.2221'"
        self.assertEqual(command[:3], ["adb", "-s", "chosen-device"])
        action = command[3:]
        if action == ["get-state"]:
            return "device\n"
        if action[:2] == ["shell", "getprop"]:
            return "16\n"
        if action[:3] == ["shell", "pm", "path"]:
            return "package:/data/app/~~abc/base.apk\n" + (
                "package:/data/app/~~abc/split.apk\n" if self.split else "")
        if action[0] == "pull":
            Path(action[2]).write_bytes(self.installed)
            return ""
        if action[:2] == ["install", "-r"]:
            self.installed = Path(action[2]).read_bytes()
            return "Success\n"
        if action[:2] == ["shell", "sha256sum"]:
            return hashlib.sha256(self.installed).hexdigest() + "  /data/app/abc/base.apk\n"
        self.fail(f"Unexpected command: {action}")

    def check(self, signers=("same", "same")):
        report = {}
        with patch.object(device, "run", side_effect=self.fake_run), patch.object(device, "certificate", side_effect=signers):
            device.check(self.args, report)
        return report

    def test_update_verifies_installed_bytes(self):
        self.assertTrue(self.check()["candidateInstalled"])
        self.assertEqual(sum("install" in c for c in self.commands), 1)

    def test_identical_apk_skips_install(self):
        self.installed = self.apk.read_bytes()
        self.assertTrue(self.check()["candidateInstalled"])
        self.assertFalse(any("install" in c for c in self.commands))

    def test_wrong_signer_never_installs(self):
        with self.assertRaisesRegex(RuntimeError, "Signing certificate mismatch"):
            self.check(("new", "old"))
        self.assertFalse(any("install" in c for c in self.commands))

    def test_wrong_hash_never_installs(self):
        self.args.sha256 = "0" * 64
        with self.assertRaisesRegex(RuntimeError, "Candidate SHA-256 mismatch"):
            self.check()
        self.assertFalse(any("install" in c for c in self.commands))

    def test_split_install_is_refused(self):
        self.split = True
        with self.assertRaisesRegex(RuntimeError, "single-APK"):
            self.check()
        self.assertFalse(any("install" in c for c in self.commands))

    def test_preflight_alone_does_not_install(self):
        self.args.install = False
        self.assertFalse(self.check()["candidateInstalled"])
        self.assertFalse(any("install" in c for c in self.commands))

    def test_android_success_without_replacement_is_detected(self):
        def no_replacement(command, timeout=60):
            if command[3:5] == ["install", "-r"]:
                return "Success\n"
            return self.fake_run(command, timeout)
        with patch.object(device, "run", side_effect=no_replacement), patch.object(device, "certificate", return_value="same"):
            with self.assertRaisesRegex(RuntimeError, "Installed SHA-256 mismatch"):
                device.check(self.args, {})

    def test_invalid_signature_never_installs(self):
        with patch.object(device, "run", side_effect=self.fake_run), patch.object(device, "certificate", side_effect=RuntimeError("invalid signature")):
            with self.assertRaisesRegex(RuntimeError, "invalid signature"):
                device.check(self.args, {})
        self.assertFalse(any("install" in c for c in self.commands))

    def test_certificate_requires_exactly_one_signer(self):
        cert = "a" * 64
        with patch.object(device, "run", return_value=f"Signer #1 certificate SHA-256 digest: {cert}\n"):
            self.assertEqual(device.certificate("apksigner", self.apk), cert)
        with patch.object(device, "run", return_value=""):
            with self.assertRaisesRegex(RuntimeError, "one verified APK signer"):
                device.certificate("apksigner", self.apk)

    def test_ui_observation_does_not_claim_playback(self):
        self.assertEqual(device.album_state('<hierarchy><node package="com.spotify.music" text="Play"/></hierarchy>'),
                         "spotify-visible-unconfirmed")
        self.assertEqual(device.album_state('<hierarchy><node package="com.spotify.music" text="The tracks on this release are not available."/></hierarchy>'),
                         "tracks-unavailable")


if __name__ == "__main__":
    unittest.main()
