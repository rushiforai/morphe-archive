/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import java.io.IOException;

/** A real connectivity notification, not a fabricated socket failure or a process-wide offline latch. */
final class PlaybackConnectionLoss extends IOException {
    final Object request;
    final Object ownership;

    PlaybackConnectionLoss(Object request, Object ownership) {
        super("Validated default network lost while player response was pending");
        this.request = request;
        this.ownership = ownership;
    }

    static PlaybackConnectionLoss find(Throwable failure) {
        for (int depth = 0; failure != null && depth < 16; depth++, failure = failure.getCause()) {
            if (failure instanceof PlaybackConnectionLoss loss) return loss;
        }
        return null;
    }
}
