"""Focused guards for the six-patch bookmark card feature."""
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
PATCH = ROOT / "patches/src/main/kotlin/dev/rikunode/hatenabookmark/OpenArticleFromBookmarkCardPatch.kt"
HELPER = ROOT / "extensions/cardclick/src/main/java/dev/rikunode/cardclick/BookmarkCardClickHelper.java"

class BookmarkCardOpenTests(unittest.TestCase):
    def test_exact_58000_target_and_opt_out(self):
        source = PATCH.read_text(encoding="utf-8")
        self.assertIn('AppTarget(version = "5.80", versionCode = 58000)', source)
        self.assertIn('key = "openArticleFromBookmarkCard"', source)
        self.assertIn('default = true', source)
        self.assertIn('if (openArticleFromBookmarkCard == false) return@execute', source)
        self.assertIn('extendWith("extensions/cardclick.mpe")', source)

    def test_exact_dex_guard_and_call_site(self):
        source = PATCH.read_text(encoding="utf-8")
        self.assertIn('"Lcom/hatena/android/bookmark/viewholders/BookmarkPageViewHolder;"', source)
        self.assertIn('it.name == "updateBookmarkView"', source)
        self.assertIn('implementation.registerCount != 11', source)
        self.assertIn('original.sumOf { it.codeUnits } != 207', source)
        self.assertIn('at == 0x77', source)
        self.assertIn('instruction.opcode == Opcode.INVOKE_VIRTUAL', source)
        self.assertIn('it.registerCount == 3 && it.registerC == 1', source)
        self.assertIn('it.registerD == 8 && it.registerE == 5', source)
        self.assertIn('matches.size != 1 || original.count', source)
        self.assertIn('matches.single() + 1', source)
        self.assertIn('->setEntry(Lcom/hatena/android/bookmark/model/BookmarkEntry;Z)V', source)

    def test_browser_url_and_children_preserved(self):
        source = PATCH.read_text(encoding="utf-8")
        helper = HELPER.read_text(encoding="utf-8")
        self.assertIn('->getUrlToBrowse()Landroid/net/Uri;', source)
        self.assertIn('->getOriginalUri()Landroid/net/Uri;', source)
        self.assertIn('->attach(Landroid/view/View;Landroid/net/Uri;Landroid/net/Uri;)V', source)
        self.assertIn('intent.setData(browseUrl)', helper)
        self.assertIn('intent.putExtra("original_uri", original)', helper)
        self.assertIn('context.startActivity(intent)', helper)
        self.assertIn('if (articleCard == null || !isWebUrl(browseUrl)) return;', helper)
        self.assertIn('http".equalsIgnoreCase(scheme)', helper)
        self.assertIn('https".equalsIgnoreCase(scheme)', helper)
        self.assertNotIn('countText.setOnClickListener', helper)
        self.assertNotIn('followButton.setOnClickListener', helper)
        self.assertNotIn('starsGroup.setOnClickListener', helper)

if __name__ == "__main__":
    unittest.main()
