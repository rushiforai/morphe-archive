import tempfile
import unittest
import zipfile
import io
import json
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from apkmirror_download import DownloadError, inspect_archive, latest_release, page_download_link, verify_identity


class DownloadTests(unittest.TestCase):
    def test_live_links_select_latest_stable_release_not_sidebar_or_beta(self):
        html = '''<a href="/apk/tapblaze/good-pizza-great-pizza/good-pizza-great-pizza-5-59-0-release/">Good Pizza, Great Pizza 5.59.0</a>
        <a href="/apk/tapblaze/good-pizza-great-pizza/good-pizza-great-pizza-5-59-2-release/">Good Pizza, Great Pizza 5.59.2</a>
        <a href="/apk/tapblaze/good-pizza-great-pizza/good-pizza-great-pizza-6-0-beta-release/">Good Pizza, Great Pizza 6.0 beta</a>
        <a href="/apk/other/app-99-release/">Other 99</a>'''
        version, url = latest_release(html, "pizza")
        self.assertEqual(version, "5.59.2")
        self.assertTrue(url.endswith("5-59-2-release/"))

    def test_download_link_prefers_complete_bundle_and_ignores_ad(self):
        html = '''<a href="https://ads.example/download.apk">Download now</a>
        <a href="/apk/tapblaze/pizza/download/?forcebaseapk=true">Download APK 70 MB</a>
        <a href="/apk/tapblaze/pizza/download/?key=abc">Download APK Bundle 417 MB</a>'''
        self.assertEqual(page_download_link(html, "https://www.apkmirror.com/page/"),
                         "https://www.apkmirror.com/apk/tapblaze/pizza/download/?key=abc")

    def test_final_here_link(self):
        html = '<a href="/wp-content/themes/APKMirror/download.php?id=123&amp;key=abc">here</a>'
        self.assertIn("id=123&key=abc", page_download_link(html, "https://www.apkmirror.com/page/"))

    def test_html_is_not_a_successful_apk(self):
        with tempfile.TemporaryDirectory() as folder:
            p = Path(folder) / "bad.apk"
            p.write_text("<html>Just a moment...</html>")
            with self.assertRaisesRegex(DownloadError, "ZIP"):
                inspect_archive(p, "pizza")

    def test_base_only_zip_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            p = Path(folder) / "base.apk"
            with zipfile.ZipFile(p, "w") as z:
                z.writestr("AndroidManifest.xml", b"manifest")
                z.writestr("classes.dex", b"dex")
            with self.assertRaisesRegex(DownloadError, "complete"):
                inspect_archive(p, "pizza")

    def test_bundle_detection_uses_content_instead_of_server_filename(self):
        with tempfile.TemporaryDirectory() as folder:
            inner = io.BytesIO()
            with zipfile.ZipFile(inner, "w") as apk:
                apk.writestr("AndroidManifest.xml", b"manifest")
                apk.writestr("lib/arm64-v8a/libcocos2dcpp.so", b"native")
                for i in range(100):
                    apk.writestr(f"assets/{i}", b"asset")
            p = Path(folder) / "wrong-extension.apk"
            with zipfile.ZipFile(p, "w") as bundle:
                bundle.writestr("info.json", "{}")
                bundle.writestr("META-INF/MANIFEST.MF", "Manifest-Version: 1.0\r\n\r\nName: base.apk\r\n\r\n")
                bundle.writestr("base.apk", inner.getvalue())
            self.assertEqual(inspect_archive(p, "pizza")["format"], "APKM")

    def test_xapk_missing_declared_asset_pack_is_rejected_despite_other_assets(self):
        self._missing_asset_pack("xapk")

    def test_apkm_missing_declared_asset_pack_is_rejected_despite_other_assets(self):
        self._missing_asset_pack("apkm")

    def _missing_asset_pack(self, kind):
        with tempfile.TemporaryDirectory() as folder:
            inner = io.BytesIO()
            with zipfile.ZipFile(inner, "w") as apk:
                apk.writestr("AndroidManifest.xml", b"manifest")
                apk.writestr("lib/arm64-v8a/libcocos2dcpp.so", b"native")
                for i in range(150):
                    apk.writestr(f"assets/{i}", b"remaining asset")
            p = Path(folder) / ("incomplete." + kind)
            with zipfile.ZipFile(p, "w") as bundle:
                bundle.writestr("base.apk", inner.getvalue())
                if kind == "xapk":
                    bundle.writestr("manifest.json", json.dumps({"split_apks": [
                        {"file": "base.apk", "id": "base"},
                        {"file": "assetpack1.apk", "id": "assetpack1"}]}))
                else:
                    bundle.writestr("info.json", "{}")
                    # Matches APKMirror's observed CRCRLF manifest formatting.
                    bundle.writestr("META-INF/MANIFEST.MF",
                                    "Manifest-Version: 1.0\r\r\n\r\r\nName: base.apk\r\r\n\r\r\nName: assetpack1.apk\r\r\n\r\r\n")
            with self.assertRaisesRegex(DownloadError, "missing declared APK.*assetpack1"):
                inspect_archive(p, "pizza")

    def test_wrong_publisher_cannot_be_a_success(self):
        with patch("apkmirror_download.android_tools", return_value=Path("tools")), \
             patch("apkmirror_download.subprocess.run", return_value=SimpleNamespace(
                 returncode=0, stdout="Signer #1 certificate SHA-256 digest: " + "0" * 64 + "\n")):
            with self.assertRaisesRegex(DownloadError, "publisher certificate"):
                verify_identity(Path("input.apk"), "pizza", None, {"format": "APK"})

    def test_failed_signature_verification_cannot_be_a_success(self):
        with patch("apkmirror_download.android_tools", return_value=Path("tools")), \
             patch("apkmirror_download.subprocess.run", return_value=SimpleNamespace(
                 returncode=1, stdout="")):
            with self.assertRaisesRegex(DownloadError, "signature verification"):
                verify_identity(Path("input.apk"), "pizza", None, {"format": "APK"})


if __name__ == "__main__":
    unittest.main()
