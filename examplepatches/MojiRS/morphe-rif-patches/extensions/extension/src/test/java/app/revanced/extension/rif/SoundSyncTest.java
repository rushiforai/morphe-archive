package app.revanced.extension.rif;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** JVM tests for the sound/picture sync decision in {@link SoundSync}. */
public class SoundSyncTest {

    // The sound normally runs 75-146 ms behind the picture: that alone must never re-seek.
    @Test
    public void normalLagDoesNotReseek() {
        for (int drift = -300; drift <= 300; drift += 10) {
            int action = SoundSync.decide(drift, 0, true, false, SoundSync.RESEEK_DRIFT_MS);
            assertEquals("drift " + drift, true, action != SoundSync.RESEEK);
        }
    }

    @Test
    public void reallyLargeDriftReseeks() {
        assertEquals(SoundSync.RESEEK, SoundSync.decide(-501, 0, true, false, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.RESEEK, SoundSync.decide(900, 0, false, false, SoundSync.RESEEK_DRIFT_MS));
    }

    // A stall right after a re-seek looks like drift but must not trigger another seek.
    @Test
    public void noSecondReseekDuringCooldown() {
        assertEquals(SoundSync.NONE, SoundSync.decide(-1500, 0, true, true, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.NONE, SoundSync.decide(1500, 0, false, true, SoundSync.RESEEK_DRIFT_MS));
    }

    @Test
    public void moderateDriftNudgesTowardsTheVideo() {
        assertEquals(SoundSync.SPEED_UP, SoundSync.decide(-200, 0, true, false, SoundSync.RESEEK_DRIFT_MS)); // sound behind: faster
        assertEquals(SoundSync.SLOW_DOWN, SoundSync.decide(200, 0, true, false, SoundSync.RESEEK_DRIFT_MS)); // sound ahead: slower
        assertEquals(SoundSync.NONE, SoundSync.decide(-100, 0, true, false, SoundSync.RESEEK_DRIFT_MS));
    }

    @Test
    public void noNudgeWhenSpeedCannotChange() {
        assertEquals(SoundSync.NONE, SoundSync.decide(-300, 0, false, false, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.RESET_SPEED, SoundSync.decide(-300, 1, false, false, SoundSync.RESEEK_DRIFT_MS));
    }

    @Test
    public void nudgeEndsWhenCloseOrPast() {
        assertEquals(SoundSync.NONE, SoundSync.decide(-100, 1, true, false, SoundSync.RESEEK_DRIFT_MS)); // still behind: keep going
        assertEquals(SoundSync.RESET_SPEED, SoundSync.decide(-50, 1, true, false, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.RESET_SPEED, SoundSync.decide(30, 1, true, false, SoundSync.RESEEK_DRIFT_MS)); // overshot
        assertEquals(SoundSync.NONE, SoundSync.decide(100, -1, true, false, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.RESET_SPEED, SoundSync.decide(50, -1, true, false, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.RESET_SPEED, SoundSync.decide(-30, -1, true, false, SoundSync.RESEEK_DRIFT_MS));
    }

    @Test
    public void largeDriftWhileNudgingStillReseeksOnce() {
        assertEquals(SoundSync.RESEEK, SoundSync.decide(-600, 1, true, false, SoundSync.RESEEK_DRIFT_MS));
        assertEquals(SoundSync.NONE, SoundSync.decide(-600, 1, true, true, SoundSync.RESEEK_DRIFT_MS));
    }

    // A coarsely reported position (e.g. 500 ms steps) shows up to ~500 ms of fake drift: the
    // wider limit must not re-seek on it, while a really large drift still does.
    @Test
    public void coarsePositionNeedsABiggerDrift() {
        assertEquals(SoundSync.NONE, SoundSync.decide(-600, 0, false, false, SoundSync.RESEEK_DRIFT_COARSE_MS));
        assertEquals(SoundSync.RESEEK, SoundSync.decide(-900, 0, false, false, SoundSync.RESEEK_DRIFT_COARSE_MS));
    }

    // One stale or jumped reading must not decide anything: the median of a window does.
    @Test
    public void medianIgnoresOutliers() {
        assertEquals(100, SoundSync.median(new int[]{90, 700, 100, -400, 110}, 5));
        assertEquals(100, SoundSync.median(new int[]{100, 900, 0, 0, 0}, 3));
        assertEquals(5, SoundSync.median(new int[]{5}, 1));
    }
}
