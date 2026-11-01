package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/** The ring follows work done: weights sum to 1, it never decreases and ends at exactly 1. */
@RunWith(RobolectricTestRunner.class)
public final class WorkFractionTest {
    private static final List<PhasedEta.Phase> PLAN = Arrays.asList(PhasedEta.Phase.PARSE,
            PhasedEta.Phase.RECONCILE, PhasedEta.Phase.DEDUPE, PhasedEta.Phase.INSERT,
            PhasedEta.Phase.STORE_WRITE);
    private static final int[] TOTALS = {4_000_000, 300_000, 100_000, 100_000, 100_000};

    @Test
    public void weightsAreNormalisedEstimatedDurations() {
        PhasedEta eta = plannedEta();
        eta.sample(PhasedEta.Phase.PARSE, 0, 0, TOTALS[0]);

        double[] weights = eta.weights();
        assertEquals(1d, Arrays.stream(weights).sum(), 1e-9);
        double insert = TOTALS[3] / PhasedEta.Phase.INSERT.defaultRate;
        double dedupe = TOTALS[2] / PhasedEta.Phase.DEDUPE.defaultRate;
        assertEquals(insert / dedupe, weights[3] / weights[2], 1e-9);
    }

    @Test
    public void arbitraryInterleavingsAreMonotoneAndEndAtExactlyOne() {
        for (long seed = 1; seed <= 25; seed++) {
            PhasedEta eta = plannedEta();
            List<int[]> posts = new ArrayList<>();
            for (int phase = 0; phase < PLAN.size(); phase++) {
                for (int done = 0; done < TOTALS[phase]; done += TOTALS[phase] / 37) {
                    posts.add(new int[] {phase, done});
                }
            }
            // Shuffle locally so that late posts of earlier phases arrive after later ones.
            Random random = new Random(seed);
            for (int index = 0; index + 1 < posts.size(); index++) {
                if (random.nextInt(4) == 0) {
                    Collections.swap(posts, index, index + 1 + random.nextInt(
                            Math.min(8, posts.size() - index - 1)));
                }
            }
            float previous = 0f;
            int previousPercent = 0;
            long now = 0;
            for (int[] post : posts) {
                now += 10_000_000L;
                eta.sample(PLAN.get(post[0]), now, post[1], TOTALS[post[0]]);
                float fraction = eta.workFraction();
                assertTrue("seed " + seed + ": " + fraction + " < " + previous,
                        fraction >= previous);
                int percent = Integer.parseInt(ExtendedDictionaryProgressDialog
                        .percentText(fraction).replace("%", ""));
                assertTrue(percent >= previousPercent);
                previous = fraction;
                previousPercent = percent;
            }
            for (int phase = 0; phase < PLAN.size(); phase++) {
                eta.sample(PLAN.get(phase), now += 10_000_000L, TOTALS[phase], TOTALS[phase]);
            }
            assertEquals(1f, eta.workFraction(), 0f);
            assertEquals("100%", ExtendedDictionaryProgressDialog.percentText(eta.workFraction()));
        }
    }

    @Test
    public void anEmptyPhaseCountsInFullAtOnce() {
        PhasedEta eta = plannedEta();
        eta.sample(PhasedEta.Phase.PARSE, 0, TOTALS[0], TOTALS[0]);
        eta.sample(PhasedEta.Phase.RECONCILE, 1, 0, 0);
        double[] weights = eta.weights();

        assertEquals(weights[0] + weights[1], eta.workFraction(), 1e-6);
    }

    @Test
    public void completionIsExactlyOneHundredPercent() {
        PhasedEta eta = plannedEta();
        eta.sample(PhasedEta.Phase.PARSE, 0, 10, TOTALS[0]);
        assertTrue(eta.workFraction() < 0.01f);

        eta.markComplete();

        assertEquals(1f, eta.workFraction(), 0f);
    }

    private static PhasedEta plannedEta() {
        PhasedEta eta = new PhasedEta(PLAN, Collections.emptyMap());
        for (int phase = 0; phase < PLAN.size(); phase++) {
            eta.expect(PLAN.get(phase), TOTALS[phase]);
        }
        return eta;
    }
}
