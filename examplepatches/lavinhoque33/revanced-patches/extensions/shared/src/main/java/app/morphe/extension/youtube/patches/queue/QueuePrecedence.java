/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU Affero General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.youtube.patches.queue;

/** Shared runtime rules for the native, RVX and explicitly selected device-only queues. */
public final class QueuePrecedence {
    private QueuePrecedence() {
    }

    public static boolean isUnlockEnabled(boolean patchIncluded, boolean unlockQueue, boolean localQueue) {
        return patchIncluded && unlockQueue && !localQueue;
    }

    public static boolean isFlyoutOverrideEnabled(boolean localQueue, boolean override, boolean unlockEnabled) {
        return localQueue || (override && !unlockEnabled);
    }
}
