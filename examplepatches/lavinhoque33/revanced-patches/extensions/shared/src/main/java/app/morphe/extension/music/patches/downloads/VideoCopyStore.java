/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.io.File;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Android lifecycle of the video copies ({@link VideoCopyFiles}): what the downloader keeps, the stream swap plays,
 * and the audio copy's lifecycle ({@link RawAudioStore}) deletes with it. A video copy never outlives the audio copy
 * of its song, and never decides whether a song has a stream copy: the green check follows the audio copy alone.
 */
final class VideoCopyStore {
    private static final class Storage {
        static final VideoCopyFiles files = new VideoCopyFiles(
                new File(Utils.getContext().getFilesDir(), "rvx_video"));
    }

    private static final AtomicBoolean loadStarted = new AtomicBoolean();
    /** The videos whose online response was kept in this run. */
    private static final Set<String> liveKept = ConcurrentHashMap.newKeySet();
    /** Player response fields the copy never uses: 4 streaming data, 7 ad placements. */
    private static final Set<Integer> LIVE_DROPPED_FIELDS = Set.of(4, 7);

    private VideoCopyStore() {}

    /** Starts loading the committed pairs in the background. Until it is done {@link #has} is false. */
    static void warmUp() {
        if (!loadStarted.compareAndSet(false, true)) return;

        Utils.runOnBackgroundThread(Storage.files::ensureLoaded);
    }

    /** Whether the video has a video copy. In memory, so the main thread may ask; false until loaded. */
    static boolean has(String videoId) {
        warmUp();
        return Storage.files.has(videoId);
    }

    /**
     * Whether the video has a video copy, loaded now if it is not yet: the answer is never a "not loaded yet" false.
     * For the few main-thread checks that must not miss (the Song/Video pill); the load reads the commit records of
     * the few copies there are, once.
     */
    static boolean hasNow(String videoId) {
        Storage.files.ensureLoaded();
        return Storage.files.has(videoId);
    }

    /** The copy that may be played, or null. Hashes the file the first time. */
    @Nullable
    static VideoCopyFiles.Entry find(String videoId) {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        return Storage.files.find(videoId);
    }

    /** The stored player response of a video copy, or null. */
    @Nullable
    static byte[] response(String videoId) {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        return Storage.files.response(videoId);
    }

    /** The response the app itself got online for a video copy (see {@link #keepLive}), or null. */
    @Nullable
    static byte[] live(String videoId) {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        return Storage.files.live(videoId);
    }

    /**
     * Keeps the response the app got online for the video of a copy, once per run: without the streaming data and
     * the ad placements, which the copy never uses. The replay answers offline with the shape of this response, so
     * the app's player selection sees what it sees online. Never fails the caller; a failure is only logged.
     */
    static void keepLive(String videoId, byte[] onlineResponse) {
        Utils.verifyOffMainThread();
        if (liveKept.contains(videoId)) return;

        try {
            Storage.files.ensureLoaded();
            byte[] live = ResponseFields.without(onlineResponse, LIVE_DROPPED_FIELDS);
            boolean kept = Storage.files.keepLive(videoId, live);
            if (kept) liveKept.add(videoId);
            Logger.printDebug(() -> "VideoCopyStore: online response of v=" + videoId + " kept=" + kept + " "
                    + live.length + "B");
        } catch (Exception ex) {
            Logger.printException(() -> "VideoCopyStore: could not keep the online response of v=" + videoId, ex);
        }
    }

    /** The id of the video copy that belongs to the song, or null. */
    @Nullable
    static String videoOf(String songId) {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        return Storage.files.videoOf(songId);
    }

    /** The committed pairs for the main thread: none until they are loaded, as {@link #has}. */
    static Map<String, String> pairsIfLoaded() {
        warmUp();
        return Storage.files.pairs();
    }

    /** The committed pairs, video id to song id. */
    static Map<String, String> pairs() {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        return Storage.files.pairs();
    }

    /**
     * Keeps a finished video download. Works only while Play downloads locally is on; the song's audio copy must exist.
     *
     * @return Whether the copy now exists. False is never fatal for the song or the list.
     */
    static boolean retain(String videoId, String songId, @Nullable String sourceId, File videoTemporary,
                          File audioTemporary, VideoCopyLogic.Download download) {
        try {
            Utils.verifyOffMainThread();
            Storage.files.ensureLoaded();
            if (!StreamSwap.supported()) return false;

            boolean kept = Storage.files.retain(videoId, songId, sourceId, videoTemporary, audioTemporary,
                    download);
            if (!kept) return false;

            // Switching off during a download must not leave a newly published extra copy.
            if (!StreamSwap.supported()) {
                delete(videoId);
                return false;
            }
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "VideoCopy: could not retain v=" + videoId, ex);
            return false;
        }
    }

    static void delete(String videoId) {
        Utils.verifyOffMainThread();
        StreamSwapSources.invalidate(videoId);
        Storage.files.delete(videoId);
    }

    /** The audio copy of the song is deleted: its video copy goes with it. */
    static void deleteForSong(String songId) {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        String videoId = Storage.files.videoOf(songId);
        if (videoId != null) delete(videoId);
    }

    /** Every stream copy is deleted: so is every video copy. @return How many video copies were deleted. */
    static int clearAll() {
        Utils.verifyOffMainThread();
        StreamSwapSources.invalidateAll();
        return Storage.files.clear();
    }

    /** Orphan cleanup: removes the video copies whose song has no audio copy in {@code songIds}, and leftovers. */
    static void retainOnly(Set<String> songIds, long songIdsReadAt) {
        Utils.verifyOffMainThread();
        Storage.files.ensureLoaded();
        for (String videoId : Storage.files.retainOnly(songIds, songIdsReadAt)) {
            StreamSwapSources.invalidate(videoId);
        }
    }

    static VideoCopyFiles.Stats stats() {
        Utils.verifyOffMainThread();
        return Storage.files.stats();
    }
}
