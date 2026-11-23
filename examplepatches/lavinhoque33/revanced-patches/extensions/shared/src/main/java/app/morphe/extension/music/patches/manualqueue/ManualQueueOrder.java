/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.patches.manualqueue;

import java.util.Arrays;
import java.util.function.ToLongFunction;

/** IDs of pending native occurrences only. The native lane, not this index, holds the order and tracks. */
final class ManualQueueOrder {
    static final long UNKNOWN = Long.MIN_VALUE;

    private long[] owned = new long[4];
    private boolean[] retained = new boolean[4];
    private int count;

    int insertionIndex(ManualQueue.Lane lane, int current, int size, ToLongFunction<Object> occurrence) {
        int insertion = current + 1;
        if (count == 0) return insertion;

        Arrays.fill(retained, 0, count, false);
        int found = 0;
        for (int index = size - 1; index > current && found < count; index--) {
            int slot = Arrays.binarySearch(owned, 0, count, occurrence.applyAsLong(lane.get(index)));
            if (slot < 0 || retained[slot]) continue;

            if (found == 0) insertion = index + 1;
            retained[slot] = true;
            found++;
        }

        // An occurrence that was removed or played is no longer pending, even if the user goes back.
        int kept = 0;
        for (int index = 0; index < count; index++) {
            if (retained[index]) owned[kept++] = owned[index];
        }
        count = kept;
        return insertion;
    }

    void record(long occurrence) {
        if (occurrence == UNKNOWN) return;
        int insert = Arrays.binarySearch(owned, 0, count, occurrence);
        if (insert >= 0) return;

        insert = -insert - 1;
        if (count == owned.length) {
            owned = Arrays.copyOf(owned, count * 2);
            retained = new boolean[owned.length];
        }
        System.arraycopy(owned, insert, owned, insert + 1, count - insert);
        owned[insert] = occurrence;
        count++;
    }
}
