package app.morphed.extension.twitch.settings;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

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
}
