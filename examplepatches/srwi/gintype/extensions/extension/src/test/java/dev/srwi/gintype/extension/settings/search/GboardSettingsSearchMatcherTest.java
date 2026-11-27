package dev.srwi.gintype.extension.settings.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.Arrays;

public final class GboardSettingsSearchMatcherTest {
    private static int title(String query, String title) {
        int total = 0;
        for (String term : GboardSettingsSearchMatcher.terms(query)) {
            int score = GboardSettingsSearchMatcher.scoreTitle(
                    term, GboardSettingsSearchMatcher.prepare(title));
            if (score == 0) {
                return 0;
            }
            total += score;
        }
        return total;
    }

    @Test
    public void foldsWidthCaseAndPunctuation() {
        assertEquals(Arrays.asList("matrix", "wheel"),
                GboardSettingsSearchMatcher.terms("  ＭＡＴＲＩＸ　wheel "));
        assertEquals("wificlipboard",
                GboardSettingsSearchMatcher.prepare("Wi-Fi Clipboard").normalized);
    }

    @Test
    public void exactPrefixAndSubstringRankInOrder() {
        int exact = title("MultiGlide", "MultiGlide");
        int prefix = title("Nin", "MultiGlide");
        int wordStart = title("touch", "Multi Touch");
        int substring = title("type", "MultiGlide");
        assertEquals(GboardSettingsSearchMatcher.EXACT, exact);
        assertEquals(GboardSettingsSearchMatcher.PREFIX, prefix);
        assertEquals(GboardSettingsSearchMatcher.SUBSTRING
                + GboardSettingsSearchMatcher.WORD_START_BONUS, wordStart);
        assertEquals(GboardSettingsSearchMatcher.SUBSTRING, substring);
    }

    @Test
    public void lettersInOrderMatchAcrossWords() {
        assertTrue(title("ntyp", "MultiGlide") > GboardSettingsSearchMatcher.TYPO);
        assertTrue(title("mtx", "Thicc Top Bar") > GboardSettingsSearchMatcher.TYPO);
    }

    @Test
    public void missingLettersMatchAsLettersInOrder() {
        assertTrue(title("trasparency", "Key transparency") > GboardSettingsSearchMatcher.TYPO);
        assertTrue(title("blr", "Enable live blur keys") > GboardSettingsSearchMatcher.TYPO);
        assertEquals(0, title("bzr", "Enable live blur keys"));
    }

    @Test
    public void englishTyposMatchWholeAndPartialWords() {
        assertEquals(GboardSettingsSearchMatcher.TYPO, title("blurr", "Enable live blur"));
        assertEquals(GboardSettingsSearchMatcher.TYPO, title("trensparency", "Key transparency"));
        assertEquals(GboardSettingsSearchMatcher.TYPO, title("trens", "Key transparency"));
        assertEquals(0, title("blxyz", "Enable live blur"));
    }

    @Test
    public void singleCharacterOnlyMatchesAsSubstring() {
        assertEquals(GboardSettingsSearchMatcher.SUBSTRING, title("x", "Matrix"));
        assertEquals(0, title("z", "Frosted Glass"));
    }

    @Test
    public void everyTermHasToMatch() {
        assertTrue(title("key trans", "Key transparency") > 0);
        assertEquals(0, title("key ftp", "Key transparency"));
    }

    @Test
    public void summariesOnlyMatchSubstrings() {
        GboardSettingsSearchMatcher.Text summary =
                GboardSettingsSearchMatcher.prepare("Two-finger swipe and tap+swipe gesture typing.");
        assertEquals(GboardSettingsSearchMatcher.SUMMARY,
                GboardSettingsSearchMatcher.scoreSummary("gesture", summary));
        assertEquals(0, GboardSettingsSearchMatcher.scoreSummary("invalid", summary));
    }

    @Test
    public void editDistanceCountsSwapsAsOneSlip() {
        assertEquals(1, GboardSettingsSearchMatcher.editDistance("bulr", "blur", 2));
        assertEquals(2, GboardSettingsSearchMatcher.editDistance("abcd", "abef", 2));
    }
}
