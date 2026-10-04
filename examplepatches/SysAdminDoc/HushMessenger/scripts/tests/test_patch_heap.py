"""The whole-APK heap gate must reject incomplete evidence and preserve inputs."""

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
from threading import Event, Lock
from unittest.mock import patch
from zipfile import BadZipFile, ZipFile

from scripts import verify_patch_heap as checker


class PatchHeapChecks(unittest.TestCase):
    def test_full_gate_bounds_concurrent_builds_without_dropping_inputs(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            bundle = root / "frozen.mpp"
            bundle.write_bytes(b"unchanged frozen bundle")
            index = root / "patches-bundle.json"
            index.write_text("{}")
            (root / "patches-list.json").write_text(
                json.dumps(
                    {"patches": [{"name": "Material You theme"}, {"name": "Other"}]}
                )
            )
            args = argparse.Namespace(
                codes=None,
                bundle=bundle,
                bundle_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest(),
                held_index_sha256=hashlib.sha256(index.read_bytes()).hexdigest(),
            )
            builds = dict.fromkeys(range(100, 121), "recorded hash")
            guard = Lock()
            delay = Event()
            active = peak = 0
            checked = []

            def check_build(_args, code, expected, names):
                nonlocal active, peak
                self.assertEqual("recorded hash", expected)
                self.assertEqual({"Material You theme", "Other"}, names)
                with guard:
                    active += 1
                    peak = max(peak, active)
                    checked.append(code)
                delay.wait(0.05)
                with guard:
                    active -= 1
                return f"PASS {code}"

            with (
                patch.object(checker, "ROOT", root),
                patch.object(checker, "recorded_builds", return_value=builds),
                patch.object(checker, "supported_codes", return_value=set(builds)),
                patch.object(checker, "verify_development", return_value="metadata OK"),
                patch.object(checker, "check_build", side_effect=check_build),
                patch.object(
                    checker.argparse.ArgumentParser, "parse_args", return_value=args
                ),
                redirect_stdout(io.StringIO()),
            ):
                self.assertEqual(0, checker.main())
            self.assertEqual(set(builds), set(checked))
            self.assertEqual(len(builds), len(checked))
            self.assertLessEqual(peak, 2, "the gate started too many JVM jobs at once")

    def test_full_gate_covers_every_recorded_build_of_every_supported_release(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            bundle = root / "frozen.mpp"
            bundle.write_bytes(b"unchanged frozen bundle")
            index = root / "patches-bundle.json"
            index.write_text("{}")
            (root / "patches-list.json").write_text(
                json.dumps(
                    {"patches": [{"name": "Material You theme"}, {"name": "Other"}]}
                )
            )
            args = argparse.Namespace(
                codes=None,
                bundle=bundle,
                bundle_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest(),
                held_index_sha256=hashlib.sha256(index.read_bytes()).hexdigest(),
            )
            checked = []
            guard = Lock()

            def check_build(_args, code, _expected, _names):
                with guard:
                    checked.append(code)
                return f"PASS {code}"

            # The real records and supported codes, not fixtures: 580 and 581 together.
            with (
                patch.object(checker, "ROOT", root),
                patch.object(checker, "verify_development", return_value="metadata OK"),
                patch.object(checker, "check_build", side_effect=check_build),
                patch.object(
                    checker.argparse.ArgumentParser, "parse_args", return_value=args
                ),
                redirect_stdout(io.StringIO()),
            ):
                self.assertEqual(0, checker.main())
            self.assertEqual(sorted(checker.recorded_builds()), sorted(checked))
            self.assertIn(346013387, checked)
            self.assertIn(346213494, checked)

    def test_corrupt_output_entry_fails_that_build_and_keeps_the_others(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            bundle = root / "frozen.mpp"
            bundle.write_bytes(b"unchanged frozen bundle")
            index = root / "patches-bundle.json"
            index.write_text("{}")
            (root / "patches-list.json").write_text(
                json.dumps({"patches": [{"name": "Material You theme"}]})
            )
            args = argparse.Namespace(
                codes=None,
                bundle=bundle,
                bundle_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest(),
                held_index_sha256=hashlib.sha256(index.read_bytes()).hexdigest(),
            )
            builds = dict.fromkeys(range(100, 121), "recorded hash")
            broken = {
                103: zlib.error(
                    "Error -3 while decompressing data: invalid block type"
                ),
                111: AttributeError("'NoneType' object has no attribute 'decompress'"),
            }
            checked = []
            guard = Lock()

            def check_build(_args, code, _expected, _names):
                with guard:
                    checked.append(code)
                if code in broken:
                    raise broken[code]
                return f"PASS {code}"

            output, error = io.StringIO(), io.StringIO()
            with (
                patch.object(checker, "ROOT", root),
                patch.object(checker, "recorded_builds", return_value=builds),
                patch.object(checker, "supported_codes", return_value=set(builds)),
                patch.object(checker, "verify_development", return_value="metadata OK"),
                patch.object(checker, "check_build", side_effect=check_build),
                patch.object(
                    checker.argparse.ArgumentParser, "parse_args", return_value=args
                ),
                redirect_stdout(output),
                redirect_stderr(error),
            ):
                self.assertEqual(2, checker.main())
            self.assertEqual(sorted(builds), sorted(checked))
            passed = [code for code in builds if f"PASS {code}\n" in output.getvalue()]
            self.assertEqual(sorted(set(builds) - set(broken)), sorted(passed))
            self.assertEqual(2, error.getvalue().count("CHECK FAILED:"))
            self.assertIn("invalid block type", error.getvalue())
            self.assertIn("no attribute 'decompress'", error.getvalue())
            self.assertNotIn("Traceback", error.getvalue())

    def test_failed_discovery_reports_exit_code_before_starting_patcher(self):
        for code in (137, -1073741819, 0):
            with self.subTest(exit=code), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                stock = root / "messenger-580-123.apk"
                stock.write_bytes(b"unchanged stock APK")
                bundle = root / "frozen.mpp"
                bundle.write_bytes(b"unchanged frozen bundle")
                args = argparse.Namespace(
                    stock_dir=root,
                    java=Path("java"),
                    compat_classpath="dexlib;guava",
                    bundle=bundle,
                    bundle_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest(),
                )
                with patch.object(
                    checker.subprocess,
                    "run",
                    return_value=subprocess.CompletedProcess(
                        [], code, "Loaded DEX classes\n", ""
                    ),
                ) as run:
                    with self.assertRaisesRegex(RuntimeError, f"exit {code}"):
                        checker.check_build(
                            args,
                            123,
                            hashlib.sha256(stock.read_bytes()).hexdigest(),
                            {"Material You theme"},
                        )
                    run.assert_called_once()
                self.assertEqual(b"unchanged stock APK", stock.read_bytes())
                self.assertEqual(b"unchanged frozen bundle", bundle.read_bytes())

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
            "changed-bundle",
            "wrong-classes",
        ):
            with self.subTest(case=case), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                stock = root / "messenger-580-123.apk"
                stock.write_bytes(b"unchanged stock APK")
                original = stock.read_bytes()
                bundle = root / "patches.mpp"
                bundle.write_bytes(b"frozen bundle")
                args = argparse.Namespace(
                    stock_dir=root,
                    java=Path("java"),
                    compat_classpath="dexlib;guava",
                    bundle=bundle,
                    bundle_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest(),
                    desktop_jar=Path("desktop.jar"),
                )
                temporary = []

                def run(
                    command,
                    case=case,
                    temporary=temporary,
                    original=original,
                    stock=stock,
                    args=args,
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
                    if case == "changed-bundle":
                        args.bundle.write_bytes(b"changed frozen input")
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

    def test_stock_apk_is_found_under_any_version_name_but_only_once(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "messenger-581-123.apk").write_bytes(b"stock")
            (root / "messenger-580-9123.apk").write_bytes(b"other build")
            self.assertEqual(
                root / "messenger-581-123.apk", checker.stock_apk(root, 123)
            )
            with self.assertRaisesRegex(ValueError, "found 0"):
                checker.stock_apk(root, 456)
            (root / "messenger-580-123.apk").write_bytes(b"same code twice")
            with patch.object(checker.subprocess, "run") as run:
                with self.assertRaisesRegex(ValueError, "found 2"):
                    checker.check_build(
                        argparse.Namespace(stock_dir=root), 123, "0" * 64, set()
                    )
                run.assert_not_called()

    def test_corrupt_frozen_zip_has_a_controlled_failure_before_patching(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            bundle = root / "patches-1.2.3.mpp"
            bundle.write_bytes(b"invalid archive")
            index = root / "patches-bundle.json"
            index.write_text("{}")
            (root / "gradle.properties").write_text("version=1.2.3\n")
            args = argparse.Namespace(
                codes=None,
                bundle=bundle,
                bundle_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest(),
                held_index_sha256=hashlib.sha256(index.read_bytes()).hexdigest(),
            )
            error = io.StringIO()
            with (
                patch.object(checker, "ROOT", root),
                patch.object(
                    checker,
                    "recorded_builds",
                    return_value=dict.fromkeys(range(21), "hash"),
                ),
                patch.object(checker, "supported_codes", return_value=set(range(21))),
                patch.object(
                    checker.argparse.ArgumentParser, "parse_args", return_value=args
                ),
                patch.object(checker, "ThreadPoolExecutor") as pool,
                redirect_stderr(error),
            ):
                self.assertEqual(2, checker.main())
                pool.assert_not_called()
            self.assertIn("CHECK FAILED:", error.getvalue())
            self.assertNotIn("Traceback", error.getvalue())

    def test_complete_gate_rejects_reduced_builds_or_catalog(self):
        total = (
            33  # This fixture's validated catalog, independent of the implementation.
        )
        for count, patches, changed_default in (
            (20, total, None),
            (21, total - 1, None),
            (21, total + 1, None),
            (21, total, 1),
            (21, total, 1.0),
        ):
            with (
                self.subTest(builds=count, patches=patches, default=changed_default),
                tempfile.TemporaryDirectory() as directory,
            ):
                root = Path(directory)
                names = ["Material You theme"] + [
                    f"Patch {index}" for index in range(total - 1)
                ]
                catalog = {
                    "version": "1.2.3",
                    "patches": [{"name": name} for name in names],
                }
                catalog["patches"][0]["default"] = True
                published = json.loads(json.dumps(catalog))
                if changed_default is not None:
                    published["patches"][0]["default"] = changed_default
                (root / "patches-list.json").write_text(
                    json.dumps(
                        {
                            **published,
                            "patches": published["patches"][:patches]
                            + ([{"name": "Extra patch"}] if patches > total else []),
                        }
                    )
                )
                bundle = root / "frozen/patches-1.2.3.mpp"
                bundle.parent.mkdir()
                with ZipFile(bundle, "w") as archive:
                    archive.writestr(
                        "META-INF/MANIFEST.MF", "Version: 1.2.3\nTimestamp: 123\n"
                    )
                digest = hashlib.sha256(bundle.read_bytes()).hexdigest()
                (bundle.parent / "catalog-evidence.json").write_text(
                    json.dumps(
                        {
                            "bundle": bundle.name,
                            "sha256": digest,
                            "dexValidated": True,
                            "catalog": catalog,
                        }
                    )
                )
                (root / "gradle.properties").write_text(
                    "version=1.2.3\nbundleTimestampMillis=123\n"
                )
                index = root / "patches-bundle.json"
                index.write_text(
                    json.dumps(
                        {
                            "version": "1.2.2",
                            "download_url": "https://github.com/SysAdminDoc/HushMessenger/releases/download/v1.2.2/patches-1.2.2.mpp",
                        }
                    )
                )
                args = argparse.Namespace(
                    codes=None,
                    bundle=bundle,
                    bundle_sha256=digest,
                    held_index_sha256=hashlib.sha256(index.read_bytes()).hexdigest(),
                )
                error = io.StringIO()
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
                    patch.object(
                        checker, "supported_codes", return_value=set(range(21))
                    ),
                    patch.object(checker, "ThreadPoolExecutor") as pool,
                    redirect_stderr(error),
                ):
                    self.assertEqual(2, checker.main())
                    pool.assert_not_called()
                if changed_default is not None:
                    self.assertIn("Development catalog differs", error.getvalue())
