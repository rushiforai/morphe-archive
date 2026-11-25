/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4896
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.notifications;

import androidx.annotation.Nullable;

import kotlin.Unit;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.ShortsPlayerState;
import app.morphe.extension.youtube.shared.VideoInformation;

/** Records player loads, but ignores a muted feed preview until it is opened. */
public final class PlayedVideoTracker {
    private static final long OPENED_PREVIEW_CHECK_MILLIS = 1000;

    @Nullable
    private static volatile String previewVideoId;

    static {
        PlayerType.getOnChange().addObserver(playerType -> {
            if (playerType.isNoneOrHidden()) {
                previewVideoId = null;
            } else if (playerType.isMaximizedOrFullscreen()) {
                String videoId = previewVideoId;
                previewVideoId = null;
                if (videoId != null) {
                    // A newly opened player can briefly report the preceding preview's video ID.
                    Utils.runOnMainThreadDelayed(() -> {
                        if (Settings.UNGROUP_NOTIFICATIONS.get() && videoId.equals(VideoInformation.getVideoId())) {
                            SeenVideos.addPlayedInBackground(videoId, false);
                        }
                    }, OPENED_PREVIEW_CHECK_MILLIS);
                }
            }
            return Unit.INSTANCE;
        });
    }

    public static void onVideoLoaded(String videoId) {
        if (!SeenVideos.isVideoId(videoId)) {
            return;
        }
        if (PlayerType.getCurrent() == PlayerType.INLINE_MINIMAL) {
            previewVideoId = videoId;
        } else {
            previewVideoId = null;
            SeenVideos.addPlayedInBackground(videoId, ShortsPlayerState.getCurrent().isOpen());
        }
    }
}
