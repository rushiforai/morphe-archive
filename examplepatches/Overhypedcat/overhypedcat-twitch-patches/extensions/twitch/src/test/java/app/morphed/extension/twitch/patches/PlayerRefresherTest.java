package app.morphed.extension.twitch.patches;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class PlayerRefresherTest {
    @Test
    public void recognisesAudioOnly() {
        assertTrue(PlayerRefresher.isAudioOnly(0, "audio_only"));
        assertTrue(PlayerRefresher.isAudioOnly(0, null));
        assertTrue(PlayerRefresher.isAudioOnly(-1, "Audio Only"));
    }

    @Test
    public void videoQualitiesAreNotAudioOnly() {
        assertFalse(PlayerRefresher.isAudioOnly(1080, "1080p60"));
        assertFalse(PlayerRefresher.isAudioOnly(360, "360p"));
        // Unknown height (the method changed): keep the label.
        assertFalse(PlayerRefresher.isAudioOnly(-1, null));
    }
}
