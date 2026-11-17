/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import java.util.function.LongPredicate;
import java.util.function.Supplier;

/** Pure presentation policy: native occurrence identity is never replaced by a media or video ID. */
final class SmartShuffleAutoSubtitle {
    private SmartShuffleAutoSubtitle() {}

    static CharSequence project(CharSequence original, long occurrenceId, LongPredicate suggestions,
                                Supplier<String> label) {
        if (occurrenceId == Long.MIN_VALUE || !suggestions.test(occurrenceId)) {
            return original;
        }

        String suggested = label.get();
        return original == null || original.length() == 0 ? suggested : original + " · " + suggested;
    }
}
