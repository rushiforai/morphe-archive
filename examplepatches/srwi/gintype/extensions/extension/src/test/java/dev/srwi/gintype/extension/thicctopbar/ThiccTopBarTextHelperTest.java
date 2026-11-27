package dev.srwi.gintype.extension.thicctopbar;

import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.view.inputmethod.CompletionInfo;
import android.view.inputmethod.CorrectionInfo;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputContentInfo;

import org.junit.Assert;
import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class ThiccTopBarTextHelperTest {

    @Test
    public void boundaryCharDetection() {
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar(' '));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar('.'));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar(','));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar('!'));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar('?'));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar('\n'));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar('a'));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar('Z'));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar('9'));

        // Non-BMP surrogate pairs: mathematical bold '𝐀' (U+1D400) is a letter, emoji '😀' (U+1F600) is a boundary
        String mathBoldA = "\uD835\uDC00";
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar(mathBoldA, 0));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar(mathBoldA, 1));
        String grinningEmoji = "\uD83D\uDE00";
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar(grinningEmoji, 0));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar(grinningEmoji, 1));
    }

    @Test
    public void sentenceEndDetection() {
        // Dot, exclamation, and question marks do NOT end the sentence buffer (kept in topbar per UX requirements)
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo."));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo. "));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo,"));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo!"));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo?  "));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo"));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded("Hallo "));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded(""));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded((CharSequence) null));

        // Only newline (\n or \r) ends the sentence / paragraph
        Assert.assertTrue(ThiccTopBarTextHelper.isSentenceEnded("Hallo\n"));
        Assert.assertTrue(ThiccTopBarTextHelper.isSentenceEnded("Hallo\r"));
        Assert.assertTrue(ThiccTopBarTextHelper.isSentenceEnded("Hallo\n   "));
    }

    @Test
    public void punctuationSplittingTests() {
        Assert.assertEquals("Hallo", ThiccTopBarTextHelper.stripTrailingPunctuation("Hallo,"));
        Assert.assertEquals(",", ThiccTopBarTextHelper.getTrailingPunctuation("Hallo,"));

        Assert.assertEquals("dir", ThiccTopBarTextHelper.stripTrailingPunctuation("dir."));
        Assert.assertEquals(".", ThiccTopBarTextHelper.getTrailingPunctuation("dir."));

        Assert.assertEquals("toll", ThiccTopBarTextHelper.stripTrailingPunctuation("toll!"));
        Assert.assertEquals("!", ThiccTopBarTextHelper.getTrailingPunctuation("toll!"));

        Assert.assertEquals("wirklich", ThiccTopBarTextHelper.stripTrailingPunctuation("wirklich?!"));
        Assert.assertEquals("?!", ThiccTopBarTextHelper.getTrailingPunctuation("wirklich?!"));

        Assert.assertEquals("wort", ThiccTopBarTextHelper.stripTrailingPunctuation("wort..."));
        Assert.assertEquals("...", ThiccTopBarTextHelper.getTrailingPunctuation("wort..."));

        Assert.assertEquals("wort", ThiccTopBarTextHelper.stripTrailingPunctuation("wort"));
        Assert.assertEquals("", ThiccTopBarTextHelper.getTrailingPunctuation("wort"));
    }

    @Test
    public void activeWordResolution() {
        // 1. In-progress typing (no trailing whitespace)
        Assert.assertEquals("toggles", ThiccTopBarTextHelper.getActiveWord("toggles", Collections.emptyList()));
        Assert.assertEquals("Welt", ThiccTopBarTextHelper.getActiveWord("Hallo Welt", Collections.emptyList()));

        // 2. Swiped word with single auto-space
        Assert.assertEquals("toggles", ThiccTopBarTextHelper.getActiveWord("toggles ", Collections.emptyList()));
        Assert.assertEquals("Welt", ThiccTopBarTextHelper.getActiveWord("Hallo Welt ", Collections.emptyList()));

        // 3. Double space (suppressed active word, moving to next word)
        Assert.assertNull(ThiccTopBarTextHelper.getActiveWord("toggles  ", Collections.emptyList()));

        // 4. Prediction items (suppressed next-word suggestions per user UX requirement)
        GboardThiccTopBarRuntime.CandidateItem pred1 = new GboardThiccTopBarRuntime.CandidateItem(
                "und", 0, false, false, true, "PREDICTION", null, null);
        GboardThiccTopBarRuntime.CandidateItem pred2 = new GboardThiccTopBarRuntime.CandidateItem(
                "ist", 1, false, false, true, "PREDICTION", null, null);
        List<GboardThiccTopBarRuntime.CandidateItem> predictionItems = Arrays.asList(pred1, pred2);

        Assert.assertNull(ThiccTopBarTextHelper.getActiveWord("toggles ", predictionItems));

        // 5. Swipe candidate alternatives (not all prediction -> active word preserved)
        GboardThiccTopBarRuntime.CandidateItem alt1 = new GboardThiccTopBarRuntime.CandidateItem(
                "toggles", 0, true, true, false, "GLIDE", null, null);
        List<GboardThiccTopBarRuntime.CandidateItem> glideItems = Collections.singletonList(alt1);
        Assert.assertEquals("toggles", ThiccTopBarTextHelper.getActiveWord("toggles ", glideItems));

        // 5b. Live single-candidate glide preview for the NEXT word while InputConnection still ends
        // with "<prevWord> " (or "<prevWord>" without trailing space) must return null so <prevWord>
        // is not paired with the next word, while prefix completions while typing still resolve.
        GboardThiccTopBarRuntime.CandidateItem nextWordPreview = new GboardThiccTopBarRuntime.CandidateItem(
                "sollten", 0, false, false, false, "RECOMMENDATION", null, null);
        Assert.assertNull(ThiccTopBarTextHelper.getActiveWord("dann ", Collections.singletonList(nextWordPreview)));
        Assert.assertEquals("sollten", ThiccTopBarTextHelper.getActiveWord("sollten ", Collections.singletonList(nextWordPreview)));

        GboardThiccTopBarRuntime.CandidateItem nextWordZu = new GboardThiccTopBarRuntime.CandidateItem(
                "zu", 0, false, false, false, "RECOMMENDATION", null, null);
        Assert.assertNull(ThiccTopBarTextHelper.getActiveWord("manchmal", Collections.singletonList(nextWordZu)));
        GboardThiccTopBarRuntime.CandidateItem prefixCompletion = new GboardThiccTopBarRuntime.CandidateItem(
                "manchmal", 0, false, false, false, "RECOMMENDATION", null, null);
        Assert.assertEquals("manchma", ThiccTopBarTextHelper.getActiveWord("manchma", Collections.singletonList(prefixCompletion)));

        // 6. When candidates are cleared (allowTrailingSpace = false, e.g. after swipe-delete or manual space):
        // Trailing space means word was committed, not currently composing
        Assert.assertNull(ThiccTopBarTextHelper.getActiveWord("toggles ", Collections.emptyList(), false));
        Assert.assertNull(ThiccTopBarTextHelper.getActiveWord("Hallo Welt ", Collections.emptyList(), false));
        Assert.assertEquals("toggles", ThiccTopBarTextHelper.getActiveWord("toggles", Collections.emptyList(), false));
    }

    @Test
    public void activeOrTrailingPunctuatedWordResolution() {
        Assert.assertEquals("gehts", ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts"));
        Assert.assertEquals("gehts", ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts?"));
        Assert.assertEquals("gehts", ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts ?"));
        Assert.assertEquals("gehts", ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts? "));
        Assert.assertEquals("gehts", ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts!"));
        Assert.assertEquals("gehts", ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts."));
        Assert.assertNull(ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo wie gehts "));
        Assert.assertNull(ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("Hallo\n"));
        Assert.assertNull(ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord("?"));
        Assert.assertNull(ThiccTopBarTextHelper.getActiveOrTrailingPunctuatedWord((CharSequence) null));
    }

    @Test
    public void preserveActiveSuggestionsDuringNextWordGlide() {
        List<String> malAlts = Arrays.asList("mal", "Mark", "man");
        GboardThiccTopBarRuntime.CandidateItem liveGlideSchauen = new GboardThiccTopBarRuntime.CandidateItem(
                "schauen", 0, false, false, false, "RECOMMENDATION", null, null);
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldPreserveActiveSuggestions(
                malAlts, "mal", false, Collections.singletonList(liveGlideSchauen)));

        // Single-candidate word ("jetzt") should also be preserved when live preview ("besser") arrives
        Assert.assertTrue(GboardThiccTopBarRuntime.shouldPreserveActiveSuggestions(
                Collections.singletonList("jetzt"), "jetzt", false,
                Collections.singletonList(new GboardThiccTopBarRuntime.CandidateItem(
                        "besser", 0, false, false, false, "RECOMMENDATION", null, null))));

        // Once the new word commits ("schauen"), alternatives must update
        Assert.assertFalse(GboardThiccTopBarRuntime.shouldPreserveActiveSuggestions(
                malAlts, "schauen", false, Collections.singletonList(liveGlideSchauen)));
    }

    @Test
    public void newWordEntranceAnimationCalculations() {
        // First word or incremental word addition should animate in; bulk initial population (>1 from 0),
        // same-count refreshes, and deletions should not.
        Assert.assertTrue(ThiccTopBarView.shouldAnimateNewWordEntrance(0, 1));
        Assert.assertTrue(ThiccTopBarView.shouldAnimateNewWordEntrance(1, 2));
        Assert.assertTrue(ThiccTopBarView.shouldAnimateNewWordEntrance(5, 6));
        Assert.assertFalse(ThiccTopBarView.shouldAnimateNewWordEntrance(0, 4));
        Assert.assertFalse(ThiccTopBarView.shouldAnimateNewWordEntrance(3, 3));
        Assert.assertFalse(ThiccTopBarView.shouldAnimateNewWordEntrance(3, 2));

        // First word enters by its full width; subsequent words enter by delta width
        Assert.assertEquals(180f, ThiccTopBarView.computeEntranceTranslationX(0, 0f, 180, 1080), 0.01f);
        Assert.assertEquals(160f, ThiccTopBarView.computeEntranceTranslationX(180, 0f, 340, 1080), 0.01f);
        // Active in-flight translation accumulates seamlessly if another word arrives mid-animation
        Assert.assertEquals(210f, ThiccTopBarView.computeEntranceTranslationX(340, 50f, 500, 1080), 0.01f);
        // Clamped to barWidth
        Assert.assertEquals(1080f, ThiccTopBarView.computeEntranceTranslationX(200, 0f, 1500, 1080), 0.01f);

        // Sliding-window cap at 15+ words: count stays 16 -> 16, but window shifted left by 1 word
        List<String> prev16 = Arrays.asList(
                "ab", "einer", "gewissen", "Satzlaenge", "faengt", "die", "Animation", "an",
                "nicht", "mehr", "zu", "passieren.", "die", "Woerter", "erscheinen", "dann");
        List<String> next16Shifted = Arrays.asList(
                "einer", "gewissen", "Satzlaenge", "faengt", "die", "Animation", "an", "nicht",
                "mehr", "zu", "passieren.", "die", "Woerter", "erscheinen", "dann", "wieder");
        List<String> prev16EditedInPlace = Arrays.asList(
                "ab", "einer", "gewissen", "Satzlaenge", "faengt", "die", "Animation", "an",
                "nicht", "mehr", "zu", "passieren.", "die", "Woerter", "erscheinen", "denn");
        Assert.assertTrue(ThiccTopBarView.shouldAnimateNewWordEntrance(prev16, next16Shifted));
        Assert.assertFalse(ThiccTopBarView.shouldAnimateNewWordEntrance(prev16, prev16EditedInPlace));
        // Deleting backwards (shift right) must not animate as new word entrance
        Assert.assertFalse(ThiccTopBarView.shouldAnimateNewWordEntrance(next16Shifted, prev16));
    }

    @Test
    public void findHistoryWordPositionWithDuplicates() {
        // Text with three identical words: "toggles toggles toggles"
        String text = "toggles toggles toggles";
        ThiccTopBarSentenceBuffer buffer = new ThiccTopBarSentenceBuffer();
        buffer.addWord("toggles", Collections.singletonList("toggles"), 0);
        buffer.addWord("toggles", Collections.singletonList("toggles"), 0);
        buffer.addWord("toggles", Collections.singletonList("toggles"), 0);

        List<ThiccTopBarSentenceBuffer.WordEntry> entries = buffer.getEntries();
        Assert.assertEquals(3, entries.size());

        // Col 0 is the first "toggles" (index 0..7)
        int[] pos0 = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 0, "toggles");
        Assert.assertNotNull(pos0);
        Assert.assertEquals(0, pos0[0]);
        Assert.assertEquals(7, pos0[1]);

        // Col 1 is the middle "toggles" (index 8..15)
        int[] pos1 = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 1, "toggles");
        Assert.assertNotNull(pos1);
        Assert.assertEquals(8, pos1[0]);
        Assert.assertEquals(15, pos1[1]);

        // Col 2 is the last "toggles" (index 16..23)
        int[] pos2 = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 2, "toggles");
        Assert.assertNotNull(pos2);
        Assert.assertEquals(16, pos2[0]);
        Assert.assertEquals(23, pos2[1]);
    }

    @Test
    public void findHistoryWordPositionInRealSentence() {
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = new ThiccTopBarSentenceBuffer();
        buffer.addWord("Hallo", Collections.singletonList("Hallo"), 0);
        buffer.addWord("wie", Collections.singletonList("wie"), 0);
        buffer.addWord("geht", Collections.singletonList("geht"), 0);
        buffer.addWord("es", Collections.singletonList("es"), 0);
        buffer.addWord("dir", Collections.singletonList("dir"), 0);

        List<ThiccTopBarSentenceBuffer.WordEntry> entries = buffer.getEntries();

        // Check each word's exact position
        int[] posHallo = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 0, "Hallo");
        Assert.assertNotNull(posHallo);
        Assert.assertEquals("Hallo", text.substring(posHallo[0], posHallo[1]));

        int[] posWie = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 1, "wie");
        Assert.assertNotNull(posWie);
        Assert.assertEquals("wie", text.substring(posWie[0], posWie[1]));

        int[] posGeht = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 2, "geht");
        Assert.assertNotNull(posGeht);
        Assert.assertEquals("geht", text.substring(posGeht[0], posGeht[1]));

        int[] posEs = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 3, "es");
        Assert.assertNotNull(posEs);
        Assert.assertEquals("es", text.substring(posEs[0], posEs[1]));

        int[] posDir = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 4, "dir");
        Assert.assertNotNull(posDir);
        Assert.assertEquals("dir", text.substring(posDir[0], posDir[1]));
    }

    @Test
    public void findHistoryWordPositionWithPunctuation() {
        String text = "Hallo, wie geht es dir.";
        ThiccTopBarSentenceBuffer buffer = new ThiccTopBarSentenceBuffer();
        buffer.addWord("Hallo,", Collections.singletonList("Hallo,"), 0);
        buffer.addWord("wie", Collections.singletonList("wie"), 0);
        buffer.addWord("geht", Collections.singletonList("geht"), 0);
        buffer.addWord("es", Collections.singletonList("es"), 0);
        buffer.addWord("dir.", Collections.singletonList("dir."), 0);

        List<ThiccTopBarSentenceBuffer.WordEntry> entries = buffer.getEntries();

        // Target Col 0: "Hallo," -> base word "Hallo" at [0, 5]
        int[] posHallo = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 0, "Hallo,");
        Assert.assertNotNull(posHallo);
        Assert.assertEquals(0, posHallo[0]);
        Assert.assertEquals(5, posHallo[1]);
        Assert.assertEquals("Hallo", text.substring(posHallo[0], posHallo[1]));

        // Target Col 4: "dir." -> base word "dir" at [19, 22]
        int[] posDir = ThiccTopBarTextHelper.findHistoryWordPosition(text, entries, 4, "dir.");
        Assert.assertNotNull(posDir);
        Assert.assertEquals(19, posDir[0]);
        Assert.assertEquals(22, posDir[1]);
        Assert.assertEquals("dir", text.substring(posDir[0], posDir[1]));
    }

    @Test
    public void findLastWordBoundaryTests() {
        String text = "Das ist ein Test und noch ein Test";
        int[] pos = ThiccTopBarTextHelper.findLastWordBoundary(text, "Test");
        Assert.assertNotNull(pos);
        Assert.assertEquals(30, pos[0]);
        Assert.assertEquals(34, pos[1]);
        Assert.assertEquals("Test", text.substring(pos[0], pos[1]));

        int[] posFirst = ThiccTopBarTextHelper.findLastWordBoundary(text, "Das");
        Assert.assertNotNull(posFirst);
        Assert.assertEquals(0, posFirst[0]);
        Assert.assertEquals(3, posFirst[1]);

        Assert.assertNull(ThiccTopBarTextHelper.findLastWordBoundary(text, "NichtVorhanden"));
        Assert.assertNull(ThiccTopBarTextHelper.findLastWordBoundary(null, "Test"));
        Assert.assertNull(ThiccTopBarTextHelper.findLastWordBoundary(text, null));
    }

    @Test
    public void contextualBoundaryCharTests() {
        // Decimals and thousands separators between digits are NOT boundaries
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("3.14", 1));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("3,14", 1));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("1.500", 1));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("100,000", 3));

        // Dot or comma after a word or before space IS a boundary
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("Hallo.", 5));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("Hallo,", 5));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("Hallo. Welt", 5));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("Hallo, Welt", 5));

        // Contractions: apostrophe between letters is NOT a boundary
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("geht's", 4));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("don't", 3));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("it's", 2));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("c'est", 1));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("geht’s", 4)); // typographic apostrophe \u2019

        // Compound words: hyphen between letters/digits is NOT a boundary
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("E-Mail", 1));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("Wi-Fi", 2));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("Covid-19", 5));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("und/oder", 3));
        Assert.assertFalse(ThiccTopBarTextHelper.isBoundaryChar("my_var", 2));

        // Standalone hyphen / slash with spaces IS a boundary
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("Hallo - Welt", 6));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("a / b", 2));

        // Brackets, quotes, operators, currency, emojis are boundaries
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("(Hallo)", 0));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("(Hallo)", 6));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("[Wichtig]", 0));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("„Genial“", 0));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("50€", 2));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("$100", 0));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("1+2=3", 1));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("1+2=3", 3));
        Assert.assertTrue(ThiccTopBarTextHelper.isBoundaryChar("Super!😊", 5));
    }

    @Test
    public void tokenPartsParsingAllCases() {
        // 1. Plain words
        ThiccTopBarTextHelper.TokenParts p1 = ThiccTopBarTextHelper.parseTokenParts("Hallo");
        Assert.assertEquals("", p1.prefix);
        Assert.assertEquals("Hallo", p1.word);
        Assert.assertEquals("", p1.suffix);
        Assert.assertTrue(p1.hasWord());

        // 2. Trailing punctuation
        ThiccTopBarTextHelper.TokenParts p2 = ThiccTopBarTextHelper.parseTokenParts("Hallo,");
        Assert.assertEquals("", p2.prefix);
        Assert.assertEquals("Hallo", p2.word);
        Assert.assertEquals(",", p2.suffix);

        ThiccTopBarTextHelper.TokenParts p3 = ThiccTopBarTextHelper.parseTokenParts("dir.");
        Assert.assertEquals("", p3.prefix);
        Assert.assertEquals("dir", p3.word);
        Assert.assertEquals(".", p3.suffix);

        ThiccTopBarTextHelper.TokenParts p4 = ThiccTopBarTextHelper.parseTokenParts("toll!?!...");
        Assert.assertEquals("", p4.prefix);
        Assert.assertEquals("toll", p4.word);
        Assert.assertEquals("!?!...", p4.suffix);

        // 3. Brackets & Parentheses
        ThiccTopBarTextHelper.TokenParts p5 = ThiccTopBarTextHelper.parseTokenParts("(Hallo)");
        Assert.assertEquals("(", p5.prefix);
        Assert.assertEquals("Hallo", p5.word);
        Assert.assertEquals(")", p5.suffix);

        ThiccTopBarTextHelper.TokenParts p6 = ThiccTopBarTextHelper.parseTokenParts("[Wichtig]");
        Assert.assertEquals("[", p6.prefix);
        Assert.assertEquals("Wichtig", p6.word);
        Assert.assertEquals("]", p6.suffix);

        ThiccTopBarTextHelper.TokenParts p7 = ThiccTopBarTextHelper.parseTokenParts("{Config}");
        Assert.assertEquals("{", p7.prefix);
        Assert.assertEquals("Config", p7.word);
        Assert.assertEquals("}", p7.suffix);

        ThiccTopBarTextHelper.TokenParts p8 = ThiccTopBarTextHelper.parseTokenParts("<Tag>");
        Assert.assertEquals("<", p8.prefix);
        Assert.assertEquals("Tag", p8.word);
        Assert.assertEquals(">", p8.suffix);

        // 4. Quotation marks
        ThiccTopBarTextHelper.TokenParts p9 = ThiccTopBarTextHelper.parseTokenParts("„Genial!“");
        Assert.assertEquals("„", p9.prefix);
        Assert.assertEquals("Genial", p9.word);
        Assert.assertEquals("!“", p9.suffix);

        ThiccTopBarTextHelper.TokenParts p10 = ThiccTopBarTextHelper.parseTokenParts("\"Zitat\"");
        Assert.assertEquals("\"", p10.prefix);
        Assert.assertEquals("Zitat", p10.word);
        Assert.assertEquals("\"", p10.suffix);

        ThiccTopBarTextHelper.TokenParts p11 = ThiccTopBarTextHelper.parseTokenParts("«Französisch»");
        Assert.assertEquals("«", p11.prefix);
        Assert.assertEquals("Französisch", p11.word);
        Assert.assertEquals("»", p11.suffix);

        // 5. Contractions & Internal hyphens & Decimals
        ThiccTopBarTextHelper.TokenParts p12 = ThiccTopBarTextHelper.parseTokenParts("geht's");
        Assert.assertEquals("", p12.prefix);
        Assert.assertEquals("geht's", p12.word);
        Assert.assertEquals("", p12.suffix);

        ThiccTopBarTextHelper.TokenParts p13 = ThiccTopBarTextHelper.parseTokenParts("geht's?!");
        Assert.assertEquals("", p13.prefix);
        Assert.assertEquals("geht's", p13.word);
        Assert.assertEquals("?!", p13.suffix);

        ThiccTopBarTextHelper.TokenParts p14 = ThiccTopBarTextHelper.parseTokenParts("E-Mail");
        Assert.assertEquals("", p14.prefix);
        Assert.assertEquals("E-Mail", p14.word);
        Assert.assertEquals("", p14.suffix);

        ThiccTopBarTextHelper.TokenParts p15 = ThiccTopBarTextHelper.parseTokenParts("3,14");
        Assert.assertEquals("", p15.prefix);
        Assert.assertEquals("3,14", p15.word);
        Assert.assertEquals("", p15.suffix);

        ThiccTopBarTextHelper.TokenParts p16 = ThiccTopBarTextHelper.parseTokenParts("1.500");
        Assert.assertEquals("", p16.prefix);
        Assert.assertEquals("1.500", p16.word);
        Assert.assertEquals("", p16.suffix);

        // 6. Currency, Percentages, Hashtags, Mentions
        ThiccTopBarTextHelper.TokenParts p17 = ThiccTopBarTextHelper.parseTokenParts("$100");
        Assert.assertEquals("$", p17.prefix);
        Assert.assertEquals("100", p17.word);
        Assert.assertEquals("", p17.suffix);

        ThiccTopBarTextHelper.TokenParts p18 = ThiccTopBarTextHelper.parseTokenParts("50€");
        Assert.assertEquals("", p18.prefix);
        Assert.assertEquals("50", p18.word);
        Assert.assertEquals("€", p18.suffix);

        ThiccTopBarTextHelper.TokenParts p19 = ThiccTopBarTextHelper.parseTokenParts("100%");
        Assert.assertEquals("", p19.prefix);
        Assert.assertEquals("100", p19.word);
        Assert.assertEquals("%", p19.suffix);

        ThiccTopBarTextHelper.TokenParts p20 = ThiccTopBarTextHelper.parseTokenParts("#Gboard");
        Assert.assertEquals("#", p20.prefix);
        Assert.assertEquals("Gboard", p20.word);
        Assert.assertEquals("", p20.suffix);

        ThiccTopBarTextHelper.TokenParts p21 = ThiccTopBarTextHelper.parseTokenParts("@user");
        Assert.assertEquals("@", p21.prefix);
        Assert.assertEquals("user", p21.word);
        Assert.assertEquals("", p21.suffix);

        // 7. Emojis
        ThiccTopBarTextHelper.TokenParts p22 = ThiccTopBarTextHelper.parseTokenParts("Super!😊");
        Assert.assertEquals("", p22.prefix);
        Assert.assertEquals("Super", p22.word);
        Assert.assertEquals("!😊", p22.suffix);

        // 8. Standalone symbols (no word)
        ThiccTopBarTextHelper.TokenParts p23 = ThiccTopBarTextHelper.parseTokenParts("😊");
        Assert.assertFalse(p23.hasWord());

        ThiccTopBarTextHelper.TokenParts p24 = ThiccTopBarTextHelper.parseTokenParts("+");
        Assert.assertFalse(p24.hasWord());

        ThiccTopBarTextHelper.TokenParts p25 = ThiccTopBarTextHelper.parseTokenParts("...");
        Assert.assertFalse(p25.hasWord());
    }

    @Test
    public void sentenceTokenizationTests() {
        // Sentence with mixed brackets, quotes, currency, and emojis
        String s = "(Hallo) das ist ein \"Zitat\" mit $100 und 50€ Super!😊";
        List<ThiccTopBarTextHelper.TokenParts> tokens = ThiccTopBarTextHelper.tokenizeSentence(s);

        Assert.assertEquals(10, tokens.size());
        Assert.assertEquals("Hallo", tokens.get(0).word);
        Assert.assertEquals("(", tokens.get(0).prefix);
        Assert.assertEquals(")", tokens.get(0).suffix);

        Assert.assertEquals("das", tokens.get(1).word);
        Assert.assertEquals("ist", tokens.get(2).word);
        Assert.assertEquals("ein", tokens.get(3).word);

        Assert.assertEquals("Zitat", tokens.get(4).word);
        Assert.assertEquals("\"", tokens.get(4).prefix);
        Assert.assertEquals("\"", tokens.get(4).suffix);

        Assert.assertEquals("mit", tokens.get(5).word);

        Assert.assertEquals("100", tokens.get(6).word);
        Assert.assertEquals("$", tokens.get(6).prefix);

        Assert.assertEquals("und", tokens.get(7).word);

        Assert.assertEquals("50", tokens.get(8).word);
        Assert.assertEquals("€", tokens.get(8).suffix);

        Assert.assertEquals("Super", tokens.get(9).word);
        Assert.assertEquals("!😊", tokens.get(9).suffix);

        // Math operators test
        String math = "1 + 2 = 3";
        List<ThiccTopBarTextHelper.TokenParts> mathTokens = ThiccTopBarTextHelper.tokenizeSentence(math);
        Assert.assertEquals(5, mathTokens.size());
        Assert.assertTrue(mathTokens.get(0).hasWord()); // "1"
        Assert.assertFalse(mathTokens.get(1).hasWord()); // "+"
        Assert.assertTrue(mathTokens.get(2).hasWord()); // "2"
        Assert.assertFalse(mathTokens.get(3).hasWord()); // "="
        Assert.assertTrue(mathTokens.get(4).hasWord()); // "3"

        // Adjacent brackets without space: "(Hallo)(Welt)"
        List<ThiccTopBarTextHelper.TokenParts> adj = ThiccTopBarTextHelper.tokenizeSentence("(Hallo)(Welt)");
        Assert.assertEquals(2, adj.size());
        Assert.assertEquals("Hallo", adj.get(0).word);
        Assert.assertEquals("(", adj.get(0).prefix);
        Assert.assertEquals(")", adj.get(0).suffix);
        Assert.assertEquals("Welt", adj.get(1).word);
        Assert.assertEquals("(", adj.get(1).prefix);
        Assert.assertEquals(")", adj.get(1).suffix);
    }

    @Test
    public void findHistoryWordPositionInComplexSentences() {
        // 1. In brackets: "(Hallo) wie geht es dir" -> Target Col 0: "(Hallo)"
        String text1 = "(Hallo) wie geht es dir";
        ThiccTopBarSentenceBuffer buf1 = new ThiccTopBarSentenceBuffer();
        buf1.addWord("(Hallo)", Collections.singletonList("(Hallo)"), 0);
        buf1.addWord("wie", Collections.singletonList("wie"), 0);
        buf1.addWord("geht", Collections.singletonList("geht"), 0);
        buf1.addWord("es", Collections.singletonList("es"), 0);
        buf1.addWord("dir", Collections.singletonList("dir"), 0);

        int[] posHallo = ThiccTopBarTextHelper.findHistoryWordPosition(text1, buf1.getEntries(), 0, "(Hallo)");
        Assert.assertNotNull(posHallo);
        Assert.assertEquals(1, posHallo[0]);
        Assert.assertEquals(6, posHallo[1]);
        Assert.assertEquals("Hallo", text1.substring(posHallo[0], posHallo[1]));

        // 2. In quotes: "Das ist „Genial!“ wirklich" -> Target Col 2: "„Genial!“"
        String text2 = "Das ist „Genial!“ wirklich";
        ThiccTopBarSentenceBuffer buf2 = new ThiccTopBarSentenceBuffer();
        buf2.addWord("Das", Collections.singletonList("Das"), 0);
        buf2.addWord("ist", Collections.singletonList("ist"), 0);
        buf2.addWord("„Genial!“", Collections.singletonList("„Genial!“"), 0);
        buf2.addWord("wirklich", Collections.singletonList("wirklich"), 0);

        int[] posGenial = ThiccTopBarTextHelper.findHistoryWordPosition(text2, buf2.getEntries(), 2, "„Genial!“");
        Assert.assertNotNull(posGenial);
        Assert.assertEquals("Genial", text2.substring(posGenial[0], posGenial[1]));

        // 3. With decimals and currency: "Kostet $100 oder 3,14€ bar"
        String text3 = "Kostet $100 oder 3,14€ bar";
        ThiccTopBarSentenceBuffer buf3 = new ThiccTopBarSentenceBuffer();
        buf3.addWord("Kostet", Collections.singletonList("Kostet"), 0);
        buf3.addWord("$100", Collections.singletonList("$100"), 0);
        buf3.addWord("oder", Collections.singletonList("oder"), 0);
        buf3.addWord("3,14€", Collections.singletonList("3,14€"), 0);
        buf3.addWord("bar", Collections.singletonList("bar"), 0);

        int[] pos100 = ThiccTopBarTextHelper.findHistoryWordPosition(text3, buf3.getEntries(), 1, "$100");
        Assert.assertNotNull(pos100);
        Assert.assertEquals("100", text3.substring(pos100[0], pos100[1]));

        int[] posPi = ThiccTopBarTextHelper.findHistoryWordPosition(text3, buf3.getEntries(), 3, "3,14€");
        Assert.assertNotNull(posPi);
        Assert.assertEquals("3,14", text3.substring(posPi[0], posPi[1]));

        // 4. With contractions and hyphens: "Wie geht's per E-Mail"
        String text4 = "Wie geht's per E-Mail";
        ThiccTopBarSentenceBuffer buf4 = new ThiccTopBarSentenceBuffer();
        buf4.addWord("Wie", Collections.singletonList("Wie"), 0);
        buf4.addWord("geht's", Collections.singletonList("geht's"), 0);
        buf4.addWord("per", Collections.singletonList("per"), 0);
        buf4.addWord("E-Mail", Collections.singletonList("E-Mail"), 0);

        int[] posGehts = ThiccTopBarTextHelper.findHistoryWordPosition(text4, buf4.getEntries(), 1, "geht's");
        Assert.assertNotNull(posGehts);
        Assert.assertEquals("geht's", text4.substring(posGehts[0], posGehts[1]));

        int[] posEmail = ThiccTopBarTextHelper.findHistoryWordPosition(text4, buf4.getEntries(), 3, "E-Mail");
        Assert.assertNotNull(posEmail);
        Assert.assertEquals("E-Mail", text4.substring(posEmail[0], posEmail[1]));

        // 5. With attached emoji: "Das ist Super!😊 danke"
        String text5 = "Das ist Super!😊 danke";
        ThiccTopBarSentenceBuffer buf5 = new ThiccTopBarSentenceBuffer();
        buf5.addWord("Das", Collections.singletonList("Das"), 0);
        buf5.addWord("ist", Collections.singletonList("ist"), 0);
        buf5.addWord("Super!😊", Collections.singletonList("Super!😊"), 0);
        buf5.addWord("danke", Collections.singletonList("danke"), 0);

        int[] posSuper = ThiccTopBarTextHelper.findHistoryWordPosition(text5, buf5.getEntries(), 2, "Super!😊");
        Assert.assertNotNull(posSuper);
        Assert.assertEquals("Super", text5.substring(posSuper[0], posSuper[1]));

        // 6. Sentence with standalone math operators: "1 + 2 = 3"
        // Buffer only stores the real words ("1", "2", "3")
        String text6 = "1 + 2 = 3";
        ThiccTopBarSentenceBuffer buf6 = new ThiccTopBarSentenceBuffer();
        buf6.addWord("1", Collections.singletonList("1"), 0);
        buf6.addWord("2", Collections.singletonList("2"), 0);
        buf6.addWord("3", Collections.singletonList("3"), 0);

        int[] pos2 = ThiccTopBarTextHelper.findHistoryWordPosition(text6, buf6.getEntries(), 1, "2");
        Assert.assertNotNull(pos2);
        Assert.assertEquals("2", text6.substring(pos2[0], pos2[1]));
    }

    @Test
    public void activeWordResolutionWithSymbols() {
        // Active typing inside parentheses
        Assert.assertEquals("Hallo", ThiccTopBarTextHelper.getActiveWord("(Hallo", Collections.emptyList()));

        // Active typing with currency
        Assert.assertEquals("100", ThiccTopBarTextHelper.getActiveWord("$100", Collections.emptyList()));

        // Active typing compound words
        Assert.assertEquals("E-Mail", ThiccTopBarTextHelper.getActiveWord("E-Mail", Collections.emptyList()));
        Assert.assertEquals("geht's", ThiccTopBarTextHelper.getActiveWord("geht's", Collections.emptyList()));

        // Active typing decimal
        Assert.assertEquals("3,14", ThiccTopBarTextHelper.getActiveWord("3,14", Collections.emptyList()));
    }

    @Test
    public void replaceHistoryWordNormalCursorAtEnd() {
        // Normal case: user was typing at the end of the text field
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "wie", "geht", "es", "dir");
        TestInputConnection ic = new TestInputConnection(text, 21, 21);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 1, "wie", "warum");
        Assert.assertTrue(ok);
        Assert.assertEquals("Hallo warum geht es dir", ic.getText());
        // Cursor restored to end of text field so user can continue typing
        Assert.assertEquals(23, ic.getSelectionStart());
        Assert.assertEquals(23, ic.getSelectionEnd());
    }

    @Test
    public void replaceHistoryWordTargetWordIsSelected() {
        // Untypical case: user tapped on history word in topbar -> word is currently selected in text field
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "wie", "geht", "es", "dir");
        // "wie" is at [6, 9]
        TestInputConnection ic = new TestInputConnection(text, 6, 9);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 1, "wie", "warum");
        Assert.assertTrue(ok);
        Assert.assertEquals("Hallo warum geht es dir", ic.getText());
        // Target word was selected -> new word stays selected so user can flick again or retype
        Assert.assertEquals(6, ic.getSelectionStart());
        Assert.assertEquals(11, ic.getSelectionEnd());
        Assert.assertEquals("warum", ic.getSelectedText(0));
    }

    @Test
    public void replaceHistoryWordCursorAtStart() {
        // Untypical case: cursor placed at index 0 (very beginning of text field)
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "wie", "geht", "es", "dir");
        TestInputConnection ic = new TestInputConnection(text, 0, 0);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 4, "dir", "euch");
        Assert.assertTrue(ok);
        Assert.assertEquals("Hallo wie geht es euch", ic.getText());
    }

    @Test
    public void replaceHistoryWordCursorInMiddle() {
        // Untypical case: cursor placed in the middle of sentence (between "geht" and " es dir")
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "wie", "geht", "es", "dir");
        // Offset 14 is right after "geht"
        TestInputConnection ic = new TestInputConnection(text, 14, 14);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 0, "Hallo", "Guten Tag");
        Assert.assertTrue(ok);
        Assert.assertEquals("Guten Tag wie geht es dir", ic.getText());
    }

    @Test
    public void replaceHistoryWordCursorInsideTargetWord() {
        // Untypical case: cursor placed inside the word to be replaced (e.g. "w|ie" at offset 7)
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "wie", "geht", "es", "dir");
        TestInputConnection ic = new TestInputConnection(text, 7, 7);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 1, "wie", "warum");
        Assert.assertTrue(ok);
        Assert.assertEquals("Hallo warum geht es dir", ic.getText());
    }

    @Test
    public void replaceHistoryWordWithDuplicatesAndUntypicalCursor() {
        // Untypical case: sentence with duplicate words, cursor placed after the second instance
        String text = "gut ist gut und bleibt gut";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("gut", "ist", "gut", "und", "bleibt", "gut");
        TestInputConnection ic = new TestInputConnection(text, 11, 11);

        // Replace first "gut" (Col 0) with "toll"
        boolean ok1 = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 0, "gut", "toll");
        Assert.assertTrue(ok1);
        Assert.assertEquals("toll ist gut und bleibt gut", ic.getText());

        // Replace middle "gut" (Col 2) with "super"
        boolean ok2 = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 2, "gut", "super");
        Assert.assertTrue(ok2);
        Assert.assertEquals("toll ist super und bleibt gut", ic.getText());

        // Replace last "gut" (Col 5) with "prima"
        boolean ok3 = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 5, "gut", "prima");
        Assert.assertTrue(ok3);
        Assert.assertEquals("toll ist super und bleibt prima", ic.getText());
    }

    @Test
    public void replaceHistoryWordWithBracketsAndUntypicalCursor() {
        // Untypical case: word in parentheses, cursor inside parentheses "(H|allo)"
        String text = "(Hallo) wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("(Hallo)", "wie", "geht", "es", "dir");
        TestInputConnection ic = new TestInputConnection(text, 2, 2);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 0, "(Hallo)", "(Hi)");
        Assert.assertTrue(ok);
        // Parentheses are preserved!
        Assert.assertEquals("(Hi) wie geht es dir", ic.getText());
    }

    @Test
    public void replaceHistoryWordWithQuotesAndUntypicalCursor() {
        // Untypical case: German quotes with trailing exclamation mark, cursor at 0
        String text = "Das ist „Genial!“ wirklich";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Das", "ist", "„Genial!“", "wirklich");
        TestInputConnection ic = new TestInputConnection(text, 0, 0);

        boolean ok = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 2, "„Genial!“", "„Klasse!“");
        Assert.assertTrue(ok);
        Assert.assertEquals("Das ist „Klasse!“ wirklich", ic.getText());
    }

    @Test
    public void replaceActiveWordWithUntypicalCursorAndSelection() {
        // Untypical case 1: Active word is currently selected in text field
        String text1 = "Hallo Welt";
        TestInputConnection ic1 = new TestInputConnection(text1, 6, 10); // "Welt" selected
        boolean ok1 = ThiccTopBarTextHelper.replaceActiveWordInTextField(ic1, "Erde");
        Assert.assertTrue(ok1);
        Assert.assertEquals("Hallo Erde", ic1.getText());

        // Untypical case 2: Cursor placed directly at end
        String text2 = "Hallo Welt";
        TestInputConnection ic2 = new TestInputConnection(text2, 10, 10);
        boolean ok2 = ThiccTopBarTextHelper.replaceActiveWordInTextField(ic2, "Erde");
        Assert.assertTrue(ok2);
        Assert.assertEquals("Hallo Erde", ic2.getText());
    }

    @Test
    public void selectHistoryWordAndJumpToEndWithUntypicalCursor() {
        String text = "Hallo wie geht es dir";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "wie", "geht", "es", "dir");
        TestInputConnection ic = new TestInputConnection(text, 0, 0);

        // Select Col 1 ("wie") from start of field
        boolean selOk = ThiccTopBarTextHelper.selectHistoryWordInTextField(ic, buffer, 1, "wie");
        Assert.assertTrue(selOk);
        Assert.assertEquals(6, ic.getSelectionStart());
        Assert.assertEquals(9, ic.getSelectionEnd());
        Assert.assertEquals("wie", ic.getSelectedText(0));

        // Jump to end
        ThiccTopBarTextHelper.jumpToEndOfTextField(ic);
        Assert.assertEquals(21, ic.getSelectionStart());
        Assert.assertEquals(21, ic.getSelectionEnd());
    }

    @Test
    public void findHistoryWordPosition_ignoresTrailingActiveWord() {
        String text = "Hallo Welt Hallo";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "Welt");

        int[] pos = ThiccTopBarTextHelper.findHistoryWordPosition(text, buffer.getEntries(), 0, "Hallo");
        Assert.assertNotNull(pos);
        Assert.assertEquals(0, pos[0]);
        Assert.assertEquals(5, pos[1]);
    }

    @Test
    public void findHistoryWordPositionInParagraph_isolatesCurrentParagraph() {
        String text = "Hallo Welt\nHallo Test";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "Test");

        // Cursor in second paragraph (index 21)
        int[] pos = ThiccTopBarTextHelper.findHistoryWordPositionInParagraph(text, 21, buffer.getEntries(), 0, "Hallo");
        Assert.assertNotNull(pos);
        Assert.assertEquals(11, pos[0]);
        Assert.assertEquals(16, pos[1]);
    }

    @Test
    public void replaceHistoryWord_preservesMiddleCursorPosition() {
        // Cursor is at offset 15 (after "wie "), NOT at the end of the text field
        TestInputConnection ic = new TestInputConnection("Hallo Welt wie geht", 15, 15);
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Hallo", "Welt", "wie", "geht");

        boolean replaced = ThiccTopBarTextHelper.replaceHistoryWord(ic, buffer, 0, "Hallo", "Servus");
        Assert.assertTrue(replaced);
        Assert.assertEquals("Servus Welt wie geht", ic.getText());
        // "Servus" (6) is 1 char longer than "Hallo" (5), so cursor should shift 15 -> 16
        Assert.assertEquals(16, ic.getSelectionStart());
        Assert.assertEquals(16, ic.getSelectionEnd());
    }

    @Test
    public void replaceActiveWordInTextField_inMiddleOfWord() {
        // Cursor is between "hal" and "lo"
        TestInputConnection ic = new TestInputConnection("hallo welt", 3, 3);

        boolean replaced = ThiccTopBarTextHelper.replaceActiveWordInTextField(ic, "super");
        Assert.assertTrue(replaced);
        Assert.assertEquals("super welt", ic.getText());
        Assert.assertEquals(5, ic.getSelectionStart());
        Assert.assertEquals(5, ic.getSelectionEnd());
    }

    @Test
    public void findCandidateByWord_matchesExactTextEvenWhenTrimmed() {
        GboardThiccTopBarRuntime.CandidateItem a = new GboardThiccTopBarRuntime.CandidateItem("Alpha", 0, false, false, false, "", null, null);
        GboardThiccTopBarRuntime.CandidateItem b = new GboardThiccTopBarRuntime.CandidateItem("Beta", 1, false, false, false, "", null, null);
        GboardThiccTopBarRuntime.CandidateItem c = new GboardThiccTopBarRuntime.CandidateItem("Gamma", 2, false, false, false, "", null, null);
        GboardThiccTopBarRuntime.CandidateItem d = new GboardThiccTopBarRuntime.CandidateItem("Delta", 3, false, false, false, "", null, null);

        List<GboardThiccTopBarRuntime.CandidateItem> items = Arrays.asList(a, b, c, d);
        GboardThiccTopBarRuntime.CandidateItem found = GboardThiccTopBarRuntime.findCandidateByWord(items, "Delta");
        Assert.assertSame(d, found);
    }

    @Test
    public void moveCursorByWord_navigatesLeftAndRightAcrossWords() {
        String text = "Hallo Welt, wie geht's?";
        TestInputConnection ic = new TestInputConnection(text, text.length(), text.length());

        // Step 1 left from end -> selects "geht's" [16, 22]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(16, ic.getSelectionStart());
        Assert.assertEquals(22, ic.getSelectionEnd());

        // Step 2 left -> selects "wie" [12, 15]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(12, ic.getSelectionStart());
        Assert.assertEquals(15, ic.getSelectionEnd());

        // Step 3 left -> selects "Welt" [6, 10]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(6, ic.getSelectionStart());
        Assert.assertEquals(10, ic.getSelectionEnd());

        // Step 4 left -> selects "Hallo" [0, 5]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(0, ic.getSelectionStart());
        Assert.assertEquals(5, ic.getSelectionEnd());

        // Step 5 left from first word "Hallo" -> collapses to cursor at start [0, 0]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(0, ic.getSelectionStart());
        Assert.assertEquals(0, ic.getSelectionEnd());

        // Step 6 left at cursor [0, 0] -> returns false, stays at [0, 0]
        Assert.assertFalse(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(0, ic.getSelectionStart());
        Assert.assertEquals(0, ic.getSelectionEnd());

        // Step 1 right from [0, 0] -> selects "Hallo" [0, 5]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, 1));
        Assert.assertEquals(0, ic.getSelectionStart());
        Assert.assertEquals(5, ic.getSelectionEnd());

        // Step 2 right -> selects "Welt" [6, 10]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, 1));
        Assert.assertEquals(6, ic.getSelectionStart());
        Assert.assertEquals(10, ic.getSelectionEnd());

        // Step 3 right -> selects "wie" [12, 15]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, 1));
        Assert.assertEquals(12, ic.getSelectionStart());
        Assert.assertEquals(15, ic.getSelectionEnd());

        // Step 4 right -> selects "geht's" [16, 22]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, 1));
        Assert.assertEquals(16, ic.getSelectionStart());
        Assert.assertEquals(22, ic.getSelectionEnd());

        // Step 5 right past last word -> moves cursor to end [23, 23]
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, 1));
        Assert.assertEquals(23, ic.getSelectionStart());
        Assert.assertEquals(23, ic.getSelectionEnd());

        // Also test right end without trailing punctuation: "Hallo Welt" with "Welt" selected
        TestInputConnection icNoPunct = new TestInputConnection("Hallo Welt", 6, 10);
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(icNoPunct, 1));
        Assert.assertEquals(10, icNoPunct.getSelectionStart());
        Assert.assertEquals(10, icNoPunct.getSelectionEnd());
    }

    @Test
    public void getWordIndexAtCursor_tracksNavigatedWord() {
        String text = "Eins Zwei Drei Vier";
        ThiccTopBarSentenceBuffer buffer = createSentenceBuffer("Eins", "Zwei", "Drei", "Vier");
        TestInputConnection ic = new TestInputConnection(text, text.length(), text.length());

        // Move left to "Vier" (col 3)
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(3, ThiccTopBarTextHelper.getWordIndexAtCursor(ic, buffer));

        // Move left to "Drei" (col 2)
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(2, ThiccTopBarTextHelper.getWordIndexAtCursor(ic, buffer));

        // Move left to "Zwei" (col 1)
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(1, ThiccTopBarTextHelper.getWordIndexAtCursor(ic, buffer));

        // Move left to "Eins" (col 0)
        Assert.assertTrue(ThiccTopBarTextHelper.moveCursorByWord(ic, -1));
        Assert.assertEquals(0, ThiccTopBarTextHelper.getWordIndexAtCursor(ic, buffer));
    }

    @Test
    public void isInputEmptyAndSentenceEnded_falseWhenFirstWordSelected() {
        // First word selected at [0, 5]: before is empty, sel is "Hallo", after is " Welt"
        TestInputConnection icStart = new TestInputConnection("Hallo Welt", 0, 5);
        Assert.assertFalse(ThiccTopBarTextHelper.isInputEmpty(icStart));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded(icStart));

        // First word of second paragraph selected at [6, 11]: before ends with "\n"
        TestInputConnection icPara = new TestInputConnection("Eins.\nHallo Welt", 6, 11);
        Assert.assertFalse(ThiccTopBarTextHelper.isInputEmpty(icPara));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded(icPara));

        // Truly empty input
        TestInputConnection icEmpty = new TestInputConnection("", 0, 0);
        Assert.assertTrue(ThiccTopBarTextHelper.isInputEmpty(icEmpty));
    }

    @Test
    public void hasTextAfterCursorOnSameLine_and_isSentenceEnded() {
        // Cursor at start of non-empty line after newline: not sentence-ended because line has text after cursor
        TestInputConnection icAfterNewline = new TestInputConnection("Satz eins.\nHallo Welt", 11, 11);
        Assert.assertTrue(ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(icAfterNewline));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded(icAfterNewline));

        // Cursor after newline with nothing (or only spaces) after on same line: sentence ended
        TestInputConnection icEmptyNewline = new TestInputConnection("Satz eins.\n   ", 11, 11);
        Assert.assertFalse(ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(icEmptyNewline));
        Assert.assertTrue(ThiccTopBarTextHelper.isSentenceEnded(icEmptyNewline));

        // Cursor after period before newline: newline is after cursor, not before -> not sentence ended
        TestInputConnection icPeriodBeforeNewline = new TestInputConnection("Satz eins.\nHallo", 10, 10);
        Assert.assertFalse(ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(icPeriodBeforeNewline));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded(icPeriodBeforeNewline));

        // Cursor with only trailing spaces on same line: treated as no word text after on same line
        TestInputConnection icTrailingSpaces = new TestInputConnection("Hallo   ", 5, 5);
        Assert.assertFalse(ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(icTrailingSpaces));
        Assert.assertFalse(ThiccTopBarTextHelper.isSentenceEnded(icTrailingSpaces));

        // Empty input
        TestInputConnection icEmpty = new TestInputConnection("", 0, 0);
        Assert.assertFalse(ThiccTopBarTextHelper.hasTextAfterCursorOnSameLine(icEmpty));
    }

    @Test
    public void syncSentenceBufferFromText_preservesFullParagraphWhenCursorMovedLeft() {
        Map<String, List<String>> cache = new HashMap<>();
        cache.put("hallo", Arrays.asList("Hallo", "Halle", "Halt"));
        cache.put("welt", Arrays.asList("Welt", "Wert", "Weit"));
        cache.put("heute", Arrays.asList("heute", "heut", "leute"));

        // Spacebar moved cursor between "Hallo " and "Welt heute"
        ThiccTopBarSentenceBuffer bufMiddle = new ThiccTopBarSentenceBuffer();
        TestInputConnection icMiddle = new TestInputConnection("Hallo Welt heute", 6, 6);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icMiddle, null, bufMiddle, cache);
        Assert.assertEquals(3, bufMiddle.getEntries().size());
        Assert.assertEquals("Hallo", bufMiddle.getEntries().get(0).committedWord);
        Assert.assertEquals("Welt", bufMiddle.getEntries().get(1).committedWord);
        Assert.assertEquals("heute", bufMiddle.getEntries().get(2).committedWord);
        Assert.assertEquals(Arrays.asList("heute", "heut", "leute"), bufMiddle.getEntries().get(2).alternatives);

        // Spacebar moved cursor all the way to index 0 ("|Hallo Welt heute")
        ThiccTopBarSentenceBuffer bufStart = new ThiccTopBarSentenceBuffer();
        TestInputConnection icStart = new TestInputConnection("Hallo Welt heute", 0, 0);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icStart, null, bufStart, cache);
        Assert.assertEquals(3, bufStart.getEntries().size());
        Assert.assertEquals("heute", bufStart.getEntries().get(2).committedWord);

        // Spacebar moved cursor into the middle of a word ("Hal|lo Welt heute") -> runtime passes currentWord = null
        ThiccTopBarSentenceBuffer bufInsideWord = new ThiccTopBarSentenceBuffer();
        TestInputConnection icInsideWord = new TestInputConnection("Hallo Welt heute", 3, 3);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icInsideWord, null, bufInsideWord, cache);
        Assert.assertEquals(3, bufInsideWord.getEntries().size());
        Assert.assertEquals("Hallo", bufInsideWord.getEntries().get(0).committedWord);
        Assert.assertEquals("heute", bufInsideWord.getEntries().get(2).committedWord);

        // Active word being typed mid-line ("Hallo neue| Welt heute"): keeps preceding & following words with split=1
        ThiccTopBarSentenceBuffer bufActiveMidLine = new ThiccTopBarSentenceBuffer();
        TestInputConnection icActiveMidLine = new TestInputConnection("Hallo neue Welt heute", 10, 10);
        int splitActiveMidLine = ThiccTopBarTextHelper.syncSentenceBufferWithSplit(
                icActiveMidLine, "neue", false, bufActiveMidLine, cache);
        Assert.assertEquals(1, splitActiveMidLine);
        Assert.assertEquals(3, bufActiveMidLine.getEntries().size());
        Assert.assertEquals("Hallo", bufActiveMidLine.getEntries().get(0).committedWord);
        Assert.assertEquals("Welt", bufActiveMidLine.getEntries().get(1).committedWord);
        Assert.assertEquals("heute", bufActiveMidLine.getEntries().get(2).committedWord);

        // Live swipe guess replacing a selected mid-sentence word ("Hallo [Welt] heute"): keeps "Hallo" before & "heute" after
        ThiccTopBarSentenceBuffer bufLiveMidLine = new ThiccTopBarSentenceBuffer();
        TestInputConnection icLiveMidLine = new TestInputConnection("Hallo Welt heute", 6, 10);
        int splitLiveMidLine = ThiccTopBarTextHelper.syncSentenceBufferWithSplit(
                icLiveMidLine, null, true, bufLiveMidLine, cache);
        Assert.assertEquals(1, splitLiveMidLine);
        Assert.assertEquals(2, bufLiveMidLine.getEntries().size());
        Assert.assertEquals("Hallo", bufLiveMidLine.getEntries().get(0).committedWord);
        Assert.assertEquals("heute", bufLiveMidLine.getEntries().get(1).committedWord);

        // Cursor after newline at start of second paragraph ("Alter Satz.\n|Hallo Welt heute")
        ThiccTopBarSentenceBuffer bufSecondPara = new ThiccTopBarSentenceBuffer();
        TestInputConnection icSecondPara = new TestInputConnection("Alter Satz.\nHallo Welt heute", 12, 12);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icSecondPara, null, bufSecondPara, cache);
        Assert.assertEquals(3, bufSecondPara.getEntries().size());
        Assert.assertEquals("Hallo", bufSecondPara.getEntries().get(0).committedWord);
        Assert.assertEquals("heute", bufSecondPara.getEntries().get(2).committedWord);
    }

    @Test
    public void syncSentenceBufferFromText_preservesCapitalizationOnSwappedWord() {
        Map<String, List<String>> cache = new HashMap<>();
        // Simulate lowercase cache entry from an earlier word, plus exact capitalized entry
        cache.put("dass", Arrays.asList("das", "dass", "daß"));
        cache.put("Dass", Arrays.asList("Das", "Dass", "Daß"));

        ThiccTopBarSentenceBuffer buf = new ThiccTopBarSentenceBuffer();
        TestInputConnection ic = new TestInputConnection("Dass ist gut", 12, 12);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(ic, null, buf, cache);
        Assert.assertEquals(Arrays.asList("Das", "Dass", "Daß"), buf.getEntries().get(0).alternatives);

        // Even when only lowercase fallback exists in cache, TitleCase word preserves leading uppercase
        Map<String, List<String>> lowercaseOnlyCache = new HashMap<>();
        lowercaseOnlyCache.put("dass", Arrays.asList("das", "dass", "daß"));
        ThiccTopBarSentenceBuffer bufFallback = new ThiccTopBarSentenceBuffer();
        ThiccTopBarTextHelper.syncSentenceBufferFromText(ic, null, bufFallback, lowercaseOnlyCache);
        Assert.assertEquals(Arrays.asList("Das", "Dass", "Daß"), bufFallback.getEntries().get(0).alternatives);
    }

    @Test
    public void syncSentenceBufferFromText_slidingWindowWithHysteresisTracksCursorInLongParagraph() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 40; i++) {
            if (i > 0) sb.append(' ');
            sb.append("w").append(i);
        }
        String text = sb.toString();
        ThiccTopBarSentenceBuffer buf = new ThiccTopBarSentenceBuffer();

        // 1. Cursor at end -> shows last 25 words (w15..w39)
        TestInputConnection icEnd = new TestInputConnection(text, text.length(), text.length());
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icEnd, null, buf, Collections.emptyMap());
        Assert.assertEquals(25, buf.getEntries().size());
        Assert.assertEquals(15, buf.getWindowStartWordIndex());
        Assert.assertEquals("w15", buf.getEntries().get(0).committedWord);
        Assert.assertEquals("w39", buf.getEntries().get(24).committedWord);

        // 2. Cursor moves left to w25 (inside 8-word margin from left edge 15) -> window stays at 15..39
        int w25Start = text.indexOf("w25");
        TestInputConnection icW25 = new TestInputConnection(text, w25Start, w25Start + 3);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icW25, null, buf, Collections.emptyMap());
        Assert.assertEquals(15, buf.getWindowStartWordIndex());
        Assert.assertEquals(10, ThiccTopBarTextHelper.getWordIndexAtCursor(icW25, buf));

        // 3. Cursor moves left to w20 (within 8 words of left edge 15) -> window re-centers around w20
        int w20Start = text.indexOf("w20");
        TestInputConnection icW20 = new TestInputConnection(text, w20Start, w20Start + 3);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icW20, null, buf, Collections.emptyMap());
        Assert.assertEquals(8, buf.getWindowStartWordIndex());
        Assert.assertEquals("w8", buf.getEntries().get(0).committedWord);
        Assert.assertEquals(12, ThiccTopBarTextHelper.getWordIndexAtCursor(icW20, buf));

        // 4. Cursor moves all the way to w0 -> window starts at 0 and getWordIndexAtCursor == 0
        TestInputConnection icW0 = new TestInputConnection(text, 0, 2);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(icW0, null, buf, Collections.emptyMap());
        Assert.assertEquals(0, buf.getWindowStartWordIndex());
        Assert.assertEquals("w0", buf.getEntries().get(0).committedWord);
        Assert.assertEquals(0, ThiccTopBarTextHelper.getWordIndexAtCursor(icW0, buf));
    }

    @Test
    public void testMultiGlideKineticaSuggestionsTrimmingAndCacheIsolation() {
        Map<String, List<String>> cache = GboardThiccTopBarRuntime.getWordAlternativesCacheForTesting();
        cache.clear();

        // 1. Kinetica returns up to 10 candidates; buildMultiGlideSuggestions trims to 3 starting with committedWord
        List<String> tenCandidates = Arrays.asList(
                "heute", "hatte", "hätte", "harte", "hüte", "heiße", "helfe", "hebe", "hege", "hexe"
        );
        List<String> trimmed = GboardThiccTopBarRuntime.buildMultiGlideSuggestions("heute", tenCandidates);
        Assert.assertEquals(Arrays.asList("heute", "hatte", "hätte"), trimmed);

        // 2. Caching Kinetica alternatives for word 1 ("heute") caches 3 alternatives
        GboardThiccTopBarRuntime.cacheAlternativeGroup(trimmed, "heute");
        Assert.assertEquals(Arrays.asList("heute", "hatte", "hätte"), cache.get("heute"));

        // 3. Caching a later word whose runner-up happens to include "heute" must NOT overwrite "heute"'s primary cache
        GboardThiccTopBarRuntime.cacheAlternativeGroup(Arrays.asList("Leute", "heute", "Beute"), "Leute");
        Assert.assertEquals(Arrays.asList("heute", "hatte", "hätte"), cache.get("heute"));
        Assert.assertEquals(Arrays.asList("Leute", "heute", "Beute"), cache.get("Leute"));
    }

    @Test
    public void cacheAlternativeGroup_preservesTopAndBottomOrderWhenMovingToHistory() {
        ThiccTopBarSentenceBuffer buf = GboardThiccTopBarRuntime.getSentenceBuffer();
        buf.clear();
        Map<String, List<String>> cache = GboardThiccTopBarRuntime.getWordAlternativesCacheForTesting();
        cache.clear();

        // Active right wheel has centerIndex=1 -> top="Hallo", center="Welt", bottom="Wald"
        GboardThiccTopBarRuntime.cacheAlternativeGroup(Arrays.asList("Hallo", "Welt", "Wald"), "Welt");

        // After typing a period or space/next word, "Welt" moves to history and must keep top="Hallo", bottom="Wald"
        TestInputConnection ic = new TestInputConnection("Welt.", 5, 5);
        ThiccTopBarTextHelper.syncSentenceBufferFromText(ic, null, buf, cache);

        Assert.assertEquals(1, buf.getEntries().size());
        ThiccTopBarSentenceBuffer.WordEntry entry = buf.getEntries().get(0);
        Assert.assertEquals(1, entry.selectedIndex);
        Assert.assertEquals(Arrays.asList("Hallo.", "Welt.", "Wald."), entry.alternatives);
        int size = entry.alternatives.size();
        Assert.assertEquals("Hallo.", entry.alternatives.get((entry.selectedIndex - 1 + size) % size));
        Assert.assertEquals("Wald.", entry.alternatives.get((entry.selectedIndex + 1) % size));
    }

    @Test
    public void testMultiGlideRepeatedDecodeAndCommitDoesNotShiftLastWordSelection() {
        ThiccTopBarSentenceBuffer buf = GboardThiccTopBarRuntime.getSentenceBuffer();
        buf.clear();
        Map<String, List<String>> cache = GboardThiccTopBarRuntime.getWordAlternativesCacheForTesting();
        cache.clear();

        // Simulate 30 words typed via two-finger Kinetica where each word fires both
        // onWordDecoded and onWordCommitted (calling recordMultiGlideDecodedWord twice per word).
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 30; i++) {
            if (i > 0) sb.append(' ');
            String word = "wort" + i;
            sb.append(word);
            List<String> alts = Arrays.asList(word, word + "a", word + "b", word + "c", word + "d");
            GboardThiccTopBarRuntime.recordMultiGlideDecodedWord(word, alts);
            GboardThiccTopBarRuntime.recordMultiGlideDecodedWord(word, alts);
        }

        // Sync sentence buffer as done when displaying the bar or selecting the last word
        String fullText = sb.toString();
        TestInputConnection ic = new TestInputConnection(fullText, fullText.length(), fullText.length());
        ThiccTopBarTextHelper.syncSentenceBufferFromText(ic, null, buf, cache);

        int lastColIdx = buf.getEntries().size() - 1;
        Assert.assertEquals("wort29", buf.getEntries().get(lastColIdx).getSelectedWord());
        Assert.assertEquals(Arrays.asList("wort29", "wort29a", "wort29b"), buf.getEntries().get(lastColIdx).alternatives);

        // Tapping the last word in the Thicc Top Bar must select "wort29" at the end of the line, never an earlier word
        boolean selected = ThiccTopBarTextHelper.selectHistoryWordInTextField(ic, buf, lastColIdx, "wort29");
        Assert.assertTrue(selected);
        Assert.assertEquals("wort29", ic.getSelectedText(0).toString());
        Assert.assertEquals(fullText.length() - "wort29".length(), ic.getSelectionStart());
        Assert.assertEquals(fullText.length(), ic.getSelectionEnd());
    }

    @Test
    public void stepMultiWordSelection_extendsFromCursorAndExistingSelection() {
        // 1. Collapsed cursor at end of "Hallo Welt heute"
        String text = "Hallo Welt heute";
        TestInputConnection icCursor = new TestInputConnection(text, text.length(), text.length());
        ThiccTopBarTextHelper.MultiWordSelectAnchor cursorAnchor =
                ThiccTopBarTextHelper.captureMultiWordSelectAnchor(icCursor);

        Assert.assertTrue(ThiccTopBarTextHelper.stepMultiWordSelection(icCursor, cursorAnchor, -1));
        Assert.assertEquals("heute", icCursor.getSelectedText(0).toString());

        Assert.assertTrue(ThiccTopBarTextHelper.stepMultiWordSelection(icCursor, cursorAnchor, -1));
        Assert.assertEquals("Welt heute", icCursor.getSelectedText(0).toString());

        Assert.assertTrue(ThiccTopBarTextHelper.stepMultiWordSelection(icCursor, cursorAnchor, 1));
        Assert.assertEquals("heute", icCursor.getSelectedText(0).toString());

        // 2. Existing word selection ("Welt") is preserved and included when extending left or right
        TestInputConnection icSel = new TestInputConnection(text, 6, 10);
        ThiccTopBarTextHelper.MultiWordSelectAnchor selAnchor =
                ThiccTopBarTextHelper.captureMultiWordSelectAnchor(icSel);

        Assert.assertTrue(ThiccTopBarTextHelper.stepMultiWordSelection(icSel, selAnchor, -1));
        Assert.assertEquals("Hallo Welt", icSel.getSelectedText(0).toString());

        Assert.assertTrue(ThiccTopBarTextHelper.stepMultiWordSelection(icSel, selAnchor, 1));
        Assert.assertEquals("Welt", icSel.getSelectedText(0).toString());

        Assert.assertTrue(ThiccTopBarTextHelper.stepMultiWordSelection(icSel, selAnchor, 1));
        Assert.assertEquals("Welt heute", icSel.getSelectedText(0).toString());
    }

    private static ThiccTopBarSentenceBuffer createSentenceBuffer(String... words) {
        ThiccTopBarSentenceBuffer buf = new ThiccTopBarSentenceBuffer();
        for (String w : words) {
            buf.addWord(w, Collections.singletonList(w), 0);
        }
        return buf;
    }

    /**
     * Test implementation of InputConnection to simulate any cursor position,
     * selection, and document editing in pure unit tests.
     */
    private static class TestInputConnection implements InputConnection {
        private final StringBuilder text;
        private int selStart;
        private int selEnd;

        public TestInputConnection(String initialText, int selStart, int selEnd) {
            this.text = new StringBuilder(initialText != null ? initialText : "");
            this.selStart = Math.max(0, Math.min(this.text.length(), selStart));
            this.selEnd = Math.max(0, Math.min(this.text.length(), selEnd));
        }

        public String getText() {
            return text.toString();
        }

        public int getSelectionStart() {
            return selStart;
        }

        public int getSelectionEnd() {
            return selEnd;
        }

        @Override
        public CharSequence getTextBeforeCursor(int n, int flags) {
            int start = Math.max(0, selStart - n);
            return text.substring(start, selStart);
        }

        @Override
        public CharSequence getTextAfterCursor(int n, int flags) {
            int end = Math.min(text.length(), selEnd + n);
            return text.substring(selEnd, end);
        }

        @Override
        public CharSequence getSelectedText(int flags) {
            if (selStart == selEnd) return null;
            int s = Math.min(selStart, selEnd);
            int e = Math.max(selStart, selEnd);
            return text.substring(s, e);
        }

        @Override
        public int getCursorCapsMode(int reqModes) {
            return 0;
        }

        @Override
        public ExtractedText getExtractedText(ExtractedTextRequest request, int flags) {
            ExtractedText et = new ExtractedText();
            et.text = text.toString();
            et.selectionStart = selStart;
            et.selectionEnd = selEnd;
            et.startOffset = 0;
            return et;
        }

        @Override
        public boolean deleteSurroundingText(int beforeLength, int afterLength) {
            if (beforeLength > 0) {
                int delStart = Math.max(0, selStart - beforeLength);
                this.text.delete(delStart, selStart);
                this.selStart = delStart;
                this.selEnd = delStart;
            }
            if (afterLength > 0) {
                int delEnd = Math.min(text.length(), selEnd + afterLength);
                this.text.delete(selEnd, delEnd);
            }
            return true;
        }

        @Override
        public boolean deleteSurroundingTextInCodePoints(int beforeLength, int afterLength) {
            return deleteSurroundingText(beforeLength, afterLength);
        }

        @Override
        public boolean setComposingText(CharSequence text, int newCursorPosition) {
            return commitText(text, newCursorPosition);
        }

        @Override
        public boolean setComposingRegion(int start, int end) {
            return true;
        }

        @Override
        public boolean finishComposingText() {
            return true;
        }

        @Override
        public boolean commitText(CharSequence text, int newCursorPosition) {
            int s = Math.min(selStart, selEnd);
            int e = Math.max(selStart, selEnd);
            this.text.replace(s, e, text.toString());
            int newCursor = s + text.length();
            this.selStart = newCursor;
            this.selEnd = newCursor;
            return true;
        }

        @Override
        public boolean commitCompletion(CompletionInfo text) {
            return false;
        }

        @Override
        public boolean commitCorrection(CorrectionInfo correctionInfo) {
            return false;
        }

        @Override
        public boolean setSelection(int start, int end) {
            this.selStart = Math.max(0, Math.min(text.length(), start));
            this.selEnd = Math.max(0, Math.min(text.length(), end));
            return true;
        }

        @Override
        public boolean performEditorAction(int editorAction) {
            return false;
        }

        @Override
        public boolean performContextMenuAction(int id) {
            return false;
        }

        @Override
        public boolean beginBatchEdit() {
            return true;
        }

        @Override
        public boolean endBatchEdit() {
            return true;
        }

        @Override
        public boolean sendKeyEvent(KeyEvent event) {
            return false;
        }

        @Override
        public boolean clearMetaKeyStates(int states) {
            return false;
        }

        @Override
        public boolean reportFullscreenMode(boolean enabled) {
            return false;
        }

        @Override
        public boolean performPrivateCommand(String action, Bundle data) {
            return false;
        }

        @Override
        public boolean requestCursorUpdates(int cursorUpdateMode) {
            return false;
        }

        @Override
        public Handler getHandler() {
            return null;
        }

        @Override
        public void closeConnection() {
        }

        @Override
        public boolean commitContent(InputContentInfo inputContentInfo, int flags, Bundle opts) {
            return false;
        }
    }
}
