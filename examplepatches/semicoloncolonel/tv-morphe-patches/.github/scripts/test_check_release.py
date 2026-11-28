"""Tests for check_release.py.

    python3 -m unittest discover -s .github/scripts -p 'test_*.py'
"""

import base64
import hashlib
import io
import json
import struct
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest import mock

from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey

import check_release

REPO = "semicoloncolonel/tv-morphe-patches"
KEY = Ed25519PrivateKey.generate()
PUBLIC = base64.b64encode(KEY.public_key().public_bytes(
    serialization.Encoding.Raw, serialization.PublicFormat.Raw)).decode()


def make_mpp(version, signed=True, key=KEY, dex=True):
    """An .mpp signed the way the Morphe Gradle plugin signs it."""
    buf = io.BytesIO()
    with zipfile.ZipFile(buf, "w") as z:
        z.writestr("META-INF/MANIFEST.MF", f"Manifest-Version: 1.0\nName: TV Morphe Patches\nVersion: {version}\n")
        if dex:
            z.writestr("classes.dex", b"dex\n035\0")
    data = buf.getvalue()
    if not signed:
        return data
    eocd = data.rfind(b"PK\x05\x06")
    signature = key.sign(b"MorpheSig1" + hashlib.sha256(data[:eocd + 20] + b"\0\0").digest())
    public = base64.b64encode(key.public_key().public_bytes(
        serialization.Encoding.Raw, serialization.PublicFormat.Raw)).decode()
    comment = f"MorpheSig1 {public} {base64.b64encode(signature).decode()}".encode()
    return data[:eocd + 20] + struct.pack("<H", len(comment)) + comment


def bundle(version, **changes):
    b = {"version": version, "download_url": check_release.expected_url(REPO, version),
         "signature_download_url": "", "public_key": PUBLIC, "description": "notes"}
    b.update(changes)
    return b


class BuiltTest(unittest.TestCase):
    VERSION = "1.2.0-dev.11"

    def layout(self, root, bundle_json=None, mpps=None):
        (root / "morphe-signing.pub").write_text(PUBLIC + "\n")
        (root / "patches-bundle.json").write_text(json.dumps(bundle_json or bundle(self.VERSION)))
        libs = root / "patches/build/libs"
        libs.mkdir(parents=True)
        for name, data in (mpps if mpps is not None else {f"patches-{self.VERSION}.mpp": make_mpp(self.VERSION)}).items():
            (libs / name).write_bytes(data)

    def problems(self, **layout):
        with tempfile.TemporaryDirectory() as tmp:
            self.layout(Path(tmp), **layout)
            return check_release.check_built(self.VERSION, REPO, Path(tmp))

    def test_good_release(self):
        self.assertEqual(self.problems(), [])

    def test_bundle_json_for_another_version(self):
        problems = self.problems(bundle_json=bundle("1.2.0-dev.10"))
        self.assertTrue(any("version '1.2.0-dev.10'" in p for p in problems))
        self.assertTrue(any("download_url" in p for p in problems))

    def test_wrong_public_key(self):
        self.assertTrue(any("public_key" in p for p in self.problems(bundle_json=bundle(self.VERSION, public_key="x"))))

    def test_manifest_with_the_old_version(self):
        problems = self.problems(mpps={f"patches-{self.VERSION}.mpp": make_mpp("1.2.0-dev.10")})
        self.assertTrue(any("manifest says version '1.2.0-dev.10'" in p for p in problems))

    def test_unsigned_bundle(self):
        problems = self.problems(mpps={f"patches-{self.VERSION}.mpp": make_mpp(self.VERSION, signed=False)})
        self.assertTrue(any("not signed" in p for p in problems))

    def test_signed_with_another_key(self):
        other = make_mpp(self.VERSION, key=Ed25519PrivateKey.generate())
        problems = self.problems(mpps={f"patches-{self.VERSION}.mpp": other})
        self.assertTrue(any("different key" in p for p in problems))

    def test_changed_after_signing(self):
        data = bytearray(make_mpp(self.VERSION))
        data[40] ^= 1
        problems = self.problems(mpps={f"patches-{self.VERSION}.mpp": bytes(data)})
        self.assertTrue(problems)

    def test_bundle_without_dex(self):
        problems = self.problems(mpps={f"patches-{self.VERSION}.mpp": make_mpp(self.VERSION, dex=False)})
        self.assertTrue(any("no .dex" in p for p in problems))

    def test_second_bundle_would_be_uploaded(self):
        problems = self.problems(mpps={f"patches-{self.VERSION}.mpp": make_mpp(self.VERSION),
                                       "patches-1.2.0-dev.10.mpp": make_mpp("1.2.0-dev.10")})
        self.assertTrue(any("not only" in p for p in problems))

    def test_no_bundle_built(self):
        self.assertTrue(any("no .mpp" in p for p in self.problems(mpps={})))


