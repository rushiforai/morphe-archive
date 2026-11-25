package app.hushmessenger.extension;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class StoryTrayTest {
    /** The own tile as the stories unit hands it over: your session, your story and your note. */
    static final class OwnTile {
        final Object A00 = "session";
        final Object A01 = "your story";
        final Object A02 = "your note";
    }

    private final OwnTile tile = new OwnTile();

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void offLeavesTheTileWhereItIs() {
        assertSame(tile, StoryTray.ownTile(tile));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void onTakesTheTileOutOfTheRow() {
        Settings.preferences.edit().putBoolean(StoryTray.KEY, true).commit();
        assertNull(StoryTray.ownTile(tile));
        assertTrue(Settings.activeAt.containsKey(StoryTray.KEY));
        // No tile, as on an account still loading, stays no tile.
        assertNull(StoryTray.ownTile(null));
    }

    @Test public void pauseAndSafeModeGiveTheTileBack() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(StoryTray.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.activeAt.clear();
            assertSame(state, tile, StoryTray.ownTile(tile));
            assertTrue(state, Settings.activeAt.isEmpty());
        }
    }

    @Test public void theSwitchSitsUnderHideStoriesAndStartsOff() {
        int stories = -1, own = -1;
        for (int i = 0; i < SettingsActivity.CONTROLS.length; i++) {
            if (SettingsActivity.CONTROLS[i][0].equals("stories")) stories = i;
            if (SettingsActivity.CONTROLS[i][0].equals(StoryTray.KEY)) own = i;
        }
        assertEquals(stories + 1, own);
        assertEquals("Hide Create story", SettingsActivity.CONTROLS[own][1]);
        assertEquals("inbox", SettingsActivity.CONTROLS[own][3]);
        assertTrue(Settings.installed.contains(StoryTray.KEY));
        assertFalse(Settings.preferences.getBoolean(StoryTray.KEY, false));
    }
}
