package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.SharedPreferences;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/** PhasedEta: per-phase rates, history from the previous run, and built-in defaults. */
@RunWith(RobolectricTestRunner.class)
public final class EtaEstimatorTest {
    private static final long SECOND = 1_000_000_000L;
    private static final long STEP = SECOND / 4;
    private static final List<PhasedEta.Phase> PLAN =
            Arrays.asList(PhasedEta.Phase.RECONCILE, PhasedEta.Phase.DELETE);
    private static final int STORED = 100_000;
    private static final int DELETED = 400_000;
    private static final double RECONCILE_RATE = 20_000d;
    private static final double DELETE_RATE = 200_000d;

    @Test
    public void slowThenFastJobConvergesAndOnlyRisesAtPhaseBoundaries() {
        PhasedEta eta = new PhasedEta(PLAN, Collections.emptyMap());
        run(eta, true);
        Map<PhasedEta.Phase, Double> measured = eta.measuredRates();
        assertEquals(RECONCILE_RATE, measured.get(PhasedEta.Phase.RECONCILE), 1_000);
        assertEquals(DELETE_RATE, measured.get(PhasedEta.Phase.DELETE), 10_000);
    }

    @Test
    public void ratesPersistedByOneRunMakeTheNextRunAccurateFromItsFirstSample() {
        SharedPreferences preferences = RuntimeEnvironment.getApplication()
                .getSharedPreferences("eta_test", Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
        PhasedEta first = new PhasedEta(PLAN, PhasedEta.loadRates(preferences, "remove"));
        run(first, false);
        PhasedEta.saveRates(preferences, "remove", first.measuredRates());
        assertTrue("rates are kept per job kind",
                PhasedEta.loadRates(preferences, "import").isEmpty());

        PhasedEta second = new PhasedEta(PLAN, PhasedEta.loadRates(preferences, "remove"));
        second.expect(PhasedEta.Phase.DELETE, DELETED);
        second.sample(PhasedEta.Phase.RECONCILE, 0, 0, STORED);
        double truth = STORED / RECONCILE_RATE + DELETED / DELETE_RATE;
        long shown = second.remainingSeconds(0);
        assertTrue("ETA " + shown + " vs " + truth, shown <= 2 * truth && shown >= truth / 2);
    }

    @Test
    public void missingRatesFallBackToTheBuiltInDefaults() {
        SharedPreferences preferences = RuntimeEnvironment.getApplication()
                .getSharedPreferences("eta_empty", Context.MODE_PRIVATE);
        preferences.edit().clear().commit();
        Map<PhasedEta.Phase, Double> rates = PhasedEta.loadRates(preferences, "import");
        assertTrue(rates.isEmpty());

        PhasedEta eta = new PhasedEta(PLAN, rates);
        assertEquals(-1L, eta.remainingSeconds(0));
        eta.expect(PhasedEta.Phase.DELETE, 60_000);
        eta.sample(PhasedEta.Phase.RECONCILE, 0, 0, 30_000);
        double expected = 30_000 / PhasedEta.Phase.RECONCILE.defaultRate
                + 60_000 / PhasedEta.Phase.DELETE.defaultRate;
        assertEquals((long) Math.ceil(expected), eta.remainingSeconds(0));
    }

    @Test
    public void aClearlyHigherFreshEstimateIsShownEvenWithinAPhase() {
        PhasedEta eta = new PhasedEta(Collections.singletonList(PhasedEta.Phase.DELETE),
                Collections.emptyMap());
        eta.sample(PhasedEta.Phase.DELETE, 0, 0, 100_000);
        eta.sample(PhasedEta.Phase.DELETE, SECOND, 50_000, 100_000);
        assertEquals(1L, eta.remainingSeconds(SECOND));
        // The job slows to 1,000 rows/s: 49k rows left is ~49 s, far above the shown 1 s.
        eta.sample(PhasedEta.Phase.DELETE, 3 * SECOND, 51_000, 100_000);
        eta.sample(PhasedEta.Phase.DELETE, 4 * SECOND, 52_000, 100_000);
        assertTrue(eta.remainingSeconds(4 * SECOND) > 10);
    }

    /** Reconcile at 20k rows/s, then delete at 200k rows/s, sampled every 250 ms. */
    private static void run(PhasedEta eta, boolean check) {
        eta.expect(PhasedEta.Phase.DELETE, DELETED);
        long now = 0;
        long previous = Long.MAX_VALUE;
        for (int done = 0; ; done = Math.min(STORED, done + (int) (RECONCILE_RATE / 4))) {
            eta.sample(PhasedEta.Phase.RECONCILE, now, done, STORED);
            long shown = eta.remainingSeconds(now);
            if (check) {
                assertTrue("non-increasing within a phase", shown <= previous);
            }
            previous = shown;
            if (done == STORED) {
                break;
            }
            now += STEP;
        }
        previous = Long.MAX_VALUE;
        for (int done = 0; ; done = Math.min(DELETED, done + (int) (DELETE_RATE / 4))) {
            eta.sample(PhasedEta.Phase.DELETE, now, done, DELETED);
            long shown = eta.remainingSeconds(now);
            if (check) {
                assertTrue("non-increasing within a phase", shown <= previous);
                if (done > 0) {
                    double truth = (DELETED - done) / DELETE_RATE;
                    assertTrue("ETA " + shown + " vs " + truth,
                            shown <= 2 * Math.max(truth, 1));
                }
            }
            previous = shown;
            if (done == DELETED) {
                break;
            }
            now += STEP;
        }
    }
}
