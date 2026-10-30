import hashlib
import json
import os
import re
import shutil
import subprocess
import tempfile
import unittest
from datetime import datetime
from pathlib import Path


@unittest.skipUnless(shutil.which("pwsh"), "Release stages require PowerShell 7")
class ReleaseStages(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        release = self.root / "scripts/release/release.ps1"
        release.parent.mkdir(parents=True)
        shutil.copyfile(
            Path(__file__).resolve().parents[1] / "release/release.ps1", release
        )
        shutil.copyfile(
            Path(__file__).resolve().parents[1] / "walk-receipt.ps1",
            self.root / "scripts/walk-receipt.ps1",
        )
        self.release = release
        (self.root / ".gitignore").write_text("build/\ntrace.jsonl\nfrozen.mpp\n")
        (self.root / "gradle.properties").write_text("version=0.23.1\n")
        self.feed = self.root / "patches-bundle.json"
        self.feed.write_text('{"version":"0.23.0"}')
        self.bundle = self.root / "frozen.mpp"
        self.bundle.write_bytes(b"frozen development input")
        self.feed_hash = hashlib.sha256(self.feed.read_bytes()).hexdigest()
        self.bundle_hash = hashlib.sha256(self.bundle.read_bytes()).hexdigest()
        self.trace = self.root / "trace.jsonl"
        tests = self.root / "scripts/tests"
        tests.mkdir()
        (tests / "test_fixture.py").write_text(
            "import unittest\nclass Check(unittest.TestCase):\n def test_ok(self): self.assertTrue(True)\n"
        )
        # Substitute the external validator and builder, while executing the actual stage script and git checks.
        (self.root / "scripts/check_release.py").write_text(
            "import hashlib,json,pathlib,sys\n"
            "args=sys.argv[1:]\n"
            "def value(flag): return args[args.index(flag)+1]\n"
            "assert '--development' in args\n"
            "assert value('--held-index-sha256') == hashlib.sha256(pathlib.Path('patches-bundle.json').read_bytes()).hexdigest()\n"
            "assert value('--bundle-sha256') == hashlib.sha256(pathlib.Path(value('--bundle')).read_bytes()).hexdigest()\n"
            "with open('trace.jsonl','a') as out: out.write(json.dumps({'validation':args})+'\\n')\n"
        )
        self.wrapper = self.root / "build-wrapper.ps1"
        self.wrapper.write_text(
            "param([string]$ProjectDir,[string[]]$Tasks)\n"
            "@{tasks=$Tasks;fixtures=$env:HUSH_NATIVE_FIXTURES} | ConvertTo-Json -Compress | "
            "Add-Content -LiteralPath (Join-Path $ProjectDir 'trace.jsonl')\nexit 0\n"
        )
        self.public_state = self.root / "build/release/0.23.1/state.json"
        self.public_state.parent.mkdir(parents=True)
        self.public_state.write_text('{"prepare":{"sha256":"public receipt"}}')
        self.original_state = self.public_state.read_bytes()
        self.development_state = self.public_state.with_name("development-state.json")
        self.environment = os.environ | {
            "HUSHMESSENGER_BUILD_WRAPPER": str(self.wrapper),
            "BUILD_QUEUE_SCRIPT": "",
            "HUSH_NATIVE_FIXTURES": "private fixtures must not reach the unit preflight",
        }
        for arguments in (
            ("init", "-q"),
            ("config", "user.name", "SysAdminDoc"),
            ("config", "user.email", "matt_parker@outlook.com"),
            ("add", "."),
            ("commit", "-qm", "test release fixture"),
        ):
            subprocess.run(
                ["git", "-C", str(self.root), *arguments],
                check=True,
                capture_output=True,
            )

    def run_stage(self, stage="preflight", extra=(), cwd=None):
        return subprocess.run(
            [
                "pwsh",
                "-NoProfile",
                "-File",
                str(self.release),
                "-Stage",
                stage,
                "-Version",
                "0.23.1",
                *extra,
            ],
            cwd=cwd or self.root,
            env=self.environment,
            capture_output=True,
            text=True,
            timeout=40,
            check=False,
        )

    def development_inputs(self, **overrides):
        inputs = {
            "-Bundle": str(self.bundle),
            "-BundleSha256": self.bundle_hash,
            "-HeldIndexSha256": self.feed_hash,
        } | overrides
        return ["-Development", *[value for pair in inputs.items() for value in pair]]

    def builder_action(self, action):
        self.wrapper.write_text(
            self.wrapper.read_text().replace("exit 0", action + "\nexit 0")
        )
        subprocess.run(
            ["git", "-C", str(self.root), "add", "."], check=True, capture_output=True
        )
        subprocess.run(
            ["git", "-C", str(self.root), "commit", "-qm", "change test builder"],
            check=True,
            capture_output=True,
        )

    def test_local_preflight_times_the_actual_stage_and_keeps_public_receipts_and_feed(
        self,
    ):
        result = self.run_stage(extra=self.development_inputs())
        self.assertEqual(0, result.returncode, result.stdout + result.stderr)
        receipt = json.loads(self.development_state.read_text(encoding="utf-8-sig"))[
            "preflight"
        ]
        self.assertTrue(receipt["development"])
        self.assertGreaterEqual(receipt["seconds"], 0)
        self.assertLess(receipt["seconds"], 40)
        self.assertLess(
            datetime.fromisoformat(receipt["started"]),
            datetime.fromisoformat(receipt["finished"]),
        )
        self.assertEqual(self.bundle_hash, receipt["bundle_sha256"])
        self.assertEqual(self.feed_hash, receipt["held_index_sha256"])
        self.assertEqual(self.original_state, self.public_state.read_bytes())
        self.assertEqual(
            self.feed_hash, hashlib.sha256(self.feed.read_bytes()).hexdigest()
        )
        trace = [
            json.loads(line)
            for line in self.trace.read_text(encoding="utf-8-sig").splitlines()
        ]
        self.assertEqual(2, len(trace))
        self.assertIn("--development", trace[0]["validation"])
        self.assertEqual(
            [
                ":patches:test",
                ":extensions:messenger:testDebugUnitTest",
                "--no-configuration-cache",
            ],
            trace[1]["tasks"],
        )
        self.assertFalse(trace[1]["fixtures"])

    def test_relative_bundle_is_resolved_from_the_callers_directory_once(self):
        result = self.run_stage(
            extra=self.development_inputs(
                **{"-Bundle": str(Path(self.root.name) / self.bundle.name)}
            ),
            cwd=self.root.parent,
        )
        self.assertEqual(0, result.returncode, result.stdout + result.stderr)
        self.assertTrue(self.development_state.exists())

    def test_changed_frozen_input_stops_before_tests_and_cannot_leave_a_success_receipt(
        self,
    ):
        result = self.run_stage(
            extra=self.development_inputs(**{"-BundleSha256": "0" * 64})
        )
        self.assertNotEqual(0, result.returncode)
        self.assertFalse(self.trace.exists())
        self.assertFalse(self.development_state.exists())
        self.assertEqual(self.original_state, self.public_state.read_bytes())

    def test_development_cannot_prepare_build_publish_or_update_the_index(self):
        for stage in ("prepare", "build", "publish", "index"):
            with self.subTest(stage=stage):
                result = self.run_stage(stage, self.development_inputs())
                self.assertNotEqual(0, result.returncode)
                self.assertIn("only available for the local preflight", result.stderr)
                self.assertEqual(self.original_state, self.public_state.read_bytes())
        self.assertFalse(self.trace.exists())

    def test_prepare_refuses_a_missing_bundle_key_before_changing_anything(self):
        before = self.feed.read_bytes(), (self.root / "gradle.properties").read_bytes()
        result = self.run_stage(
            "prepare", ["-BundleKey", str(self.root / "no-such.key")]
        )
        self.assertNotEqual(0, result.returncode)
        self.assertIn("Pass -BundleKey", result.stderr)
        self.assertEqual(
            before,
            (self.feed.read_bytes(), (self.root / "gradle.properties").read_bytes()),
        )
        self.assertFalse(self.trace.exists())
        self.assertEqual(self.original_state, self.public_state.read_bytes())

    def test_publish_refuses_without_a_passing_walk_of_the_built_bundle(self):
        head = subprocess.run(
            ["git", "-C", str(self.root), "rev-parse", "HEAD"],
            check=True,
            capture_output=True,
            text=True,
        ).stdout.strip()
        assets = self.public_state.parent / "assets"
        assets.mkdir()
        bundle = assets / "patches-0.23.1.mpp"
        bundle.write_bytes(b"the built bundle")
        for name in ("SHA256SUMS.txt", "SHA256SUMS.txt.sig"):
            (assets / name).write_bytes(name.encode())
        bundle_hash = hashlib.sha256(bundle.read_bytes()).hexdigest()
        self.public_state.write_text(
            json.dumps({"build": {"commit": head, "sha256": bundle_hash}})
        )
        walk = self.root / "build/walk-receipt.json"

        def receipt(**change):
            return json.dumps(
                {
                    "schema": 2,
                    "result": "PASS",
                    "full": True,
                    "serial": "TESTPHONE01",
                    "device": "SM-S908U1",
                    "emulator": False,
                    "appVersion": "584.1.0.61.98",
                    "bundleSha256": bundle_hash,
                    "installedApkSha256": "4" * 64,
                    "started": "2026-10-21T16:00:00Z",
                    "finished": "2026-10-21T16:30:00Z",
                    "screens": 40,
                    "crashes": 0,
                    "problems": [],
                }
                | change
            )

        for name, written, expected in (
            ("no walk", None, "-Walk names the walk-receipt.json"),
            ("missing receipt", "", "there's no walk receipt at"),
            ("count-only receipt", receipt(schema=1), "isn't schema 2"),
            ("partial walk", receipt(result="PARTIAL", full=False), "the walk ended PARTIAL, not PASS"),
            ("crash", receipt(crashes=1), "recorded a Messenger crash"),
            ("another bundle", receipt(bundleSha256="5" * 64), "patched with bundle"),
        ):
            with self.subTest(name):
                walk.unlink(missing_ok=True)
                if written:
                    walk.write_text(written)
                result = self.run_stage("publish", () if written is None else ("-Walk", str(walk)))
                self.assertNotEqual(0, result.returncode)
                # pwsh wraps a long error at the console width, behind "| " on each line, and colors
                # the error view when TERM is set (Git Bash), which puts escape codes inside the wrap.
                plain = re.sub(r"\x1b\[[0-9;]*m", "", result.stderr + result.stdout)
                said = re.sub(r"\s*\n\s*\|\s*", " ", plain)
                self.assertIn(expected, said)
                self.assertFalse((self.public_state.parent / "notes.md").exists())
                tags = subprocess.run(
                    ["git", "-C", str(self.root), "tag", "--list"],
                    check=True,
                    capture_output=True,
                    text=True,
                ).stdout
                self.assertEqual("", tags)

    def test_public_build_cannot_reuse_a_development_preflight(self):
        self.development_state.write_text(
            '{"preflight":{"commit":"irrelevant","development":true}}'
        )
        result = self.run_stage("build")
        self.assertNotEqual(0, result.returncode)
        self.assertIn("Run -Stage preflight", result.stderr)
        self.assertFalse(self.trace.exists())

    def test_failed_rerun_invalidates_a_previous_development_success(self):
        passed = self.run_stage(extra=self.development_inputs())
        self.assertEqual(0, passed.returncode, passed.stderr)
        self.assertTrue(self.development_state.exists())
        self.bundle.write_bytes(b"changed outside the tracked checkout")
        failed = self.run_stage(extra=self.development_inputs())
        self.assertNotEqual(0, failed.returncode)
        self.assertFalse(self.development_state.exists())
        self.assertEqual(self.original_state, self.public_state.read_bytes())

    def test_builder_cannot_replace_the_validated_external_bundle(self):
        self.builder_action(
            "Set-Content -LiteralPath (Join-Path $ProjectDir 'frozen.mpp') -Value 'changed'"
        )
        result = self.run_stage(extra=self.development_inputs())
        self.assertNotEqual(0, result.returncode)
        self.assertIn("frozen bundle changed", result.stderr)
        self.assertFalse(self.development_state.exists())

    def test_builder_cannot_change_the_public_feed(self):
        self.builder_action(
            "Set-Content -LiteralPath (Join-Path $ProjectDir 'patches-bundle.json') -Value 'changed'"
        )
        result = self.run_stage(extra=self.development_inputs())
        self.assertNotEqual(0, result.returncode)
        self.assertIn("uncommitted changes", result.stderr)
        self.assertFalse(self.development_state.exists())

    def test_a_feed_change_git_status_misses_still_stops_the_preflight(self):
        self.builder_action(
            "& git -C $ProjectDir update-index --assume-unchanged patches-bundle.json\n"
            "Set-Content -LiteralPath (Join-Path $ProjectDir 'patches-bundle.json') -Value 'changed'"
        )
        result = self.run_stage(extra=self.development_inputs())
        self.assertNotEqual(0, result.returncode)
        self.assertIn("held public feed changed", result.stderr)
        self.assertFalse(self.development_state.exists())

    def test_uppercase_hashes_are_accepted_and_recorded_in_lowercase(self):
        result = self.run_stage(
            extra=self.development_inputs(
                **{
                    "-BundleSha256": self.bundle_hash.upper(),
                    "-HeldIndexSha256": self.feed_hash.upper(),
                }
            )
        )
        self.assertEqual(0, result.returncode, result.stdout + result.stderr)
        receipt = json.loads(self.development_state.read_text(encoding="utf-8-sig"))[
            "preflight"
        ]
        self.assertEqual(self.bundle_hash, receipt["bundle_sha256"])
        self.assertEqual(self.feed_hash, receipt["held_index_sha256"])

    def test_builder_cannot_stamp_a_different_commit_as_validated(self):
        self.builder_action(
            "& git -C $ProjectDir commit --allow-empty -qm 'later commit'"
        )
        result = self.run_stage(extra=self.development_inputs())
        self.assertNotEqual(0, result.returncode)
        self.assertIn("HEAD changed during preflight", result.stderr)
        self.assertFalse(self.development_state.exists())

    def test_stage_seconds_include_time_spent_waiting_in_the_builder(self):
        self.builder_action("Start-Sleep -Milliseconds 1500")
        result = self.run_stage(extra=self.development_inputs())
        self.assertEqual(0, result.returncode, result.stderr)
        receipt = json.loads(self.development_state.read_text(encoding="utf-8-sig"))[
            "preflight"
        ]
        self.assertGreaterEqual(receipt["seconds"], 1.5)

    def test_local_preflight_requires_explicit_hashes_and_a_clean_commit(self):
        missing = self.run_stage(extra=["-Development"])
        self.assertNotEqual(0, missing.returncode)
        self.assertIn("requires a frozen", missing.stderr)
        # .NET's $ also matches before a final newline, which would only fail after the whole test run.
        trailing = self.run_stage(
            extra=self.development_inputs(**{"-BundleSha256": self.bundle_hash + "\n"})
        )
        self.assertNotEqual(0, trailing.returncode)
        self.assertIn("requires a frozen", trailing.stderr)
        (self.root / "gradle.properties").write_text("version=0.23.1\nchanged=true\n")
        dirty = self.run_stage(extra=self.development_inputs())
        self.assertNotEqual(0, dirty.returncode)
        self.assertIn("uncommitted changes", dirty.stderr)
        self.assertFalse(self.trace.exists())


if __name__ == "__main__":
    unittest.main()
