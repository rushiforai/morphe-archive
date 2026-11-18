package io.github.sabopura.morphe.extension.twitch.player;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class PipShrinksTest {
    private final PipShrinks shrinks = new PipShrinks();
    private final Object vod = new Object();

    /** The failing order on the phone: the link's shrink arrives before Android reports the end of picture-in-picture. */
    @Test
    public void aShrinkAskedDuringPictureInPictureIsMadeWhenItEnds() {
        shrinks.changed(vod, true);
        shrinks.asked(vod);
        assertTrue(shrinks.changed(vod, false));
    }

    /** The order that already works: picture-in-picture ends first, and Twitch shrinks the player itself. */
    @Test
    public void nothingHappensWhenNoShrinkWasAskedDuringPictureInPicture() {
        shrinks.changed(vod, true);
        assertFalse(shrinks.changed(vod, false));
        shrinks.asked(vod);
        assertFalse(shrinks.changed(vod, false));
    }

    @Test
    public void aShrinkAskedOutsidePictureInPictureIsLeftToTwitch() {
        shrinks.asked(vod);
        shrinks.changed(vod, true);
        assertFalse(shrinks.changed(vod, false));
    }

    @Test
    public void theShrinkIsMadeOnceAndAFreshPictureInPictureStartsClean() {
        shrinks.changed(vod, true);
        shrinks.asked(vod);
        assertTrue(shrinks.changed(vod, false));
        assertFalse(shrinks.changed(vod, false));
        shrinks.changed(vod, true);
        assertFalse(shrinks.changed(vod, false));
    }

    @Test
    public void aRepeatedStartOfPictureInPictureKeepsTheRequest() {
        shrinks.changed(vod, true);
        shrinks.asked(vod);
        shrinks.changed(vod, true);
        assertTrue(shrinks.changed(vod, false));
    }

    @Test
    public void eachPlayerScreenKeepsItsOwnRequest() {
        Object live = new Object();
        shrinks.changed(vod, true);
        shrinks.changed(live, true);
        shrinks.asked(live);
        assertFalse(shrinks.changed(vod, false));
        assertTrue(shrinks.changed(live, false));
    }

    @Test
    public void aPlayerScreenNotCreatedYetIsIgnored() {
        shrinks.asked(null);
        assertFalse(shrinks.changed(null, true));
        assertFalse(shrinks.changed(null, false));
    }
}
