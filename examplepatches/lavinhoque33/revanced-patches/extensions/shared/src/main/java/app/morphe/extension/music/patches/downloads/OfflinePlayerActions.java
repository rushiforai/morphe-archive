/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import androidx.annotation.Nullable;

import java.io.IOException;

import app.morphe.extension.music.patches.flyout.FlyoutPatch.ProtocolBufferFieldInterface;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Called by the native player's overflow selection, never by a browse or queue row's binder. */
@SuppressWarnings("unused")
public final class OfflinePlayerActions {
    private OfflinePlayerActions() {}

    @Nullable
    public static String copyForMenu(String videoId) {
        if (!OfflineReplay.enabled() || !RawAudioFiles.validId(videoId)) return null;

        String copyId = heldCopy(videoId);
        return copyId != null && !Utils.isInternetReachable() ? copyId : null;
    }

    @Nullable
    public static byte[] menu(Object storage, Object occurrence, String videoId, String title, String copyId) {
        try {
            boolean canQueue = OfflineQueueActions.available(storage, videoId, occurrence);
            var labels = new OfflinePlayerMenu.Labels(canQueue ? str("queue_play_next") : "",
                    canQueue ? str("queue_add") : "", str("menu_share"), str("morphe_music_remove_download"));
            return OfflinePlayerMenu.encode(videoId, title, copyId, canQueue, labels);
        } catch (Exception ex) {
            Logger.printException(() -> "Could not build the local Music player actions", ex);
            return null;
        }
    }

    public static boolean staleQueueCommand(ProtocolBufferFieldInterface command) {
        if (!(command instanceof OfflineQueueActions.Carrier)) {
            return false;
        }

        try {
            OfflineQueueCommand target = OfflineQueueCommand.parse(command.toByteArray());
            return target != null && target.playerOnly() && !OfflineQueueActions.markPlayerCommand(command);
        } catch (IOException ignored) {
            return false;
        }
    }

    @Nullable
    public static String removalTarget(String params) {
        return OfflinePlayerMenu.removalTarget(params);
    }

    static void requestRemoval(String copyId) {
        Logger.printDebug(() -> "OfflinePlayerActions: consumed marked Remove download");
        Utils.runOnMainThread(() -> {
            // A stale click must not download anything or retarget to a different stored copy.
            if (!LocalDownloadManager.downloadMode().streamCopy()) return;

            DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
            if (registry != null && registry.hasOwnCopy(copyId)) DownloadRemoval.confirmSong(copyId);
        });
    }

    @Nullable
    private static String heldCopy(String videoId) {
        if (!LocalDownloadManager.downloadMode().streamCopy()) return null;

        DownloadedMarkers.warmUp();
        DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
        if (registry == null) return null;

        String copyId = registry.canonicalId(videoId);
        if (registry.hasOwnCopy(copyId)) return copyId;

        String songId = VideoCopyStore.pairsIfLoaded().get(videoId);
        if (songId == null) return null;

        copyId = registry.canonicalId(songId);
        return registry.hasOwnCopy(copyId) ? copyId : null;
    }
}
