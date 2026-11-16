/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.downloads;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Settles a genuinely failed native Onesie transport before its retry loop can hide the failure. */
@SuppressWarnings("unused")
public final class OnesieFallback {
    public interface Controller {
        boolean rvxClaimFailure();
        boolean rvxFailureLive();
        void rvxFailFuture(Exception failure);
        void rvxFailPacked(Exception failure);
        void rvxCloseFailure();
    }

    public interface Fetch {
        Object rvxController();
        void rvxCancelFetch();
    }

    private OnesieFallback() { }

    public static boolean disconnected() {
        return OnesieFallbackLogic.disconnected(OfflineReplay.enabled(), Utils.isInternetReachable());
    }

    public static boolean failed(Object controller, Exception failure) {
        if (!disconnected() || !(controller instanceof Controller nativeController)) return false;
        boolean accepted = OnesieFallbackLogic.complete(nativeController, failure);
        if (accepted) Logger.printDebug(() -> "PlayerFallback: Onesie transport failure forwarded before retry");
        return accepted;
    }

    public static boolean failedFetch(Object task, Exception failure) {
        if (!(task instanceof Fetch fetch) || !failed(fetch.rvxController(), failure)) return false;
        fetch.rvxCancelFetch();
        return true;
    }
}
