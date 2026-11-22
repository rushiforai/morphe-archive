"""Focused static regression and DEX layout guards for opt-in article storage persistence."""
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/hatenabookmark/PreserveArticleWebStoragePatch.kt"


class StoragePersistenceTests(unittest.TestCase):
    def test_default_on_and_strict_scoped_hooks(self):
        source = PATCH.read_text(encoding="utf-8")
        self.assertIn('key = "preserveArticleWebStorage"', source)
        self.assertIn("default = true", source)
        self.assertIn("if (preserveArticleWebStorage != true) return@execute", source)
        self.assertIn('"onDestroy", emptyList(), 4, 39,', source)
        self.assertIn('"onCreate", emptyList(), 5, 170,', source)
        self.assertIn("0x23, Opcode.INVOKE_VIRTUAL", source)
        self.assertIn("0x60, Opcode.INVOKE_VIRTUAL", source)
        self.assertEqual(source.count('replaceInstruction('), 2)
        self.assertIn('replaceInstruction(destroy.second, "nop")', source)
        self.assertIn('replaceInstruction(startup.second, "nop")', source)
        self.assertNotIn("CookieManager;.setCookie", source)

    def test_existing_patches_are_present(self):
        folder = PATCH.parent
        for name in (
            "BlockAdsInAppBrowserPatch.kt",
            "HideWeeklyRankingPatch.kt",
            "HideNativePrEntriesPatch.kt",
            "CloneHatenaBookmarkPatch.kt",
        ):
            self.assertTrue((folder / name).is_file(), name)


if __name__ == "__main__":
    unittest.main()
