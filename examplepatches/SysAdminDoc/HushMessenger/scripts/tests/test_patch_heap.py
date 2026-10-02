"""The whole-APK heap gate must reject incomplete evidence and preserve inputs."""

import argparse
import hashlib
import json
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch
from zipfile import BadZipFile, ZipFile

from scripts import verify_patch_heap as checker


class PatchHeapChecks(unittest.TestCase):
    def test_complete_and_failed_runs_keep_stock_and_remove_temporary_outputs(self):
        for case in (
            "valid",
            "missing-theme",
            "wrong-counts",
            "missing-patch",
            "failed-step",
            "missing-output",
            "nonzero",
            "timeout",
            "empty-output",
            "stock-output",
            "incomplete-apk",
            "missing-extension",
            "changed-stock",
            "wrong-classes",
        ):
            with self.subTest(case=case), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                stock = root / "messenger-580-123.apk"
                stock.write_bytes(b"unchanged stock APK")
                original = stock.read_bytes()
                args = argparse.Namespace(
                    stock_dir=root,
                    java=Path("java"),
                    compat_classpath="dexlib;guava",
                    bundle=Path("patches.mpp"),
                    desktop_jar=Path("desktop.jar"),
                )
                temporary = []

                def run(
                    command,
                    case=case,
                    temporary=temporary,
                    original=original,
                    stock=stock,
                    **kwargs,
                ):
                    self.assertIn("-Xmx1024m", command)
                    if "-cp" in command:
                        return subprocess.CompletedProcess(
                            command,
                            0,
                            "59 dark surface constants\n614 Color.parseColor and Context.getColor calls\n23 Material You editable classes",
                            "",
                        )
                    self.assertIn("--enable=Material You theme", command)
                    self.assertIn("--enable=Other patch", command)
                    output = Path(
                        next(
                            arg.split("=", 1)[1]
                            for arg in command
                            if arg.startswith("--out=")
                        )
                    )
                    report = Path(
                        next(
                            arg.split("=", 1)[1]
                            for arg in command
                            if arg.startswith("--result-file=")
                        )
                    )
                    temporary.append(output.parent)
                    if case == "timeout":
                        raise subprocess.TimeoutExpired(command, 1800)
                    if case != "missing-output":
                        if case in ("empty-output", "stock-output"):
                            output.write_bytes(
                                b"" if case == "empty-output" else original
                            )
                        else:
                            with ZipFile(output, "w") as apk:
                                apk.writestr("AndroidManifest.xml", b"manifest")
                                if case != "incomplete-apk":
                                    apk.writestr("resources.arsc", b"resources")
                                apk.writestr(
                                    "classes.dex",
                                    b"dex\n035\0"
                                    + b"\0" * 104
                                    + (
                                        b"other"
                                        if case == "missing-extension"
                                        else b"Lapp/hushmessenger/extension/Settings;"
                                    ),
                                )
                    if case == "changed-stock":
                        stock.write_bytes(b"patcher changed input")
                    report.write_text(
                        json.dumps(
                            {
                                "appliedPatches": [{"name": "Material You theme"}]
                                + (
                                    []
                                    if case == "missing-patch"
                                    else [{"name": "Other patch"}]
                                ),
                                "failedPatches": [],
                                "patchingSteps": [
                                    {"step": "PATCHING", "success": True},
                                    {
                                        "step": "REBUILDING",
                                        "success": case != "failed-step",
                                    },
                                ],
                            }
                        ),
                        encoding="utf-8",
                    )
                    count = 613 if case == "wrong-counts" else 614
                    owners = 24 if case == "wrong-classes" else 23
                    log = (
                        ""
                        if case == "missing-theme"
                        else f"Material You: {owners} classes, 59 surfaces, {count} colour calls"
                    )
                    return subprocess.CompletedProcess(
                        command, 1 if case == "nonzero" else 0, log, ""
                    )

                with patch.object(checker.subprocess, "run", side_effect=run):
                    if case == "valid":
                        self.assertIn(
                            "PASS 123: 2 patches, 1024 MB",
                            checker.check_build(
                                args,
                                123,
                                hashlib.sha256(original).hexdigest(),
                                {"Material You theme", "Other patch"},
                            ),
                        )
                    else:
                        with self.assertRaises(
                            (RuntimeError, subprocess.TimeoutExpired, BadZipFile)
                        ):
                            checker.check_build(
                                args,
                                123,
                                hashlib.sha256(original).hexdigest(),
                                {"Material You theme", "Other patch"},
                            )
                if case != "changed-stock":
                    self.assertEqual(original, stock.read_bytes())
                self.assertTrue(temporary)
                self.assertTrue(all(not path.exists() for path in temporary))

    def test_changed_stock_is_rejected_before_starting_java(self):
        with tempfile.TemporaryDirectory() as directory:
            stock = Path(directory) / "messenger-580-123.apk"
            stock.write_bytes(b"different APK")
            with patch.object(checker.subprocess, "run") as run:
                with self.assertRaisesRegex(ValueError, "does not match"):
                    checker.check_build(
                        argparse.Namespace(stock_dir=Path(directory)),
                        123,
                        "0" * 64,
                        set(),
                    )
                run.assert_not_called()

    def test_complete_gate_rejects_reduced_builds_or_catalog(self):
        for count, patches in ((20, 31), (21, 30), (21, 32)):
            with (
                self.subTest(builds=count, patches=patches),
                tempfile.TemporaryDirectory() as directory,
            ):
                root = Path(directory)
                names = ["Material You theme"] + [
                    f"Patch {index}" for index in range(patches - 1)
                ]
                (root / "patches-list.json").write_text(
                    json.dumps({"patches": [{"name": name} for name in names]})
                )
                args = argparse.Namespace(codes=None)
                with (
                    patch.object(
                        checker.argparse.ArgumentParser, "parse_args", return_value=args
                    ),
                    patch.object(checker, "ROOT", root),
                    patch.object(
                        checker,
                        "recorded_builds",
                        return_value=dict.fromkeys(range(count), "hash"),
                    ),
                    patch.object(checker, "ThreadPoolExecutor") as pool,
                ):
                    self.assertEqual(2, checker.main())
                    pool.assert_not_called()
