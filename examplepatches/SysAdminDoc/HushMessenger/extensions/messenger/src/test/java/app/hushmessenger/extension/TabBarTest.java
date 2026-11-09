package app.hushmessenger.extension;

import android.view.View;
import android.widget.Switch;
import android.widget.TextView;
import java.util.Collections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #154: the tab bar at the bottom slides away while the chat list scrolls, or takes Messenger's floating style. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class TabBarTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        forgetHeldAnswers();
        CrashGuard.resetForTests();
    }

    @After public void forgetHeldAnswers() {
        Settings.floatingBar = null;
        Settings.scrollAwayBar = null;
    }

    @Test public void scrollAwayLaysTheBarOverTheChatsAndLetsItSlide() {
        Settings.preferences.edit().putBoolean(Settings.TAB_BAR_SCROLL_AWAY, true).commit();
        assertTrue("The home screen takes the overlay", Settings.tabBarOverlay(0));
        assertTrue(Settings.lastActive(Settings.TAB_BAR_SCROLL_AWAY) > 0);
        Settings.activeAt.clear();
        assertTrue("The Chats page lets the bar slide away", Settings.tabBarScrollAway(0));
        assertTrue(Settings.lastActive(Settings.TAB_BAR_SCROLL_AWAY) > 0);
        assertFalse("Floating tab bar stays its own switch", Settings.floatingTabBar(0));
        assertEquals(0, Settings.lastActive(Settings.FLOATING_TAB_BAR));
    }

    @Test public void floatingTabBarAnswersYesForThePill() {
        Settings.preferences.edit().putBoolean(Settings.FLOATING_TAB_BAR, true).commit();
        assertTrue(Settings.floatingTabBar(0));
        assertTrue(Settings.lastActive(Settings.FLOATING_TAB_BAR) > 0);
        assertFalse("Hide the tab bar while scrolling stays its own switch", Settings.tabBarOverlay(0));
        assertFalse(Settings.tabBarScrollAway(0));
    }

    @Test public void messengersOwnYesStaysYesAndIsntCountedAsAUse() {
        assertTrue(Settings.floatingTabBar(1));
        assertTrue(Settings.tabBarOverlay(1));
        assertTrue(Settings.tabBarScrollAway(1));
        assertNull("Messenger's own yes holds nothing", Settings.floatingBar);
        assertNull(Settings.scrollAwayBar);
        assertEquals(0, Settings.lastActive(Settings.FLOATING_TAB_BAR));
        assertEquals(0, Settings.lastActive(Settings.TAB_BAR_SCROLL_AWAY));
    }

    @Test public void offPauseSafeModeAndAMissingControlKeepMessengersAnswers() {
        for (String state : new String[] {"off", "paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(Settings.FLOATING_TAB_BAR, !state.equals("off"))
                .putBoolean(Settings.TAB_BAR_SCROLL_AWAY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            forgetHeldAnswers();
            Settings.activeAt.clear();
            assertFalse(state, Settings.floatingTabBar(0));
            assertFalse(state, Settings.tabBarOverlay(0));
            assertFalse(state, Settings.tabBarScrollAway(0));
            assertTrue(state, Settings.floatingTabBar(1));
            assertTrue(state, Settings.tabBarScrollAway(1));
            assertEquals(state, 0, Settings.lastActive(Settings.FLOATING_TAB_BAR));
            assertEquals(state, 0, Settings.lastActive(Settings.TAB_BAR_SCROLL_AWAY));
        }
    }

    /** The home screen's frame is built once, so the bar keeps its layout until Messenger restarts, either way. */
    @Test public void theFirstAnswersHoldUntilARestart() {
        assertFalse(Settings.floatingTabBar(0));
        assertFalse(Settings.tabBarOverlay(0));
        Settings.preferences.edit().putBoolean(Settings.FLOATING_TAB_BAR, true).putBoolean(Settings.TAB_BAR_SCROLL_AWAY, true).commit();
        assertFalse("Turning it on mid-session waits for Restart Messenger", Settings.floatingTabBar(0));
        assertFalse(Settings.tabBarOverlay(0));
        assertFalse("The Chats page follows the frame it sits in", Settings.tabBarScrollAway(0));
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart(Settings.FLOATING_TAB_BAR));
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart(Settings.TAB_BAR_SCROLL_AWAY));

        forgetHeldAnswers();
        assertTrue(Settings.floatingTabBar(0));
        assertTrue(Settings.tabBarOverlay(0));
        Settings.preferences.edit().putBoolean(Settings.FLOATING_TAB_BAR, false).putBoolean("paused", true).commit();
        assertTrue("Turning it off also waits for the restart", Settings.floatingTabBar(0));
        assertTrue("Pause waits for the restart too", Settings.tabBarScrollAway(0));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(Settings.FLOATING_TAB_BAR));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(Settings.TAB_BAR_SCROLL_AWAY));

        forgetHeldAnswers();
        assertNull(Settings.heldUntilRestart(Settings.FLOATING_TAB_BAR));
        assertNull(Settings.heldUntilRestart(Settings.TAB_BAR_SCROLL_AWAY));
    }

    /** When Messenger lays the bar over the page on its own, the frame never asks, so the Chats page follows the switch. */
    @Test public void withNoHeldAnswerTheChatsPageFollowsTheSwitch() {
        assertFalse(Settings.tabBarScrollAway(0));
        Settings.preferences.edit().putBoolean(Settings.TAB_BAR_SCROLL_AWAY, true).commit();
        assertTrue(Settings.tabBarScrollAway(0));
        assertTrue(Settings.lastActive(Settings.TAB_BAR_SCROLL_AWAY) > 0);
        assertNull("Only the frame's question holds an answer", Settings.scrollAwayBar);
    }

    @Test public void theRowSaysTheChangeWaitsForARestart() {
        assertFalse(Settings.tabBarOverlay(0));
        OpenSections.only("navigation");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            root.findViewWithTag("tab_controls").performClick();
            Switch control = root.findViewWithTag(Settings.TAB_BAR_SCROLL_AWAY);
            TextView label = root.findViewWithTag("active_" + Settings.TAB_BAR_SCROLL_AWAY);
            assertFalse(control.isChecked());
            control.performClick();
            assertTrue(Settings.preferences.getBoolean(Settings.TAB_BAR_SCROLL_AWAY, false));
            assertEquals("Takes effect after Messenger restarts", label.getText().toString());
            control.performClick();
            assertNotEquals("Takes effect after Messenger restarts", label.getText().toString());
        }
    }

    @Test public void bothSwitchesSitUnderNavigationAndStartOff() {
        for (String key : new String[] {Settings.TAB_BAR_SCROLL_AWAY, Settings.FLOATING_TAB_BAR}) {
            String[] spec = null;
            for (String[] control : SettingsActivity.CONTROLS) if (control[0].equals(key)) spec = control;
            assertNotNull(key, spec);
            assertEquals(key, "navigation", spec[3]);
            assertTrue(key, Settings.installed.contains(key));
            assertFalse(key, Settings.preferences.getBoolean(key, false));
            assertTrue("Not yet checked on a phone: " + key, SettingsActivity.EXPERIMENTAL.contains(key));
        }
    }
}
