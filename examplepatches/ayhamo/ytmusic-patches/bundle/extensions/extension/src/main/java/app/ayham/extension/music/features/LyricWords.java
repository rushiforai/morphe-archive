package app.ayham.extension.music.features;

/**
 * How far into a word-timed lyric line the singing is, in characters of the line's text: BitChord's
 * karaoke line fills its words as they are sung. Pure, so it is unit tested.
 */
final class LyricWords {
    private LyricWords() {
    }

    /**
     * @param start  each word's start, ms
     * @param end    each word's end, ms (a word that never ends counts as sung at once)
     * @param chars  each word's length in the line's text, its trailing space included
     * @param posMs  the playing position, ms
     * @return the characters sung so far: whole words, plus the part of the word being sung
     */
    static float sung(long[] start, long[] end, int[] chars, long posMs) {
        float done = 0;
        for (int i = 0; i < start.length; i++) {
            if (posMs < start[i]) return done;
            long len = end[i] - start[i];
            if (len <= 0 || posMs >= end[i]) {
                done += chars[i];
                continue;
            }
            return done + chars[i] * (posMs - start[i]) / (float) len;
        }
        return done;
    }

    /**
     * The sung part as shown: the words' characters scaled onto the text on screen, which can differ
     * a little from the words joined (trimmed, brackets taken out).
     */
    static float shown(float sung, int wordChars, int shownChars) {
        if (wordChars <= 0 || shownChars <= 0) return 0;
        return Math.max(0, Math.min(shownChars, sung * shownChars / wordChars));
    }
}
