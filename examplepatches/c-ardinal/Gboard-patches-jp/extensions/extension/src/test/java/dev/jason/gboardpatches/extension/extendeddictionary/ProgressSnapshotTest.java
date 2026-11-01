package dev.jason.gboardpatches.extension.extendeddictionary;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.res.Configuration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;

import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

import dev.jason.gboardpatches.extension.R;

/** The dialog only ever sees whole snapshots, and its ring never moves back. */
@RunWith(RobolectricTestRunner.class)
public final class ProgressSnapshotTest {
    private static final List<PhasedEta.Phase> PLAN = Arrays.asList(PhasedEta.Phase.REPAIR,
            PhasedEta.Phase.RECONCILE, PhasedEta.Phase.DEDUPE, PhasedEta.Phase.INSERT,
            PhasedEta.Phase.STORE_WRITE);

    @Test
    public void concurrentReadsSeeOnlyConsistentSnapshotsAndARisingRing() throws Exception {
        Map<PhasedEta.Phase, Integer> totals = new EnumMap<>(PhasedEta.Phase.class);
        totals.put(PhasedEta.Phase.REPAIR, 1_000);
        totals.put(PhasedEta.Phase.RECONCILE, 300_000);
        totals.put(PhasedEta.Phase.DEDUPE, 100_000);
        totals.put(PhasedEta.Phase.INSERT, 100_000);
        totals.put(PhasedEta.Phase.STORE_WRITE, 100_000);
        ExtendedDictionaryProgressDialog.Job job = new ExtendedDictionaryProgressDialog.Job(
                R.string.gboard_patches_extended_dictionary_progress_import_title, true,
                "import", PLAN, Collections.emptyMap());
        AtomicBoolean writing = new AtomicBoolean(true);
        Thread writer = new Thread(() -> {
            for (PhasedEta.Phase phase : PLAN) {
                int total = totals.get(phase);
                for (int done = 0; done <= total; done += Math.max(1, total / 400)) {
                    job.onProgress(phase, done, total);
                }
                job.onProgress(phase, total, total);
            }
            writing.set(false);
        });
        writer.start();
        float ring = 0f;
        int reads = 0;
        while (writing.get() || reads == 0) {
            ExtendedDictionaryProgressDialog.Snapshot state = job.snapshot.get();
            if (state == null) {
                continue;
            }
            reads++;
            assertEquals("count and total come from one update",
                    (int) totals.get(state.phase), state.total);
            assertTrue(state.done >= 0 && state.done <= state.total);
            assertTrue("ring never moves back", state.overallFraction >= ring);
            assertTrue(state.overallFraction <= 1f);
            ring = state.overallFraction;
        }
        writer.join();
        assertTrue(reads > 0);
    }

    @Test
    public void aLateStalePostCannotPullTheRingBack() {
        ExtendedDictionaryProgressDialog.Job job = new ExtendedDictionaryProgressDialog.Job(
                R.string.gboard_patches_extended_dictionary_progress_import_title, true,
                "import", PLAN, Collections.emptyMap());
        job.onProgress(PhasedEta.Phase.INSERT, 90_000, 100_000);
        float before = job.snapshot.get().overallFraction;

        job.onProgress(PhasedEta.Phase.DEDUPE, 100, 100_000);

        ExtendedDictionaryProgressDialog.Snapshot state = job.snapshot.get();
        assertNotNull(state);
        assertEquals(PhasedEta.Phase.DEDUPE, state.phase);
        assertEquals(100, state.done);
        assertEquals(100_000, state.total);
        assertTrue(state.overallFraction >= before);
    }

    @Test
    public void phaseLabelsExplainPerPhaseCounts() {
        Context english = localized(Locale.ENGLISH);
        assertEquals("Adding words", ExtendedDictionaryProgressDialog.phaseLabel(
                english, PhasedEta.Phase.INSERT));
        for (PhasedEta.Phase phase : PhasedEta.Phase.values()) {
            assertTrue(ExtendedDictionaryProgressDialog.phaseLabel(
                    localized(Locale.forLanguageTag("zh-Hant")), phase).matches(".*\\p{IsHan}.*"));
        }
    }

    private static Context localized(Locale locale) {
        Context application = RuntimeEnvironment.getApplication();
        Configuration configuration =
                new Configuration(application.getResources().getConfiguration());
        configuration.setLocale(locale);
        return application.createConfigurationContext(configuration);
    }
}
