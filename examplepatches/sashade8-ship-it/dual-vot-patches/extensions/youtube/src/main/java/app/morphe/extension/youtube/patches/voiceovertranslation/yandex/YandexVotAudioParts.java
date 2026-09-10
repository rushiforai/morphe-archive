/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Pure part arithmetic for uploading the original audio track to Yandex.
 *
 * <p>The Yandex upload protocol requires every part except the final remainder to be
 * exactly {@link #PART_SIZE_BYTES} bytes. Do not change that constant without protocol
 * evidence.
 */
final class YandexVotAudioParts {
    /** Yandex upload protocol part size in bytes. */
    static final int PART_SIZE_BYTES = 5_295_308;

    private YandexVotAudioParts() {
    }

    /** A contiguous byte range of the source track. {@code length} is at most PART_SIZE_BYTES. */
    record Part(long start, int length) {
    }

    /**
     * Partitions {@code [0, fileSize)} into ascending, non-overlapping parts that cover the
     * whole track. Every part except the last has length {@link #PART_SIZE_BYTES}; the last
     * part holds the exact remainder (which may also be a full part).
     */
    static List<Part> parts(long fileSize) {
        if (fileSize <= 0) return Collections.emptyList();

        List<Part> result = new ArrayList<>();
        long start = 0;
        while (start < fileSize) {
            long remaining = fileSize - start;
            int length = remaining >= PART_SIZE_BYTES
                    ? PART_SIZE_BYTES
                    : (int) remaining;
            result.add(new Part(start, length));
            start += length;
        }
        return result;
    }

    static int partCount(long fileSize) {
        if (fileSize <= 0) return 0;
        long parts = (fileSize - 1L) / PART_SIZE_BYTES + 1L;
        return parts > Integer.MAX_VALUE ? Integer.MAX_VALUE : (int) parts;
    }
}
