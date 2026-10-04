import copy
import hashlib
import importlib.util
import io
import json
import os
import re
import shutil
import struct
import subprocess
import sys
import tempfile
import unittest
import zipfile
from contextlib import redirect_stderr, redirect_stdout
from pathlib import Path
from unittest.mock import patch

spec = importlib.util.spec_from_file_location(
    "check_release", Path(__file__).parents[1] / "check_release.py"
)
release = importlib.util.module_from_spec(spec)
spec.loader.exec_module(release)

SSH_KEYGEN = shutil.which("ssh-keygen")
GIT = shutil.which("git")
REPO = Path(__file__).parents[2]
# Fixtures replace the git lookup; keep the real one for the test that builds a repository.
TAGGED_PUBLIC_FEED = release.tagged_public_feed


class FakeGradle:
    """Popen stand-in whose output pipes stay open for a set number of waits."""

    pid = 4321

    def __init__(self, returncode=0, output="", timeouts=0):
        self.returncode = None
        self.result = returncode
        self.output = output
        self.timeouts = timeouts
        self.waits = []
        self.killed = False

    def communicate(self, timeout=None):
        self.waits.append(timeout)
        if self.timeouts:
            self.timeouts -= 1
            raise subprocess.TimeoutExpired("gradlew", timeout)
        self.returncode = self.result
        return self.output, ""

    def kill(self):
        self.killed = True


def new_key(path):
    subprocess.run(
        [SSH_KEYGEN, "-q", "-t", "ed25519", "-N", "", "-C", "test", "-f", str(path)],
        check=True,
        capture_output=True,
    )
    return path.with_name(path.name + ".pub").read_text(encoding="utf-8").split()[:2]


def sign(key, file, namespace=release.SIGNATURE_NAMESPACE):
    signature = file.with_name(file.name + ".sig")
    signature.unlink(missing_ok=True)
    subprocess.run(
        [SSH_KEYGEN, "-Y", "sign", "-f", str(key), "-n", namespace, str(file)],
        check=True,
        capture_output=True,
    )


