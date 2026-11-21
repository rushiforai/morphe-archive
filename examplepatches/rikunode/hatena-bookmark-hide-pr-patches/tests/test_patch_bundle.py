#!/usr/bin/env python3
"""Prepublication static checks for this one-version, one-patch bundle.

This is NOT a real APK application or Android runtime test.
"""
from pathlib import Path
import hashlib
import json
import struct
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
MPP = ROOT / "patches/build/libs/patches-0.4.4.mpp"

class MppTests(unittest.TestCase):
    def test_android_bundle(self):
        self.assertTrue(MPP.exists(), f"Bundle missing: {MPP}")
        with zipfile.ZipFile(MPP) as z:
            self.assertIsNone(z.testzip())
            self.assertIn("classes.dex", z.namelist())
            dex = z.read("classes.dex")
            self.assertEqual(dex[:8], bytes([100,101,120,10,48,51,56,0]))
            self.assertGreater(struct.unpack_from("<I", dex, 0x60)[0], 0)
            self.assertIn(b"HideNativePrEntriesPatchKt", dex)
            self.assertIn(b"filteredWithMuteWords", dex)
            self.assertIn(b"BlockAdsInAppBrowserPatchKt", dex)
        print("BUILD_BUNDLE_SHA256", hashlib.sha256(MPP.read_bytes()).hexdigest())

    def test_metadata(self):
        meta = json.loads((ROOT/"patches-list.json").read_text(encoding="utf-8"))
        self.assertEqual(meta["version"], "0.4.4")
        self.assertEqual(len(meta["patches"]), 5)
        self.assertEqual({p["name"] for p in meta["patches"]}, {"Hide native PR entries from article feeds", "Clone Hatena Bookmark for safe side-by-side testing", "Hide weekly bookmark ranking announcement", "Block ads in in-app article browser", "Preserve article WebView cookies and storage"})
        patch = next(p for p in meta["patches"] if p["name"] == "Hide native PR entries from article feeds")
        packages = patch["compatiblePackages"]
        self.assertEqual(len(packages), 1)
        self.assertEqual(packages[0]["packageName"], "com.hatena.android.bookmark")
        target = packages[0]["targets"][0]
        self.assertEqual(target["version"], "5.80")
        self.assertEqual(set(target["versionCodes"].values()), {58000})

    def test_source_fail_closed(self):
        source = (ROOT/"patches/src/main/kotlin/dev/rikunode/hatenabookmark/HideNativePrEntriesPatch.kt").read_text(encoding="utf-8")
        for expected in (
            'name = "filteredWithMuteWords"', 'returnType = "Z"',
            'AppTarget(version = "5.80", versionCode = 58000)',
            'sumOf { it.codeUnits } == 105',
            'name = "withDate"',
            'sumOf { it.codeUnits } == 37',
            'move-result-object p1',
            '== 21)', 'prCalls.size == 1', 'if-eqz v0, :normal_article',
            'const/4 v0, 0x0', 'return v0',
        ):
            self.assertIn(expected, source)
        self.assertNotIn('isPrEntry()Z\n                move-result v0\n                return v0', source)

class FilterBehaviorTests(unittest.TestCase):
    """Semantics of the leading guard and untouched original mute logic."""
    @staticmethod
    def result(is_pr: bool, mute_match: bool) -> bool:
        if is_pr:
            return False  # patch short circuit
        return not mute_match  # original MuteHelper logic

    def test_pr_never_included(self):
        for is_muted in (True,False):
            self.assertFalse(self.result(True,is_muted))
    def test_ordinary_unmuted_kept(self):
        self.assertTrue(self.result(False,False))
    def test_ordinary_muted_filtered(self):
        self.assertFalse(self.result(False,True))

if __name__=="__main__":
    unittest.main()
