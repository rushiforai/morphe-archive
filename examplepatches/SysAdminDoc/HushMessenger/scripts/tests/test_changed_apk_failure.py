#!/usr/bin/env python3
"""Changed-APK checker failures must preserve inputs and remove temporary files."""

import argparse
import hashlib
import io
import json
import subprocess
import tempfile
import unittest
import zlib
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path
from unittest.mock import patch
from zipfile import ZipFile

from scripts import verify_changed_apk_failure as checker

REASON = "expected 6 permission loads, found 4; use version code 346013387 or 346013440"
WRAPPED_REASON = (
    'app.morphe.patcher.patch.PatchException: The patch "Install beside Meta apps" '
    'depends on "ResourcePatch@1179093020", which raised an exception:\r\n'
    'app.morphe.patcher.patch.PatchException: The patch "ResourcePatch@1179093020" '
    'depends on "BytecodePatch@1727420902", which raised an exception:\r\n'
    "app.morphe.patcher.patch.PatchException: Install beside Meta apps: "
    "expected 6 permission loads, found 4. Use an unmodified arm64 Messenger "
    "580.0.0.49.91 APK (version code 346013387 or 346013440).\r\r\n"
    "\tat app.hushmessenger.patches.coexist.InstallBesideMetaAppsPatchKt.validateDexSites(InstallBesideMetaAppsPatch.kt:203)\r\n"
)


def report():
    return {
        "failedPatches": [
            {"patch": {"name": "Install beside Meta apps"}, "reason": REASON}
        ],
        "patchingSteps": [{"step": "PATCHING", "success": False}],
    }


class ChangedApkChecks(unittest.TestCase):
    def test_dex_checksum_and_signature_are_updated_after_literal_change(self):
        data = b"dex\n035\0" + bytes(56) + checker.OLD_LITERAL
        changed = checker.altered_dex(data)
        self.assertNotIn(checker.OLD_LITERAL, changed)
        self.assertIn(checker.CHANGED_LITERAL, changed)
        self.assertEqual(
            changed[12:32], hashlib.sha1(changed[32:], usedforsecurity=False).digest()
        )
        self.assertEqual(
            int.from_bytes(changed[8:12], "little"),
            zlib.adler32(changed[12:]) & 0xFFFFFFFF,
        )
        self.assertEqual(len(data), len(changed))

    def test_rejection_report_and_error_paths_keep_stock_and_clean_temporary_apks(self):
        cases = [
            "valid",
            "wrapped-reason",
            "output",
            "exit-zero",
            "rebuild",
            "reason",
            "wrapped-unrelated",
            "wrapped-count-prefix",
            "wrapped-build-prefix",
            "split-reason",
            "report-array",
            "missing-fields",
            "malformed-patch",
            "malformed-step",
            "missing-report",
            "timeout",
        ]
        with tempfile.TemporaryDirectory() as root:
            stock = Path(root) / "stock.apk"
            with ZipFile(stock, "w") as archive:
                archive.writestr(
                    "classes.dex", b"dex\n035\0" + bytes(56) + checker.OLD_LITERAL
                )
                archive.writestr(
                    "classes2.dex", b"dex\n035\0" + bytes(56) + checker.OLD_LITERAL
                )
            original = stock.read_bytes()
            digest = hashlib.sha256(original).hexdigest()
            args = argparse.Namespace(
                stock_apk=stock,
                bundle=Path("patches.mpp"),
                desktop_jar=Path("desktop.jar"),
                java=Path("java"),
            )
            for case in cases:
                scratch = []

                def desktop(command, case=case, scratch=scratch, **kwargs):
                    changed = Path(command[-1])
                    scratch.append(changed.parent)
                    self.assertTrue(changed.exists())
                    self.assertNotEqual(changed.resolve(), stock.resolve())
                    if case == "timeout":
                        raise subprocess.TimeoutExpired(command, 300)
                    outcome = report()
                    if case == "wrapped-reason":
                        outcome["failedPatches"][0]["reason"] = WRAPPED_REASON
                    if case == "output":
                        Path(
                            next(arg[3:] for arg in command if arg.startswith("-o="))
                        ).write_bytes(b"unexpected")
                    if case == "rebuild":
                        outcome["patchingSteps"].append(
                            {"step": "REBUILDING", "success": False}
                        )
                    if case == "reason":
                        outcome["failedPatches"][0]["reason"] = "unrelated failure"
                    if case == "wrapped-unrelated":
                        outcome["failedPatches"][0]["reason"] = WRAPPED_REASON.replace(
                            "expected 6 permission loads, found 4",
                            "expected 6 permission loads, found 5",
                        )
                    if case == "wrapped-count-prefix":
                        outcome["failedPatches"][0]["reason"] = WRAPPED_REASON.replace(
                            "found 4.", "found 40."
                        )
                    if case == "wrapped-build-prefix":
                        outcome["failedPatches"][0]["reason"] = WRAPPED_REASON.replace(
                            "346013440)", "3460134400)"
                        )
                    if case == "split-reason":
                        outcome["failedPatches"][0]["reason"] = (
                            "expected 6 permission loads, found 4\n"
                            "unrelated error on version code 346013387 or 346013440"
                        )
                    if case == "report-array":
                        outcome = []
                    if case == "missing-fields":
                        outcome = {"failedPatches": report()["failedPatches"]}
                    if case == "malformed-patch":
                        outcome["failedPatches"] = [None]
                    if case == "malformed-step":
                        outcome["patchingSteps"] = [None]
                    if case != "missing-report":
                        Path(
                            next(arg[3:] for arg in command if arg.startswith("-r="))
                        ).write_text(json.dumps(outcome), encoding="utf-8")
                    return subprocess.CompletedProcess(
                        command, 0 if case == "exit-zero" else 1, "", ""
                    )

                with (
                    self.subTest(case=case),
                    patch.object(checker, "STOCK_SHA256", {digest}),
                    patch.object(checker.subprocess, "run", side_effect=desktop),
                    redirect_stdout(io.StringIO()),
                ):
                    if case in {"valid", "wrapped-reason"}:
                        self.assertEqual(checker.check(args), 0)
                    else:
                        with self.assertRaises(
                            (
                                OSError,
                                ValueError,
                                TypeError,
                                RuntimeError,
                                subprocess.TimeoutExpired,
                            )
                        ):
                            checker.check(args)
                self.assertEqual(stock.read_bytes(), original)
                self.assertTrue(scratch)
                self.assertTrue(all(not path.exists() for path in scratch))

    def test_missing_input_timeout_and_malformed_report_have_cli_diagnostics(self):
        argv = [
            "verify_changed_apk_failure.py",
            "--stock-apk",
            "missing.apk",
            "--bundle",
            "bundle.mpp",
            "--desktop-jar",
            "desktop.jar",
        ]
        for error in (
            FileNotFoundError("missing APK"),
            subprocess.TimeoutExpired(["java", "private-path"], 300),
            ValueError("malformed report"),
        ):
            output = io.StringIO()
            with (
                self.subTest(error=error),
                patch("sys.argv", argv),
                patch.object(checker, "check", side_effect=error),
                redirect_stderr(output),
            ):
                self.assertEqual(checker.main(), 2)
                self.assertIn("CHECK FAILED:", output.getvalue())
                self.assertNotIn("Traceback", output.getvalue())
                self.assertNotIn("private-path", output.getvalue())


if __name__ == "__main__":
    unittest.main()
