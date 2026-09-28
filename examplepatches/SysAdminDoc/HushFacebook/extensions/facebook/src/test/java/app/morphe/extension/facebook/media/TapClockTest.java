/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.ViewConfiguration;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;


import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The tap clock: a finger that came up within the touch slop of where it went down is a tap,
 * however long it stayed. A scroll, a second finger or a cancelled gesture isn't. It reads each
 * event and leaves it exactly as it was.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TapClockTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int SLOP = 10;

    @Before
    public void start() {
        TapToPlayForTests.forget();
        HookStatus.clear();
    }

    @After
    public void restore() {
        TapToPlayForTests.forget();
        HookStatus.clear();
    }

    private static void down(float x, float y, long at) {
        TapClock.record(MotionEvent.ACTION_DOWN, x, y, at, SLOP);
    }

    private static void move(float x, float y, long at) {
        TapClock.record(MotionEvent.ACTION_MOVE, x, y, at, SLOP);
    }

    private static void up(float x, float y, long at) {
        TapClock.record(MotionEvent.ACTION_UP, x, y, at, SLOP);
    }

    @Test
    public void aTapWithinTheSlopIsKeptByTheTimeItEnded() {
        assertEquals("nothing yet", -1, TapClock.msSinceTap(1_000));
        down(100, 100, 1_000);
        move(106, 104, 1_020);
        up(107, 105, 1_050);
        assertEquals(150, TapClock.msSinceTap(1_200));
        assertEquals("a clock that reads earlier than the tap", -1, TapClock.msSinceTap(1_049));
    }

    @Test
    public void aLongPressIsATapToo() {
        down(100, 100, 1_000);
        up(100, 100, 3_000);
        assertEquals(0, TapClock.msSinceTap(3_000));
    }

    @Test
    public void aScrollIsntATapEvenIfItComesBack() {
        down(100, 100, 1_000);
        move(100, 100 + SLOP + 1, 1_020);
        up(100, 100, 1_100);
        assertEquals(-1, TapClock.msSinceTap(1_200));

        // The control: the same gesture without the excursion.
        down(100, 100, 2_000);
        move(100, 100 + SLOP, 2_020);
        up(100, 100, 2_100);
        assertEquals(100, TapClock.msSinceTap(2_200));
    }

    @Test
    public void anUpFarFromItsDownIsntATap() {
        down(100, 100, 1_000);
        up(100 + SLOP + 1, 100, 1_010);
        assertEquals(-1, TapClock.msSinceTap(1_100));
    }

    @Test
    public void aSecondFingerOrACancelIsntATap() {
        down(100, 100, 1_000);
        TapClock.record(MotionEvent.ACTION_POINTER_DOWN, 300, 300, 1_010, SLOP);
        up(100, 100, 1_050);
        assertEquals(-1, TapClock.msSinceTap(1_100));

        down(100, 100, 2_000);
        TapClock.record(MotionEvent.ACTION_CANCEL, 100, 100, 2_010, SLOP);
        up(100, 100, 2_050);
        assertEquals(-1, TapClock.msSinceTap(2_100));
    }

    @Test
    public void anUpWithoutItsDownIsntATap() {
        up(100, 100, 1_000);
        assertEquals(-1, TapClock.msSinceTap(1_100));
    }

    @Test
    public void aLaterScrollInvalidatesThePreviousTapBeforeTheFingerLifts() {
        down(100, 100, 1_000);
        up(100, 100, 1_050);
        down(100, 100, 1_100);
        move(100, 400, 1_150);
        assertEquals(-1, TapClock.msSinceTap(1_150));
        up(100, 400, 1_200);
        assertEquals(-1, TapClock.msSinceTap(1_300));
    }

    /**
     * Through the hook, with the activity's own touch slop: the event comes out as it went in, and
     * the hook changes nothing Facebook reads of it.
     */
    @Test
    public void theHookReadsTheEventAndLeavesItAlone() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        int slop = ViewConfiguration.get(activity).getScaledTouchSlop();
        assertTrue(slop > 1);

        MotionEvent down = MotionEvent.obtain(5_000, 5_000, MotionEvent.ACTION_DOWN, 200, 300, 0);
        MotionEvent up = MotionEvent.obtain(5_000, 5_120, MotionEvent.ACTION_UP, 200 + slop - 1, 300, 0);
        TapClock.touch(activity, down);
        TapClock.touch(activity, up);
        assertEquals(80, TapClock.msSinceTap(5_200));
        assertEquals(MotionEvent.ACTION_UP, up.getActionMasked());
        assertEquals(200f + slop - 1, up.getX(), 0f);
        assertEquals(300f, up.getY(), 0f);
        assertEquals(5_120, up.getEventTime());
        assertEquals(MotionEvent.ACTION_DOWN, down.getActionMasked());
        assertEquals(200f, down.getX(), 0f);

        MotionEvent farDown = MotionEvent.obtain(6_000, 6_000, MotionEvent.ACTION_DOWN, 200, 300, 0);
        MotionEvent farUp = MotionEvent.obtain(6_000, 6_100, MotionEvent.ACTION_UP, 200 + slop + 1, 300, 0);
        TapClock.touch(activity, farDown);
        TapClock.touch(activity, farUp);
        assertEquals("a finger that moved past the activity's slop", -1, TapClock.msSinceTap(6_200));
        down.recycle();
        up.recycle();
        farDown.recycle();
        farUp.recycle();

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(FamilyNames.TAP_TO_PLAY + ": ") && report.contains("1 found, 0 missing"));
    }

    /**
     * An activity that can't answer its touch slop, one not yet attached to anything, makes the
     * clock throw. The report names the hook, and the throw goes no further than the hook.
     */
    @Test
    public void aFailureIsReportedAndNeverReachesFacebook() {
        MotionEvent event = MotionEvent.obtain(1, 1, MotionEvent.ACTION_DOWN, 1, 1, 0);
        TapClock.touch(new Activity(), event);
        java.util.List<String> missing = HookStatus.missing(FamilyNames.TAP_TO_PLAY);
        assertEquals(missing.toString(), 1, missing.size());
        assertTrue(missing.get(0), missing.get(0).startsWith("a working 'tap clock' hook (it threw "));
        TapClock.touch(null, null);
        event.recycle();
    }
}
