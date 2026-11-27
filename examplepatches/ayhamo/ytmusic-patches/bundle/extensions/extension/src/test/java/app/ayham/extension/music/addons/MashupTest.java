package app.ayham.extension.music.addons;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** TrackMatcher.isMashup on hostile input: nulls, a blank credit, nested brackets. */
public class MashupTest {
    @Test
    public void aNullTitleOrArtistDoesNotCrash() {
        assertFalse(TrackMatcher.isMashup(null, null));
        assertFalse(TrackMatcher.isMashup(null, "Artist"));
        assertFalse(TrackMatcher.isMashup("Song", null));
        assertFalse(TrackMatcher.isMashup("Song", "   "));
        assertTrue(TrackMatcher.isMashup("Song A x Song B", null));
        assertTrue(TrackMatcher.isMashup("Song A x Song B", ""));
    }

    @Test
    public void nestedBracketsLeaveNoHalfBracketInASide() {
        // one pass left "Song (Remix / Edit  )", split on " / " into two sides: a mashup by mistake
        assertFalse(TrackMatcher.isMashup("Song (Remix / Edit (Radio))", "Artist"));
        assertFalse(TrackMatcher.isMashup("Song [Live (A x B) Version]", "Artist"));
        // a real join outside the brackets still counts
        assertTrue(TrackMatcher.isMashup("Song A (Live (2020)) x Song B", "Artist"));
    }
}
