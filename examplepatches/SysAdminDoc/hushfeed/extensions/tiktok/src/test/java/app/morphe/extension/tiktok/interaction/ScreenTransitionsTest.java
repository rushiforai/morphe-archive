/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.interaction;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.os.Bundle;

import app.morphe.extension.tiktok.SettingsContextRule;
import app.morphe.extension.tiktok.settings.Settings;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

/** Turn off screen transitions, from the callbacks the host application registers. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class ScreenTransitionsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int SLIDE_IN = android.R.anim.slide_in_left;
    private static final int SLIDE_OUT = android.R.anim.slide_out_right;

    /** Stands in for a TikTok screen that asks for its own slide as it opens. */
    public static class SlidingActivity extends Activity {
        @Override protected void onCreate(Bundle state) {
            super.onCreate(state);
            overridePendingTransition(SLIDE_IN, SLIDE_OUT);
        }
    }

    @After public void tearDown() {
        ScreenTransitions.resetForTests();
        Settings.TURN_OFF_SCREEN_TRANSITIONS.resetToDefault();
    }

    @Test public void aScreenOpensWithoutTikToksSlide() {
        assertTrue("picking the patch is the ask", Settings.TURN_OFF_SCREEN_TRANSITIONS.get());
        ScreenTransitions.install(RuntimeEnvironment.getApplication());
        try (var controller = Robolectric.buildActivity(SlidingActivity.class).setup()) {
            assertEquals(0, shadowOf(controller.get()).getPendingTransitionEnterAnimationResourceId());
            assertEquals(0, shadowOf(controller.get()).getPendingTransitionExitAnimationResourceId());
        }
    }

    @Test public void switchedOffTikToksSlideStays() {
        Settings.TURN_OFF_SCREEN_TRANSITIONS.save(false);
        ScreenTransitions.install(RuntimeEnvironment.getApplication());
        try (var controller = Robolectric.buildActivity(SlidingActivity.class).setup()) {
            assertEquals(SLIDE_IN, shadowOf(controller.get()).getPendingTransitionEnterAnimationResourceId());
            assertEquals(SLIDE_OUT, shadowOf(controller.get()).getPendingTransitionExitAnimationResourceId());
        }
    }

    @Test public void aClosingScreenAsksForNoTransitionAfterTikToksOwn() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            activity.finish();
            activity.overridePendingTransition(SLIDE_IN, SLIDE_OUT);
            ScreenTransitions.paused(activity);
            assertEquals(0, shadowOf(activity).getPendingTransitionEnterAnimationResourceId());
            assertEquals(0, shadowOf(activity).getPendingTransitionExitAnimationResourceId());
        }
    }

    @Test public void aScreenGoingBehindAnotherKeepsWhatItAskedFor() {
        try (var controller = Robolectric.buildActivity(Activity.class).setup()) {
            Activity activity = controller.get();
            activity.overridePendingTransition(SLIDE_IN, SLIDE_OUT);
            ScreenTransitions.paused(activity);
            assertEquals("only a closing screen is asked as it leaves the front",
                    SLIDE_IN, shadowOf(activity).getPendingTransitionEnterAnimationResourceId());
        }
    }
}
