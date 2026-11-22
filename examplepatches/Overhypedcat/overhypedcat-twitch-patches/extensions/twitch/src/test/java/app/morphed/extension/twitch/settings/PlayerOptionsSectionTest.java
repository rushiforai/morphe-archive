package app.morphed.extension.twitch.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import app.morphed.extension.twitch.musicfilter.StatusWords;

/** The Options sheet is recognised in each of its layouts (portrait, full screen, vertical full screen). */
public class PlayerOptionsSectionTest {
    @Test
    public void rowsOfEachLayoutAreRecognised() {
        assertTrue("portrait", PlayerOptionsSection.isSheetRow("playback-audio-only"));
        assertTrue("both", PlayerOptionsSection.isSheetRow("playback-video-stats"));
        assertTrue("full screen", PlayerOptionsSection.isSheetRow("playback-landscape-alerts"));
        assertTrue("full screen", PlayerOptionsSection.isSheetRow("playback-pip-auto-popout"));
    }

    @Test
    public void otherViewsAreNot() {
        assertFalse(PlayerOptionsSection.isSheetRow(null));
        assertFalse(PlayerOptionsSection.isSheetRow(42));
        assertFalse(PlayerOptionsSection.isSheetRow("playback-chat-mode-no-chat"));
        assertFalse(PlayerOptionsSection.isSheetRow("channel-settings-block"));
    }

    @Test
    public void songRemovalShowsAProblemsWordsAndItsSentenceUnder() {
        PlayerOptionsSection.SongLines lines = PlayerOptionsSection.SongLines.of(StatusWords.REMOVING, 0,
                StatusWords.problem("No match yet", "YouTube's copy of A - T doesn't line up with the stream yet"), 0, 0);
        assertEquals("No match yet", lines.status);
        assertEquals("YouTube's copy of A - T doesn't line up with the stream yet", lines.detail);
        assertEquals(-1, lines.nextTick);
        PlayerOptionsSection.SongLines plain = PlayerOptionsSection.SongLines.of(StatusWords.LISTENING, 0, "boom", 0, 0);
        assertEquals("boom", plain.status);
        assertNull("no sentence twice", plain.detail);
    }

    @Test
    public void songRemovalsStepCountsDownWithNoSentence() {
        PlayerOptionsSection.SongLines lines = PlayerOptionsSection.SongLines.of(StatusWords.RETRYING, 6_000, null, 0, 0);
        assertEquals("Retrying 6 s", lines.status);
        assertNull(lines.detail);
        assertEquals(1005, lines.nextTick);
    }

    @Test
    public void theNativeSheetsSwitchesLineUpWithItsTitles() {
        // the title 60 px into the list, with 0 padding of its own; or 40 px in, padded 20
        assertEquals(60, PlayerOptionsSection.sideOf(true, 196, 136, 0, 42));
        assertEquals(60, PlayerOptionsSection.sideOf(true, 176, 136, 20, 42));
        assertEquals("no title to go by", 42, PlayerOptionsSection.sideOf(false, 0, 0, 0, 42));
        assertEquals("a title not where it should be", 42, PlayerOptionsSection.sideOf(true, 100, 136, 0, 42));
        assertEquals("a title right at the list's edge", 0, PlayerOptionsSection.sideOf(true, 136, 136, 0, 42));
    }
}
