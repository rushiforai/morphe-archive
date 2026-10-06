/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Turn off screen transitions: with the patch in and its switch on, a Facebook screen asks Android
 * for no transition as it comes to the front and as it closes, with the open and close overrides
 * set on Android 14, a tab that would slide gets the other style, and a panel is told not to
 * slide. Off, paused or without the patch, Facebook's stay.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class ScreenTransitionsTest {
    /** Robolectric's answer for a screen nobody asked a pending transition of. */
    private static final int NOT_ASKED = -1;

    private static final HushfacebookPause.Reason[] PAUSES = {
            HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
            HushfacebookPause.Reason.MARKER_FILE};

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        ScreenTransitions.inBuildForTests = true;
        HookStatus.clear();
    }

    @After
    public void restore() {
        ScreenTransitions.inBuildForTests = null;
        PauseForTests.resume();
        Settings.TURN_OFF_SCREEN_TRANSITIONS.resetToDefault();
        HookStatus.clear();
    }

    private static Activity screen() {
        return Robolectric.buildActivity(Activity.class).create().get();
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.SCREEN_TRANSITIONS + ":")) return line;
        }
        return null;
    }

    private static void assertPending(String message, int expected, Activity activity) {
        ShadowActivity screen = Shadows.shadowOf(activity);
        assertEquals(message, expected, screen.getPendingTransitionEnterAnimationResourceId());
        assertEquals(message, expected, screen.getPendingTransitionExitAnimationResourceId());
    }

    @Test
    public void theSwitchStartsOnAndAScreenOpensWithoutATransition() {
        assertTrue("the switch doesn't start on once picked", Settings.TURN_OFF_SCREEN_TRANSITIONS.get());
        Activity activity = screen();
        assertPending("a new screen already had a pending transition", NOT_ASKED, activity);

        ScreenTransitions.activityCreated(activity);

        ShadowActivity shadow = Shadows.shadowOf(activity);
        for (int type : new int[]{Activity.OVERRIDE_TRANSITION_OPEN, Activity.OVERRIDE_TRANSITION_CLOSE}) {
            ShadowActivity.OverriddenActivityTransition override = shadow.getOverriddenActivityTransition(type);
            assertNotNull("no override for " + type, override);
            assertEquals(0, override.enterAnim);
            assertEquals(0, override.exitAnim);
        }
        // Android takes a pending transition only from a screen in front, so it isn't asked yet.
        assertPending("the screen asked before it was in front", NOT_ASKED, activity);
        assertEquals(FamilyNames.SCREEN_TRANSITIONS + ": invoked 1, 1 found, 0 missing. Counted: "
                + ScreenTransitions.OPENED + " 1", statusLine());

        ScreenTransitions.activityResumed(activity);
        assertPending("the screen in front", 0, activity);
    }

    @Test
    public void aClosingScreenAsksForNoTransitionAndOneThatStaysDoesNot() {
        Activity staying = screen();
        ScreenTransitions.activityPaused(staying);
        assertPending("a screen that isn't closing", NOT_ASKED, staying);

        Activity closing = screen();
        closing.finish();
        ScreenTransitions.activityPaused(closing);
        assertPending("a closing screen", 0, closing);
    }

    @Test
    @Config(sdk = 30)
    public void beforeAndroid14AScreenAsksTheSameWayWithoutTheNewerOverrides() {
        Activity activity = screen();
        ScreenTransitions.activityCreated(activity);
        assertEquals(FamilyNames.SCREEN_TRANSITIONS + ": invoked 1, 1 found, 0 missing. Counted: "
                + ScreenTransitions.OPENED + " 1", statusLine());
        assertPending("the screen asked before it was in front", NOT_ASKED, activity);
        ScreenTransitions.activityResumed(activity);
        assertPending("the screen in front", 0, activity);

        Activity closing = screen();
        closing.finish();
        ScreenTransitions.activityPaused(closing);
        assertPending("a closing screen", 0, closing);
    }

    @Test
    public void aTabThatWouldSlideGetsTheOtherStyle() {
        assertEquals("a style that doesn't slide was changed", 0, ScreenTransitions.tabStyle(0, 1));
        assertEquals("a style that doesn't slide was changed", 2, ScreenTransitions.tabStyle(2, 1));
        assertNull("a tab that doesn't slide was counted", statusLine());

        assertEquals("a tab still slid in", 0, ScreenTransitions.tabStyle(1, 1));
        assertEquals("a tab still slid in, with another sliding style", 1, ScreenTransitions.tabStyle(0, 0));
        assertEquals(FamilyNames.SCREEN_TRANSITIONS + ": invoked 2, 1 found, 0 missing. Counted: "
                + ScreenTransitions.TAB + " 2", statusLine());

        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(false);
        assertEquals("off, a tab lost its slide", 1, ScreenTransitions.tabStyle(1, 1));
        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(true);
        for (HushfacebookPause.Reason reason : PAUSES) {
            PauseForTests.pause(reason);
            assertEquals("paused by " + reason + ", a tab lost its slide", 1, ScreenTransitions.tabStyle(1, 1));
            PauseForTests.resume();
        }
        assertEquals("the switch didn't come back after the pause", 0, ScreenTransitions.tabStyle(1, 1));
        ScreenTransitions.inBuildForTests = false;
        assertEquals("without the patch, a tab lost its slide", 1, ScreenTransitions.tabStyle(1, 1));
    }

    @Test
    public void aPanelAskedForShowsWithoutItsSlide() {
        assertFalse("a panel asked for without a slide got one", ScreenTransitions.panelSlides(false));
        assertNull("a panel that doesn't slide was counted", statusLine());

        assertFalse("the Menu still slid in", ScreenTransitions.panelSlides(true));
        assertEquals(FamilyNames.SCREEN_TRANSITIONS + ": invoked 1, 1 found, 0 missing. Counted: "
                + ScreenTransitions.PANEL + " 1", statusLine());

        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(false);
        assertTrue("off, the Menu lost its slide", ScreenTransitions.panelSlides(true));
        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(true);
        for (HushfacebookPause.Reason reason : PAUSES) {
            PauseForTests.pause(reason);
            assertTrue("paused by " + reason + ", the Menu lost its slide", ScreenTransitions.panelSlides(true));
            PauseForTests.resume();
        }
        assertFalse("the switch didn't come back after the pause", ScreenTransitions.panelSlides(true));
        ScreenTransitions.inBuildForTests = false;
        assertTrue("without the patch, the Menu lost its slide", ScreenTransitions.panelSlides(true));
    }

    @Test
    public void offPausedOrWithoutThePatchFacebooksStay() {
        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(false);
        assertFacebooks("off");
        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(true);
        for (HushfacebookPause.Reason reason : PAUSES) {
            PauseForTests.pause(reason);
            assertFacebooks("paused by " + reason);
            PauseForTests.resume();
        }
        HookStatus.clear();
        ScreenTransitions.inBuildForTests = false;
        assertFacebooks("without the patch");
        assertNull("a build without the patch reported it", statusLine());
    }

    private static void assertFacebooks(String when) {
        Activity activity = screen();
        ScreenTransitions.activityCreated(activity);
        ScreenTransitions.activityResumed(activity);
        activity.finish();
        ScreenTransitions.activityPaused(activity);
        ShadowActivity shadow = Shadows.shadowOf(activity);
        assertNull(when, shadow.getOverriddenActivityTransition(Activity.OVERRIDE_TRANSITION_OPEN));
        assertNull(when, shadow.getOverriddenActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE));
        assertPending(when, NOT_ASKED, activity);
    }
}
