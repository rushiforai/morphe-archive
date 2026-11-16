/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

/** One explicit Play after an owned in-flight exhaustion; never an automatic queue/repeat retry. */
final class ExhaustedPlayback {
    record Occurrence(long itemId, String videoId) { }
    record Resume(Object owner, Object selection, Occurrence failed, Occurrence previous, long generation) { }

    private long generation;
    private Resume resume;

    synchronized boolean armed() {
        return resume != null;
    }

    synchronized long generation() {
        return generation;
    }

    /** Called directly by the connectivity callback, not posted behind a later STOP decision. */
    void reconnected() {
        clear();
    }

    synchronized void clear() {
        generation++;
        resume = null;
    }

    synchronized void arm(Object owner, Object selection, Occurrence failed, Occurrence previous, long generation) {
        if (generation != this.generation) return;
        resume = null;
        if (failed == null || previous == null
                || failed.itemId() == previous.itemId()) return;

        resume = new Resume(owner, selection, failed, previous, generation);
    }

    /** Consumed even when it is stale: normal Play must not leave a deferred offline interception behind. */
    synchronized Resume take(Object owner, Object selection, long currentItemId, boolean enabled, boolean online) {
        Resume candidate = resume;
        resume = null;
        return enabled && !online && candidate != null && candidate.owner() == owner
                && candidate.selection() == selection && candidate.failed().itemId() == currentItemId
                ? candidate : null;
    }
}
