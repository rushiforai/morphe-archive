import json
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import Mock, patch
from zipfile import ZipFile

from scripts import verify_compat_patch as check


class ProfilePatchChecks(unittest.TestCase):
    def test_record_gate_requires_complete_application_and_unchanged_inputs(self):
        cases = (
            "valid",
            "exit",
            "missing_report",
            "missing_apk",
            "failed_patch",
            "missing_patch",
            "duplicate_patch",
            "failed_step",
            "missing_rebuild",
            "bad_json",
            "bad_zip",
            "unchanged",
            "changed_bundle",
            "timeout",
            "malformed_apk",
        )
        for case in cases:
            with self.subTest(case=case), tempfile.TemporaryDirectory() as temp:
                root = Path(temp)
                apk, bundle, desktop = (
                    root / name for name in ("stock.apk", "patches.mpp", "desktop.jar")
                )
                for path in (apk, bundle, desktop):
                    path.write_bytes(path.name.encode())
                with ZipFile(apk, "w") as archive:
                    for entry in (
                        "AndroidManifest.xml",
                        "resources.arsc",
                        "classes.dex",
                    ):
                        archive.writestr(entry, b"stock")
                original = apk.read_bytes()
                names = ["Open settings from menu", "Material You theme"]
                scratch = []

                def run(
                    command,
                    *,
                    names=names,
                    scratch=scratch,
                    case=case,
                    apk=apk,
                    bundle=bundle,
                    **kwargs,
                ):
                    self.assertEqual(1800, kwargs["timeout"])
                    self.assertIn("-Xmx1024m", command)
                    self.assertIn("--unsigned", command)
                    self.assertNotIn("--continue-on-error", command)
                    self.assertEqual(
                        names,
                        [
                            arg.removeprefix("--enable=")
                            for arg in command
                            if arg.startswith("--enable=")
                        ],
                    )
                    output = Path(
                        next(
                            arg.split("=", 1)[1]
                            for arg in command
                            if arg.startswith("--out=")
                        )
                    )
                    result = Path(
                        next(
                            arg.split("=", 1)[1]
                            for arg in command
                            if arg.startswith("--result-file=")
                        )
                    )
                    scratch.append(output.parent)
                    if case == "timeout":
                        raise subprocess.TimeoutExpired(command, 1800)
                    report = {
                        "appliedPatches": [{"name": name} for name in names],
                        "failedPatches": [],
                        "patchingSteps": [
                            {"step": step, "success": True}
                            for step in ("PATCHING", "REBUILDING")
                        ],
                    }
                    if case == "failed_patch":
                        report["failedPatches"] = [{"name": names[0]}]
                    if case == "missing_patch":
                        report["appliedPatches"].pop()
                    if case == "duplicate_patch":
                        report["appliedPatches"] = [{"name": names[0]}] * 2
                    if case == "failed_step":
                        report["patchingSteps"][1]["success"] = False
                    if case == "missing_rebuild":
                        report["patchingSteps"].pop()
                    if case != "missing_report":
                        result.write_text(
                            "{" if case == "bad_json" else json.dumps(report),
                            encoding="utf-8",
                        )
                    if case != "missing_apk":
                        with ZipFile(output, "w") as archive:
                            for entry in (
                                "AndroidManifest.xml",
                                "resources.arsc",
                                "classes.dex",
                            ):
                                archive.writestr(entry, b"patched")
                    if case == "bad_zip":
                        output.write_bytes(b"not a zip")
                    if case == "unchanged":
                        output.write_bytes(apk.read_bytes())
                    if case == "changed_bundle":
                        bundle.write_bytes(b"replaced bundle")
                    return subprocess.CompletedProcess(
                        command, 1 if case == "exit" else 0, "", ""
                    )

                with (
                    patch.object(check.subprocess, "run", side_effect=run),
                    patch.object(
                        check,
                        "validate_apk",
                        side_effect=(
                            ValueError("malformed APK")
                            if case == "malformed_apk"
                            else None
                        ),
                    ) as validate,
                ):
                    if case == "valid":
                        self.assertEqual(
                            "Desktop applied and rebuilt all 2 patches",
                            check.verify(
                                apk,
                                bundle,
                                desktop,
                                Path("java"),
                                names,
                                check.digest(apk),
                                Path("aapt2"),
                            ),
                        )
                    else:
                        with self.assertRaises(
                            (ValueError, subprocess.SubprocessError, OSError)
                        ):
                            check.verify(
                                apk,
                                bundle,
                                desktop,
                                Path("java"),
                                names,
                                check.digest(apk),
                                Path("aapt2"),
                            )
                    if case in ("valid", "malformed_apk"):
                        validate.assert_called_once_with(
                            scratch[0] / "patched.apk", Path("java"), Path("aapt2")
                        )
                self.assertTrue(scratch)
                self.assertTrue(all(not path.exists() for path in scratch))
                self.assertEqual(original, apk.read_bytes())

    def test_empty_or_duplicate_selection_never_launches_desktop(self):
        for names in ([], ["menu", "menu"]):
            with patch.object(check.subprocess, "run") as run:
                with self.assertRaises(ValueError):
                    check.verify(
                        Path("stock"),
                        Path("bundle"),
                        Path("desktop"),
                        Path("java"),
                        names,
                        "",
                        Path("aapt2"),
                    )
                run.assert_not_called()

    def test_changed_discovery_input_never_launches_desktop(self):
        with tempfile.TemporaryDirectory() as temp:
            source = Path(temp) / "input"
            source.write_bytes(b"changed after discovery")
            with patch.object(check.subprocess, "run") as run:
                with self.assertRaisesRegex(
                    ValueError, "changed after compatibility discovery"
                ):
                    check.verify(
                        source,
                        source,
                        source,
                        Path("java"),
                        ["menu"],
                        "0" * 64,
                        Path("aapt2"),
                    )
                run.assert_not_called()

    def test_content_validator_propagates_failure_and_stops_timed_out_process_tree(
        self,
    ):
        for outcome in ("success", "failure", "timeout"):
            with self.subTest(outcome=outcome):
                process = Mock(returncode=1 if outcome == "failure" else 0)
                process.communicate.side_effect = (
                    [subprocess.TimeoutExpired("gradlew", 600), ("", "")]
                    if outcome == "timeout"
                    else [("", "invalid contents")]
                )
                with (
                    patch.object(
                        check.subprocess, "Popen", return_value=process
                    ) as launch,
                    patch.object(check, "stop_process_tree") as stop,
                ):
                    if outcome == "success":
                        check.validate_apk(
                            Path("rebuilt.apk"), Path("jdk/bin/java"), Path("aapt2")
                        )
                    else:
                        with self.assertRaisesRegex(
                            ValueError, "Rebuilt APK validation"
                        ):
                            check.validate_apk(
                                Path("rebuilt.apk"), Path("jdk/bin/java"), Path("aapt2")
                            )
                    command = launch.call_args.args[0]
                    self.assertIn(":patches:checkRebuiltApk", command)
                    self.assertIn(
                        f"-PvalidationApk={Path('rebuilt.apk').resolve()}", command
                    )
                    self.assertIn(
                        f"-PvalidationAapt2={Path('aapt2').resolve()}", command
                    )
                    self.assertEqual(
                        Path("jdk").resolve(),
                        Path(launch.call_args.kwargs["env"]["JAVA_HOME"]),
                    )
                    self.assertEqual(outcome == "timeout", stop.called)


if __name__ == "__main__":
    unittest.main()
