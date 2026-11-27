package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class LyricWordsTest {
    // "A never ending" : "A " (2), "never " (6), "ending" (6)
    private static final long[] START = {1000, 1500, 2500};
    private static final long[] END = {1400, 2300, 3500};
    private static final int[] CHARS = {2, 6, 6};

    @Test
    public void nothingSungBeforeTheFirstWord() {
        assertEquals(0f, LyricWords.sung(START, END, CHARS, 900), 1e-4f);
    }

    @Test
    public void aWordFillsAsItIsSung() {
        assertEquals(1f, LyricWords.sung(START, END, CHARS, 1200), 1e-4f);
        // halfway through "never "
        assertEquals(2f + 3f, LyricWords.sung(START, END, CHARS, 1900), 1e-4f);
    }

    @Test
    public void aGapBetweenWordsHoldsTheWordsSoFar() {
        assertEquals(8f, LyricWords.sung(START, END, CHARS, 2400), 1e-4f);
    }

    @Test
    public void theWholeLineOnceItsLastWordEnds() {
        assertEquals(14f, LyricWords.sung(START, END, CHARS, 9000), 1e-4f);
    }

    @Test
    public void aWordWithoutLengthCountsAsSungAtOnce() {
        assertEquals(3f, LyricWords.sung(new long[]{100, 200}, new long[]{100, 150}, new int[]{3, 4}, 120), 1e-4f);
    }

    @Test
    public void theSungPartIsScaledOntoTheTextShown() {
        assertEquals(5f, LyricWords.shown(7f, 14, 10), 1e-4f);
        assertEquals(10f, LyricWords.shown(20f, 14, 10), 1e-4f);
        assertEquals(0f, LyricWords.shown(3f, 0, 10), 1e-4f);
    }
}
