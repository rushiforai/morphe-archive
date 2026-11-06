/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3847
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.patches;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.ShortsPlayerState;

/**
 * Skips live streams that appear in the Shorts feed.
 */
@SuppressWarnings("unused")
public class SkipLiveShortsPatch {

    /**
     * Implemented by the Shorts player class.
     * The rest of the implementation is added by the patch.
     */
    public interface ReelSequenceController {
        void patch_skipToNextShort();
    }

    private static WeakReference<ReelSequenceController> reelSequenceControllerRef =
            new WeakReference<>(null);

    /**
     * Injection point.
     */
    public static void setReelSequenceController(ReelSequenceController controller) {
        reelSequenceControllerRef = new WeakReference<>(controller);
    }

    /**
     * Called by {@link app.morphe.extension.youtube.shared.VideoInformation}
     * when the video information of a newly loaded video is available.
     */
    public static void onVideoLoaded(boolean isLive) {
        try {
            if (!isLive || !Settings.SKIP_LIVE_SHORTS.get()) {
                return;
            }

            // The controller outlives the Shorts player, so only skip while Shorts are open.
            if (!ShortsPlayerState.getCurrent().isOpen()) {
                return;
            }

            ReelSequenceController controller = reelSequenceControllerRef.get();
            if (controller == null) {
                return;
            }

            Utils.runOnMainThreadNowOrLater(() -> {
                Logger.printDebug(() -> "Skipping live Short");
                controller.patch_skipToNextShort();
            });
        } catch (Exception ex) {
            Logger.printException(() -> "onVideoLoaded failure", ex);
        }
    }
}
