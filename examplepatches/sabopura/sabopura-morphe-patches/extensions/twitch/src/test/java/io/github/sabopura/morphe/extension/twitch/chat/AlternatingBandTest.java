package io.github.sabopura.morphe.extension.twitch.chat;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The alternating band marks every other row and gives way to a background Twitch gave a row. */
public class AlternatingBandTest {
    @Test
    public void everyOtherRowWhileTheSettingIsOn() {
        assertTrue(ChatEnhancements.bandShows(true, 1, false));
        assertTrue(ChatEnhancements.bandShows(true, 7, false));
        assertFalse(ChatEnhancements.bandShows(true, 0, false));
        assertFalse(ChatEnhancements.bandShows(true, 8, false));
    }

    @Test
    public void aRowThatStopsAlternatingLosesTheBand() {
        assertFalse(ChatEnhancements.bandShows(false, 1, false));
    }

    @Test
    public void twitchsOwnBackgroundIsLeftAlone() {
        assertFalse(ChatEnhancements.bandShows(true, 1, true));
    }
}
