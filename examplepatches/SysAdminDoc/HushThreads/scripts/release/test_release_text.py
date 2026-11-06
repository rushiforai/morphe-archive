"""Run each release_text command on a temporary tree and read back what it wrote."""

import argparse
import base64
import contextlib
import hashlib
import io
import json
from pathlib import Path
import sys
import tempfile
import unittest

# py -I leaves the script's own folder off the path.
sys.path.insert(0, str(Path(__file__).resolve().parent))
import release_text  # noqa: E402  # pyright: ignore[reportMissingImports]

CHANGELOG = """# Changelog

Changes in the source build, then released versions.

## Unreleased

* Hide the Instagram button is new (#7).
* **Docs:** The README says which connections honor user certificates.
* **Tooling:** The fixture tests run as their own task.

## 0.0.12 (2026-10-07)

* First.
"""
README = """<a href="x"><img src="https://img.shields.io/badge/version-0.0.12-000000" alt="Version 0.0.12"></a>

The latest release is [v0.0.12](https://github.com/Owner/HushThreads/releases/tag/v0.0.12), with 17 patches.

HushThreads v0.0.12 works with all three builds below.

HushThreads v0.0.12 has 17 patches. All but three are selected.
"""
USER_AGENT = 'headers.put("User-Agent", "HushThreads/0.0.12");\nassert(wire.contains("HushThreads/0.0.12\\r\\n"));\n'
TOML = 'morphe-patcher = "1.15.1"\nmanager-floor = "1.34.0"\n'
FORM = "      placeholder: Version 0.0.12 for Threads 450.0.0.51.78\n      placeholder: Morphe Manager 1.34.0\n"
# Throwaway Ed25519 keys, so the bundles here carry real signatures.
SEED = bytes(range(32))
OTHER_SEED = bytes(range(1, 33))
# RFC 8032 section 7.1, TEST 1 and TEST 2: secret key, public key, message, signature.
RFC_8032 = [
    ("9d61b19deffd5a60ba844af492ec2cc44449c5697b326919703bac031cae7f60",
     "d75a980182b10ab7d54bfed3c964073a0ee172f3daa62325af021a68f707511a", "",
     "e5564300c360ac729086e2cc806e828a84877f1eb8e5d974d873e065224901555fb8821590a33bacc61e39701cf9b46bd25bf5f0595bbe24655141438e7a100b"),
    ("4ccd089b28ff96da9db6c346ec114e0f5b8a319f35aba624da8cf6ed4fb8a6fb",
     "3d4017c3e843895a92b70aa74d1b7ebc9c982ccf2ec4968cc0cd55f12af4660c", "72",
     "92a009a9f0d4cab8720e820b5f642540a2b27b5416503f8fb3762223ebdb69da085ac1e43e15996e458f3613d0f11d8c387b2eaeb4302aeeb00d291612bb0c00"),
]


def sign(seed: bytes, message: bytes) -> tuple[bytes, bytes]:
    """The public key and Ed25519 signature for `seed`, by RFC 8032 5.1.6."""
    digest = hashlib.sha512(seed).digest()
    secret = int.from_bytes(digest[:32], "little") & ((1 << 254) - 8) | (1 << 254)
    public = release_text.point_encode(release_text.point_times(release_text.BASE, secret))
    r = int.from_bytes(hashlib.sha512(digest[32:] + message).digest(), "little") % release_text.L
    nonce = release_text.point_encode(release_text.point_times(release_text.BASE, r))
    k = int.from_bytes(hashlib.sha512(nonce + public + message).digest(), "little") % release_text.L
    return public, nonce + ((r + k * secret) % release_text.L).to_bytes(32, "little")


PUBLIC_KEY = base64.b64encode(sign(SEED, b"")[0]).decode("ascii")
OTHER_KEY = base64.b64encode(sign(OTHER_SEED, b"")[0]).decode("ascii")


def zip_with_comment(comment: str, body: bytes = b"") -> bytes:
    """`body` and a zip end record carrying `comment`: all the index reads of a bundle."""
    raw = comment.encode("ascii")
    return body + b"PK\x05\x06" + bytes(16) + len(raw).to_bytes(2, "little") + raw


def signed_zip(seed: bytes, body: bytes = b"") -> bytes:
    """What signBundle writes: the MorpheSig1 signature over the archive with an empty comment."""
    public, signature = sign(seed, b"MorpheSig1" + hashlib.sha256(zip_with_comment("", body)).digest())
    return zip_with_comment(f"MorpheSig1 {base64.b64encode(public).decode()} {base64.b64encode(signature).decode()}", body)


