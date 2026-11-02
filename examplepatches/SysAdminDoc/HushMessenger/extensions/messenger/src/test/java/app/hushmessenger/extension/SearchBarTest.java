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
public class SearchBarTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.keptSearchBar = null;
        CrashGuard.resetForTests();
    }

    @Test public void onBringsTheBarBackAndNeverHidesIt() {
        Settings.preferences.edit().putBoolean(Settings.SEARCH_BAR, true).commit();
        assertFalse(Settings.searchIcon(false));
        assertEquals("An account without the icon changes nothing, so it isn't counted", 0, Settings.lastActive(Settings.SEARCH_BAR));
        assertFalse(Settings.searchIcon(true));
        assertTrue(Settings.lastActive(Settings.SEARCH_BAR) > 0);
        assertEquals(Collections.singletonMap(Settings.SEARCH_BAR, true), Settings.preferences.getAll());
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersAnswer() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(Settings.SEARCH_BAR, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            Settings.keptSearchBar = null;
            Settings.activeAt.clear();
            assertTrue(state, Settings.searchIcon(true));
            assertFalse(state, Settings.searchIcon(false));
            assertEquals(state, 0, Settings.lastActive(Settings.SEARCH_BAR));
        }
    }

    @Test public void theFirstAnswerHoldsUntilARestartSoTheBarAndIconNeverBothShow() {
        assertTrue(Settings.searchIcon(true));
        Settings.preferences.edit().putBoolean(Settings.SEARCH_BAR, true).commit();
        assertTrue("Turning it on mid-session waits for Restart Messenger", Settings.searchIcon(true));
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart(Settings.SEARCH_BAR));

        Settings.keptSearchBar = null;
        assertFalse(Settings.searchIcon(true));
        Settings.preferences.edit().putBoolean(Settings.SEARCH_BAR, false).commit();
        assertFalse("Turning it off also waits for the restart", Settings.searchIcon(true));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(Settings.SEARCH_BAR));

        Settings.keptSearchBar = null;
        assertTrue(Settings.searchIcon(true));
        assertNull(Settings.heldUntilRestart(Settings.SEARCH_BAR));
    }

    @Test public void theUnpatchedStubAnswersNoIcon() {
        // Before the patch fills in this build's own check, nothing reads as the icon and nothing is held.
        Settings.preferences.edit().putBoolean(Settings.SEARCH_BAR, true).commit();
        assertFalse(Settings.inboxSearchIcon(new Object(), 0x810b24000045b3L));
        assertNull(Settings.keptSearchBar);
    }
}
