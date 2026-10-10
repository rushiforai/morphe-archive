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
public class DisappearingSwipeTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void onlyItsOwnSwitchBlocksTheSwipeAndEachGestureAsksAgain() {
        assertFalse(Settings.blockDisappearingSwipe());
        assertEquals(0, Settings.lastActive("disappearing_swipe"));
        Settings.preferences.edit().putBoolean("disappearing_swipe", true).commit();
        assertTrue(Settings.blockDisappearingSwipe());
        assertTrue(Settings.lastActive("disappearing_swipe") > 0);
        Settings.preferences.edit().putBoolean("disappearing_swipe", false).commit();
        assertFalse("The next swipe after switching off works as usual", Settings.blockDisappearingSwipe());
        assertEquals(Collections.singletonMap("disappearing_swipe", false), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepTheSwipe() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("disappearing_swipe", !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.activeAt.clear();
            assertFalse(state, Settings.blockDisappearingSwipe());
            assertEquals(state, 0, Settings.lastActive("disappearing_swipe"));
        }
    }

    @Test public void theSwitchSitsUnderConversationsAndStartsOff() {
        String[] spec = null;
        for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals("disappearing_swipe")) spec = control;
        assertNotNull(spec);
        assertEquals("conversations", spec[3]);
        assertTrue(Settings.installed.contains("disappearing_swipe"));
        assertFalse(Settings.preferences.getBoolean("disappearing_swipe", false));
    }
}
