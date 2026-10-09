package app.hushmessenger.extension;

import java.util.Collections;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class EmojiSearchTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onKeepsTheTrayOnEmojiAndOnlyEverReplacesTheSearchMode() {
        Settings.preferences.edit().putBoolean("emoji_search", true).commit();
        assertEquals(0, Settings.lastActive("emoji_search"));
        assertEquals("expression", Settings.emojiSearchMode("expression"));
        assertNull(Settings.emojiSearchMode(null));
        assertEquals("another mode isn't ours to change", "gif", Settings.emojiSearchMode("gif"));
        assertEquals("None of those count as a use", 0, Settings.lastActive("emoji_search"));
        assertEquals("expression", Settings.emojiSearchMode("expression_search"));
        assertTrue(Settings.lastActive("emoji_search") > 0);
        assertEquals(Collections.singletonMap("emoji_search", true), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersMode() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("emoji_search", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertEquals(state, "expression_search", Settings.emojiSearchMode("expression_search"));
            assertEquals(state, "expression", Settings.emojiSearchMode("expression"));
            assertEquals(state, 0, Settings.lastActive("emoji_search"));
        }
    }

    @Test public void theSwitchTakesEffectWithoutARestart() {
        assertEquals("expression_search", Settings.emojiSearchMode("expression_search"));
        Settings.preferences.edit().putBoolean("emoji_search", true).commit();
        assertEquals("expression", Settings.emojiSearchMode("expression_search"));
        Settings.preferences.edit().putBoolean("emoji_search", false).commit();
        assertEquals("expression_search", Settings.emojiSearchMode("expression_search"));
    }
}
