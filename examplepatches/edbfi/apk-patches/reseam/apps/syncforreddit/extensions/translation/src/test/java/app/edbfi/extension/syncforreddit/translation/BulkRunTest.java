// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.function.IntConsumer;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public final class BulkRunTest {
    @Test
    public void repeatedModelsAreSkippedAndOtherLanguagesStillRun() {
        BulkRun run = new BulkRun(6);
        List<String> waited = new ArrayList<>();
        for (String language : List.of("fr", "es", "fr", "de", "es", "fr")) {
            if (run.hasTimedOut(language)) continue;
            waited.add(language);
            if (language.equals("fr")) run.recordTimeout(language);
        }

        assertEquals(List.of("fr", "es", "de", "es"), waited);
        assertEquals("Timed out waiting for a translation model. Run Translate all again.", run.message(false));
        assertEquals("Some text could not be translated. Run Translate all again.", run.message(true));
    }

    @Test
    public void retryStartsWithNoSkippedLanguagesOrFailures() {
        BulkRun previous = new BulkRun(2);
        previous.recordTimeout("fr");
        previous.recordFailure("Unable to translate the text.");

        BulkRun retry = new BulkRun(2);
        assertFalse(retry.hasTimedOut("fr"));
        assertEquals("No new translations", retry.message(false));
        assertEquals("Translation complete", retry.message(true));
    }

    @Test
    public void canceledAndLateCallbacksDoNotAdvanceOrAffectAnotherLanguage() {
        BulkRun run = new BulkRun(2);
        List<ModelWait.Result> completions = new ArrayList<>();
        ModelWait french = new ModelWait(result -> {
            if (result == ModelWait.Result.TIMED_OUT) run.recordTimeout("fr");
            completions.add(result);
        });
        french.run();

        ModelWait canceled = new ModelWait(result -> {
            if (result == ModelWait.Result.TIMED_OUT) run.recordTimeout("es");
            completions.add(result);
        });
        canceled.cancel();
        french.complete(true);
        canceled.run();
        canceled.complete(false);

        assertTrue(run.hasTimedOut("fr"));
        assertFalse(run.hasTimedOut("es"));
        assertEquals(List.of(ModelWait.Result.TIMED_OUT), completions);
    }

    @Test
    public void rowFailureContinuesAndKeepsTranslationsOnBothSides() {
        BulkRun run = new BulkRun(3);
        String[] staged = {"First translation", null, null};
        List<List<String>> saved = new ArrayList<>();
        IntConsumer advance = completed -> {
            assertEquals(1, completed);
            staged[completed + 1] = "Last translation";
            saveStaged(staged, saved);
        };

        run.detectionFailed(1, "Unable to detect the source language.", false, advance);

        assertEquals(List.of(List.of("First translation", "Last translation")), saved);
        assertEquals("Some text could not be translated. Run Translate all again.", run.message(true));
    }

    @Test
    public void dependencyFailureCompletesOnceWithOnlyPriorSuccesses() {
        BulkRun run = new BulkRun(4);
        run.recordFailure("Unable to detect the source language.");
        run.recordTimeout("fr");
        String[] staged = {"First translation", null, null, null};
        List<List<String>> saved = new ArrayList<>();
        IntConsumer advance = completed -> {
            assertEquals(3, completed);
            saveStaged(staged, saved);
        };

        run.detectionFailed(2, "Automatic language detection is unavailable.", true, advance);
        run.detectionFailed(2, "Another failure", true, advance);
        run.detectionFailed(2, "A late row failure", false, advance);

        assertEquals(List.of(List.of("First translation")), saved);
        assertEquals("Automatic language detection is unavailable.", run.message(false));
        assertEquals("Saved the translations completed so far. Automatic language detection is unavailable.",
                run.message(true));
    }

    // Simulate only the stock completion boundary. Sync's provider ignores unpopulated entries.
    private static void saveStaged(String[] staged, List<List<String>> saved) {
        saved.add(Arrays.stream(staged).filter(Objects::nonNull).toList());
    }
}
