package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The lyric clock held at the pause tap (Morphe's own runs on until YT's session says paused). */
public class LyricTimingTest {

    @Test
    public void holdsWhilePausedNearTheTap() {
        // Morphe's estimate ran ahead after the tap, then its paused sample sits a little behind
        assertTrue(LyricTiming.holds(25_300, 25_000, true));
        assertTrue(LyricTiming.holds(24_800, 25_000, true));
    }

    @Test
    public void letsGoOnPlay() {
        assertFalse(LyricTiming.holds(25_000, 25_000, false));
    }

    @Test
    public void letsGoOnASeek() {
        assertFalse(LyricTiming.holds(60_000, 25_000, true));
        assertFalse(LyricTiming.holds(10_000, 25_000, true));
    }

    @Test
    public void nothingHeldWithoutATap() {
        assertFalse(LyricTiming.holds(25_000, -1, true));
    }

    @Test
    public void aLineIsOverdueShortlyAfterItsEnd() {
        assertFalse(LyricTiming.overdue(100_000, 100_000));
        assertFalse(LyricTiming.overdue(100_059, 100_000));
        assertTrue(LyricTiming.overdue(100_060, 100_000));
        assertFalse(LyricTiming.overdue(500_000, -1)); // the last line: no end, never overdue
    }

    @Test
    public void aRepeatedLineIsFoundAgainOnceTheFirstOneEnds() {
        assertFalse(LyricTiming.rematch(true, true, 10_000, 12_000));  // same line, still running
        assertTrue(LyricTiming.rematch(true, true, 12_000, 12_000));   // the same words again: the next line
        assertTrue(LyricTiming.rematch(true, false, 10_000, 12_000));  // new text
        assertTrue(LyricTiming.rematch(false, true, 10_000, 12_000));  // new lyrics
        assertFalse(LyricTiming.rematch(true, true, 500_000, -1));     // the last line: no end
    }

    @Test
    public void aRepeatedLineShownEarlyIsTheNextCopyNotTheEndedOne() {
        // "Bow (work out, work out)" at 0-2 s and 4-6 s, another line between; Morphe names it at 3.8 s
        long[] starts = {0, 2_000, 4_000};
        long[] ends = {2_000, 4_000, 6_000};
        boolean[] same = {true, false, true};
        assertEquals(2, LyricTiming.pickLine(starts, ends, same, 3_800));
        assertEquals(0, LyricTiming.pickLine(starts, ends, same, 1_000)); // the first copy, running
        assertEquals(2, LyricTiming.pickLine(starts, ends, same, 5_000)); // the second copy, running
    }

    @Test
    public void aLineNamedLateIsTheLastOnePast() {
        long[] starts = {0, 2_000, 4_000};
        long[] ends = {2_000, 4_000, 6_000};
        assertEquals(0, LyricTiming.pickLine(starts, ends, new boolean[]{true, false, false}, 2_100));
        assertEquals(-1, LyricTiming.pickLine(starts, ends, new boolean[]{false, false, false}, 2_100));
        assertEquals(2, LyricTiming.pickLine(starts, new long[]{2_000, 4_000, -1}, new boolean[]{false, false, true}, 9_000)); // last line
    }

    @Test
    public void theDeckClockCountsOnlyForTheIncomingSongsLyrics() {
        assertEquals(8_000, LyricTiming.deckFor("bi7ad9Kk62o", "bi7ad9Kk62o", 8_000));
        assertEquals(-1, LyricTiming.deckFor("3_g2un5M350", "bi7ad9Kk62o", 8_000)); // still the old song's
        assertEquals(-1, LyricTiming.deckFor("bi7ad9Kk62o", null, 8_000));          // no mix
        assertEquals(-1, LyricTiming.deckFor("bi7ad9Kk62o", "bi7ad9Kk62o", -1));    // handed over
    }

