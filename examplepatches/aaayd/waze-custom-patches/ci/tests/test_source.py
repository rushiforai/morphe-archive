import hashlib
import io
import json
import sys
import unittest
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import source


def fixture():
    stream = io.BytesIO()
    with zipfile.ZipFile(stream, "w") as archive:
        archive.writestr("META-INF/MANIFEST.MF", "Manifest-Version: 1.0\r\nVersion: 1.8.1030732\r\n")
        for name in ["classes.dex", "extensions/theme-selector.dex", "extensions/badge-selector.dex", "extensions/aa-installer.dex", "extensions/icon-pack.dex", "extensions/alert-distance.dex", "extensions/camera-sound.dex"]:
            archive.writestr(name, b"dex\n035\0")
    files = {
        "build-info.json": json.dumps({"tag": "waze-5.24.5.0-1030732", "version": "5.24.5.0",
                                       "bundle_version": "1.8.1030732", "extension": ".apkm"}).encode(),
        "patch-report.json": json.dumps({"packageName": "com.waze", "packageVersion": "5.24.5.0",
                                         "failedPatches": [], "appliedPatches": [{"name": p} for p in source.OPTIONS],
                                         "patchingSteps": [{"step": "PATCHING", "success": True}]}).encode(),
        "waze-theme-selector-1.8.1030732.mpp": stream.getvalue(),
        "waze-5.24.5.0-original-arm64.apkm": b"original package fixture",
        "waze-5.24.5.0-patched-arm64.apk": b"patched package fixture",
    }
    release = {"draft": False, "prerelease": False, "tag_name": "waze-5.24.5.0-1030732",
               "published_at": "2026-10-01T04:17:45Z", "html_url": "https://github.com/owner/repo/releases/tag/waze-5.24.5.0-1030732"}
    seal(release, files)
    return release, files


def seal(release, files):
    files["SHA256SUMS.txt"] = "".join(f"{hashlib.sha256(data).hexdigest()}  {name}\n"
                                      for name, data in files.items() if name != "SHA256SUMS.txt").encode()
    release["assets"] = [{"name": name, "state": "uploaded", "digest": "sha256:" + hashlib.sha256(data).hexdigest(),
                          "browser_download_url": "https://github.com/owner/repo/releases/download/tag/" + name}
                         for name, data in files.items()]


class SourceTests(unittest.TestCase):
    def test_morphe_fields_and_local_datetime(self):
        manifest = source.make_manifest(*fixture())
        self.assertEqual(manifest["version"], "1.8.1030732")
        self.assertEqual(manifest["created_at"], "2026-10-01T04:17:45")
        self.assertTrue(manifest["download_url"].endswith(".mpp"))
        self.assertIn("/releases/tag/", manifest["page_url"])

    def test_never_advertises_a_draft_or_prerelease(self):
        for flag in ["draft", "prerelease"]:
            release, files = fixture()
            release[flag] = True
            with self.assertRaisesRegex(ValueError, "published stable"):
                source.make_manifest(release, files)

    def test_rejects_incomplete_asset_upload(self):
        release, files = fixture()
        release["assets"][0]["state"] = "new"
        with self.assertRaisesRegex(ValueError, "corrupted release asset"):
            source.make_manifest(release, files)

    def test_rejects_corrupted_bundle_download(self):
        release, files = fixture()
        files["waze-theme-selector-1.8.1030732.mpp"] += b"tampered"
        with self.assertRaisesRegex(ValueError, "checksum mismatch"):
            source.make_manifest(release, files)

    def test_rejects_partial_patch_set(self):
        release, files = fixture()
        report = json.loads(files["patch-report.json"])
        report["appliedPatches"].pop()
        files["patch-report.json"] = json.dumps(report).encode()
        seal(release, files)
        with self.assertRaisesRegex(ValueError, "eight successful"):
            source.make_manifest(release, files)

    def test_rejects_wrong_version_in_bundle_manifest(self):
        release, files = fixture()
        info = json.loads(files["build-info.json"])
        info["bundle_version"] = "1.8.1030733"
        files["build-info.json"] = json.dumps(info).encode()
        files["waze-theme-selector-1.8.1030733.mpp"] = files.pop("waze-theme-selector-1.8.1030732.mpp")
        seal(release, files)
        with self.assertRaisesRegex(ValueError, "manifest version differs"):
            source.make_manifest(release, files)

    def test_changelog_is_idempotent(self):
        manifest = source.make_manifest(*fixture())
        changelog = source.next_changelog("", manifest)
        self.assertEqual(changelog, source.next_changelog(changelog, manifest))


if __name__ == "__main__":
    unittest.main()
