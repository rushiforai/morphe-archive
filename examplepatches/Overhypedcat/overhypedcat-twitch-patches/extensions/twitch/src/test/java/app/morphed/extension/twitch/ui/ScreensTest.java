package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** Only the Settings screen is rebuilt to show its rows' new texts: never the player's. */
public class ScreensTest {
    @Test
    public void theSettingsScreenIsKnownByItsKind() {
        assertTrue(Screens.isSettingsScreen("tv.twitch.android.settings.SettingsActivity", null));
        assertTrue("noted while its rows were built",
                Screens.isSettingsScreen("a.b.Xyz", "a.b.Xyz"));
        assertFalse("the player's screen", Screens.isSettingsScreen(
                "tv.twitch.android.feature.viewer.landing.ViewerLandingActivity", null));
        assertFalse(Screens.isSettingsScreen(null, null));
    }
}
