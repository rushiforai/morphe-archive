/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.VibrationEffect;
import android.os.Vibrator;
import android.view.HapticFeedbackConstants;
import android.view.View;

import org.robolectric.RuntimeEnvironment;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Turn off haptics: with its switch on, Facebook's View haptics and the effects it hands the
 * vibrator don't play and are counted. Off or paused, they play as asked.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HapticsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A view that records the haptics it was asked to play and says it played them. */
    private static final class Played extends View {
        int haptics;

        Played() {
            super(RuntimeEnvironment.getApplication());
        }

        @Override
        public boolean performHapticFeedback(int feedbackConstant) {
            haptics++;
            return true;
        }

        @Override
        public boolean performHapticFeedback(int feedbackConstant, int flags) {
            haptics++;
            return true;
        }
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.TURN_OFF_HAPTICS.resetToDefault();
        FeedFilterCounters.clear();
        HookStatus.clear();
    }

    private static Vibrator vibrator() {
        return RuntimeEnvironment.getApplication().getSystemService(Vibrator.class);
    }

    private static String counterLine() {
        for (String line : FeedFilterCounters.report()) {
            if (line.startsWith(Haptics.ROUTE + ":")) return line;
        }
        return null;
    }

    @Test
    public void theSwitchStartsOnAndHoldsEveryHapticBack() {
        assertTrue("the switch starts on", Settings.TURN_OFF_HAPTICS.get());
        Played view = new Played();
        assertFalse(Haptics.performHapticFeedback(view, HapticFeedbackConstants.LONG_PRESS));
        assertFalse(Haptics.performHapticFeedback(view, HapticFeedbackConstants.CONFIRM, 0));
        assertEquals("the view was asked to play", 0, view.haptics);
        Vibrator vibrator = vibrator();
        Haptics.vibrate(vibrator, VibrationEffect.createPredefined(VibrationEffect.EFFECT_CLICK));
        assertFalse("the vibrator played", Shadows.shadowOf(vibrator).isVibrating());
        assertEquals(Haptics.ROUTE + ": 3 lists, 3 items, 3 removed. Last reason: held back. Removed: held back 3. "
                + "Kinds: view haptic 2, vibration 1", counterLine());
    }

    @Test
    public void offTheyPlay() {
        Settings.TURN_OFF_HAPTICS.save(false);
        Played view = new Played();
        assertTrue(Haptics.performHapticFeedback(view, HapticFeedbackConstants.LONG_PRESS));
        assertTrue(Haptics.performHapticFeedback(view, HapticFeedbackConstants.CONFIRM, 0));
        assertEquals(2, view.haptics);
        Vibrator vibrator = vibrator();
        Haptics.vibrate(vibrator, VibrationEffect.createOneShot(40, VibrationEffect.DEFAULT_AMPLITUDE));
        assertTrue("the vibrator didn't play", Shadows.shadowOf(vibrator).isVibrating());
        assertEquals(Haptics.ROUTE + ": 3 lists, 3 items, 0 removed. Kinds: view haptic 2, vibration 1",
                counterLine());
    }

    @Test
    public void pausedTheyPlay() {
        for (HushfacebookPause.Reason why : new HushfacebookPause.Reason[]{
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP,
                HushfacebookPause.Reason.MARKER_FILE}) {
            PauseForTests.pause(why);
            Played view = new Played();
            assertTrue(why + " held a haptic back", Haptics.performHapticFeedback(view, HapticFeedbackConstants.LONG_PRESS));
            assertEquals(1, view.haptics);
        }
        PauseForTests.resume();
        assertFalse("the switch didn't come back after the pause",
                Haptics.performHapticFeedback(new Played(), HapticFeedbackConstants.LONG_PRESS));
    }
}
