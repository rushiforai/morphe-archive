/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.os.SystemClock;
import android.view.MotionEvent;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * The release listener guard Keep the reel speed brings (issue #25), on an account Facebook gives
 * its own hold: there the listener is on every reel, both its flags say yes, and on every lift it
 * puts back the speed the reel was drawn at. Facebook's yes is the {@code true} each release call
 * hands over here.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelLiftGuardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        ReelHold.forget();
        HookStatus.clear();
        // A build with Keep the reel speed and without Hold a reel for 2x.
        ReelHold.holdInBuildForTests = false;
        ReelHold.keepInBuildForTests = true;
    }

    @After
    public void restore() {
        Settings.KEEP_REEL_SPEED.resetToDefault();
        Settings.HOLD_REEL_FOR_2X.resetToDefault();
        ReelHold.forget();
        HookStatus.clear();
    }

    private static void finger(int action) {
        long now = SystemClock.uptimeMillis();
        MotionEvent event = MotionEvent.obtain(now, now, action, 100, 200, 0);
        ReelHold.touch(event);
        event.recycle();
    }

    /** Stands in for FbGrootPlayer: the speed it plays at, which only its setter changes, with the hook first in it. */
    private static final class Reel {
        float speed;

        Reel(float speed) {
            this.speed = speed;
        }

        void set(float facebooks) {
            speed = ReelHold.speedSet(this, facebooks);
        }
    }

    /** A tap on [reel] as the listener hears it: both flags asked on the lift, then the speed it noted put back. */
    private static void tap(Reel reel, float noted) {
        finger(MotionEvent.ACTION_DOWN);
        finger(MotionEvent.ACTION_UP);
        if (ReelHold.release(true) && ReelHold.release(true)) reel.set(noted);
    }

    /** Facebook's own hold on [reel] and its lift: the speed-up sets 2x, the lift puts back [noted]. */
    private static void facebooksHold(Reel reel, float noted) {
        ReelHold.speeds = player -> ((Reel) player).speed;
        finger(MotionEvent.ACTION_DOWN);
        ReelHold.held();
        reel.set(2f);
        finger(MotionEvent.ACTION_UP);
        if (ReelHold.release(true) && ReelHold.release(true)) reel.set(noted);
    }

    private static String line(String family) {
        for (String line : HookStatus.report()) {
            if (line.startsWith(family + ":")) return line;
        }
        return null;
    }

    @Test
    public void aTapOnAReelAtAPickedSpeedLeavesTheSpeedAlone() {
        assertTrue("Keep the reel speed starts on", Settings.KEEP_REEL_SPEED.get());
        Reel reel = new Reel(1.5f);
        tap(reel, 1f);
        assertEquals("a tap put the reel back to normal speed", 1.5f, reel.speed, 0f);
        tap(reel, 1f);
        assertEquals("a second tap put the reel back to normal speed", 1.5f, reel.speed, 0f);
    }

    @Test
    public void facebooksOwnHoldStillSpeedsUpAndItsLiftGivesBackThePickedSpeed() {
        Reel reel = new Reel(1.5f);
        facebooksHold(reel, 1f);
        assertEquals("the hold's lift put back Facebook's noted speed", 1.5f, reel.speed, 0f);
        tap(reel, 1f);
        assertEquals("a tap after the hold put a speed back", 1.5f, reel.speed, 0f);
    }

    @Test
    public void duringAHoldFacebooksNoStaysNo() {
        finger(MotionEvent.ACTION_DOWN);
        ReelHold.held();
        finger(MotionEvent.ACTION_UP);
        assertFalse("the guard said yes where Facebook said no", ReelHold.release(false));
    }

    @Test
    public void withKeepTheReelSpeedOffFacebooksAnswersStand() {
        Settings.KEEP_REEL_SPEED.save(false);
        Reel reel = new Reel(1.5f);
        tap(reel, 1f);
        assertEquals("the listener's put-back was held back with the switch off", 1f, reel.speed, 0f);
    }

    @Test
    public void withNeitherPatchInTheBuildFacebooksAnswersStand() {
        ReelHold.keepInBuildForTests = false;
        finger(MotionEvent.ACTION_DOWN);
        finger(MotionEvent.ACTION_UP);
        assertTrue(ReelHold.release(true));
        Reel reel = new Reel(1.5f);
        facebooksHold(reel, 1f);
        assertEquals("Facebook's put-back after its own hold was changed", 1f, reel.speed, 0f);
        assertNoFamilyCounted();
    }

    /** Neither reel patch's line in the report, so the guard's hooks counted under no family. */
    private static void assertNoFamilyCounted() {
        assertNull("Hold a reel for 2x counted the guard's hooks with neither patch in the build",
                line(FamilyNames.HOLD_REEL_FOR_2X));
        assertNull("Keep the reel speed counted the guard's hooks with neither patch in the build",
                line(FamilyNames.KEEP_REEL_SPEED));
    }

    /**
     * The guard goes in before either patch does its own part, so a build whose Keep the reel speed
     * refused, and that has no Hold a reel for 2x, carries these hooks with neither patch's status
     * on, which is how an unpatched extension reads. Facebook's answers stand there even with
     * Hold's switch on.
     */
    @Test
    public void withTheGuardButNeitherPatchsStatusFacebooksAnswersStand() {
        ReelHold.holdInBuildForTests = null;
        ReelHold.keepInBuildForTests = null;
        assertTrue(Settings.HOLD_REEL_FOR_2X.get());
        finger(MotionEvent.ACTION_DOWN);
        finger(MotionEvent.ACTION_UP);
        assertTrue("a tap's lift lost Facebook's put-back", ReelHold.release(true));
        Reel reel = new Reel(1.5f);
        facebooksHold(reel, 1f);
        assertEquals("Facebook's put-back after its own hold was changed", 1f, reel.speed, 0f);
        assertNoFamilyCounted();
    }

    @Test
    public void holdSwitchedOffWithKeepTheReelSpeedOnStillGuards() {
        ReelHold.holdInBuildForTests = true;
        Settings.HOLD_REEL_FOR_2X.save(false);
        Reel reel = new Reel(1.5f);
        tap(reel, 1f);
        assertEquals("a tap put the reel back to normal speed", 1.5f, reel.speed, 0f);
    }

    @Test
    public void theGuardCountsUnderKeepTheReelSpeed() {
        tap(new Reel(1.5f), 1f);
        assertNull("Hold a reel for 2x isn't in this build", line(FamilyNames.HOLD_REEL_FOR_2X));
        String keep = line(FamilyNames.KEEP_REEL_SPEED);
        assertTrue("no Keep the reel speed line: " + HookStatus.report(), keep != null && keep.contains("invoked"));
    }
}
