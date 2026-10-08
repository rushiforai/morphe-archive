/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/**
 * Only on the right edge: with Hold a reel for 2x on, a long press on a reel's right third, measured
 * against the reel's width at the press, goes to the speed-up, and one anywhere else gets Facebook's
 * own answer to its edge check. Off, Hold a reel for 2x counts a press wherever it lands, and with
 * Hold off or paused every answer is Facebook's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelHoldRightEdgeTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        ReelHold.forget();
        HookStatus.clear();
        ReelHold.holdInBuildForTests = true;
        Settings.HOLD_REEL_RIGHT_EDGE.save(true);
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HOLD_REEL_FOR_2X.resetToDefault();
        Settings.HOLD_REEL_RIGHT_EDGE.resetToDefault();
        ReelHold.forget();
        HookStatus.clear();
    }

    @Test public void onlyAPressOnTheRightThirdSpeedsTheReelUpAndTheRestIsCounted() {
        assertTrue("the right third", ReelHoldForTests.pressAt(290, false));
        assertTrue("where the right third starts", ReelHoldForTests.pressAt(200, false));
        assertFalse("just left of it", ReelHoldForTests.pressAt(199, false));
        assertFalse("the left edge", ReelHoldForTests.pressAt(10, false));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.HOLD_REEL_FOR_2X + ": invoked 4"));
        assertTrue(report, report.contains(ReelHold.OFF_THE_RIGHT_EDGE + " 2"));
    }

    @Test public void theRightThirdFollowsTheReelsWidthAtThePress() {
        View reel = new View(RuntimeEnvironment.getApplication());
        reel.layout(0, 0, 900, 600);
        long now = SystemClock.uptimeMillis();
        MotionEvent press = MotionEvent.obtain(now, now, MotionEvent.ACTION_DOWN, 290, 300, 0);
        try {
            ReelHold.edgeTouch(press, reel);
            assertFalse("290 of 900 is the left third", ReelHold.anywhere(false));
        } finally {
            press.recycle();
        }
    }

    /** Where Facebook gives the account its own hold, its edge check's yes still speeds the reel up. */
    @Test public void aPressOffTheRightThirdGetsFacebooksOwnAnswer() {
        ReelHold.longPress(true);
        assertTrue("Facebook's own hold on its edge", ReelHoldForTests.pressAt(10, true));
        assertFalse("Facebook's own hold off its edge", ReelHoldForTests.pressAt(150, false));
        ReelHold.longPress(false);
        assertFalse("no hold of Facebook's own", ReelHoldForTests.pressAt(10, true));
    }

    /** A press the hook couldn't measure, or a check it wasn't first in, counts wherever it landed. */
    @Test public void anUnmeasuredPressCountsAnywhereAndAMeasureIsUsedOnce() {
        assertTrue("no press measured", ReelHold.anywhere(false));
        ReelHold.edgeTouch(null, new View(RuntimeEnvironment.getApplication()));
        assertTrue("no press", ReelHold.anywhere(false));
        assertFalse(ReelHoldForTests.pressAt(10, false));
        assertTrue("the last measure was used", ReelHold.anywhere(false));
    }

    @Test public void offItCountsAPressAnywhereAndHoldOffOrPausedIsFacebooks() {
        Settings.HOLD_REEL_RIGHT_EDGE.save(false);
        assertTrue("the right edge switch off", ReelHoldForTests.pressAt(10, false));

        Settings.HOLD_REEL_RIGHT_EDGE.save(true);
        Settings.HOLD_REEL_FOR_2X.save(false);
        assertFalse("Hold a reel for 2x off", ReelHoldForTests.pressAt(290, false));
        assertTrue("Hold a reel for 2x off, Facebook's yes", ReelHoldForTests.pressAt(10, true));

        Settings.HOLD_REEL_FOR_2X.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertFalse("paused", ReelHoldForTests.pressAt(290, false));
    }
}
