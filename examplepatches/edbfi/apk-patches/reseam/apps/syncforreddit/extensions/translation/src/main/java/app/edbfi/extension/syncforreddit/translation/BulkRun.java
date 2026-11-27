// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import java.util.HashSet;
import java.util.Set;
import java.util.function.IntConsumer;

final class BulkRun {
    private final int lastIndex;
    private final Set<String> timedOutLanguages = new HashSet<>();
    private String failure;
    private String stopReason;

    BulkRun(int rowCount) {
        lastIndex = rowCount - 1;
    }

    boolean hasTimedOut(String language) {
        return timedOutLanguages.contains(language);
    }

    void recordTimeout(String language) {
        timedOutLanguages.add(language);
    }

    void recordFailure(String message) {
        if (failure == null) failure = message;
    }

    void detectionFailed(int index, String message, boolean unavailable, IntConsumer advance) {
        if (stopReason != null) return;
        if (unavailable) {
            stopReason = message;
            // Advancing past the final row commits the populated entries in Sync's results array.
            advance.accept(lastIndex);
        } else {
            recordFailure(message);
            advance.accept(index);
        }
    }

    String message(boolean translated) {
        if (stopReason != null) {
            return translated ? "Saved the translations completed so far. " + stopReason : stopReason;
        }
        if (translated) {
            return failure == null && timedOutLanguages.isEmpty() ? "Translation complete"
                    : "Some text could not be translated. Run Translate all again.";
        }
        if (!timedOutLanguages.isEmpty()) {
            return "Timed out waiting for a translation model. Run Translate all again.";
        }
        return failure == null ? "No new translations" : failure;
    }
}
