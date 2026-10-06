#!/usr/bin/env python3
"""Regressions for pre-install certificate and permission checks."""

import argparse
import io
import subprocess
import tempfile
import unittest
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path
from unittest.mock import patch

from scripts import check_install as checker

A = "a" * 64
B = "b" * 64
STAMP = "c" * 64
PERMISSION = "app.hushfacebook.receiver.permission.ACCESS"
OWNERS = f"+ permission:android.permission.INTERNET\n  package:android\n+ permission:{PERMISSION}\n  package:com.facebook.katana\n"


def apk(package="com.facebook.orca", signers=(A,), code=346013440):
    return checker.Apk(
        package, code, "580.0.0.49.91", frozenset({PERMISSION}), frozenset(signers)
    )


class CertificateChecks(unittest.TestCase):
    def test_rotated_signer_is_selected_for_device_api_and_stamp_is_excluded(self):
        output = (
            "Number of signers: 1\n"
            f"Signer (minSdkVersion=33, maxSdkVersion=2147483647) certificate SHA-256 digest: {B}\n"
            f"Signer (minSdkVersion=24, maxSdkVersion=32) certificate SHA-256 digest: {A}\n"
            f"Source Stamp Signer certificate SHA-256 digest: {STAMP}\n"
        )
        self.assertEqual(checker.active_signers(output, 36), {B})
        self.assertEqual(checker.active_signers(output, 28), {A})

    def test_build_tools_37_scheme_prefixed_signers(self):
        self.assertEqual(
            checker.active_signers(
                f"Number of signers: 1\nV2 Signer: certificate SHA-256 digest: {A}\nV2 Signer: public key SHA-256 digest: {B}\n", 36
            ),
            {A},
        )
        self.assertEqual(
            checker.active_signers(f"Number of signers: 1\nV3.0 Signer: certificate SHA-256 digest: {A}\n", 36),
            {A},
        )
        rotated = (
            "Number of signers: 1\n"
            f"V3.1 Signer: (minSdkVersion=33, maxSdkVersion=2147483647) certificate SHA-256 digest: {B}\n"
            f"V3.0 Signer: (minSdkVersion=24, maxSdkVersion=32) certificate SHA-256 digest: {A}\n"
            f"Source Stamp Signer: certificate SHA-256 digest: {STAMP}\n"
        )
        self.assertEqual(checker.active_signers(rotated, 36), {B})
        self.assertEqual(checker.active_signers(rotated, 28), {A})

    def test_build_tools_37_unknown_or_mixed_records_fail_closed(self):
        for output in (
            f"Number of signers: 1\nV2 Signer: unknown certificate SHA-256 digest: {A}\n",
            f"Number of signers: 1\nV2 Signer: certificate SHA-256 digest: {A}\nV2 Signer: certificate SHA-256 digest: {B}\n",
            f"Number of signers: 2\nSigner #1 certificate SHA-256 digest: {A}\nV2 Signer: certificate SHA-256 digest: {B}\n",
            f"Number of signers: 1\nSource Stamp Signer: certificate SHA-256 digest: {A}\n",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.active_signers(output, 36)

    def test_multiple_signers_require_full_set(self):
        output = f"Number of signers: 2\nSigner #1 certificate SHA-256 digest: {A}\nSigner #2 certificate SHA-256 digest: {B}\n"
        self.assertEqual(checker.active_signers(output, 28), {A, B})
        self.assertTrue(
            checker.conflicts(apk(signers=(A, B)), {"com.facebook.orca": apk()}, {})
        )

    def test_missing_unknown_and_duplicate_signer_records_fail_closed(self):
        for output in (
            "",
            f"Number of signers: 1\nSource Stamp Signer certificate SHA-256 digest: {A}\n",
            f"Number of signers: 2\nSigner #1 certificate SHA-256 digest: {A}\n",
            f"Number of signers: 1\nSigner unknown certificate SHA-256 digest: {A}\n",
            f"Number of signers: 2\nSigner #1 certificate SHA-256 digest: {A}\nSigner #2 certificate SHA-256 digest: {A}\n",
            f"Number of signers: 1\nNumber of signers: 2\nSigner #1 certificate SHA-256 digest: {A}\n",
            f"Number of signers: 2\nSigner #1 certificate SHA-256 digest: {A}\nSigner #1 certificate SHA-256 digest: {B}\n",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.active_signers(output, 36)

    def test_indented_signer_records_are_counted_and_validated(self):
        valid = f"Number of signers: 1\nSigner #1 certificate SHA-256 digest: {A}\n"
        for extra in (
            "  Number of signers: 2\n",
            f"\tSigner #2 certificate SHA-256 digest: {B}\n",
            f"  Signer unknown certificate SHA-256 digest: {B}\n",
        ):
            with self.subTest(extra=extra), self.assertRaises(ValueError):
                checker.active_signers(valid + extra, 36)
        indented = (
            "  Number of signers: 2\n"
            f"\tSigner #1 certificate SHA-256 digest: {A}\n"
            f"  Signer #2 certificate SHA-256 digest: {B}\n"
            f"  Source Stamp Signer certificate SHA-256 digest: {STAMP}\n"
        )
        self.assertEqual(checker.active_signers(indented, 28), {A, B})

    def test_changed_key_is_not_approved_as_rotation(self):
        problems = checker.conflicts(
            apk(signers=(B,)), {"com.facebook.orca": apk()}, {}
        )
        self.assertIn("does not approve certificate rotation", problems[0])

    def test_same_key_update_and_permission_owner_pass(self):
        installed = {
            "com.facebook.orca": apk(),
            "com.facebook.katana": apk("com.facebook.katana"),
        }
        self.assertEqual(
            checker.conflicts(apk(), installed, {PERMISSION: "com.facebook.katana"}), []
        )

    def test_different_key_owner_is_named(self):
        installed = {"com.facebook.katana": apk("com.facebook.katana", (B,))}
        problems = checker.conflicts(
            apk(), installed, {PERMISSION: "com.facebook.katana"}
        )
        self.assertIn(PERMISSION, problems[0])
        self.assertIn("com.facebook.katana", problems[0])

    def test_renamed_permissions_do_not_require_matching_stock_facebook_key(self):
        installed = {"com.facebook.katana": apk("com.facebook.katana", (B,))}
        self.assertEqual(
            checker.conflicts(
                apk(),
                installed,
                {"com.facebook.receiver.permission.ACCESS": "com.facebook.katana"},
            ),
            [],
        )

    def test_downgrade_and_unreadable_owner_fail(self):
        self.assertIn(
            "downgrade",
            checker.conflicts(apk(), {"com.facebook.orca": apk(code=346013441)}, {})[0],
        )
        with self.assertRaises(ValueError):
            checker.conflicts(apk(), {}, {PERMISSION: "com.facebook.katana"})

    def test_normal_downgrade_keeps_the_plain_message(self):
        self.assertEqual(
            checker.conflicts(apk(), {"com.facebook.orca": apk(code=346013441)}, {}),
            ["Version downgrade: installed 346013441, candidate 346013440."],
        )

    def test_spoofed_version_code_is_named_with_the_readme_fix(self):
        installed = {"com.facebook.orca": apk(code=2147483647)}
        leftover_only = checker.conflicts(apk(), {}, {}, leftover=2147483647)
        for problems in (checker.conflicts(apk(), installed, {}), leftover_only):
            with self.subTest(problems=problems):
                self.assertEqual(len(problems), 1)
                self.assertIn("2147483647", problems[0])
                self.assertIn('"Spoof package version"', problems[0])
                self.assertIn("INSTALL_FAILED_VERSION_DOWNGRADE", problems[0])
        self.assertIn("uninstalled with its data kept", leftover_only[0])

    def test_spoofed_help_names_a_readme_section_that_exists(self):
        readme = (Path(__file__).parents[2] / "README.md").read_text(encoding="utf-8")
        section = readme.split("### If something doesn't work", 1)
        self.assertEqual(len(section), 2)
        self.assertIn('"If something doesn\'t work"', checker.SPOOFED_HELP)
        self.assertIn(
            "INSTALL_FAILED_VERSION_DOWNGRADE", section[1].split("\n### ", 1)[0]
        )

    def test_leftover_data_only_conflicts_when_newer(self):
        self.assertIn(
            "Android refuses anything lower",
            checker.conflicts(apk(), {}, {}, leftover=346013441)[0],
        )
        self.assertEqual(checker.conflicts(apk(), {}, {}, leftover=346013387), [])
        self.assertEqual(checker.conflicts(apk(), {}, {}, leftover=None), [])

    def test_leftover_version_inventory_is_read_exactly(self):
        output = (
            "package:com.facebook.orca.extra versionCode:1\n"
            "package:com.facebook.orca versionCode:2147483647\n"
        )
        self.assertEqual(
            checker.leftover_version(output, "com.facebook.orca"), 2147483647
        )
        self.assertIsNone(checker.leftover_version("", "com.facebook.orca"))
        for output in (
            "package:com.facebook.orca\n",
            "Error: unknown option --show-versioncode\n",
            "package:com.facebook.orca versionCode:1\npackage:com.facebook.orca versionCode:2\n",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.leftover_version(output, "com.facebook.orca")

    def test_permission_inventory_must_be_complete_and_unambiguous(self):
        self.assertEqual(
            checker.permission_owners(OWNERS)[PERMISSION], "com.facebook.katana"
        )
        for output in (
            "",
            "Error: access denied",
            OWNERS + f"+ permission:{PERMISSION}\n",
            OWNERS + OWNERS,
            OWNERS + "+ permission:bad permission\n  package:other.owner\n",
            OWNERS + "  package:other.owner\n",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.permission_owners(output)

    def test_failed_signature_verification_cannot_supply_certificates(self):
        failure = subprocess.CompletedProcess(
            ["java"], 1, f"Signer #1 certificate SHA-256 digest: {A}", "DOES NOT VERIFY"
        )
        with (
            patch.object(checker.subprocess, "run", return_value=failure),
            self.assertRaisesRegex(ValueError, "DOES NOT VERIFY"),
        ):
            checker.run(["java", "-jar", "apksigner.jar", "verify"])

    def test_live_check_uses_only_read_only_adb_commands_and_removes_pulled_apks(self):
        calls = []
        pulled = []
        with tempfile.TemporaryDirectory() as root:
            candidate = Path(root) / "candidate.apk"
            candidate.write_bytes(b"fixture")
            args = argparse.Namespace(
                apk=candidate, serial="selected-phone", adb=Path("adb")
            )

            def device(command):
                calls.append(command)
                self.assertEqual(command[:3], ["adb", "-s", "selected-phone"])
                operation = command[3:]
                if operation == ["get-state"]:
                    return "device\n"
                if operation == ["shell", "getprop", "ro.build.version.sdk"]:
                    return "36\n"
                if operation == ["shell", "getprop", "ro.product.cpu.abilist"]:
                    return "arm64-v8a,armeabi-v7a\n"
                if operation == ["shell", "getconf", "PAGE_SIZE"]:
                    return "16384\n"
                if operation == ["shell", "pm", "list", "permissions", "-f"]:
                    return OWNERS
                if operation == ["shell", "pm", "list", "users"]:
                    return "Users:\n  UserInfo{0:Private name:c13} running\n"
                if operation == ["shell", "pm", "list", "packages", "--user", "0"]:
                    return "package:android\npackage:com.facebook.orca\npackage:com.facebook.katana\n"
                if operation[:5] == ["shell", "pm", "path", "--user", "0"]:
                    return f"package:/data/app/{operation[5]}/base.apk\npackage:/data/app/{operation[5]}/split.apk\n"
                if operation[0] == "pull":
                    path = Path(operation[2])
                    path.write_bytes(b"pulled APK")
                    pulled.append(path)
                    return ""
                self.fail(f"Unexpected device operation: {operation}")

            with (
                patch.object(checker, "run", side_effect=device),
                patch.object(checker, "check_native"),
                patch.object(
                    checker,
                    "read_apk",
                    side_effect=[apk(), apk("com.facebook.katana"), apk()],
                ),
                redirect_stdout(io.StringIO()),
            ):
                self.assertEqual(checker.check(args), 0)
            self.assertEqual(len(pulled), 2)
            self.assertTrue(all(not path.exists() for path in pulled))
            self.assertTrue(calls)

    def test_other_user_installation_is_checked_without_printing_user_names(self):
        calls = []
        with tempfile.TemporaryDirectory() as root:
            candidate = Path(root) / "candidate.apk"
            candidate.write_bytes(b"fixture")
            args = argparse.Namespace(apk=candidate, serial="phone", adb=Path("adb"))

            def device(command):
                operation = command[3:]
                calls.append(operation)
                results = {
                    ("get-state",): "device",
                    ("shell", "getprop", "ro.build.version.sdk"): "28",
                    ("shell", "getprop", "ro.product.cpu.abilist"): "arm64-v8a",
                    ("shell", "getconf", "PAGE_SIZE"): "4096",
                    ("shell", "pm", "list", "permissions", "-f"): OWNERS,
                    (
                        "shell",
                        "pm",
                        "list",
                        "users",
                    ): "Users:\n UserInfo{0:Secret owner:c13} running\n UserInfo{10:Private work profile:30}\n",
                    (
                        "shell",
                        "pm",
                        "list",
                        "packages",
                        "--user",
                        "0",
                    ): "package:android\npackage:com.facebook.katana\n",
                    (
                        "shell",
                        "pm",
                        "list",
                        "packages",
                        "--user",
                        "10",
                    ): "package:android\npackage:com.facebook.orca\n",
                }
                if tuple(operation) in results:
                    return results[tuple(operation)]
                if operation[:3] == ["shell", "pm", "path"]:
                    return f"package:/data/app/{operation[-1]}/base.apk\n"
                if operation[0] == "pull":
                    Path(operation[2]).write_bytes(b"pulled")
                    return ""
                self.fail(operation)

            output = io.StringIO()
            with (
                patch.object(checker, "run", side_effect=device),
                patch.object(checker, "check_native"),
                patch.object(
                    checker,
                    "read_apk",
                    side_effect=[apk(), apk("com.facebook.katana"), apk(signers=(B,))],
                ),
                redirect_stdout(output),
            ):
                self.assertEqual(checker.check(args), 1)
            self.assertIn(
                ["shell", "pm", "path", "--user", "10", "com.facebook.orca"], calls
            )
            self.assertNotIn("Secret owner", output.getvalue())
            self.assertNotIn("Private work profile", output.getvalue())

    def test_spoofed_leftover_data_is_found_when_messenger_is_not_installed(self):
        calls = []
        with tempfile.TemporaryDirectory() as root:
            candidate = Path(root) / "candidate.apk"
            candidate.write_bytes(b"fixture")
            args = argparse.Namespace(apk=candidate, serial="phone", adb=Path("adb"))
            versions = [
                "shell",
                "pm",
                "list",
                "packages",
                "-u",
                "--show-versioncode",
                "--user",
            ]

            def device(command):
                operation = command[3:]
                calls.append(operation)
                results = {
                    ("get-state",): "device",
                    ("shell", "getprop", "ro.build.version.sdk"): "36",
                    ("shell", "pm", "list", "permissions", "-f"): OWNERS,
                    (
                        "shell",
                        "pm",
                        "list",
                        "users",
                    ): "Users:\n UserInfo{0:Owner:c13} running\n UserInfo{10:Work:30}\n",
                    ("shell", "pm", "list", "packages", "--user", "0"): (
                        "package:android\npackage:com.facebook.katana\n"
                    ),
                    ("shell", "pm", "list", "packages", "--user", "10"): (
                        "package:android\n"
                    ),
                    tuple(versions + ["0", "com.facebook.orca"]): (
                        "package:com.facebook.orca versionCode:2147483647\n"
                    ),
                    tuple(versions + ["10", "com.facebook.orca"]): "",
                }
                if tuple(operation) in results:
                    return results[tuple(operation)]
                if operation[:3] == ["shell", "pm", "path"]:
                    return f"package:/data/app/{operation[-1]}/base.apk\n"
                if operation[0] == "pull":
                    Path(operation[2]).write_bytes(b"pulled")
                    return ""
                self.fail(operation)

            output = io.StringIO()
            with (
                patch.object(checker, "run", side_effect=device),
                patch.object(checker, "check_native"),
                patch.object(
                    checker,
                    "read_apk",
                    side_effect=[apk(), apk("com.facebook.katana")],
                ),
                redirect_stdout(output),
            ):
                self.assertEqual(checker.check(args), 1)
            text = output.getvalue()
            self.assertIn(
                "NOTE: com.facebook.orca was uninstalled with its data kept", text
            )
            self.assertIn("CONFLICT: Version downgrade", text)
            self.assertIn('"Spoof package version"', text)
            self.assertNotIn(
                ["shell", "pm", "path", "--user", "0", "com.facebook.orca"], calls
            )


class ParserAndCliChecks(unittest.TestCase):
    def setUp(self):
        self.args = argparse.Namespace(build_tools=Path("tools"), java=Path("java"))
        self.badging = "package: name='com.facebook.orca' versionCode='346013440' versionName='580.0.0.49.91'\n"
        self.permissions = f"package: com.facebook.orca\npermission: {PERMISSION}\n"
        self.certificates = (
            f"Number of signers: 1\nSigner #1 certificate SHA-256 digest: {A}\n"
        )

    def test_real_parser_and_sdk_specific_signature_command(self):
        for sdk in (28, 36):
            with (
                self.subTest(sdk=sdk),
                patch.object(
                    checker,
                    "run",
                    side_effect=[self.badging, self.permissions, self.certificates],
                ) as run,
            ):
                self.assertEqual(
                    checker.read_apk(Path("valid.apk"), self.args, sdk), apk()
                )
                command = run.call_args.args[0]
                self.assertEqual(
                    command[command.index("--min-sdk-version") + 1], str(sdk)
                )
                self.assertEqual(
                    command[command.index("--max-sdk-version") + 1], str(sdk)
                )

    def test_permission_parser_rejects_partial_duplicate_or_wrong_package_output(self):
        for output in (
            self.permissions + "permission: bad permission\n",
            self.permissions + f"permission: {PERMISSION}\n",
            self.permissions.replace(
                "package: com.facebook.orca", "package: other.app"
            ),
            self.permissions.replace("package: com.facebook.orca\n", ""),
        ):
            with (
                self.subTest(output=output),
                patch.object(
                    checker,
                    "run",
                    side_effect=[self.badging, output, self.certificates],
                ),
                self.assertRaises(ValueError),
            ):
                checker.read_apk(Path("bad.apk"), self.args, 36)

    def test_indented_permission_records_are_counted_and_validated(self):
        for extra in (
            "  permission: bad permission\n",
            f"\tpermission: {PERMISSION}\n",
            "  package: other.app\n",
        ):
            with (
                self.subTest(extra=extra),
                patch.object(
                    checker,
                    "run",
                    side_effect=[
                        self.badging,
                        self.permissions + extra,
                        self.certificates,
                    ],
                ),
                self.assertRaises(ValueError),
            ):
                checker.read_apk(Path("bad.apk"), self.args, 36)
        indented = "\n".join("  " + line for line in self.permissions.splitlines())
        with patch.object(
            checker,
            "run",
            side_effect=["\t" + self.badging, indented, self.certificates],
        ):
            self.assertEqual(checker.read_apk(Path("valid.apk"), self.args, 36), apk())

    def test_multiple_package_headers_are_not_silently_accepted(self):
        with (
            patch.object(
                checker,
                "run",
                side_effect=[self.badging * 2, self.permissions, self.certificates],
            ),
            self.assertRaises(ValueError),
        ):
            checker.read_apk(Path("bad.apk"), self.args, 36)

    def test_incomplete_user_and_package_inventories_fail_closed(self):
        for output in (
            "",
            "Users:\n",
            "Users:\n UserInfo{0:owner:c13}\ntruncated",
            "Users:\n UserInfo{0:owner:c13}\n UserInfo{0:owner:c13}",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.user_ids(output)
        for output in (
            "",
            "package:android\npackage:bad package",
            "package:android\nError: unavailable",
            "package:android\npackage:android",
        ):
            with self.subTest(output=output), self.assertRaises(ValueError):
                checker.package_names(output)

    def test_cli_errors_and_conflicts_have_stable_exit_codes_without_tracebacks(self):
        argv = [
            "check_install.py",
            "--apk",
            "missing.apk",
            "--serial",
            "phone",
            "--build-tools",
            "tools",
        ]
        for error in (
            OSError("missing tool"),
            ValueError("invalid output"),
            subprocess.TimeoutExpired("adb", 120),
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
        for result in (0, 1):
            with (
                patch("sys.argv", argv),
                patch.object(checker, "check", return_value=result),
            ):
                self.assertEqual(checker.main(), result)


class RecordedBuildChecks(unittest.TestCase):
    def test_builds_and_checksums_come_from_compat_report_records(self):
        with tempfile.TemporaryDirectory() as root:
            for code, version in (
                (347000001, "581.0.0.1.91"),
                (346013370, "580.0.0.49.91"),
            ):
                Path(root, f"{code}.txt").write_text(
                    f"# header\nversion {version}\ncode {code}\nsha256 {str(code) * 2}\n"
                    "hook ads LX/A;->a()V\npluginSentinel LX/B;->c:Ljava/lang/Object;\n",
                    encoding="utf-8",
                )
            builds = checker.recorded_builds(Path(root))
            self.assertEqual(
                builds,
                {
                    346013370: ("580.0.0.49.91", "346013370" * 2),
                    347000001: ("581.0.0.1.91", "347000001" * 2),
                },
            )
            with patch.object(checker, "BUILDS", builds):
                self.assertEqual(
                    checker.supported_builds(),
                    "580.0.0.49.91, version code 346013370; 581.0.0.1.91, version code 347000001",
                )
        self.assertTrue(checker.BUILDS)
        self.assertEqual(set(checker.STOCK_SHA256), set(checker.BUILDS))
        for version, sha256 in checker.BUILDS.values():
            self.assertRegex(version, r"^\d+(\.\d+)+$")
            self.assertRegex(sha256, r"^[0-9a-f]{64}$")


if __name__ == "__main__":
    unittest.main()
