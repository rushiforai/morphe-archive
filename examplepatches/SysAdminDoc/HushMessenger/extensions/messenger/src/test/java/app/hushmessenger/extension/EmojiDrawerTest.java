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
public class EmojiDrawerTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.oldEmojiDrawer = null;
        CrashGuard.resetForTests();
    }

    @Test public void onTurnsTheRedesignOffAndNeverTurnsItOn() {
        Settings.preferences.edit().putBoolean("emoji_drawer", true).commit();
        assertEquals(0, Settings.lastActive("emoji_drawer"));
        assertFalse(Settings.redesignedEmojiDrawer(false));
        assertEquals("An account without the redesign changes nothing, so it isn't counted", 0, Settings.lastActive("emoji_drawer"));
        assertFalse(Settings.redesignedEmojiDrawer(true));
        assertTrue(Settings.lastActive("emoji_drawer") > 0);
        assertEquals(Collections.singletonMap("emoji_drawer", true), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("emoji_drawer", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.oldEmojiDrawer = null;
            Settings.activeAt.clear();
            assertTrue(state, Settings.redesignedEmojiDrawer(true));
            assertFalse(state, Settings.redesignedEmojiDrawer(false));
            assertEquals(state, 0, Settings.lastActive("emoji_drawer"));
        }
    }

    @Test public void theFirstAnswerHoldsUntilARestartSoTheDrawerNeverMixesLayouts() {
        assertTrue(Settings.redesignedEmojiDrawer(true));
        Settings.preferences.edit().putBoolean("emoji_drawer", true).commit();
        assertTrue("Turning it on mid-session waits for Restart Messenger", Settings.redesignedEmojiDrawer(true));

        Settings.oldEmojiDrawer = null;
        assertFalse(Settings.redesignedEmojiDrawer(true));
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse("Pause, like the switch, takes effect on the next start", Settings.redesignedEmojiDrawer(true));
        Settings.preferences.edit().putBoolean("paused", false).putBoolean("emoji_drawer", false).commit();
        assertFalse(Settings.redesignedEmojiDrawer(true));

        Settings.oldEmojiDrawer = null;
        assertTrue(Settings.redesignedEmojiDrawer(true));
    }

    @Test public void concurrentFirstAsksAllGetTheSameAnswer() throws Exception {
        Settings.preferences.edit().putBoolean("emoji_drawer", true).commit();
        Thread[] askers = new Thread[8];
        boolean[] answers = new boolean[askers.length];
        for (int i = 0; i < askers.length; i++) {
            int at = i;
            askers[i] = new Thread(() -> answers[at] = Settings.redesignedEmojiDrawer(true));
        }
        for (Thread asker : askers) asker.start();
        Settings.preferences.edit().putBoolean("emoji_drawer", false).commit();
        for (Thread asker : askers) asker.join();
        boolean first = Settings.oldEmojiDrawer;
        for (boolean answer : answers) assertEquals(!first, answer);
    }
}
