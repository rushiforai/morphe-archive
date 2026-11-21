"""v0.2.1 regression: native PR rows are removed on the always-used hot-feed conversion path.

Evidence:
- v5.80 GetCategoryHotEntryList.execute and CategoryHotEntryPagingSource.getHotEntries bypass
  filterByMuteWords when logged out OR user has no mute rules.
- HotEntryListViewModel uses GetCategoryHotEntryList.executePaging; PagingSource.load calls
  withDate(List<BookmarkEntry>, ZonedDateTime) after loading the list.
- Compiled v0.2.1 withDate unconditionally calls the patched MuteHelperKt.filterByMuteWords
  with an empty mute-list before converting each BookmarkEntry to EntryWithDate.
These tests verify the actual modified DEX not just source text; Android UI outcome awaits user.
"""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
APKS = ROOT / "apk-inspection"
SOURCE = APKS / "Hatena_Bookmark__Save__share_5.80_APKPure.apk"
PATCHED = APKS / "HatenaBookmark-5.80-PR-hidden-clone-v021-test.apk"
REPORT = APKS / "hatena-v021-apply.json"
SDK_ROOT = Path(os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT") or (Path.home() / "AppData/Local/Android/Sdk"))
DEXDUMP = Path(os.environ.get("ANDROID_DEXDUMP") or (SDK_ROOT / "build-tools" / "36.0.0" / "dexdump.exe"))


@unittest.skipUnless(SOURCE.is_file() and PATCHED.is_file() and REPORT.is_file(), "v0.2.1 local APKs not available")
class HotfeedUnmutedPrTests(unittest.TestCase):
    def test_input_has_not_changed(self):
        self.assertEqual(
            hashlib.sha256(SOURCE.read_bytes()).hexdigest(),
            "f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b",
        )

    def test_real_v021_application_all_stages(self):
        result = json.loads(REPORT.read_text(encoding="utf-8"))
        self.assertEqual({x["name"] for x in result["appliedPatches"]}, {
            "Hide native PR entries from article feeds",
            "Clone Hatena Bookmark for safe side-by-side testing",
        })
        self.assertEqual(result["failedPatches"], [])
        self.assertTrue(all(x["success"] for x in result["patchingSteps"]))

    def test_no_unintended_second_dex_mutation(self):
        with zipfile.ZipFile(SOURCE) as raw, zipfile.ZipFile(PATCHED) as patched:
            self.assertEqual(raw.read("classes2.dex"), patched.read("classes2.dex"))
            self.assertIsNone(patched.testzip())
            self.assertIn("classes3.dex", patched.namelist())

    @unittest.skipUnless(DEXDUMP.is_file(), "SDK dexdump not available")
    def test_new_unconditional_guard_in_real_dex(self):
        with zipfile.ZipFile(PATCHED) as z:
            payload = z.read("classes3.dex")
        temp = APKS / "hatena-v021-test-compiled.dex"
        temp.write_bytes(payload)
        output = subprocess.check_output([str(DEXDUMP), "-d", str(temp)]).decode("utf-8", "replace")
        pos = output.index("name          : 'withDate'")
        sub = output[pos:pos + 2400]
        opcodes = re.findall(r"\|[0-9a-f]{4}: (.*)", sub)
        self.assertGreaterEqual(len(opcodes), 8)
        self.assertIn("CollectionsKt;.emptyList:()", opcodes[0])
        self.assertIn("move-result-object v0", opcodes[1])
        self.assertIn("const/4 v1, #int 0", opcodes[2])
        self.assertIn("MuteHelperKt;.filterByMuteWords", opcodes[3])
        self.assertIn("move-result-object v4", opcodes[4])
        self.assertIn("new-instance v0", opcodes[5])
        pos = output.index("name          : 'filteredWithMuteWords'")
        sub = output[pos:pos + 1500]
        self.assertIn("BookmarkEntry;.isPrEntry:()", sub)
        self.assertIn("if-eqz v0", sub)
        self.assertIn("const/4 v0, #int 0", sub)
        self.assertIn("return v0", sub)

    def test_experimental_guard_and_expected_source_structure(self):
        patch = (ROOT/"patches/src/main/kotlin/dev/rikunode/hatenabookmark/HideNativePrEntriesPatch.kt").read_text(encoding="utf-8")
        for snippet in (
            'name = "withDate"',
            "UnconditionalHotFeedFingerprint.method",
            "dateImpl.registerCount == 6",
            "sumOf { it.codeUnits } == 37",
            "move-result-object p1",
            "emptyList()Ljava/util/List;",
            "filterByMuteWords(Ljava/util/List;Ljava/util/List;Ljava/lang/Integer;)Ljava/util/List;",
        ):
            self.assertIn(snippet, patch)

if __name__ == "__main__":
    unittest.main()
