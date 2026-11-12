/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * What an offline replay needs of a stream copy besides its audio: a trimmed player response, the song's metadata,
 * an optional cover, and the playlists and albums the copies were downloaded from. It is stored beside the raw copy
 * and deleted with it ({@link RawAudioStore} calls {@link #delete}, {@link #clearAll} and {@link #retainOnly}).
 *
 * <p>Stored data exists only for stream copies, so nothing is ever written in the file-only mode of Download in
 * app: the callers are the stream copy path of the downloader ({@link #storeDownloaded}) and the stream swap, which
 * lazily stores the app's own response when a copy plays online ({@link #storeOnline}). Reading is for the replay
 * and the lists: {@link #has} is in memory; every other method reads the disk and belongs to a worker thread.
 * Failures are only logged: this data never changes a download or a playback.
 */
final class OfflineCopyStore {
    private static final class Storage {
        static final File directory = new File(Utils.getContext().getFilesDir(), "rvx_offline");
        static final OfflineCopyFiles copies = new OfflineCopyFiles(directory);
        static final OfflineSourceStore sources = new OfflineSourceStore(
                new File(Utils.getContext().getFilesDir(), "rvx_offline_sources.json"));
    }

    private static final AtomicBoolean loadStarted = new AtomicBoolean();
    /** The sources whose header was asked for in this process: a failed request is not repeated on every bind. */
    private static final Set<String> headerAttempts = ConcurrentHashMap.newKeySet();

    private OfflineCopyStore() {}

    /** Starts loading the ids of the stored copies in the background. Until it is done {@link #has} is false. */
    static void warmUp() {
        if (!loadStarted.compareAndSet(false, true)) return;

        Utils.runOnBackgroundThread(() -> {
            Storage.copies.ensureLoaded();
            Storage.sources.ensureLoaded();
            OfflineBrowsePages.load();
            VideoCopyStore.warmUp();
        });
    }

    /**
     * Whether anything is stored: a copy with stored data or a remembered source. In memory, so the main thread
     * may ask; false until loaded.
     */
    static boolean hasAnything() {
        warmUp();
        return !Storage.copies.ids().isEmpty() || !Storage.sources.isEmpty();
    }

    /** Whether a downloaded album or playlist is remembered under the id. In memory, false until loaded. */
    static boolean hasSource(String sourceId) {
        warmUp();
        return Storage.sources.ids().contains(sourceId);
    }

    /** The song ids of every remembered source, by source id. In memory, empty until loaded. */
    static Map<String, List<String>> tracksBySource() {
        warmUp();
        Map<String, List<String>> tracks = new HashMap<>();
        for (OfflineSourceStore.Source source : Storage.sources.sources()) tracks.put(source.id(), source.videoIds());
        return tracks;
    }

    /** Whether the copy has stored data. In memory, so the main thread may ask. */
    static boolean has(String videoId) {
        warmUp();
        return Storage.copies.has(videoId);
    }

    /** The metadata of a copy with stored data, or null when it has none. Reads the disk: a worker thread only. */
    @Nullable
    static OfflineCopyMetadata metadataOf(String videoId) {
        Utils.verifyOffMainThread();
        return Storage.copies.metadata(videoId);
    }

    /** The stored data of a copy, or null when it has none. */
    @Nullable
    static OfflineCopyFiles.Stored find(String videoId) {
        Utils.verifyOffMainThread();
        return Storage.copies.read(videoId);
    }

    /**
     * The url of the cover of a song for the app's image loader: the stored cover file when the copy has one, which
     * loads with no network, else the url recorded for it. Null when neither is known. Touches the disk.
     */
    @Nullable
    static String coverUrl(@Nullable String videoId, @Nullable String recordedUrl) {
        File file = videoId == null ? null : Storage.copies.thumbnailFile(videoId);
        return file == null ? recordedUrl : Uri.fromFile(file).toString();
    }

    /** The metadata of every copy that has stored data. */
    static List<OfflineCopyMetadata> copiesWithData() {
        Utils.verifyOffMainThread();
        Storage.copies.ensureLoaded();
        return Storage.copies.allMetadata();
    }

    /**
     * The track list of every downloaded playlist and album, those saved before the offline store included, whether
     * or not their copies are all there. Reads the disk: a worker thread only.
     */
    static Map<String, List<String>> allTrackLists() {
        Utils.verifyOffMainThread();
        Storage.sources.ensureLoaded();
        adoptEarlierSources();
        return tracksBySource();
    }

    /** The downloaded playlists and albums that still have a stream copy, the latest first. */
    static List<OfflineSourceStore.Source> sources() {
        Utils.verifyOffMainThread();
        Storage.sources.ensureLoaded();
        adoptEarlierSources();

        Set<String> copyIds = RawAudioStore.copyIds();
        List<OfflineSourceStore.Source> present = new ArrayList<>();
        for (OfflineSourceStore.Source source : Storage.sources.sources()) {
            if (!Collections.disjoint(source.videoIds(), copyIds)) present.add(source);
        }
        return present;
    }

    /**
     * Playlists and albums downloaded before the offline lists existed are only in the track lists the downloaded
     * markers keep. They are remembered here, without a title and older than any later download, so the list shows
     * them in their recorded track order; {@link #fillHeader} gives them their title once there is a network.
     */
    private static void adoptEarlierSources() {
        if (!StreamSwap.supported()) return;

        try {
            Map<String, List<String>> adoptable = OfflineSourceStore.adoptable(DownloadedMarkers.savedTrackLists(),
                    Storage.sources.ids());
            for (Map.Entry<String, List<String>> saved : adoptable.entrySet()) {
                Storage.sources.remember(saved.getKey(), null, saved.getValue(), 0);
                Logger.printDebug(() -> "OfflineCopyStore: adopted " + saved.getKey() + " tracks="
                        + saved.getValue().size());
            }
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineCopyStore: could not adopt the earlier sources", ex);
        }
    }

    /** The remembered playlists and albums that have a stream copy and no title yet. A worker thread only. */
    static List<String> sourceIdsWithoutTitle() {
        List<String> ids = new ArrayList<>();
        for (OfflineSourceStore.Source source : sources()) {
            if (source.title().isEmpty()) ids.add(source.id());
        }
        return ids;
    }

    /** Fetches and stores the title of a source from the network. A worker thread only; throws when it has none. */
    static String fillHeader(String sourceId) throws Exception {
        Utils.verifyOffMainThread();
        SourceHeader header = PlaylistDownloads.fetchHeader(sourceId);
        if (!header.hasTitle()) throw new IOException("the page has no title");

        Storage.sources.updateHeader(sourceId, header, System.currentTimeMillis());
        return header.title();
    }

    /**
     * The tracks of a source that still have a stream copy, in the source's order. A track whose copy has no
     * stored data is listed with {@code stored == null}: it is not available offline until it plays online.
     */
    static List<OfflineSourceStore.Track> tracksOf(String sourceId) {
        Utils.verifyOffMainThread();
        Storage.sources.ensureLoaded();
        OfflineSourceStore.Source source = Storage.sources.get(sourceId);
        if (source == null) return new ArrayList<>();

        return OfflineSourceStore.tracksOf(source, RawAudioStore.copyIds(), Storage.copies::metadata);
    }

    /**
     * Stores what a finished download knows, replacing anything stored before: a re-downloaded copy may differ
     * from the one an earlier online response described. Title, artist and album are the tags the download wrote,
     * the cover is the one it embedded (stored when small), the response is built from the resolved format.
     */
    static void storeDownloaded(String videoId, Format format, VideoDetails details, AudioTagger.Tags tags) {
        try {
            Utils.verifyOffMainThread();
            long duration = format.getApproxDurationMs() > 0
                    ? format.getApproxDurationMs() : details.getLengthSeconds() * 1000L;
            OfflineCopyMetadata metadata = new OfflineCopyMetadata(videoId, tags.title, tags.artist, tags.album,
                    duration, OfflineCopyMetadata.largestThumbnail(details), System.currentTimeMillis(),
                    OfflineCopyMetadata.SOURCE_DOWNLOAD);
            write(metadata, OfflineResponseTrim.fromDownload(format, details), tags.artwork);
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineCopyStore: could not store the download of v=" + videoId, ex);
        }
    }

    /**
     * Stores the app's own response of a play of a copy, when the copy has none or only the one built at download
     * time. {@code itag} is the stored copy's: only that format is kept. The caller has verified the copy against
     * this response. Returns at once; the work runs in the background and a failure is only logged.
     */
    static void storeOnline(String videoId, byte[] responseBytes, int itag) {
        Utils.runOnBackgroundThread(() -> {
            try {
                Outcome outcome = storeOnlineNow(videoId, responseBytes, itag);
                if (outcome.reason() != null) Logger.printDebug(() -> "OfflineCopyStore: not stored v=" + videoId
                        + " " + outcome.reason());
            } catch (Exception ex) {
                Logger.printException(() -> "OfflineCopyStore: could not store the online response of v=" + videoId,
                        ex);
            }
        });
    }

    /** What storing a response did: the sizes written, or why nothing was. */
    record Outcome(@Nullable OfflineCopyFiles.Written written, @Nullable String reason) {
        static Outcome stored(OfflineCopyFiles.Written written) {
            return new Outcome(written, null);
        }

        static Outcome skipped(String reason) {
            return new Outcome(null, reason);
        }
    }

    /**
     * Stores a response the backfill fetched for a copy that has no stored data, on the calling worker thread. The
     * caller has verified the copy against this response, as the stream swap does for a played one.
     */
    static Outcome storeBackfilled(String videoId, byte[] responseBytes, int itag) throws Exception {
        Utils.verifyOffMainThread();
        return storeOnlineNow(videoId, responseBytes, itag);
    }

    /** The copies that have no stored data, in a fixed order. Reads the disk: a worker thread only. */
    static List<String> idsWithoutData() {
        Utils.verifyOffMainThread();
        Storage.copies.ensureLoaded();
        return OfflineBackfillLogic.pending(RawAudioStore.copyIds(), Storage.copies.ids());
    }

    /** How many of the copies have stored data, so can play with no network. Reads the disk: a worker thread only. */
    static StreamDownloads.Readiness readiness() {
        Utils.verifyOffMainThread();
        Storage.copies.ensureLoaded();
        Set<String> copyIds = RawAudioStore.copyIds();
        int missing = OfflineBackfillLogic.pending(copyIds, Storage.copies.ids()).size();
        return new StreamDownloads.Readiness(copyIds.size() - missing, copyIds.size());
    }

    private static Outcome storeOnlineNow(String videoId, byte[] responseBytes, int itag) throws Exception {
        Storage.copies.ensureLoaded();
        if (Storage.copies.hasOnlineResponse(videoId)) return Outcome.skipped("already stored");
        // The copy may have been deleted since the swap verified it.
        if (RawAudioStore.find(videoId) == null) return Outcome.skipped("the copy is gone");

        byte[] trimmed = OfflineResponseTrim.trim(responseBytes, itag);
        if (trimmed == null) return Outcome.skipped("itag=" + itag + " missing");

        VideoDetails details = PlayerResponse.parseFrom(trimmed).getVideoDetails();
        if (!videoId.equals(details.getVideoId())) return Outcome.skipped("details name another video");

        OfflineCopyFiles.Stored previous = Storage.copies.read(videoId);
        OfflineCopyMetadata metadata = OfflineCopyMetadata.online(previous == null ? null : previous.metadata(),
                videoId, details, TrackMetadata.stripTopic(details.getOwnerChannelName()), System.currentTimeMillis());
        byte[] cover = previous == null ? null : previous.thumbnail();
        String coverUrl = metadata.thumbnailUrl();
        if (cover == null && coverUrl != null) cover = TrackMetadata.artwork(videoId, coverUrl);

        OfflineCopyFiles.Written written = write(metadata, trimmed, cover);
        return written == null ? Outcome.skipped("rejected, response over the limit") : Outcome.stored(written);
    }

    @Nullable
    private static OfflineCopyFiles.Written write(OfflineCopyMetadata metadata, byte[] response,
                                                  @Nullable byte[] cover) throws Exception {
        OfflineCopyFiles.Written written = Storage.copies.write(metadata, response, cover);
        if (written == null) {
            Logger.printDebug(() -> "OfflineCopyStore: rejected v=" + metadata.videoId()
                    + " response=" + response.length + "B (limit " + OfflineCopyFiles.MAX_RESPONSE_BYTES + "B)");
            return null;
        }
        Logger.printDebug(() -> "OfflineCopyStore: stored v=" + metadata.videoId() + " response="
                + written.responseBytes() + "B thumb=" + written.thumbnailBytes() + "B source="
                + metadata.responseSource());
        return written;
    }

    /**
     * Remembers a downloaded playlist or album; a null header keeps what is known of it. Nothing is recorded while
     * Play downloads locally is off, so a file-only download writes no stream data.
     */
    static void rememberSource(String sourceId, @Nullable SourceHeader header, List<String> videoIds) {
        if (!StreamSwap.supported()) return;
        try {
            Utils.verifyOffMainThread();
            Storage.sources.remember(sourceId, header, videoIds, System.currentTimeMillis());
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineCopyStore: could not remember the source " + sourceId, ex);
        }
    }

    /**
     * Called when a playlist or album page header binds: a remembered source without a title (one recorded where
     * only its tracks were known) gets it from the header's own browse response, once per process. The header
     * model is the app's and has no readable title; the page is online, so the request is the same the download
     * makes. Cheap on the main thread: the check is in memory and the request runs in the background.
     */
    static void captureHeaderLater(String sourceId) {
        warmUp();
        if (!Storage.sources.needsHeader(sourceId) || !headerAttempts.add(sourceId)) return;

        Utils.runOnBackgroundThread(() -> {
            try {
                String title = fillHeader(sourceId);
                Logger.printDebug(() -> "OfflineCopyStore: header of " + sourceId + " title=" + title);
            } catch (Exception ex) {
                Logger.printDebug(() -> "OfflineCopyStore: no header for " + sourceId, ex);
            }
        });
    }

    /** A downloaded playlist or album is forgotten, with the pages stored for it. Its copies are the caller's. */
    static void removeSource(String sourceId) {
        try {
            Storage.sources.remove(sourceId);
            OfflineBrowsePages.retainOnly(Storage.sources.ids());
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineCopyStore: could not forget the source " + sourceId, ex);
        }
    }

    /** The stream copy is deleted: its stored data goes with it. */
    static void delete(String videoId) {
        Storage.copies.delete(videoId);
    }

    /** Every stream copy is deleted: so is every stored response and source. */
    static void clearAll() {
        try {
            Storage.copies.clear();
            Storage.sources.clear();
            OfflineBrowsePages.retainOnly(Collections.emptySet());
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineCopyStore: could not clear the stored data", ex);
        }
    }

    /**
     * Orphan cleanup: removes the stored data of every copy not in {@code copyIds}, leftovers of interrupted writes,
     * and sources none of whose tracks has a copy. Data published after {@code copyIdsReadAt} is kept: it belongs
     * to a copy kept while {@code copyIds} was read.
     */
    static void retainOnly(Set<String> copyIds, long copyIdsReadAt) {
        try {
            Storage.copies.retainOnly(copyIds, copyIdsReadAt);
            Storage.sources.retainWithCopies(copyIds);
            OfflineBrowsePages.retainOnly(Storage.sources.ids());
        } catch (Exception ex) {
            Logger.printException(() -> "OfflineCopyStore: could not clean up the stored data", ex);
        }
    }
}
