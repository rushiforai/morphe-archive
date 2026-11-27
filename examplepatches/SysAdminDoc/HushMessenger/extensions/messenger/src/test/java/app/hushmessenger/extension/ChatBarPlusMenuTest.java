package app.hushmessenger.extension;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #241: on 588 the switch answers Messenger's own flags for moving the chat bar's buttons into the + menu. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ChatBarPlusMenuTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
    }

    @Test public void offLeavesMetasAnswer() {
        assertFalse(ChatBarPlus.menuFlag(0));
        assertTrue(ChatBarPlus.menuFlag(1));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void onMovesTheButtonsInEveryChat() {
        Settings.preferences.edit().putBoolean(ChatBarPlus.KEY, true).commit();
        assertTrue(ChatBarPlus.menuFlag(0));
        assertTrue(Settings.activeAt.containsKey(ChatBarPlus.KEY));
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** An account Meta already gave the move to isn't the switch's doing. */
    @Test public void aYesMetaAlreadyGaveDoesntCountAsAUse() {
        Settings.preferences.edit().putBoolean(ChatBarPlus.KEY, true).commit();
        assertTrue(ChatBarPlus.menuFlag(1));
        assertTrue(Settings.activeAt.isEmpty());
    }

    @Test public void pauseAndSafeModeLeaveMetasAnswer() {
        for (String state : new String[] {"paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(ChatBarPlus.KEY, true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            Settings.activeAt.clear();
            assertFalse(state, ChatBarPlus.menuFlag(0));
            assertTrue(state, ChatBarPlus.menuFlag(1));
            assertTrue(state, Settings.activeAt.isEmpty());
        }
    }
}
