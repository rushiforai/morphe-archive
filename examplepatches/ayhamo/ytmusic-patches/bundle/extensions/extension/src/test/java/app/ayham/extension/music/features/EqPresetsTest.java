package app.ayham.extension.music.features;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class EqPresetsTest {
    private static final String US = "com.google.android.apps.youtube.music";

    @Test
    public void ourOwnSessionIsOurs() {
        assertTrue(EqPresets.fromUs(US, US));
    }

    @Test
    public void anotherAppsSessionIsLeftAlone() {
        assertFalse(EqPresets.fromUs("com.spotify.music", US));
    }

    @Test
    public void aSessionNamingNoAppIsLeftAlone() {
        assertFalse(EqPresets.fromUs(null, US));
    }
}