def catalog(*builds: str, version: str = "v0.0.13", count: int = 2) -> str:
    codes = {"450.0.0.51.78": 512008342, "449.0.0.54.82": 511908382}
    patch = {
        "name": "A",
        "compatiblePackages": {"com.instagram.barcelona": list(builds)},
        "compatibility": [{"packageName": "com.instagram.barcelona",
                           "targets": [{"version": b, "versionCodes": {"ARM64_V8A": codes[b]}} for b in builds]}],
    }
    return json.dumps({"version": version, "patches": [dict(patch, name=f"P{i}") for i in range(count)]})


def results(cases: int, skipped: int = 0) -> str:
    body = "".join(f'<testcase name="t{i}" classname="C"/>' for i in range(cases))
    return f'<?xml version="1.0"?><testsuite name="C" tests="{cases}" skipped="{skipped}" failures="0" errors="0">{body}</testsuite>'


class ReleaseTextTest(unittest.TestCase):
    def setUp(self):
        self.folder = tempfile.TemporaryDirectory()
        self.root = Path(self.folder.name)
        self.write("CHANGELOG.md", CHANGELOG)
        self.write("README.md", README)
        self.write("gradle.properties", "kotlin.code.style = official\nversion = 0.0.12\n")
        self.write("gradle/libs.versions.toml", TOML)
        self.write(release_text.USER_AGENT_TEST, USER_AGENT)
        self.write("patches-list.json", catalog("450.0.0.51.78"))
        self.write("patches-bundle.json", json.dumps({
            "created_at": "2026-10-08T22:37:14", "description": "old",
            "download_url": "https://github.com/Owner/HushThreads/releases/download/v0.0.12/patches-0.0.12.mpp",
            "signature_download_url": "", "version": "0.0.12"}, indent=2) + "\n")
        self.write(".github/ISSUE_TEMPLATE/bug_report.yml", FORM)
        self.write("extensions/threads/build/test-results/testDebugUnitTest/TEST-a.xml", results(3))
        self.write("extensions/threads/build/test-results/testDebugUnitTest/TEST-b.xml", results(2))
        self.write("patches/build/test-results/test/TEST-c.xml", results(4))
        self.write("patches/build/test-results/fixtureTest/TEST-d.xml", results(1))
        self.write("morphe-signing.pub", PUBLIC_KEY + "\n")
        self.bundle(signed_zip(SEED, b"payload"))
        self.saved = release_text.ROOT
        release_text.ROOT = self.root

    def tearDown(self):
        release_text.ROOT = self.saved
        self.folder.cleanup()

    def write(self, name: str, text: str) -> None:
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8", newline="\n")

    def read(self, name: str) -> str:
        return (self.root / name).read_text(encoding="utf-8")

    def bundle(self, data: bytes, version: str = "0.0.13") -> None:
        """The release bundle and the bundle.sha256 buildAndroid writes beside it."""
        path = self.root / f"patches/build/release/patches-{version}.mpp"
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        path.with_name("bundle.sha256").write_text(hashlib.sha256(data).hexdigest(), encoding="ascii")

    def run_command(self, command, **values):
        with contextlib.redirect_stdout(io.StringIO()) as printed:
            command(argparse.Namespace(**values))
        return printed.getvalue()

    def refused(self, command, needle: str, **values) -> None:
        with self.assertRaises(SystemExit) as caught:
            self.run_command(command, **values)
        self.assertIn(needle, str(caught.exception))

    def test_cut_dates_unreleased_and_moves_every_version_string(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        changelog = self.read("CHANGELOG.md")
        self.assertIn("released versions.\n\n## 0.0.13 (2026-10-09)\n\n* Hide the Instagram", changelog)
        self.assertNotIn("## Unreleased", changelog)
        self.assertEqual(changelog.count("## 0.0.12 (2026-10-07)"), 1)
        self.assertIn("version = 0.0.13\n", self.read("gradle.properties"))
        readme = self.read("README.md")
        self.assertIn("badge/version-0.0.13-000000", readme)
        self.assertIn('alt="Version 0.0.13"', readme)
        # The latest-release line moves with the patch count, after the patch list is generated.
        self.assertIn("The latest release is [v0.0.12]", readme)
        self.assertEqual(self.read(release_text.USER_AGENT_TEST).count("HushThreads/0.0.13"), 2)

    def test_cut_moves_a_user_agent_an_earlier_release_left_behind(self):
        self.write(release_text.USER_AGENT_TEST, USER_AGENT.replace("0.0.12", "0.0.11"))
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.assertEqual(self.read(release_text.USER_AGENT_TEST).count("HushThreads/0.0.13"), 2)

    def test_cut_drops_a_leftover_app_label_and_accepts_unlabeled_bullets(self):
        labeled = CHANGELOG.replace("* Hide the Instagram", "* **Threads:** Hide the Instagram")
        self.write("CHANGELOG.md", labeled)
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        changelog = self.read("CHANGELOG.md")
        self.assertIn("## 0.0.13 (2026-10-09)\n\n* Hide the Instagram", changelog)
        self.assertNotIn("**Threads:**", changelog)
        self.assertIn("* **Docs:** The README says", changelog)
        self.assertIn("* **Tooling:** The fixture tests run", changelog)

    def test_cut_refuses_what_manager_would_misread_and_writes_nothing(self):
        for bad, needle in (("* Hide the Instagram", "- **Threads:** Hide the Instagram"),
                            ("* Hide the Instagram", "* **Feed:** Hide the Instagram"),
                            ("* Hide the Instagram", "* **Tooling:** Hide the Instagram"),
                            ("is new (#7).", "is new\n  (#7)."),
                            ("is new (#7).", "is new \u2014 (#7).")):
            self.write("CHANGELOG.md", CHANGELOG.replace(bad, needle))
            with self.assertRaises(SystemExit):
                self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
            self.assertIn("version = 0.0.12\n", self.read("gradle.properties"))
            self.assertIn("badge/version-0.0.12-", self.read("README.md"))
        self.write("CHANGELOG.md", CHANGELOG)
        self.refused(release_text.cut, "moves forward", version="0.0.12", date=None)
        self.refused(release_text.cut, "moves forward", version="0.0.11", date=None)
        self.refused(release_text.cut, "isn't a YYYY-MM-DD", version="0.0.13", date="2026-13-40")
        self.write(release_text.USER_AGENT_TEST, "no version here\n")
        self.refused(release_text.cut, "User-Agent", version="0.0.13", date=None)
        self.assertEqual(self.read("CHANGELOG.md"), CHANGELOG)

    def test_readme_names_the_release_and_its_count_and_lists_what_is_left(self):
        printed = self.run_command(release_text.readme, version="0.0.13")
        readme = self.read("README.md")
        self.assertIn("The latest release is [v0.0.13](https://github.com/Owner/HushThreads/releases/tag/v0.0.13), "
                      "with 2 patches.", readme)
        self.assertIn("HushThreads v0.0.13 has 2 patches. All but three", readme)
        self.assertIn("still name 0.0.12", printed)
        self.assertIn("works with all three builds below", printed)
        self.write("patches-list.json", catalog("450.0.0.51.78", version="v0.0.12"))
        self.refused(release_text.readme, "generatePatchesList", version="0.0.13")

    def test_notes_carry_every_bullet_by_scope_with_counts_from_the_results(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("intro.md", "HushThreads v0.0.13 has 2 patches.\n")
        self.write("update.md", "1. You need [Morphe Manager](https://x) 1.34.0 or newer.\n")
        out = self.root / "notes.md"
        self.run_command(release_text.notes, version="0.0.13", intro=str(self.root / "intro.md"),
                         update=str(self.root / "update.md"), out=str(out))
        notes = out.read_text(encoding="utf-8")
        self.assertTrue(notes.startswith("HushThreads v0.0.13 has 2 patches.\n\n## Threads\n\n- Hide the Instagram"))
        self.assertIn("## Docs\n\n- The README says which connections", notes)
        self.assertIn("## Tooling\n\n- The fixture tests run as their own task.\n\n## Update\n\n1. You need", notes)
        self.assertNotIn("**Threads:**", notes)
        self.assertLess(notes.index("## Threads"), notes.index("## Docs"))
        self.assertLess(notes.index("## Docs"), notes.index("## Tooling"))
        self.assertIn("5 runtime tests and 5 patch tests passed locally", notes)
        self.assertIn("All 2 patches applied without forcing to Threads 450.0.0.51.78, and the release receipt "
                      "records the run.", notes)

    def test_notes_refuse_a_stale_floor_a_skipped_run_and_an_uncut_version(self):
        self.write("intro.md", "Intro.\n")
        self.write("update.md", "Use Morphe Manager 1.29.0 or newer.\n")
        values = dict(version="0.0.13", intro=str(self.root / "intro.md"), update=str(self.root / "update.md"),
                      out=str(self.root / "notes.md"))
        self.refused(release_text.notes, "prepare", **values)
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.refused(release_text.notes, "1.29.0", **values)
        self.write("update.md", "Use Morphe Manager 1.34.0 or newer.\n")
        self.write("patches/build/test-results/fixtureTest/TEST-d.xml", results(1, skipped=1))
        self.refused(release_text.notes, "skipped", **values)
        self.assertFalse((self.root / "notes.md").exists())

    def test_index_points_the_bundle_and_bug_form_at_the_release(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("summary.txt", "One patch is new.\n")
        self.run_command(release_text.index, version="0.0.13", created="2026-10-09T17:03:42",
                         summary=str(self.root / "summary.txt"))
        bundle = json.loads(self.read("patches-bundle.json"))
        self.assertEqual(list(bundle), ["created_at", "description", "download_url", "signature_download_url", "version",
                                        "public_key"])
        # Manager pins this key when it adds the source, so it's the key that signed the bundle.
        self.assertEqual(bundle["public_key"], PUBLIC_KEY)
        self.assertEqual(bundle["version"], "0.0.13")
        self.assertEqual(bundle["created_at"], "2026-10-09T17:03:42")
        self.assertEqual(bundle["download_url"],
                         "https://github.com/Owner/HushThreads/releases/download/v0.0.13/patches-0.0.13.mpp")
        description = bundle["description"]
        self.assertTrue(description.startswith("HushThreads v0.0.13 has 2 patches for Threads 450.0.0.51.78 "
                                               "(com.instagram.barcelona).\n\nOne patch is new.\n\nValidation: "))
        self.assertIn("5 runtime tests passed locally. All 5 patch tests passed too", description)
        self.assertIn("Needs Morphe Manager 1.34.0 or newer. Patch the arm64-v8a bundle of Threads 450.0.0.51.78 "
                      "(version code 512008342).", description)
        self.assertIn("placeholder: Version 0.0.13 for Threads 450.0.0.51.78\n", self.read(".github/ISSUE_TEMPLATE/bug_report.yml"))
        # Manager shows this description for the release an app was patched with, so it ends with the
        # Threads bullets in the shape its changelog parser reads. Docs and Tooling reach nobody there.
        self.assertTrue(description.endswith("\n\n### Changes\n\n* Hide the Instagram button is new (#7)."))
        self.assertNotIn("README says which", description)
        self.assertNotIn("fixture tests run", description)

    def test_index_facts_come_from_the_prose_and_not_the_changelog_bullets(self):
        self.write("CHANGELOG.md", CHANGELOG.replace(
            "Hide the Instagram button is new (#7).",
            "Hide the Instagram button is new, as on Threads 449.0.0.54.82 with 90 patches."))
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("summary.txt", "One patch is new.\n")
        self.run_command(release_text.index, version="0.0.13", created="2026-10-09T17:03:42",
                         summary=str(self.root / "summary.txt"))
        facts, groups = json.loads(self.read("patches-bundle.json"))["description"].split("\n\n### ", 1)
        self.assertNotIn("90 patches", facts)
        self.assertNotIn("449.0.0.54.82", facts)
        self.assertIn("with 90 patches.", groups)

    def test_index_refuses_a_bundle_the_published_key_did_not_sign(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("summary.txt", "x.\n")
        values = dict(version="0.0.13", created="2026-10-09T17:03:42", summary=str(self.root / "summary.txt"))
        self.bundle(zip_with_comment("", b"payload"))
        self.refused(release_text.index, "isn't signed", **values)
        self.bundle(signed_zip(OTHER_SEED, b"payload"))
        self.refused(release_text.index, "another key", **values)
        self.assertEqual(json.loads(self.read("patches-bundle.json"))["version"], "0.0.12")

    def test_index_refuses_a_bundle_changed_after_it_was_signed(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("summary.txt", "x.\n")
        values = dict(version="0.0.13", created="2026-10-09T17:03:42", summary=str(self.root / "summary.txt"))
        # Changed after signing with the comment kept, and a checksum written to match.
        self.bundle(signed_zip(SEED, b"payload").replace(b"payload", b"paylo4d"))
        self.refused(release_text.index, "changed after it was signed", **values)
        # A comment naming the published key over a signature that key never made.
        self.bundle(zip_with_comment(f"MorpheSig1 {PUBLIC_KEY} {'S' * 86}==", b"payload"))
        self.refused(release_text.index, "changed after it was signed", **values)
        # Signed, then changed with bundle.sha256 left as the build wrote it.
        self.bundle(signed_zip(SEED, b"payload"))
        (self.root / "patches/build/release/bundle.sha256").write_text(hashlib.sha256(b"other").hexdigest(), encoding="ascii")
        self.refused(release_text.index, "bundle.sha256", **values)
        self.assertEqual(json.loads(self.read("patches-bundle.json"))["version"], "0.0.12")

    def test_signed_passes_the_published_keys_bundle_and_stops_the_rest(self):
        self.assertIn(PUBLIC_KEY, self.run_command(release_text.signed, version="0.0.13"))
        self.bundle(zip_with_comment("", b"payload"))
        self.refused(release_text.signed, "isn't signed", version="0.0.13")
        self.bundle(signed_zip(OTHER_SEED, b"payload"))
        self.refused(release_text.signed, "another key", version="0.0.13")

    def test_ed25519_matches_rfc_8032(self):
        for secret, public, message, signature in RFC_8032:
            secret, public, message, signature = map(bytes.fromhex, (secret, public, message, signature))
            self.assertTrue(release_text.ed25519_verify(public, message, signature))
            self.assertEqual(sign(secret, message), (public, signature), "the test signer is off")
            flipped = bytearray(signature)
            flipped[5] ^= 1
            self.assertFalse(release_text.ed25519_verify(public, message, bytes(flipped)))
            self.assertFalse(release_text.ed25519_verify(public, message + b"x", signature))

    def test_index_refuses_a_release_the_changelog_has_not_cut(self):
        self.write("summary.txt", "x.\n")
        self.refused(release_text.index, "no dated 0.0.13 heading", version="0.0.13", created="2026-10-09T17:03:42",
                     summary=str(self.root / "summary.txt"))

    def test_index_names_the_newest_build_after_every_threads(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("patches-list.json", catalog("449.0.0.54.82", "450.0.0.51.78"))
        self.write("summary.txt", "x.\n")
        self.run_command(release_text.index, version="0.0.13", created="2026-10-09T17:03:42",
                         summary=str(self.root / "summary.txt"))
        description = json.loads(self.read("patches-bundle.json"))["description"]
        self.assertIn("for Threads 450.0.0.51.78 (com.instagram.barcelona), and builds 449.0.0.54.82 work too.", description)
        self.assertIn("applied to Threads 450.0.0.51.78 and 449.0.0.54.82 without forcing, and the release receipt "
                      "records both runs.", description)
        self.assertNotRegex(description, r"Threads 449")

    def test_index_refuses_a_zoned_time_and_a_stale_catalog(self):
        self.run_command(release_text.cut, version="0.0.13", date="2026-10-09")
        self.write("summary.txt", "x.\n")
        self.refused(release_text.index, "yyyy-MM-ddTHH:mm:ss", version="0.0.13", created="2026-10-09T17:03:42Z",
                     summary=str(self.root / "summary.txt"))
        self.refused(release_text.index, "not v0.0.14", version="0.0.14", created="2026-10-09T17:03:42",
                     summary=str(self.root / "summary.txt"))
        self.assertEqual(json.loads(self.read("patches-bundle.json"))["version"], "0.0.12")

    def test_description_moves_the_version_count_and_build(self):
        self.write("current.txt", "HushThreads v0.0.12: ads out of Threads, 17 patches for Threads 449.0.0.54.82.\n")
        out = self.root / "description.txt"
        self.run_command(release_text.description, version="0.0.13", current=str(self.root / "current.txt"), out=str(out))
        self.assertEqual(out.read_text(encoding="utf-8"),
                         "HushThreads v0.0.13: ads out of Threads, 2 patches for Threads 450.0.0.51.78.\n")
        self.write("current.txt", "A patch bundle with 17 patches for Threads.\n")
        self.refused(release_text.description, "in this shape", version="0.0.13",
                     current=str(self.root / "current.txt"), out=str(out))

    def test_description_that_names_no_facts_stays_as_written(self):
        out = self.root / "description.txt"
        self.write("current.txt", "HushThreads patches that take the ads out of your Threads feed.\n")
        self.run_command(release_text.description, version="0.0.13", current=str(self.root / "current.txt"), out=str(out))
        self.assertEqual(out.read_text(encoding="utf-8"), "HushThreads patches that take the ads out of your Threads feed.\n")
        self.write("current.txt", "HushThreads patches — no ads.\n")
        self.refused(release_text.description, "dash", version="0.0.13",
                     current=str(self.root / "current.txt"), out=str(out))


if __name__ == "__main__":
    unittest.main()
