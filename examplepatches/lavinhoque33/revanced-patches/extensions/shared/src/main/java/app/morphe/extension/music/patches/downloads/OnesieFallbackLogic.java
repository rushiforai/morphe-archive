/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

/** Native admission is synchronized, but synchronous Future/emitter callbacks must run outside that monitor. */
final class OnesieFallbackLogic {
    private OnesieFallbackLogic() { }

    static boolean disconnected(boolean enabled, boolean online) {
        return enabled && !online;
    }

    static boolean complete(OnesieFallback.Controller controller, Exception failure) {
        if (!controller.rvxClaimFailure() || !controller.rvxFailureLive()) return false;

        try {
            controller.rvxFailFuture(failure);
            controller.rvxFailPacked(failure);
        } finally {
            controller.rvxCloseFailure();
        }
        return true;
    }
}