class ReleaseChecks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.bundle = self.root / "patches/build/libs/patches-1.2.3.mpp"
        self.bundle.parent.mkdir(parents=True)
        with zipfile.ZipFile(self.bundle, "w") as archive:
            archive.writestr(
                "META-INF/MANIFEST.MF",
                "Manifest-Version: 1.0\r\nVersion: 1.2.3\r\nTimestamp: 1790552148000\r\n\r\n",
            )
            archive.writestr("classes.dex", b"fixture")
            archive.writestr("extensions/messenger.mpe", b"fixture")
        self.digest = hashlib.sha256(self.bundle.read_bytes()).hexdigest()
        self.catalog = {
            "version": "1.2.3",
            "patches": [
                {"name": f"Control {n}", "default": True, "dependencies": []}
                for n in range(32)
            ],
        }
        self.index = {
            "version": "1.2.3",
            "created_at": "2026-09-27T23:35:48",
            "download_url": "https://github.com/SysAdminDoc/HushMessenger/releases/download/v1.2.3/patches-1.2.3.mpp",
        }
        self.write(
            "gradle.properties", "version=1.2.3\nbundleTimestampMillis=1790552148000\n"
        )
        self.write("patches-bundle.json", json.dumps(self.index))
        self.write("patches-list.json", json.dumps(self.catalog))
        self.write(
            "patches/build/reports/catalog-evidence.json",
            json.dumps(
                {
                    "bundle": self.bundle.name,
                    "sha256": self.digest,
                    "dexValidated": True,
                    "catalog": self.catalog,
                }
            ),
        )
        self.write(
            "README.md",
            f"https://img.shields.io/badge/version-1.2.3-blue\n{self.digest}  patches-1.2.3.mpp\n",
        )
        self.write("CHANGELOG.md", "# Changelog\n\n## 1.2.3 (2026-09-27)\n")
        self.write(
            "extensions/messenger/build.gradle.kts",
            "versionName = project.version.toString()\n",
        )
        # Feed bytes committed at each fixture release tag, keyed by version.
        self.tags = {}
        tagged = patch.object(release, "tagged_public_feed", self.tagged_feed)
        tagged.start()
        self.addCleanup(tagged.stop)

    def tagged_feed(self, root, version):
        self.assertEqual(self.root, root)
        release.require(version in self.tags, f"Release tag v{version} is missing")
        return self.tags[version]

    def hold(self, version="1.2.2"):
        """Switch to development metadata with an older public feed recorded at its tag."""
        self.write("README.md", "https://img.shields.io/badge/development-1.2.3-blue\n")
        self.write("CHANGELOG.md", "## Unreleased\n")
        self.write(
            "patches-bundle.json",
            json.dumps(
                {
                    **self.index,
                    "version": version,
                    "download_url": self.index["download_url"].replace(
                        "1.2.3", version
                    ),
                },
                indent=2,
            )
            + "\n",
        )
        feed = (self.root / "patches-bundle.json").read_bytes()
        self.tags[version] = feed
        return hashlib.sha256(feed).hexdigest()

    def write(self, path, text):
        target = self.root / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(text, encoding="utf-8")

    def test_complete_release_passes_and_explicit_tag_or_checksum_mismatch_fails(self):
        self.assertIn(
            "Release metadata passed", release.verify(self.root, release_tag="v1.2.3")
        )
        with self.assertRaisesRegex(ValueError, "tag differs"):
            release.verify(self.root, release_tag="v1.2.4")
        self.write("SHA256SUMS.txt", f"{self.digest}  {self.bundle.name}\n")
        release.verify(self.root, checksums=self.root / "SHA256SUMS.txt")
        self.write("SHA256SUMS.txt", f"{'0' * 64}  {self.bundle.name}\n")
        with self.assertRaisesRegex(ValueError, "checksum file"):
            release.verify(self.root, checksums=self.root / "SHA256SUMS.txt")

    def test_development_freezes_current_catalog_and_preserves_held_feed(self):
        held = self.hold()
        # Public releases used 32; this development fixture intentionally contains 33.
        self.catalog["patches"].append({"name": "New control"})
        self.write("patches-list.json", json.dumps(self.catalog))
        destination = self.root / "frozen"

        def validate(root, bundle, evidence):
            self.assertFalse(release.mutable_output(root, bundle))
            evidence.write_text(
                json.dumps(
                    {
                        "bundle": bundle.name,
                        "sha256": hashlib.sha256(bundle.read_bytes()).hexdigest(),
                        "dexValidated": True,
                        "catalog": self.catalog,
                    }
                )
            )

        with patch.object(release, "validate_catalog", side_effect=validate):
            output = io.StringIO()
            with redirect_stdout(output):
                self.assertEqual(
                    0,
                    release.main(
                        [
                            "--root",
                            str(self.root),
                            "--development",
                            "--held-index-sha256",
                            held,
                            "--freeze",
                            str(destination),
                        ]
                    ),
                )
            self.assertIn("33 patches, held public v1.2.2", output.getvalue())
            frozen = destination / self.bundle.name
            sums = destination / "SHA256SUMS.txt"
            cli = [
                "--root",
                str(self.root),
                "--development",
                "--held-index-sha256",
                held,
                "--bundle",
                str(frozen),
                "--bundle-sha256",
                self.digest,
                "--checksums",
                str(sums),
            ]
            # A later producer write doesn't touch the validated snapshot.
            self.bundle.write_bytes(b"later Java-only producer")
            with redirect_stdout(io.StringIO()):
                self.assertEqual(0, release.main(cli))
            self.assertEqual(
                self.digest, hashlib.sha256(frozen.read_bytes()).hexdigest()
            )
            frozen_data = frozen.read_bytes()

            def changed_during_signature(root, checksum):
                frozen.write_bytes(b"changed while verifying signature")
                return "Good signature"

            with (
                patch.object(
                    release, "verify_signature", side_effect=changed_during_signature
                ),
                redirect_stdout(io.StringIO()),
                redirect_stderr(io.StringIO()),
            ):
                self.assertEqual(1, release.main([*cli, "--verify-signature"]))
            frozen.write_bytes(frozen_data)
            for path, data in [
                (frozen, b"changed"),
                (self.root / "patches-bundle.json", b"changed held feed"),
            ]:
                original = path.read_bytes()
                path.write_bytes(data)
                error = io.StringIO()
                with redirect_stderr(error):
                    self.assertEqual(1, release.main(cli))
                self.assertIn("changed", error.getvalue().lower())
                path.write_bytes(original)

    def test_release_count_follows_current_exact_catalog_without_relaxing_metadata(
        self,
    ):
        self.catalog["patches"].append({"name": "New control"})
        self.write("patches-list.json", json.dumps(self.catalog))
        self.write(
            "patches/build/reports/catalog-evidence.json",
            json.dumps(
                {
                    "bundle": self.bundle.name,
                    "sha256": self.digest,
                    "dexValidated": True,
                    "catalog": self.catalog,
                }
            ),
        )
        self.assertIn("33 patches", release.verify(self.root))
        self.catalog["patches"][-1]["name"] = "Control 0"
        self.write("patches-list.json", json.dumps(self.catalog))
        self.write(
            "patches/build/reports/catalog-evidence.json",
            json.dumps(
                {
                    "bundle": self.bundle.name,
                    "sha256": self.digest,
                    "dexValidated": True,
                    "catalog": self.catalog,
                }
            ),
        )
        with self.assertRaisesRegex(ValueError, "Duplicate"):
            release.verify(self.root)

    def test_release_requires_structural_dex_evidence(self):
        evidence = self.root / "patches/build/reports/catalog-evidence.json"
        payload = json.loads(evidence.read_text(encoding="utf-8"))
        # Evidence from the older catalog tool had no DEX walk; a truthy string isn't true.
        for value in (None, False, "true", 1):
            changed = dict(payload)
            if value is None:
                del changed["dexValidated"]
            else:
                changed["dexValidated"] = value
            evidence.write_text(json.dumps(changed), encoding="utf-8")
            with (
                self.subTest(dexValidated=value),
                self.assertRaisesRegex(ValueError, "structural DEX validation"),
            ):
                release.verify(self.root)

    def test_development_feed_must_be_an_older_release_matching_its_tag(self):
        evidence = self.root / "patches/build/reports/catalog-evidence.json"

        def check(held):
            return release.verify_development(self.root, self.bundle, evidence, held)

        held = self.hold()
        self.assertIn("held public v1.2.2", check(held))
        # Git stores the feed with LF endings, so a CRLF checkout of it still matches.
        tagged = self.tags["1.2.2"].replace(b"\r\n", b"\n")
        self.tags["1.2.2"] = tagged
        crlf = tagged.replace(b"\n", b"\r\n")
        (self.root / "patches-bundle.json").write_bytes(crlf)
        self.assertIn("held public v1.2.2", check(hashlib.sha256(crlf).hexdigest()))

        # A premature edit hashed after the fact still differs from the tagged feed.
        index = json.loads(tagged)
        index["created_at"] = "2026-09-28T00:00:00"
        premature = json.dumps(index, indent=2).encode() + b"\n"
        (self.root / "patches-bundle.json").write_bytes(premature)
        with self.assertRaisesRegex(
            ValueError, "differs from patches-bundle.json at tag v1.2.2"
        ):
            check(hashlib.sha256(premature).hexdigest())

        # So does a feed bumped to the development version, even with that tag present.
        held = self.hold("1.2.3")
        with self.assertRaisesRegex(ValueError, "must be older than development"):
            check(held)

        held = self.hold()
        del self.tags["1.2.2"]
        with self.assertRaisesRegex(ValueError, "v1.2.2 is missing"):
            check(held)

    @unittest.skipIf(GIT is None, "git isn't installed")
    def test_tagged_feed_is_read_from_the_release_tag_with_git(self):
        repository = self.root / "repository"
        repository.mkdir()
        # Ignore any outer repository a caller's environment points git at.
        environment = {
            name: value
            for name, value in os.environ.items()
            if not name.startswith("GIT_")
        }

        def git(*args, data=None):
            return (
                subprocess.run(
                    [GIT, *args],
                    cwd=repository,
                    env=environment,
                    input=data,
                    capture_output=True,
                    check=True,
                )
                .stdout.decode()
                .strip()
            )

        git("init", "-q")
        feed = b'{\r\n  "version": "1.2.2"\r\n}\r\n'
        blob = git("hash-object", "-w", "--stdin", data=feed)
        # A tag on a bare tree needs no commit, so no hooks or signing run here.
        tree = git("mktree", data=f"100644 blob {blob}\tpatches-bundle.json\n".encode())
        git("update-ref", "refs/tags/v1.2.2", tree)
        with patch.dict(os.environ, environment, clear=True):
            self.assertEqual(feed, TAGGED_PUBLIC_FEED(repository, "1.2.2"))
            with self.assertRaisesRegex(
                ValueError, "v1.2.3 or its patches-bundle.json is missing"
            ):
                TAGGED_PUBLIC_FEED(repository, "1.2.3")
        with (
            patch.object(
                release.subprocess, "run", side_effect=FileNotFoundError("git")
            ),
            self.assertRaisesRegex(ValueError, "Couldn't read the v1.2.2 public feed"),
        ):
            TAGGED_PUBLIC_FEED(repository, "1.2.2")

    def test_freeze_rejects_mutable_destination_changed_producer_and_catalog_drift(
        self,
    ):
        held = self.hold()
        with self.assertRaisesRegex(ValueError, "mutable Gradle"):
            release.freeze_development(
                self.root, self.bundle, self.bundle.parent / "frozen", held
            )
        destination = self.root / "frozen"
        original = self.bundle.read_bytes()
        for case, reason in [
            ("producer", "Producer bundle changed"),
            ("catalog", "catalog differs"),
            ("version", "Bundle filename differs"),
            ("hash", "evidence is stale"),
            ("dex", "structural DEX validation"),
        ]:

            def validate(root, bundle, evidence, case=case):
                catalog = copy.deepcopy(self.catalog)
                if case == "catalog":
                    catalog["patches"][0]["default"] = False
                if case == "version":
                    self.write(
                        "gradle.properties",
                        "version=1.2.4\nbundleTimestampMillis=1790552148000\n",
                    )
                if case == "producer":
                    self.bundle.write_bytes(b"producer changed during validation")
                evidence.write_text(
                    json.dumps(
                        {
                            "bundle": bundle.name,
                            "sha256": self.digest if case != "hash" else "0" * 64,
                            "dexValidated": case != "dex",
                            "catalog": catalog,
                        }
                    )
                )

            with (
                self.subTest(case=case),
                patch.object(release, "validate_catalog", side_effect=validate),
                self.assertRaisesRegex(ValueError, reason),
            ):
                release.freeze_development(self.root, self.bundle, destination, held)
            self.assertFalse(destination.exists())
            self.assertEqual([], list(self.root.glob(".hush-freeze-*")))
            self.bundle.write_bytes(original)
            self.write(
                "gradle.properties",
                "version=1.2.3\nbundleTimestampMillis=1790552148000\n",
            )

    def test_freeze_cleanup_retries_and_reports_a_locked_staging_folder(self):
        held = self.hold()
        destination = self.root / "frozen"
        remove = shutil.rmtree
        for locked in (1, len(release.STAGING_REMOVAL_DELAYS) + 1):
            attempts = []

            def rmtree(path, *args, locked=locked, attempts=attempts, **kwargs):
                attempts.append(Path(path))
                if len(attempts) <= locked:
                    raise PermissionError(13, "The file is in use", str(path))
                remove(path, *args, **kwargs)

            with (
                self.subTest(locked=locked),
                patch.object(
                    release, "validate_catalog", side_effect=ValueError("invalid DEX")
                ),
                patch.object(release.shutil, "rmtree", side_effect=rmtree),
                patch.object(release.time, "sleep") as sleep,
                self.assertRaisesRegex(ValueError, "invalid DEX") as raised,
            ):
                release.freeze_development(self.root, self.bundle, destination, held)
            staging = attempts[0]
            self.assertTrue(staging.name.startswith(".hush-freeze-"))
            self.assertEqual({staging}, set(attempts))
            self.assertFalse(destination.exists())
            if locked == 1:
                self.assertEqual(2, len(attempts))
                self.assertEqual(1, sleep.call_count)
                self.assertFalse(staging.exists())
                self.assertNotIn("Leftover", str(raised.exception))
            else:
                self.assertEqual(locked, len(attempts))
                self.assertTrue(staging.exists())
                self.assertIn(
                    f"invalid DEX\nLeftover staging folder: {staging}",
                    str(raised.exception),
                )
                remove(staging)

    def test_catalog_validation_runs_gradlew_directly_and_does_not_reuse_old_evidence(
        self,
    ):
        evidence = self.root / "evidence.json"
        evidence.write_text("old evidence")
        gradle = FakeGradle(1, "invalid DEX")
        with (
            patch.object(release.subprocess, "Popen", return_value=gradle) as popen,
            self.assertRaisesRegex(ValueError, "validation failed\ninvalid DEX"),
        ):
            release.validate_catalog(self.root, self.bundle, evidence)
        self.assertFalse(evidence.exists())
        command = popen.call_args.args[0]
        wrapper = "gradlew.bat" if sys.platform == "win32" else "gradlew"
        self.assertEqual(str(self.root / wrapper), command[0])
        self.assertEqual(":patches:checkFrozenPatchCatalog", command[1])
        self.assertEqual([release.CATALOG_TIMEOUT], gradle.waits)
        self.assertFalse(gradle.killed)

    def test_catalog_timeout_stops_the_gradle_tree_without_an_unbounded_wait(self):
        for stuck in (False, True):
            gradle = FakeGradle(0, "partial Gradle output", 2 if stuck else 1)
            with (
                self.subTest(stuck=stuck),
                patch.object(release.subprocess, "Popen", return_value=gradle) as popen,
                patch.object(release.subprocess, "run") as run,
                patch.object(release.os, "killpg", create=True) as killpg,
                self.assertRaisesRegex(ValueError, "timed out after 600 s") as raised,
            ):
                release.validate_catalog(
                    self.root, self.bundle, self.root / "evidence.json"
                )
            self.assertEqual([release.CATALOG_TIMEOUT, 30], gradle.waits)
            self.assertTrue(gradle.killed)
            self.assertEqual(
                sys.platform != "win32", popen.call_args.kwargs["start_new_session"]
            )
            if sys.platform == "win32":
                run.assert_called_once()
                self.assertEqual(
                    ["taskkill", "/T", "/F", "/PID", "4321"], run.call_args.args[0]
                )
                killpg.assert_not_called()
            else:
                killpg.assert_called_once_with(4321, release.signal.SIGKILL)
                run.assert_not_called()
            self.assertIn(
                "holds the output pipes" if stuck else "partial Gradle output",
                str(raised.exception),
            )

    def test_saved_catalog_comparison_preserves_json_types_and_object_order(self):
        evidence = self.root / "patches/build/reports/catalog-evidence.json"
        for development in (False, True):
            with self.subTest(development=development):
                held = self.hold() if development else None

                def check(development=development, held=held):
                    if development:
                        return release.verify_development(
                            self.root, self.bundle, evidence, held
                        )
                    return release.verify(self.root)

                # Object member order has no meaning, but booleans aren't numbers.
                reordered = {"patches": self.catalog["patches"], "version": "1.2.3"}
                payload = {
                    "bundle": self.bundle.name,
                    "sha256": self.digest,
                    "dexValidated": True,
                    "catalog": reordered,
                }
                evidence.write_text(json.dumps(payload))
                check()
                for number in (1, 1.0):
                    changed = copy.deepcopy(payload)
                    changed["catalog"]["patches"][0]["default"] = number
                    evidence.write_text(json.dumps(changed))
                    with (
                        self.subTest(number=number),
                        self.assertRaisesRegex(ValueError, "catalog|Catalog"),
                    ):
                        check()

    @unittest.skipIf(SSH_KEYGEN is None, "ssh-keygen isn't installed")
    def test_signed_checksums_pass_and_an_edit_another_key_or_namespace_fails(self):
        key, other = self.root / "release_key", self.root / "other_key"
        key_type, blob = new_key(key)
        new_key(other)
        self.write(
            "scripts/release_signers",
            f'# test\nSysAdminDoc namespaces="hushmessenger-release" {key_type} {blob}\n',
        )
        checksums = self.root / "SHA256SUMS.txt"
        self.write("SHA256SUMS.txt", f"{self.digest}  {self.bundle.name}\n")
        with self.assertRaisesRegex(ValueError, "Missing signature"):
            release.verify_signature(self.root, checksums)
        sign(key, checksums)
        self.assertRegex(
            release.verify_signature(self.root, checksums),
            r'Good "hushmessenger-release" signature for SysAdminDoc with ED25519 key '
            + re.escape(
                release.signer_fingerprints(self.root / "scripts/release_signers")[0]
            ),
        )
        output, error = io.StringIO(), io.StringIO()
        cli = [
            "--root",
            str(self.root),
            "--checksums",
            str(checksums),
            "--verify-signature",
        ]
        with redirect_stdout(output):
            self.assertEqual(0, release.main(cli))
        self.assertIn("Good", output.getvalue())
        self.write("SHA256SUMS.txt", f"{'0' * 64}  {self.bundle.name}\n")
        with self.assertRaisesRegex(ValueError, "isn't signed by the key"):
            release.verify_signature(self.root, checksums)
        self.write("SHA256SUMS.txt", f"{self.digest}  {self.bundle.name}\n")
        for signer, namespace in [(other, release.SIGNATURE_NAMESPACE), (key, "file")]:
            sign(signer, checksums, namespace)
            with (
                self.subTest(namespace=namespace),
                self.assertRaisesRegex(ValueError, "isn't signed by the key"),
            ):
                release.verify_signature(self.root, checksums)
            with redirect_stdout(io.StringIO()), redirect_stderr(error):
                self.assertEqual(1, release.main(cli))
        self.assertIn("CHECK FAILED:", error.getvalue())
        with redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            release.main(["--root", str(self.root), "--verify-signature"])

    def test_committed_release_key_is_the_one_the_readme_names(self):
        signers = REPO / release.RELEASE_SIGNERS
        lines = [
            line.split()
            for line in signers.read_text(encoding="utf-8").splitlines()
            if line.strip() and not line.startswith("#")
        ]
        self.assertEqual(1, len(lines))
        self.assertEqual(
            [
                release.RELEASE_SIGNER,
                f'namespaces="{release.SIGNATURE_NAMESPACE}"',
                "ssh-ed25519",
            ],
            lines[0][:3],
        )
        [fingerprint] = release.signer_fingerprints(signers)
        self.assertIn(
            f"`{fingerprint}`", (REPO / "README.md").read_text(encoding="utf-8")
        )

    def test_changed_catalog_metadata_and_stale_artifact_evidence_fail(self):
        for key, value in [
            ("name", "Different"),
            ("default", False),
            ("category", "Changed"),
            ("dependencies", ["Different"]),
        ]:
            altered = copy.deepcopy(self.catalog)
            altered["patches"][0][key] = value
            self.write("patches-list.json", json.dumps(altered))
            with (
                self.subTest(key=key),
                self.assertRaisesRegex(ValueError, "catalog differs"),
            ):
                release.verify(self.root)
        self.write("patches-list.json", json.dumps(self.catalog))
        with self.bundle.open("ab") as handle:
            handle.write(b"changed")
        with self.assertRaisesRegex(ValueError, "evidence is stale"):
            release.verify(self.root)

    def test_version_url_timestamp_readme_and_extension_drift_fail(self):
        cases = [
            (
                "patches-bundle.json",
                json.dumps({**self.index, "version": "1.2.4"}),
                "index version",
            ),
            (
                "patches-bundle.json",
                json.dumps(
                    {
                        **self.index,
                        "download_url": self.index["download_url"].replace(
                            "v1.2.3", "v1.2.4"
                        ),
                    }
                ),
                "download URL",
            ),
            (
                "patches-bundle.json",
                json.dumps(
                    {**self.index, "created_at": self.index["created_at"] + "Z"}
                ),
                "local date-time",
            ),
            (
                "patches-bundle.json",
                json.dumps({**self.index, "created_at": "2026-09-27T23:35:49"}),
                "timestamps differ",
            ),
            (
                "README.md",
                f"https://img.shields.io/badge/version-1.2.4-blue\n{self.digest}  {self.bundle.name}\n",
                "badge",
            ),
            (
                "README.md",
                f"https://img.shields.io/badge/version-1.2.3-blue\n{'0' * 64}  {self.bundle.name}\n",
                "checksum",
            ),
            (
                "README.md",
                (
                    '<a href="https://github.com/SysAdminDoc/HushMessenger/releases/tag/v1.2.2">'
                    f'<img src="https://img.shields.io/badge/version-1.2.3-blue"></a>\n{self.digest}  {self.bundle.name}\n'
                ),
                "download link",
            ),
            (
                "README.md",
                f"https://img.shields.io/badge/version-1.2.3-blue\n[notes](../../releases/tag/v1.2.2)\n{self.digest}  {self.bundle.name}\n",
                "download link",
            ),
            (
                "README.md",
                f"https://img.shields.io/badge/version-1.2.3-blue\ngithub.com/sysadmindoc/hushmessenger/releases/download/v1.2.2/x\n{self.digest}  {self.bundle.name}\n",
                "download link",
            ),
            ("CHANGELOG.md", "## Unreleased\n\n## 1.2.3 (2026-09-27)\n", "changelog"),
            (
                "extensions/messenger/build.gradle.kts",
                'versionName = "1.2.2"\n',
                "Extension version",
            ),
        ]
        for path, changed, message in cases:
            original = (self.root / path).read_text(encoding="utf-8")
            self.write(path, changed)
            with (
                self.subTest(path=path, message=message),
                self.assertRaisesRegex(ValueError, message),
            ):
                release.verify(self.root)
            self.write(path, original)

    def test_readme_may_link_another_projects_release(self):
        self.write(
            "README.md",
            "https://img.shields.io/badge/version-1.2.3-blue\n"
            "[Desktop](https://github.com/MorpheApp/morphe-desktop/releases/tag/v1.17.0)\n"
            "Pair it with hushfacebook-patches-0.1.7.mpp or morphe-patches-1.2.0.\n"
            '<a href="https://github.com/SysAdminDoc/HushMessenger/releases/tag/v1.2.3">ours</a>\n'
            f"{self.digest}  {self.bundle.name}\n",
        )
        self.assertIn("Release metadata passed", release.verify(self.root))

    def test_cli_rejects_malformed_or_missing_evidence_without_traceback(self):
        for invalid in ['{"version": "1", "version": "2"}', "[]", "{"]:
            self.write("patches/build/reports/catalog-evidence.json", invalid)
            error = io.StringIO()
            with redirect_stderr(error):
                self.assertEqual(1, release.main(["--root", str(self.root)]))
            self.assertIn("CHECK FAILED:", error.getvalue())
            self.assertNotIn("Traceback", error.getvalue())
        self.bundle.unlink()
        error = io.StringIO()
        with redirect_stderr(error):
            self.assertEqual(1, release.main(["--root", str(self.root)]))
        self.assertIn("CHECK FAILED:", error.getvalue())

    def test_corrupt_deflate_manifest_has_a_controlled_cli_error(self):
        with zipfile.ZipFile(self.bundle) as archive:
            entries = [(name, archive.read(name)) for name in archive.namelist()]
        with zipfile.ZipFile(
            self.bundle, "w", compression=zipfile.ZIP_DEFLATED
        ) as archive:
            for name, data in entries:
                archive.writestr(name, data)
        with zipfile.ZipFile(self.bundle) as archive:
            offset = archive.getinfo("META-INF/MANIFEST.MF").header_offset
        raw = bytearray(self.bundle.read_bytes())
        name_length, extra_length = struct.unpack_from("<HH", raw, offset + 26)
        raw[offset + 30 + name_length + extra_length] = 0x07
        self.bundle.write_bytes(raw)
        error = io.StringIO()
        with redirect_stderr(error):
            self.assertEqual(1, release.main(["--root", str(self.root)]))
        self.assertIn("CHECK FAILED:", error.getvalue())
        self.assertNotIn("Traceback", error.getvalue())


if __name__ == "__main__":
    unittest.main()
