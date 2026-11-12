/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import android.database.ContentObserver;
import android.net.Uri;
import android.provider.MediaStore;

import androidx.annotation.Nullable;

import java.io.File;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Android lifecycle for original stream copies. Settings reads themselves are in-memory only. */
final class RawAudioStore {
    private static final AtomicBoolean observing = new AtomicBoolean();
    private static final CoalescedRunner cleanup = new CoalescedRunner(
            Utils::runOnBackgroundThread, RawAudioStore::cleanupNow);
    private static final class Storage {
        static final RawAudioFiles files = new RawAudioFiles(
                new File(Utils.getContext().getFilesDir(), "rvx_raw"));
    }

    private RawAudioStore() {}

    static void startCleanup() {
        // This method may be called by the native repository constructor on the main thread.
        Utils.runOnBackgroundThread(() -> {
            try {
                if (observing.compareAndSet(false, true)) {
                    Utils.getContext().getContentResolver().registerContentObserver(
                            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI, true, new ContentObserver(null) {
                                @Override
                                public void onChange(boolean selfChange) {
                                    cleanupLater();
                                }
                            });
                }
            } catch (Exception ex) {
                observing.set(false);
                Logger.printException(() -> "StreamSwap: could not observe native audio deletions", ex);
            }
            cleanupLater();
        });
    }

    private static void cleanupLater() {
        cleanup.request();
    }

    private static void cleanupNow() {
        try {
            Utils.verifyOffMainThread();
            Storage.files.cleanup(RawAudioStore::nativeUri);
            // Stored data published after the id list is read belongs to a copy kept meanwhile.
            Set<String> copyIds = Storage.files.committedIds();
            long copyIdsReadAt = System.currentTimeMillis();
            OfflineCopyStore.retainOnly(copyIds, copyIdsReadAt);
            VideoCopyStore.retainOnly(copyIds, copyIdsReadAt);
            StreamSwapSources.invalidateMissing();
            DownloadedMarkers.rescanStreamCopies();
        } catch (Exception ex) {
            Logger.printException(() -> "StreamSwap: raw cleanup failed", ex);
        }
    }

    @Nullable
    private static String nativeUri(String videoId) {
        Uri uri = NativeAudioStore.find(videoId);
        return uri == null ? null : uri.toString();
    }

    /**
     * Keeps the stream copy of a finished download: stream-only, with no native track.
     *
     * @param individual Whether the user downloaded this song itself and not as a track of a playlist or album.
     * @return Whether the copy now exists.
     */
    static boolean retain(String videoId, File temporary, Format format, boolean individual) {
        try {
            Utils.verifyOffMainThread();
            if (!StreamSwap.supported()) return false;
            boolean kept = Storage.files.retain(videoId, temporary, format.getItag(), format.getMimeType(),
                    format.getContentLength(), format.getLastModified(), null, individual);
            if (!kept) return false;

            DownloadedMarkers.onStreamCopyKept(videoId);
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "StreamSwap: could not retain raw copy v=" + videoId, ex);
            return false;
        }
    }

    /** The user asked for this song itself: its copy outlives the removal of a playlist or album that holds it. */
    static void markIndividual(String videoId) {
        Utils.verifyOffMainThread();
        Storage.files.markIndividual(videoId);
    }

    /** The ids of the copies the user downloaded itself. */
    static Set<String> individualIds() {
        Utils.verifyOffMainThread();
        return Storage.files.individualIds();
    }

    /** The music video ids that name a song with a copy, by video id. */
    static Map<String, String> aliases() {
        Utils.verifyOffMainThread();
        return Storage.files.aliases();
    }

    /** From now on {@code alias} (the music video of the song) is the same song as {@code songId}. */
    static void addAlias(String songId, String alias) {
        Utils.verifyOffMainThread();
        if (Storage.files.addAlias(songId, alias)) DownloadedMarkers.onAlias(alias, songId);
    }

    /** The copy that may be played, or null. Hashes the file the first time. */
    static RawAudioFiles.Entry find(String videoId) throws Exception {
        Utils.verifyOffMainThread();
        return Storage.files.find(videoId, RawAudioStore::nativeUri);
    }

    static void delete(String videoId) {
        Utils.verifyOffMainThread();
        StreamSwapSources.invalidate(videoId);
        Storage.files.delete(videoId);
        OfflineCopyStore.delete(videoId);
        VideoCopyStore.deleteForSong(videoId);
        DownloadedMarkers.onStreamCopyRemoved(videoId);
    }

    /**
     * The native track is confirmed gone: its copy goes with it. A stream-only copy never belonged to the native
     * track and stays.
     */
    static void deleteWithNativeTrack(String videoId) {
        Utils.verifyOffMainThread();
        StreamSwapSources.invalidate(videoId);
        if (Storage.files.deleteUnlessStreamOnly(videoId)) {
            OfflineCopyStore.delete(videoId);
            VideoCopyStore.deleteForSong(videoId);
            DownloadedMarkers.onStreamCopyRemoved(videoId);
        }
    }

    /** The ids of every committed stream copy. */
    static Set<String> copyIds() {
        Utils.verifyOffMainThread();
        return Storage.files.committedIds();
    }

    static RawAudioFiles.Stats stats() {
        Utils.verifyOffMainThread();
        return Storage.files.stats();
    }

    /**
     * Deletes every stream copy, tied or stream-only; local files are never touched.
     *
     * @return How many copies were deleted.
     */
    static int clearAll() {
        Utils.verifyOffMainThread();
        StreamSwapSources.invalidateAll();
        int count = Storage.files.clear();
        OfflineCopyStore.clearAll();
        VideoCopyStore.clearAll();
        DownloadedMarkers.onStreamCopiesCleared();
        return count;
    }
}
