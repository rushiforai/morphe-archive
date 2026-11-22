"""Read-only real APK regression tests for Hatena 5.80, not a device UI test."""
from pathlib import Path
import hashlib, json, os, subprocess, zipfile, unittest

ROOT = Path(__file__).resolve().parents[1]
D = ROOT / "apk-inspection"
SOURCE = D / "Hatena_Bookmark__Save__share_5.80_APKPure.apk"
OUT = D / "HatenaBookmark-5.80-PR-hidden-clone-experiment.apk"
REPORT = D / "hatena-58000-apply-result.json"
SDK_ROOT = Path(os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT") or (Path.home() / "AppData/Local/Android/Sdk"))
SDK = SDK_ROOT / "build-tools" / "36.0.0"

@unittest.skipUnless(all(p.exists() for p in [SOURCE, OUT, REPORT]), "test artifacts missing")
class Hatena58000(unittest.TestCase):
    def test_source_identity(self):
        self.assertEqual(hashlib.sha256(SOURCE.read_bytes()).hexdigest(), "f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b")
    def test_morphe_all_steps(self):
        data = json.loads(REPORT.read_text(encoding="utf-8"))
        self.assertEqual(data["packageVersion"], "5.80")
        self.assertEqual(len(data["appliedPatches"]), 2)
        self.assertEqual(data["failedPatches"], [])
        self.assertTrue(all(x["success"] for x in data["patchingSteps"]))
    def test_dex_contains_guard(self):
        with zipfile.ZipFile(SOURCE) as a, zipfile.ZipFile(OUT) as b:
            self.assertIsNone(b.testzip())
            self.assertEqual(a.read("classes2.dex"), b.read("classes2.dex"))
            d = b.read("classes3.dex")
            self.assertIn(b"filteredWithMuteWords", d)
            self.assertIn(b"isPrEntry", d)
        extracted = D / "hatena-58000-test-code.dex"
        extracted.write_bytes(d)
        output = subprocess.check_output([str(SDK / "dexdump.exe"), "-d", str(extracted)]).decode("utf-8","replace")
        region = output.split("name          : 'filteredWithMuteWords'",1)[1].split("catches       :",1)[0]
        for snippet in ("|0000: invoke-virtual {v6}", "isPrEntry", "|0004: if-eqz v0", "|0006: const/4 v0, #int 0", "|0007: return v0", "|0009: invoke-virtual {v6}"):
            self.assertIn(snippet, region)
    def test_output_package_and_providers(self):
        aapt = str(SDK / "aapt.exe")
        pkg = subprocess.check_output([aapt,"dump","badging",str(OUT)]).decode("utf-8","replace")
        self.assertIn("package: name='com.hatena.android.bookmark.morphe' versionCode='58000' versionName='5.80'",pkg)
        manifest = subprocess.check_output([aapt,"dump","xmltree",str(OUT),"AndroidManifest.xml"]).decode("utf-8","replace")
        self.assertIn("com.hatena.android.bookmark.morphe.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",manifest)
        for s in ("androidx-startup","firebaseinitprovider","com.squareup.picasso"):
            self.assertIn("com.hatena.android.bookmark.morphe."+s,manifest)
        self.assertNotIn("com.pairip",manifest.lower())

if __name__=="__main__":
    unittest.main()
