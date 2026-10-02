/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.reels;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Hold a reel for 2x: while the switch is on, a long press on a reel goes to Facebook's own
 * speed-up wherever it lands, every reel gets the release listener, and that listener puts the
 * speed back from the first lift it hears after a hold, never after a tap once it has. Off, paused
 * or before the settings are ready, every answer is Facebook's.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ReelHoldTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void start() {
        ReelHold.forget();
        HookStatus.clear();
        // A build with Hold a reel for 2x, as its patch's status says in one.
        ReelHold.holdInBuildForTests = true;
    }

    @After
    public void restore() {
        PauseForTests.resume();
        Settings.HOLD_REEL_FOR_2X.resetToDefault();
        BaseSettings.DEBUG.resetToDefault();
        ReelHold.forget();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static void finger(int action) {
        long now = SystemClock.uptimeMillis();
        MotionEvent event = MotionEvent.obtain(now, now, action, 100, 200, 0);
        ReelHold.touch(event);
        event.recycle();
    }

    /** A hold as Facebook's long-press handler makes it: the flag asked, then the speed-up. */
    private static void hold() {
        ReelHold.longPress(false);
        ReelHold.held();
    }

    /** Stands in for FbGrootPlayer: the speed it plays at, which only its setter changes, with the hook first in it. */
    private static final class Reel {
        float speed = 1f;

        void set(float facebooks) {
            speed = ReelHold.speedSet(this, facebooks);
        }
    }

    /** A hold on [reel] and its lift, where the release listener puts back [facebooks]. */
    private static void holdAndLift(Reel reel, float facebooks) {
        ReelHoldForTests.holdAndLift(reel, player -> ((Reel) player).speed, (player, speed) -> ((Reel) player).set(speed),
                facebooks);
    }

    /** A tap on a reel: the release listener hears the finger land and lift. True when either answer was yes. */
    private static boolean tapReleases() {
        finger(MotionEvent.ACTION_DOWN);
        boolean down = ReelHold.release(false);
        finger(MotionEvent.ACTION_UP);
        return ReelHold.release(false) || down;
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.HOLD_REEL_FOR_2X + ":")) return line;
        }
        return null;
    }

    @Test
    public void aHoldAnywhereOnAReelGoesToTheSpeedUpAndTheLiftPutsTheSpeedBack() {
        assertTrue("the switch starts off", Settings.HOLD_REEL_FOR_2X.get());
        assertTrue("a reel got no release listener", ReelHold.speedUp(false));
        finger(MotionEvent.ACTION_DOWN);
        assertFalse("the listener put a speed back before the hold", ReelHold.release(false));
        assertTrue("the long press went to Facebook's menu", ReelHold.longPress(false));
        assertTrue("a hold in the middle of the reel didn't count", ReelHold.anywhere(false));
        ReelHold.held();
        finger(MotionEvent.ACTION_MOVE);
        assertTrue("the listener didn't hear the hold's slide", ReelHold.release(false));
        finger(MotionEvent.ACTION_UP);
        assertTrue("the lift didn't put the speed back", ReelHold.release(false));
        assertEquals(FamilyNames.HOLD_REEL_FOR_2X + ": invoked 7, 5 found, 0 missing. Counted: "
                + ReelHold.HELD + " 1", statusLine());
    }

    /**
     * The listener hears every touch, and with the flags on it would put back the speed the reel had
     * before its last hold. Once the hold's lift has put the speed back, a tap doesn't.
     */
    @Test
    public void aTapAfterAHoldLeavesTheSpeedAlone() {
        finger(MotionEvent.ACTION_DOWN);
        hold();
        finger(MotionEvent.ACTION_UP);
        assertTrue(ReelHold.release(false));
        assertFalse("a tap after the hold put a speed back", tapReleases());
        assertFalse("a second tap put a speed back", tapReleases());
    }

    /**
     * The release listener reads whether a hold is on as it stood when the reel was last drawn, and
     * the speed-up has the reel drawn again. A lift before that reaches a listener that doesn't put
     * the speed back, or none at all, and the reel would stay at 2x. The hold lasts until a lift is
     * heard, so the next gesture's lift puts the speed back, and a tap after that is a plain tap.
     */
    @Test
    public void aLiftNoListenerHeardLeavesTheHoldForTheNextLift() {
        finger(MotionEvent.ACTION_DOWN);
        hold();
        finger(MotionEvent.ACTION_UP);

        finger(MotionEvent.ACTION_DOWN);
        assertTrue("the next gesture's listener was told the hold was over", ReelHold.release(false));
        finger(MotionEvent.ACTION_UP);
        assertTrue("the next lift didn't put the speed back", ReelHold.release(false));
        assertTrue("the release flag and the speed-up flag disagreed on the same lift", ReelHold.release(false));

        assertFalse("a tap after the speed went back put a speed back", tapReleases());
    }

    /** A cancelled gesture ends the hold as a lift does, as the listener takes either. */
    @Test
    public void aCancelPutsTheSpeedBackOnce() {
        finger(MotionEvent.ACTION_DOWN);
        hold();
        finger(MotionEvent.ACTION_CANCEL);
        assertTrue(ReelHold.release(false));
        assertFalse("a tap after the cancel put a speed back", tapReleases());
    }

    /** An ad's long press opens Facebook's menu, never the speed-up: no hold to count or put back. */
    @Test
    public void anAdsLongPressIsNoHold() {
        finger(MotionEvent.ACTION_DOWN);
        assertTrue(ReelHold.longPress(false));
        finger(MotionEvent.ACTION_UP);
        assertFalse("the lift after an ad's long press put a speed back", ReelHold.release(false));
        assertFalse("a tap after an ad's long press put a speed back", tapReleases());
        assertEquals(FamilyNames.HOLD_REEL_FOR_2X + ": invoked 4, 2 found, 0 missing", statusLine());
    }

    /**
     * Facebook's lift puts back the speed its listener noted, and on a reel Keep the reel speed
     * started at a kept 2x that's normal speed: the speed-up takes a reel already at the hold speed
     * for one at normal speed, and a listener drawn before the kept speed went on noted normal speed
     * too. The reel goes back to the kept speed, and a tap after the hold leaves it there.
     */
    @Test
    public void aReelAtAKeptSpeedGoesBackToItAfterAHold() {
        Reel reel = new Reel();
        reel.set(2f);
        holdAndLift(reel, 1f);
        assertEquals("the lift put back Facebook's speed, not the kept one", 2f, reel.speed, 0f);
        assertFalse("a tap after the hold put a speed back", tapReleases());
        holdAndLift(reel, 1f);
        assertEquals("a second hold didn't go back to the kept speed", 2f, reel.speed, 0f);
    }

    @Test
    public void aReelAtNormalSpeedGoesBackToNormal() {
        Reel reel = new Reel();
        holdAndLift(reel, 1f);
        assertEquals(1f, reel.speed, 0f);
    }

    /** A speed picked in the menu comes back after a hold, whether the listener noted it or was drawn before the pick. */
    @Test
    public void aSpeedPickedInTheMenuComesBackAfterAHold() {
        Reel reel = new Reel();
        reel.set(2.5f);
        holdAndLift(reel, 1f);
        assertEquals(2.5f, reel.speed, 0f);
        holdAndLift(reel, 2.5f);
        assertEquals(2.5f, reel.speed, 0f);
    }

    /**
     * A hold that starts before the last one's speed went back, after a lift no listener heard, finds
     * the reel at the first hold's 2x. Its lift goes back to the speed from before the first hold.
     */
    @Test
    public void aHoldBeforeTheLastOnesSpeedWentBackEndsAtTheSpeedBeforeBoth() {
        Reel reel = new Reel();
        reel.set(1.5f);
        ReelHold.speeds = player -> ((Reel) player).speed;
        finger(MotionEvent.ACTION_DOWN);
        hold();
        reel.set(2f);
        finger(MotionEvent.ACTION_UP);
        holdAndLift(reel, 1f);
        assertEquals(1.5f, reel.speed, 0f);
    }

    /** Only the reel held gets its speed back: a speed another player gets at the lift goes on as Facebook set it. */
    @Test
    public void anotherPlayerKeepsTheSpeedFacebookSets() {
        Reel held = new Reel();
        held.set(2f);
        Reel other = new Reel();
        ReelHold.speeds = player -> ((Reel) player).speed;
        finger(MotionEvent.ACTION_DOWN);
        hold();
        held.set(2f);
        finger(MotionEvent.ACTION_UP);
        assertTrue(ReelHold.release(false));
        other.set(1f);
        assertEquals(1f, other.speed, 0f);
        // Another player's speed set before the held reel's lift, a next reel Facebook readies say,
        // leaves the held reel's own lift to put its speed back.
        held.set(1f);
        assertEquals("the held reel's lift after another player's set lost the speed from before", 2f, held.speed, 0f);
    }

    /**
     * A lift that never sets the held reel's speed doesn't leave the wait standing: past the window
     * after the release listener asked, the same pooled player's next set, for a reel Facebook moved
     * on to without a touch, goes on as Facebook set it.
     */
    @Test
    public void aMissedLiftDoesNotOverrideTheNextReelOnTheSamePlayer() {
        Reel held = new Reel();
        held.set(2f);
        ReelHold.speeds = player -> ((Reel) player).speed;
        finger(MotionEvent.ACTION_DOWN);
        hold();
        held.set(2f);
        finger(MotionEvent.ACTION_UP);
        assertTrue(ReelHold.release(false));
        SystemClock.sleep(ReelHold.BACK_WINDOW_MS + 1);
        held.set(1f);
        assertEquals("a set long after the release was taken for the lift", 1f, held.speed, 0f);
    }

    /** Where the player's speed can't be read, as before the patch fills the getter in, the lift's speed goes on. */
    @Test
    public void anUnreadSpeedLeavesFacebooksSpeed() {
        Reel reel = new Reel();
        reel.set(2f);
        ReelHoldForTests.holdAndLift(reel, player -> Float.NaN, (player, speed) -> reel.set(speed), 1f);
        assertEquals(1f, reel.speed, 0f);
    }

    @Test
    public void aFailingSpeedReadIsReportedAndFacebooksSpeedGoesOn() {
        Reel reel = new Reel();
        reel.set(2f);
        ReelHoldForTests.holdAndLift(reel, player -> {
            throw new IllegalStateException("the getter failed");
        }, (player, speed) -> reel.set(speed), 1f);
        assertEquals(1f, reel.speed, 0f);
        assertTrue(HookStatus.missing(FamilyNames.HOLD_REEL_FOR_2X).get(0)
                .startsWith("a working 'speed set' hook (it threw "));
    }

    @Test
    public void offOrPausedTheSetterGetsFacebooksSpeed() {
        Reel reel = new Reel();
        reel.set(2f);
        ReelHold.speeds = player -> ((Reel) player).speed;
        finger(MotionEvent.ACTION_DOWN);
        hold();
        reel.set(2f);
        finger(MotionEvent.ACTION_UP);
        assertTrue(ReelHold.release(false));
        Settings.HOLD_REEL_FOR_2X.save(false);
        reel.set(1f);
        assertEquals("off, the lift's speed changed", 1f, reel.speed, 0f);
        Settings.HOLD_REEL_FOR_2X.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals("paused, a speed set changed", 1.5f, ReelHold.speedSet(reel, 1.5f), 0f);
    }

    /** A pinch's second finger is part of the same gesture, so a hold stays a hold. */
    @Test
    public void aSecondFingerKeepsTheHold() {
        finger(MotionEvent.ACTION_DOWN);
        hold();
        finger(MotionEvent.ACTION_POINTER_DOWN);
        assertTrue(ReelHold.release(false));
        finger(MotionEvent.ACTION_POINTER_UP);
        assertTrue("the first finger up ended the hold", ReelHold.release(false));
    }

    @Test
    public void offEveryAnswerIsFacebooks() {
        Settings.HOLD_REEL_FOR_2X.save(false);
        for (boolean facebooks : new boolean[] {false, true}) {
            finger(MotionEvent.ACTION_DOWN);
            assertEquals(facebooks, ReelHold.longPress(facebooks));
            assertEquals(facebooks, ReelHold.anywhere(facebooks));
            assertEquals(facebooks, ReelHold.speedUp(facebooks));
            ReelHold.held();
            assertEquals(facebooks, ReelHold.release(facebooks));
        }
        assertEquals(FamilyNames.HOLD_REEL_FOR_2X + ": invoked 10, 0 found, 0 missing", statusLine());
    }

    @Test
    public void pausedEveryAnswerIsFacebooks() {
        for (HushfacebookPause.Reason reason : new HushfacebookPause.Reason[] {
                HushfacebookPause.Reason.SWITCH, HushfacebookPause.Reason.CRASH_LOOP}) {
            PauseForTests.pause(reason);
            finger(MotionEvent.ACTION_DOWN);
            assertFalse(reason.name(), ReelHold.longPress(false));
            assertFalse(reason.name(), ReelHold.anywhere(false));
            assertFalse(reason.name(), ReelHold.speedUp(false));
            ReelHold.held();
            assertFalse(reason.name(), ReelHold.release(false));
            assertTrue(reason.name(), ReelHold.release(true));
        }
        PauseForTests.resume();
        assertTrue(ReelHold.longPress(false));
    }

    /**
     * Outside the Video tab Facebook holds at a fixed 2x, but where an account's Reels live in the
     * Video tab the hold speed is a server value, which may say normal speed for an account the
     * server never gave the feature. While on, a hold speed that isn't faster than normal is 2x, and
     * a faster one the server picked stays.
     */
    @Test
    public void aHoldSpeedThatIsNoSpeedUpBecomes2x() {
        assertEquals(2.0, ReelHold.holdSpeed(1.0), 0.0);
        assertEquals(2.0, ReelHold.holdSpeed(0.0), 0.0);
        assertEquals(2.0, ReelHold.holdSpeed(Double.NaN), 0.0);
        assertEquals(2.0, ReelHold.holdSpeed(2.0), 0.0);
        assertEquals(1.5, ReelHold.holdSpeed(1.5), 0.0);
        assertEquals(3.0, ReelHold.holdSpeed(3.0), 0.0);

        Settings.HOLD_REEL_FOR_2X.save(false);
        assertEquals("off, Facebook's hold speed changed", 1.0, ReelHold.holdSpeed(1.0), 0.0);
        Settings.HOLD_REEL_FOR_2X.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertEquals("paused, Facebook's hold speed changed", 1.0, ReelHold.holdSpeed(1.0), 0.0);
    }

    /**
     * With Debug logging on, the speed Facebook's speed setter gets when a hold speeds a reel up and
     * when its lift puts the speed back has a line each, for a phone check where the reel is muted,
     * and so does a lift whose speed the hook changed. Other speeds set don't.
     */
    @Test
    public void debugLoggingSaysWhatSpeedAHoldSetAndWhatItWentBackTo() {
        BaseSettings.DEBUG.save(true);
        Reel reel = new Reel();
        reel.set(1.5f);
        LogBufferManager.clearLogBuffer();
        holdAndLift(reel, 1f);
        holdAndLift(reel, 1.5f);
        finger(MotionEvent.ACTION_DOWN);
        reel.set(1.25f);
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("Reel hold: speed 2.0x, the reel was at 1.5x"));
        // The first lift's speed was changed, the second's already was the speed before the hold.
        assertEquals(report, 1, report.split("Reel hold: back to 1.5x \\(the speed before the hold\\)", -1).length - 1);
        assertEquals(report, 2, report.split("Reel hold: back to 1.5x", -1).length - 1);
        assertTrue(report, !report.contains("1.25"));
    }

    /**
     * Facebook's own yes to a long-press flag stays yes with the switch on, and its yes to the release
     * flags holds only once a hold sped the reel up too, since the listener would otherwise undo a
     * picked speed.
     */
    @Test
    public void onFacebooksOwnSpeedUpStaysAndItsReleaseWaitsForAHold() {
        assertTrue(ReelHold.anywhere(true));
        assertTrue(ReelHold.speedUp(true));
        finger(MotionEvent.ACTION_DOWN);
        assertFalse("a tap put a speed back", ReelHold.release(true));
        assertTrue(ReelHold.longPress(true));
        ReelHold.held();
        assertTrue(ReelHold.release(true));
    }
}
