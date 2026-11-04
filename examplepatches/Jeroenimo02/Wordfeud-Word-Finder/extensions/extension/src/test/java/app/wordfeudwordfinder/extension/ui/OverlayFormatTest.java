package app.wordfeudwordfinder.extension.ui;

import static org.junit.Assert.*;

import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.ui.Strings.Key;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public class OverlayFormatTest {
    private static Ruleset rs() {
        Map<String, Integer> p = new HashMap<>();
        p.put("A", 1);
        p.put("E", 1);
        p.put("N", 2);
        p.put("Q", 10);
        return new Ruleset(1, "nl", p, Collections.<String, Integer>emptyMap());
    }

    private static Move move(boolean horizontal, List<String> letters, List<String> bonuses, int score) {
        List<int[]> placed = new java.util.ArrayList<>();
        for (int i = 0; i < letters.size(); i++) placed.add(new int[] {i, 0});
        return new Move("WORD", 0, 0, horizontal, placed, letters, score,
                Collections.singletonList("WORD"), bonuses, false);
    }

    @Test public void bonusLabels() {
        assertNull(OverlayFormat.bonusLabel(0));
        assertEquals("DL", OverlayFormat.bonusLabel(1));
        assertEquals("TL", OverlayFormat.bonusLabel(2));
        assertEquals("DW", OverlayFormat.bonusLabel(3));
        assertEquals("TW", OverlayFormat.bonusLabel(4));
        assertNull(OverlayFormat.bonusLabel(5));
        assertNull(OverlayFormat.bonusLabel(-1));
    }

    @Test public void bonusLabelsComeFromStrings() {
        for (String lang : Strings.languages()) {
            assertEquals(Strings.get(lang, Key.BONUS_DL), OverlayFormat.bonusLabel(lang, 1));
            assertEquals(Strings.get(lang, Key.BONUS_TL), OverlayFormat.bonusLabel(lang, 2));
            assertEquals(Strings.get(lang, Key.BONUS_DW), OverlayFormat.bonusLabel(lang, 3));
            assertEquals(Strings.get(lang, Key.BONUS_TW), OverlayFormat.bonusLabel(lang, 4));
            assertNull(OverlayFormat.bonusLabel(lang, 0));
        }
        assertEquals("TW", OverlayFormat.bonusLabel("xx", 4));
    }

    @Test public void letterPoints() {
        assertEquals(1, OverlayFormat.letterPoints(rs(), 'A'));
        assertEquals(10, OverlayFormat.letterPoints(rs(), 'Q'));
        assertEquals(0, OverlayFormat.letterPoints(rs(), 'q'));   // blank
        assertEquals(0, OverlayFormat.letterPoints(rs(), 'Z'));   // unknown
        assertEquals(0, OverlayFormat.letterPoints(null, 'A'));
        assertEquals(0, OverlayFormat.letterPoints(rs(), '\0'));
    }

    @Test public void blankDetection() {
        assertTrue(OverlayFormat.isBlank(rs(), 'q'));
        assertFalse(OverlayFormat.isBlank(rs(), 'Q'));
        assertFalse(OverlayFormat.isBlank(rs(), '\0'));
        assertEquals("Q", OverlayFormat.displayLetter('q'));
        assertEquals("", OverlayFormat.displayLetter('\0'));
    }

    @Test public void bonusSummaryKeepsOrderAndDropsDuplicates() {
        Move m = move(true, Arrays.asList("A", "N", "E"), Arrays.asList("TW:A", "DL:N", "TW:E"), 30);
        assertEquals("TW DL", OverlayFormat.bonusSummary(m));
        assertEquals(Strings.get("nl", Key.BONUS_TW) + " " + Strings.get("nl", Key.BONUS_DL),
                OverlayFormat.bonusSummary("nl", m));
        // Unknown solver codes are skipped, not echoed.
        Move odd = move(true, Arrays.asList("A"), Arrays.asList("XX:A", "DW:A"), 4);
        assertEquals("DW", OverlayFormat.bonusSummary("en", odd));
        assertEquals("", OverlayFormat.bonusSummary(move(true, Arrays.asList("A"),
                Collections.<String>emptyList(), 2)));
    }

    @Test public void detailLine() {
        Move m = move(false, Arrays.asList("A", "n"), Collections.singletonList("DW:A"), 12);
        assertEquals("Down · Uses: A ? · DW", OverlayFormat.detail("en", m));
        Move h = move(true, Arrays.asList("E"), Collections.<String>emptyList(), 2);
        assertEquals("Horizontaal · Gebruikt: E", OverlayFormat.detail("nl", h));
    }

    @Test public void scoreText() {
        assertEquals("12 pts", OverlayFormat.scoreText("en", 12));
        assertEquals("7 P.", OverlayFormat.scoreText("de", 7));
        assertEquals("12 p", OverlayFormat.scoreText("nl", 12));
    }

    @Test public void usedRackIndicesHandlesDuplicatesAndBlanks() {
        List<String> rack = Arrays.asList("E", "A", "E", "?", "N");
        Move m = move(true, Arrays.asList("E", "x", "N"), Collections.<String>emptyList(), 5);
        boolean[] used = OverlayFormat.usedRackIndices(rack, m);
        assertArrayEquals(new boolean[] {true, false, false, true, true}, used);
    }

    @Test public void usedRackIndicesStarIsABlank() {
        List<String> rack = Arrays.asList("A", "*", "E");
        Move m = move(true, Arrays.asList("e", "A"), Collections.<String>emptyList(), 1);
        assertArrayEquals(new boolean[] {true, true, false}, OverlayFormat.usedRackIndices(rack, m));
        // An unmatched letter also falls back to the '*' blank.
        Move z = move(true, Arrays.asList("Z"), Collections.<String>emptyList(), 0);
        assertArrayEquals(new boolean[] {false, true, false}, OverlayFormat.usedRackIndices(rack, z));
    }

    @Test public void usedRackIndicesTwoOfTheSameLetter() {
        List<String> rack = Arrays.asList("E", "A", "E");
        Move m = move(true, Arrays.asList("E", "E"), Collections.<String>emptyList(), 2);
        assertArrayEquals(new boolean[] {true, false, true}, OverlayFormat.usedRackIndices(rack, m));
    }

    @Test public void usedRackIndicesNullSafe() {
        assertEquals(0, OverlayFormat.usedRackIndices(null, null).length);
        assertArrayEquals(new boolean[] {false}, OverlayFormat.usedRackIndices(Arrays.asList("A"), null));
    }

    @Test public void themeBonusColoursAreDistinct() {
        Theme t = Theme.forDarkMode(true);
        assertEquals(t.squareEmpty, t.bonusColor(0));
        assertEquals(t.squareEmpty, t.bonusColor(9));
        java.util.Set<Integer> s = new java.util.HashSet<>();
        for (int c = 0; c <= 4; c++) s.add(t.bonusColor(c));
        assertEquals(5, s.size());
        assertSame(Theme.DARK, Theme.forDarkMode(true));
        assertSame(Theme.LIGHT, Theme.forDarkMode(false));
    }

    @Test public void themeChromeAndBoardAreChosenSeparately() {
        Theme t = Theme.of(false, true);
        assertEquals(Theme.LIGHT.background, t.background);
        assertEquals(Theme.LIGHT.textPrimary, t.textPrimary);
        assertEquals(Theme.DARK.squareEmpty, t.squareEmpty);
        assertEquals(Theme.DARK.squareTW, t.squareTW);
        assertEquals(Theme.DARK.boardBackground, t.boardBackground);
        assertSame(Theme.DARK, Theme.of(true, true));
        assertSame(Theme.LIGHT, Theme.of(false, false));
        assertEquals(0xFFC6D1D7, Theme.LIGHT.squareEmpty);
        assertEquals(0xFFDEE3E7, Theme.LIGHT.background);
    }

    @Test public void rejectionTextForEachBranch() {
        assertEquals("Move rejected: NDJ", OverlayFormat.rejectionText("en", Arrays.asList("NDJ"), false));
        assertEquals("Move rejected: one of MANDJE, NDJ",
                OverlayFormat.rejectionText("en", Arrays.asList("MANDJE", "NDJ"), true));
        assertEquals("Zet afgewezen: een van MANDJE, NDJ",
                OverlayFormat.rejectionText("nl", Arrays.asList("MANDJE", "NDJ"), true));
        assertEquals("Move rejected", OverlayFormat.rejectionText("en", Collections.<String>emptyList(), false));
        for (String lang : Strings.languages()) {
            String t = OverlayFormat.rejectionText(lang, Arrays.asList("A", "B", "C"), true);
            assertTrue(lang, t.contains("A, B, C"));
            assertNotEquals(lang, OverlayFormat.rejectionText(lang, Arrays.asList("A", "B", "C"), false), t);
        }
    }
}