class PublishedTest(unittest.TestCase):
    """v1.2.0-dev.10: tagged, patches-bundle.json pushed, no GitHub release."""

    VERSION = "1.2.0-dev.10"
    TAG = "v1.2.0-dev.10"

    def release(self, **changes):
        r = {"tag_name": self.TAG, "draft": False, "prerelease": True,
             "assets": [{"name": f"patches-{self.VERSION}.mpp"}]}
        r.update(changes)
        return r

    def check(self, release, refs=("tag", "note"), data=None, branch="dev"):
        def remote_ref(ref):
            return ("note" if ref.startswith("refs/notes/") else "tag") in refs
        with mock.patch.object(check_release, "gh_json", return_value=release), \
                mock.patch.object(check_release, "remote_ref", side_effect=remote_ref), \
                mock.patch.object(check_release, "download", return_value=data or make_mpp(self.VERSION)):
            return check_release.check_published(branch, REPO, PUBLIC, bundle(self.VERSION))

    def test_good_release(self):
        problems, _ = self.check(self.release())
        self.assertEqual(problems, [])

    def test_missing_release(self):
        problems, release = self.check(None)
        self.assertIsNone(release)
        self.assertTrue(any("no GitHub release v1.2.0-dev.10" in p for p in problems))

    def test_missing_asset(self):
        problems, _ = self.check(self.release(assets=[]))
        self.assertTrue(any("has no patches-1.2.0-dev.10.mpp" in p for p in problems))

    def test_missing_note(self):
        problems, _ = self.check(self.release(), refs=("tag",))
        self.assertTrue(any("git note" in p for p in problems))

    def test_draft_and_channel(self):
        problems, _ = self.check(self.release(draft=True, prerelease=False))
        self.assertTrue(any("draft" in p for p in problems))
        self.assertTrue(any("not a pre-release" in p for p in problems))

    def test_main_release_is_not_a_prerelease(self):
        problems, _ = self.check(self.release(prerelease=False), branch="main")
        self.assertEqual(problems, [])

    def test_asset_with_another_version(self):
        problems, _ = self.check(self.release(), data=make_mpp("1.2.0-dev.9"))
        self.assertTrue(any("manifest says version '1.2.0-dev.9'" in p for p in problems))


class DownloadTest(unittest.TestCase):
    def test_network_error_is_a_release_error(self):
        import urllib.error
        with mock.patch("urllib.request.urlopen", side_effect=urllib.error.URLError("no route")):
            with self.assertRaises(check_release.ReleaseError):
                check_release.download("https://example.invalid/patches.mpp")


class RepairTest(unittest.TestCase):
    VERSION = "1.2.0-dev.10"

    def repair(self, release, built=True, refs=("tag",)):
        calls = []

        def run(cmd, check=True):
            calls.append(cmd)
            return mock.Mock(stdout="", returncode=0)

        with tempfile.TemporaryDirectory() as tmp, \
                mock.patch.object(check_release, "LIBS", Path(tmp)), \
                mock.patch.object(check_release, "run", side_effect=run), \
                mock.patch.object(check_release, "remote_ref",
                                  side_effect=lambda ref: ("note" if "notes" in ref else "tag") in refs):
            if built:
                (Path(tmp) / f"patches-{self.VERSION}.mpp").write_bytes(make_mpp(self.VERSION))
            check_release.repair("dev", REPO, PUBLIC, bundle(self.VERSION), release)
        return calls

    def test_creates_the_missing_release_and_note(self):
        calls = self.repair(None)
        notes = [c for c in calls if c[:2] == ["git", "notes"]]
        self.assertEqual(notes[0][-2:], ['{"channels":["dev"]}', "v1.2.0-dev.10"])
        self.assertTrue(any(c[:2] == ["git", "push"] and c[-1].startswith("refs/notes/") for c in calls))
        create = [c for c in calls if c[:3] == ["gh", "release", "create"]][0]
        self.assertIn("--prerelease", create)
        self.assertIn("--verify-tag", create)
        self.assertTrue(create[4].endswith("patches-1.2.0-dev.10.mpp"))

    def test_uploads_a_missing_asset(self):
        calls = self.repair({"assets": []}, refs=("tag", "note"))
        self.assertEqual([c[:3] for c in calls], [["gh", "release", "upload"]])

    def test_cannot_repair_without_the_build(self):
        with self.assertRaises(check_release.ReleaseError):
            self.repair(None, built=False)

    def test_cannot_repair_without_the_tag(self):
        with self.assertRaises(check_release.ReleaseError):
            self.repair(None, refs=())


if __name__ == "__main__":
    unittest.main()
