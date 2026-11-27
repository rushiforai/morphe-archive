package app.ayham.extension.music.automix;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** A mix's held addon player and automix's speed nudges of YT's player (HeldSettle). */
public class HeldSettleTest {
    private static final long LOOSE = 20, T0 = 100_000;

    @Test
    public void neverFollowedIsInStep() {
        HeldSettle h = new HeldSettle();
        assertTrue(h.inStep(T0, false));
        assertFalse("a nudge running", h.inStep(T0, true));
    }

    @Test
    public void aNudgesLagIsNotADrift() {
        // S21 FE, 2026-11-19: -25 ms read 300 ms into automix's x0.953 nudge: a relock, 4 s lost
        HeldSettle h = new HeldSettle();
        h.speedChanged(T0);
        assertFalse(h.reading(T0 + 300, false, -25, LOOSE));
        assertFalse(h.reading(T0 + HeldSettle.SETTLE_MS - 1, false, -25, LOOSE));
        // the same error once both players run at the speed: a real drift, used
        assertTrue(h.reading(T0 + HeldSettle.SETTLE_MS, false, -25, LOOSE));
    }

    @Test
    public void aReadingWhileTheNudgeRunsIsLagHoweverLate() {
        // automix's nudges last up to 1 s: past the settle but inside the nudge is still its lag
        HeldSettle h = new HeldSettle();
        h.speedChanged(T0);
        assertFalse(h.reading(T0 + 950, true, -25, LOOSE));
        assertFalse(h.inStep(T0 + 950, true));
        assertFalse(h.settled(T0 + 950, true));
    }

    @Test
    public void inStepWaitsForAConfirmingReading() {
        HeldSettle h = new HeldSettle();
        h.speedChanged(T0);
        assertFalse(h.inStep(T0 + 100, false));
        // past the lag but no reading yet: time alone isn't a lock
        assertFalse(h.inStep(T0 + HeldSettle.SETTLE_MS + 500, false));
        // a settled reading off by more than the lock's tolerance doesn't confirm it
        assertTrue(h.reading(T0 + HeldSettle.SETTLE_MS + 600, false, 35, LOOSE));
        assertFalse(h.inStep(T0 + HeldSettle.SETTLE_MS + 600, false));
        // one within it does
        assertTrue(h.reading(T0 + HeldSettle.SETTLE_MS + 700, false, -12, LOOSE));
        assertTrue(h.inStep(T0 + HeldSettle.SETTLE_MS + 700, false));
        // the next change takes it away again
        h.speedChanged(T0 + 5000);
        assertFalse(h.inStep(T0 + 5000 + HeldSettle.SETTLE_MS, false));
    }

    @Test
    public void aLagReadingConfirmsNothing() {
        HeldSettle h = new HeldSettle();
        h.speedChanged(T0);
        // within the tolerance but inside the lag: not a confirmation
        assertFalse(h.reading(T0 + 200, false, 3, LOOSE));
        assertFalse(h.inStep(T0 + HeldSettle.SETTLE_MS, false));
    }

    @Test
    public void aNewLockConfirms() {
        HeldSettle h = new HeldSettle();
        h.speedChanged(T0);
        h.locked();
        assertFalse("still inside the lag", h.inStep(T0 + 100, false));
        assertTrue(h.inStep(T0 + HeldSettle.SETTLE_MS, false));
    }
}
