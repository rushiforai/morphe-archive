/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.youtube.patches.queue;

import app.morphe.extension.youtube.settings.Settings;

public final class CastPlayQueuePatch {
    private CastPlayQueuePatch() {
    }

    /** Called only on the remote video selection path. */
    public static boolean useStockCastRestriction(boolean original) {
        return original && !Settings.RESTORE_CAST_PLAY_QUEUE.get();
    }
}
