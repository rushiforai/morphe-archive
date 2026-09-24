package app.yydarlinker.deepseekcaptions;

/** Pure virtual-clock regression harness for callback quiet, seek, pause and rate smoothing. */
public final class PlaybackClockEstimatorHarness {
    public static void main(String[] args) {
        PlaybackClockEstimator clock = new PlaybackClockEstimator();
        clock.reset(0L, 1_000L, 1f);

        PlaybackClockEstimator.Update oneX = clock.update(1_000L, 2_000L, 2_900L);
        assertFalse(oneX.seek, "1x sample");
        assertNear(1f, oneX.playbackRate, 0.05f, "1x rate");

        clock.update(3_000L, 3_000L, 2_900L);
        clock.update(5_000L, 4_000L, 2_900L);
        assertTrue(clock.playbackRate() > 1.4f, "rate smoothing moves toward 2x");

        PlaybackClockEstimator.Update quiet = clock.update(17_000L, 10_000L, 2_900L);
        assertTrue(quiet.callbackWasStale, "long callback gap marked stale");
        assertFalse(quiet.seek, "normal 2x progress after quiet is not a seek");

        PlaybackClockEstimator.Update reanchored = clock.update(19_000L, 11_000L, 2_900L);
        assertFalse(reanchored.seek, "first fresh sample after quiet reanchors rate");
        assertNear(2f, reanchored.playbackRate, 0.05f, "rate sample reset after quiet");

        PlaybackClockEstimator.Update paused = clock.update(19_000L, 12_000L, 2_900L);
        assertNear(0f, paused.playbackRate, 0.01f, "pause resets rate sampling");
        PlaybackClockEstimator.Update resumed = clock.update(21_000L, 13_000L, 2_900L);
        assertNear(2f, resumed.playbackRate, 0.05f, "resume establishes fresh rate");

        assertDelayedPause(1_600L);
        assertDelayedPause(2_000L);
        assertDelayedPause(2_400L);

        PlaybackClockEstimator.Update obviousSeek = clock.update(120_000L, 14_000L, 2_900L);
        assertTrue(obviousSeek.seek, "obvious user seek detected");
        assertNear(1f, obviousSeek.playbackRate, 0.05f, "seek resets rate sample");

        PlaybackClockEstimator oneToTwo = new PlaybackClockEstimator();
        oneToTwo.reset(0L, 1_000L, 1f);
        oneToTwo.update(1_000L, 2_000L, 2_900L);
        PlaybackClockEstimator.Update upshift = oneToTwo.update(7_400L, 5_200L, 2_900L);
        assertFalse(upshift.seek, "1x to 2x over 3.2s is a rate transition, not seek");
        assertNear(2f, upshift.playbackRate, 0.05f, "long-fresh upshift reanchors rate");

        PlaybackClockEstimator twoToOne = new PlaybackClockEstimator();
        twoToOne.reset(0L, 1_000L, 2f);
        twoToOne.update(2_000L, 2_000L, 2_900L);
        PlaybackClockEstimator.Update downshift = twoToOne.update(5_200L, 5_200L, 2_900L);
        assertFalse(downshift.seek, "2x to 1x over 3.2s is a rate transition, not seek");
        assertNear(1f, downshift.playbackRate, 0.05f, "long-fresh downshift reanchors rate");

        PlaybackClockEstimator forward = new PlaybackClockEstimator();
        forward.reset(0L, 1_000L, 1f);
        forward.update(1_000L, 2_000L, 2_900L);
        assertTrue(forward.update(25_000L, 5_200L, 2_900L).seek,
                "forward jump beyond plausible rate envelope is seek");

        PlaybackClockEstimator backward = new PlaybackClockEstimator();
        backward.reset(10_000L, 1_000L, 1f);
        backward.update(11_000L, 2_000L, 2_900L);
        assertTrue(backward.update(5_000L, 3_000L, 2_900L).seek,
                "obvious backward jump is seek");

        clock.reset(0L, 1_000L, 2f);
        long estimate = clock.estimate(7_000L);
        assertEquals(9_000L, estimate, "clock extrapolation is bounded at 4.5 seconds");

        System.out.println("PlaybackClockEstimatorHarness: OK");
    }

    private static void assertDelayedPause(long gapMs) {
        PlaybackClockEstimator delayed = new PlaybackClockEstimator();
        delayed.reset(0L, 1_000L, 2f);
        delayed.update(2_000L, 2_000L, 2_900L);
        long pausedAt = 2_000L + gapMs;
        PlaybackClockEstimator.Update pause = delayed.update(2_000L, pausedAt, 2_900L);
        assertFalse(pause.seek, "2x delayed pause is not seek at gap=" + gapMs);
        assertNear(0f, pause.playbackRate, 0.01f,
                "2x delayed pause sets zero rate at gap=" + gapMs);
        PlaybackClockEstimator.Update resume = delayed.update(
                4_000L, pausedAt + 1_000L, 2_900L
        );
        assertFalse(resume.seek, "resume after delayed pause is not seek at gap=" + gapMs);
        assertNear(2f, resume.playbackRate, 0.05f,
                "resume rebuilds 2x sample at gap=" + gapMs);
    }

    private static void assertTrue(boolean value, String label) {
        if (!value) throw new AssertionError(label);
    }

    private static void assertFalse(boolean value, String label) {
        if (value) throw new AssertionError(label);
    }

    private static void assertNear(float expected, float actual, float tolerance, String label) {
        if (Math.abs(expected - actual) > tolerance) {
            throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
        }
    }

    private static void assertEquals(long expected, long actual, String label) {
        if (expected != actual) {
            throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
        }
    }
}
