/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-10.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.view.WindowManager;

import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * The "Remove download" of a song and of a downloaded playlist or album: a confirmation, then the removal of
 * {@link StreamDownloads}. Every method is called on the main thread; the work runs in the background.
 */
final class DownloadRemoval {
    private DownloadRemoval() {}

    /** Asks whether to remove the stream copy of a song, naming the downloaded lists that hold it. */
    static void confirmSong(String songId) {
        Utils.runOnBackgroundThread(() -> {
            int lists = CopyOwnership.listsHolding(songId, OfflineCopyStore.allTrackLists());
            String message = lists == 0 ? str("morphe_music_remove_song_message")
                    : str("morphe_music_remove_song_message_lists", lists);
            Utils.runOnMainThread(() -> confirm(str("morphe_music_remove_song_title"), message,
                    () -> removeSong(songId)));
        });
    }

    /** Asks whether to remove a downloaded playlist or album. */
    static void confirmSource(String sourceId) {
        confirm(str("morphe_music_remove_list_title"), str("morphe_music_remove_list_message"),
                () -> removeSource(sourceId));
    }

    private static void confirm(String title, String message, Runnable onConfirm) {
        Activity activity = Utils.getActivity();
        if (activity == null) {
            Logger.printDebug(() -> "DownloadRemoval: no activity to ask in");
            return;
        }
        try {
            CustomDialog.create(activity, title, message, null, str("morphe_music_remove_download"), onConfirm,
                    () -> { }, null, null, true).first.show();
        } catch (WindowManager.BadTokenException ex) {
            Logger.printException(() -> "Could not show the remove download dialog", ex);
        }
    }

    private static void removeSong(String songId) {
        Utils.runOnBackgroundThread(() -> {
            try {
                StreamDownloads.remove(songId);
                Logger.printInfo(() -> "Removed the stream copy of " + songId);
                Utils.runOnMainThread(() -> {
                    Utils.showToastShort(str("morphe_music_remove_song_done"));
                    NoPlaylistDialog.onSongRemoved(songId);
                });
            } catch (Exception ex) {
                failed(songId, ex);
            }
        });
    }

    private static void removeSource(String sourceId) {
        Utils.runOnBackgroundThread(() -> {
            try {
                int removed = StreamDownloads.removeSource(sourceId);
                Logger.printInfo(() -> "Removed the download of " + sourceId + ": " + removed + " copies");
                Utils.runOnMainThread(() -> Utils.showToastShort(str("morphe_music_remove_list_done", removed)));
            } catch (Exception ex) {
                failed(sourceId, ex);
            }
        });
    }

    private static void failed(String id, Exception ex) {
        Logger.printException(() -> "Could not remove the download of " + id, ex);
        Utils.runOnMainThread(() -> Utils.showToastShort(
                str("morphe_music_remove_failed", PlaylistText.failureReason(ex))));
    }
}