    @Test
    public void anEmptyLyricsIdIsTheDecksOwnSong() {
        // Morphe's lyricsVideoId reads "" on the S21 FE's Morphe: the lines still follow the deck
        assertEquals(8_000, LyricTiming.deckFor("", "bi7ad9Kk62o", 8_000));
        assertEquals(8_000, LyricTiming.deckFor(null, "bi7ad9Kk62o", 8_000));
        assertEquals(-1, LyricTiming.deckFor("", null, 8_000));                      // no mix
        assertEquals(-1, LyricTiming.deckFor("", "bi7ad9Kk62o", -1));                 // handed over
    }

    @Test
    public void aLineWithAnAdLibAtTheSameMomentEndsAtTheNextLaterLine() {
        // "Bounce on the stage..." and its ad-lib "back it up" both at 45.55 s, "Let me see you go" at 47.88 s
        long[] starts = {44_000, 45_550, 45_550, 47_880};
        String[] texts = {"bounceonthefloor", "bounceonthestage", "backitup", "letmeseeyougo"};
        assertEquals(47_880, LyricTiming.lineEnd(starts, texts, 1));
        assertEquals(47_880, LyricTiming.lineEnd(starts, texts, 2));
        assertEquals(45_550, LyricTiming.lineEnd(starts, texts, 0));
        assertEquals(-1, LyricTiming.lineEnd(starts, texts, 3));
    }

    @Test
    public void ofLinesSharingAStartTheFirstIsTheOneShown() {
        long[] starts = {44_000, 45_550, 45_550, 47_880};
        assertEquals(1, LyricTiming.lineAt(starts, 46_000));
        assertEquals(0, LyricTiming.lineAt(starts, 45_000));
        assertEquals(-1, LyricTiming.lineAt(starts, 1_000));
        assertEquals(3, LyricTiming.lineAt(starts, 50_000));
    }

    @Test
    public void theNextSungLineComesUpItsSlideEarly() {
        long[] starts = {1_000, 5_000, 9_000, 20_000};
        String[] texts = {"one", "two", "", "three"};
        assertEquals(0, LyricTiming.dueLine(starts, texts, 4_600, 340)); // 400 ms to go: not yet
        assertEquals(1, LyricTiming.dueLine(starts, texts, 4_700, 340)); // 300 ms early
        assertEquals(1, LyricTiming.dueLine(starts, texts, 5_100, 340)); // sung now
        assertEquals(1, LyricTiming.dueLine(starts, texts, 8_800, 340)); // a gap never comes early
        assertEquals(2, LyricTiming.dueLine(starts, texts, 9_000, 340));
        assertEquals(3, LyricTiming.dueLine(starts, texts, 19_700, 340)); // out of the gap, early
        assertEquals(0, LyricTiming.dueLine(starts, texts, 700, 340)); // the first line too
    }

    @Test
    public void morpheNamingTheNextLineEarlyIsHeldBack() {
        long[] starts = {1_000, 3_000, 4_500};
        String[] texts = {"one", "two", "three"};
        // Morphe already names "two" 800 ms early: held, "one" is still sung
        assertEquals(1, LyricTiming.aheadOf(starts, texts, 0, "two", 2_200, 340));
        // within the line's own lead: Morphe's line stands
        assertEquals(-1, LyricTiming.aheadOf(starts, texts, 0, "two", 2_700, 340));
        // Morphe names the line due: nothing to hold
        assertEquals(-1, LyricTiming.aheadOf(starts, texts, 1, "two", 3_100, 340));
        // the intro: the first line named early is held too
        assertEquals(0, LyricTiming.aheadOf(starts, texts, -1, "one", 300, 340));
        // a line further than 2 s ahead, or an earlier one: not Morphe being early
        assertEquals(-1, LyricTiming.aheadOf(starts, texts, -1, "three", 300, 340));
        assertEquals(-1, LyricTiming.aheadOf(starts, texts, 2, "one", 4_600, 340));
    }

    @Test
    public void aShortBreathIsSkippedToTheNextSungLine() {
        long[] starts = {0, 2_000, 3_000, 10_000};
        String[] texts = {"bow", "", "workout", ""};
        assertEquals(3_000, LyricTiming.lineEnd(starts, texts, 0)); // 1 s breath: the line stays up
        assertEquals(10_000, LyricTiming.lineEnd(starts, texts, 2)); // the last empty line: the end
    }
}
