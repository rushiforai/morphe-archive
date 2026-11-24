/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-23.
 * Based on the A–B loop in Morphe PR #4685 (Copyright 2026 Morphe; see NOTICE).
 */
package app.morphe.extension.music.patches.loop;

/** Markers belong to a single native load, even when consecutive queue entries have the same video ID. */
final class RepeatRange {
    static final long UNSET = -1;
    static final long MIN_LENGTH_MS = 250;
    static final long END_MARGIN_MS = 500;

    private long start = UNSET;
    private long end = UNSET;
    private boolean seeking;

    long start() {
        return start;
    }

    long end() {
        return end;
    }

    boolean active() {
        return end != UNSET;
    }

    boolean setStart(long position, long duration) {
        if (position < 0 || position > duration - END_MARGIN_MS - MIN_LENGTH_MS) return false;
        start = position;
        return true;
    }

    boolean setEnd(long position, long duration) {
        if (start == UNSET || position - start < MIN_LENGTH_MS || position > duration - END_MARGIN_MS) {
            return false;
        }
        end = position;
        return true;
    }

    boolean clear() {
        if (start == UNSET) return false;
        start = end = UNSET;
        seeking = false;
        return true;
    }

    boolean manualSeek(long position) {
        return active() && (position < start || position >= end) && clear();
    }

    boolean fits(long duration) {
        return active() && end <= duration - END_MARGIN_MS;
    }

    /** Do not issue another seek until Exo has actually reported a position before B. */
    boolean shouldWrap(long position) {
        if (!active() || position < 0) return false;
        if (position < end) {
            seeking = false;
            return false;
        }
        if (seeking) return false;
        seeking = true;
        return true;
    }
}
