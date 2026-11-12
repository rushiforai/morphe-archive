/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import java.lang.ref.WeakReference;

import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The stock "No connection" bottom sheet (the connectivity mealbar) covers the player controls. While a downloaded
 * copy plays offline it has nothing to say, so it is dismissed through the app's own controller for it: the one the
 * presenter shows it with. It is dismissed when the copy starts and, when the presenter shows it later, again then.
 * With nothing of ours playing, or online, the sheet is the app's.
 */
public final class NoConnectionSheet {
    /** The presenter's mealbar controller, by the one method the patch adds to its class. */
    public interface Controller {
        /** Dismisses the mealbar that is shown (or queued), as the app's own dismiss of the controller does. */
        void rvxDismiss();
    }

    private static volatile WeakReference<Controller> controller = new WeakReference<>(null);
    private static volatile String replayedVideoId;

    private NoConnectionSheet() {}

    /** Injection point: the presenter has just shown the sheet through [controller]. */
    static void onSheetShown(Object shown) {
        if (!(shown instanceof Controller found)) return;

        controller = new WeakReference<>(found);
        if (OfflineReplayLogic.dismissesSheetShownLater(replayedVideoId, VideoInformation.getVideoId(),
                Utils.isInternetReachable())) {
            dismiss(found);
        }
    }

    /** A copy was answered for the player while the device is offline: nothing is left for the sheet to say. */
    static void onCopyReplayed(String videoId) {
        if (Utils.isInternetReachable()) return;

        replayedVideoId = videoId;
        Controller found = controller.get();
        if (found == null) {
            Logger.printInfo(() -> "OfflineReplay: no-connection sheet not found:none shown yet");
            return;
        }

        dismiss(found);
    }

    private static void dismiss(Controller target) {
        Utils.runOnMainThread(() -> {
            try {
                target.rvxDismiss();
                Logger.printInfo(() -> "OfflineReplay: no-connection sheet dismissed");
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineReplay: no-connection sheet not found:dismiss failed", ex);
            }
        });
    }
}
