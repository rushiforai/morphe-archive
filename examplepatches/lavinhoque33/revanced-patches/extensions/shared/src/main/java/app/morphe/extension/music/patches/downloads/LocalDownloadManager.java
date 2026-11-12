/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2528
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */

package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.net.Uri;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.spoof.SpoofVideoStreamsPatch;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.music.shared.VideoInformation;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.shared.spoof.requests.StreamOrDetailsDataRequest;

/** Downloads the already resolved InnerTube audio stream without leaving YouTube Music. */
public final class LocalDownloadManager {

    private static final String DOWNLOAD_CHANNEL = "morphe_audio_downloads";
    private static final String USER_AGENT =
            "com.google.android.youtube/19.47.53 (Linux; U; Android 14) gzip";

    /**
     * Ranges are fetched in parallel, which is what makes a download finish in seconds.
     * Short files are still split into this many equal ranges.
     */
    private static final int SEGMENT_COUNT = 4;
    // googlevideo throttles any single range response
    // above ~10 MiB (16 MiB ranges ran at ~3 MB/s), so ranges are bounded and handed out from a queue.
    private static final long MAX_RANGE_SIZE = 8L * 1024 * 1024;
    private static final int MAX_CONNECTIONS = 6;
    private static final int BUFFER_SIZE = 64 * 1024;

    /**
     * The system silently drops notifications posted faster than a few per second, which used to
     * leave stale progress on screen after the download had finished. Updates are spaced out.
     */
    private static final long NOTIFICATION_INTERVAL_MILLISECONDS = 1000;
    private static final AtomicLong lastNotificationTime = new AtomicLong();

    private static final int CONNECT_TIMEOUT_MILLISECONDS = 15_000;
    private static final int READ_TIMEOUT_MILLISECONDS = 30_000;

    /** A range that makes no progress this many times in a row is treated as stalled. */
    private static final int MAX_STALLED_ATTEMPTS = 4;

    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{1,20}");

    // song and playlist requests share one result for each active media download.
    private static final ConcurrentHashMap<String, FutureTask<Saved>> ACTIVE_DOWNLOADS = new ConcurrentHashMap<>();

    private static volatile String currentTitle;
    private static volatile String currentArtist;

    public static void onSetMetadata(android.media.MediaMetadata metadata) {
        if (metadata == null) return;
        currentTitle = metadata.getString(android.media.MediaMetadata.METADATA_KEY_TITLE);
        currentArtist = metadata.getString(android.media.MediaMetadata.METADATA_KEY_ARTIST);
    }

    private LocalDownloadManager() {
    }

    /** One mode for every download, with stream copies only where their playback hooks are supported. */
    static DownloadMode downloadMode() {
        return DownloadMode.of(Settings.DOWNLOAD_METHOD.get(), StreamSwap.supported());
    }

    /** True when the global method makes a song Download ours rather than stock or external. */
    public static boolean interceptsSongs() {
        return downloadMode() != DownloadMode.OFF;
    }

    /** True when the same global method makes an album or playlist header Download ours. */
    public static boolean interceptsPlaylists() {
        return downloadMode() != DownloadMode.OFF;
    }

    /** Who handles the Download of the player button; it has its own external downloader switch. */
    public static SongDownloadRoute playerButtonRoute() {
        return SongDownloadRoute.of(Settings.DOWNLOAD_METHOD.get(), StreamSwap.supported(),
                Settings.EXTERNAL_DOWNLOADER_ACTION_BUTTON.get());
    }

    /** Who handles the Download of a song menu; it has its own external downloader switch. */
    public static SongDownloadRoute menuRoute() {
        return SongDownloadRoute.of(Settings.DOWNLOAD_METHOD.get(), StreamSwap.supported(),
                Settings.EXTERNAL_DOWNLOADER_FLYOUT_MENU.get());
    }

    /** One finished track: its native track when a local file exists, and whether the network was used. */
    record Saved(@Nullable Uri nativeTrack, boolean downloaded) {
    }

    /**
     * The Download of a song (menu or player button) on the main thread. A song with a stream copy, or a music video
     * saved as its song, offers Remove instead, so no copy is ever made twice; any other song is downloaded.
     */
    public static void onDownloadTap(String videoId) {
        String songId = savedCopyOf(videoId);
        if (songId != null) {
            DownloadRemoval.confirmSong(songId);
            return;
        }
        enqueue(videoId);
    }

    /** Whether the Download of the song offers Remove: the song has a stream copy and stream copies are in use. */
    public static boolean offersRemove(String videoId) {
        return savedCopyOf(videoId) != null;
    }

    /** The id the stream copy of the song or video is stored under, or null when it has none. */
    @Nullable
    private static String savedCopyOf(String videoId) {
        if (app.morphe.extension.music.patches.flyout.SongMenus.isOpenFor(videoId)) return videoId;
        if (!downloadMode().streamCopy()) return null;

        DownloadedMarkers.warmUp();
        DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
        if (registry == null) return null;

        // The video copy of a song is played as its music video, which is the id the player then shows.
        String songId = registry.canonicalId(VideoCopyStore.pairsIfLoaded().getOrDefault(videoId, videoId));
        return registry.hasOwnCopy(songId) ? songId : null;
    }

    /** Must be called from the main thread. Resolution and downloading happen in background. */
    public static void enqueue(String videoId) {
        DownloadMode mode = downloadMode();
        DownloadQuality quality = Settings.DOWNLOAD_QUALITY.get();
        if (mode == DownloadMode.OFF) return;
        if (!VIDEO_ID.matcher(videoId).matches()) {
            Utils.showToastShort(str("morphe_music_downloads_unknown_track"));
            return;
        }
        if (mode.localFiles() && !NativeDownloads.ensureStoragePermission()) return;
        if (ACTIVE_DOWNLOADS.containsKey(videoId)) {
            Utils.showToastShort(str("morphe_music_downloads_already_running"));
            return;
        }
        Utils.submitOnBackgroundThread(() -> {
            try {
                if (mode.localFiles()) NativeDownloads.migrateLegacy();
                // A music video saved before as its song names that song: there is nothing left to save.
                String known = mode.streamCopy() ? RawAudioStore.aliases().get(videoId) : null;
                if (known != null || plan(videoId, mode) == DownloadMode.Work.SKIP) {
                    if (mode.streamCopy()) RawAudioStore.markIndividual(known != null ? known : videoId);
                    Utils.showToastShort(str(mode.localFiles()
                            ? "morphe_music_downloads_already_saved" : "morphe_music_downloads_stream_already_saved"));
                    return null;
                }
                Utils.showToastShort(str("morphe_music_downloads_started"));
                downloadSingle(videoId, mode, quality);
                Utils.showToastShort(str(mode.localFiles()
                        ? "morphe_music_downloads_complete" : "morphe_music_downloads_stream_complete"));
                if (mode.localFiles()) NativePlaylistStore.refreshUnsortedLater(); // list the new single.
            } catch (Exception ex) {
                Logger.printException(() -> "Local audio download failed: " + videoId, ex);
                Utils.showToastShort(str("morphe_music_downloads_failed_reason", PlaylistText.failureReason(ex)));
            }
            return null;
        });
    }

    /**
     * What a request for one track is: a track of a playlist or album download, a song the user downloaded itself,
     * or the song found for a music video the user downloaded.
     */
    private enum Request {
        LIST_TRACK, SINGLE, SONG_OF_VIDEO;

        /** The user asked for this song itself, so a playlist removal keeps its copy. */
        boolean individual() {
            return this != LIST_TRACK;
        }

        /** A music video may be redirected to its song. */
        boolean mayRedirect() {
            return this == SINGLE;
        }
    }

    /** A stream copy of a music video is not wanted: its song is, and this is the song's id. */
    private static final class SongRedirect extends Exception {
        final String songId;

        SongRedirect(String songId) {
            super("The song of the music video is " + songId);
            this.songId = songId;
        }
    }

    /**
     * Saves one song the user chose. A music video becomes its song: the copy is the song's audio under the song's
     * id, and the video's id is recorded as the same song, so a tap on either finds it. A video that has no song
     * found is saved as it is, under its own id, and that is logged.
     */
    private static void downloadSingle(String videoId, DownloadMode mode, DownloadQuality quality) throws Exception {
        String savedId = videoId;
        Saved saved;
        try {
            saved = download(videoId, mode, quality, Request.SINGLE);
        } catch (SongRedirect redirect) {
            savedId = redirect.songId;
            Logger.printInfo(() -> "Single download: v=" + videoId + " is saved as the song " + redirect.songId);
            saved = download(savedId, mode, quality, Request.SONG_OF_VIDEO);
            RawAudioStore.addAlias(savedId, videoId);
        }
        // A copy that was there already (kept by a playlist before) is now also one the user asked for.
        if (mode.streamCopy() && !saved.downloaded()) RawAudioStore.markIndividual(savedId);
        if (mode.streamCopy()) app.morphe.extension.music.patches.flyout.SongMenus.remember(savedId);
    }

    /** What the track still needs in this mode. Asks only the stores the mode cares about. */
    static DownloadMode.Work plan(String videoId, DownloadMode mode) {
        return mode.plan(() -> NativeAudioStore.find(videoId) != null, () -> streamCopyExists(videoId));
    }

    private static boolean streamCopyExists(String videoId) {
        try {
            return RawAudioStore.find(videoId) != null;
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not check the stream copy: " + videoId, ex);
            return false;
        }
    }

    /** Brings one track to what the mode asks for: its local file or its stream copy. Returns at once when done. */
    static Saved download(String videoId, DownloadMode mode, DownloadQuality quality) throws Exception {
        return download(videoId, mode, quality, Request.LIST_TRACK);
    }

    private static Saved download(String videoId, DownloadMode mode, DownloadQuality quality, Request request)
            throws Exception {
        Utils.verifyOffMainThread();
        if (!VIDEO_ID.matcher(videoId).matches()) throw new IOException("Invalid video id");
        boolean playing = videoId.equals(VideoInformation.getVideoId());
        String title = playing ? currentTitle : null;
        String artist = playing ? currentArtist : null;

        while (true) {
            if (plan(videoId, mode) == DownloadMode.Work.SKIP) return saved(videoId, mode, false);

            FutureTask<Saved> task = new FutureTask<>(
                    () -> downloadBlocking(videoId, mode, quality, request, title, artist));
            FutureTask<Saved> existing = ACTIVE_DOWNLOADS.putIfAbsent(videoId, task);
            if (existing == null) {
                try {
                    task.run();
                    return task.get();
                } catch (ExecutionException ex) {
                    if (ex.getCause() instanceof Exception cause) throw cause;
                    throw ex;
                } finally {
                    ACTIVE_DOWNLOADS.remove(videoId, task);
                }
            }

            // Another request owns this track. Its mode may differ, so look again when it is done.
            try {
                existing.get();
            } catch (ExecutionException ex) {
                if (ex.getCause() instanceof Exception cause) throw cause;
                throw ex;
            }
        }
    }

    private static Saved saved(String videoId, DownloadMode mode, boolean downloaded) throws IOException {
        if (!mode.localFiles()) return new Saved(null, downloaded);

        Uri uri = NativeAudioStore.find(videoId);
        if (uri == null) throw new IOException("The downloaded audio is not available: " + videoId);
        return new Saved(uri, downloaded);
    }

    // the stream is downloaded to a private temporary file; then it is published with embedded tags as a local
    // file, since Music's device-files library reads metadata only from the file, or moved to the stream copy.
    private static Saved downloadBlocking(String videoId, DownloadMode mode, DownloadQuality quality, Request request,
                                         String title, String artist) throws Exception {
        NativeAudioStore.Destination destination = null;
        File temporary = null;
        try {
            // A competing request may have finished the track between the lookup and single-flight ownership.
            DownloadMode.Work work = plan(videoId, mode);
            if (work == DownloadMode.Work.SKIP) return saved(videoId, mode, false);

            DownloadCandidates<ResolvedStream> candidates = streamsFor(videoId, !work.writesLocalFile(), quality);
            ResolvedStream resolved = candidates.next();
            if (resolved == null) throw new IOException("Audio stream unavailable");
            if (request.mayRedirect() && work.keepsStreamCopy()) {
                String songId = songOfVideo(videoId, resolved.details());
                if (songId != null) throw new SongRedirect(songId);
            }
            AudioTagger.Tags tags = TrackMetadata.resolve(videoId, title, artist, resolved.details());
            title = tags.title;
            awaitNotificationSlot();
            showDownloadNotification(videoId, title, 0, true, str("morphe_music_downloads_starting"));
            Format format;
            while (true) {
                Format selected = resolved.format();
                format = selected;
                Logger.printDebug(() -> "Download quality: v=" + videoId + " requested=" + quality
                        + " itag=" + selected.getItag() + " mime=" + selected.getMimeType()
                        + " averageBitrate=" + selected.getAverageBitrate());
                temporary = File.createTempFile("rvx-audio-", ".part", Utils.getContext().getCacheDir());
                try {
                    // Keep the existing bounded parallel range/resume downloader.
                    downloadWithResume(videoId, title, format.getUrl(),
                            new NativeAudioStore.Destination(null, temporary, format.getMimeType()),
                            format.getContentLength());
                    break;
                } catch (ForbiddenException ex) {
                    temporary.delete();
                    temporary = null;
                    resolved = candidates.next();
                    if (resolved == null) throw ex;
                }
            }

            Uri uri = null;
            if (work.writesLocalFile()) {
                // Pending MediaStore files are hidden from native Library until the full audio has been indexed.
                destination = NativeAudioStore.create(videoId, AudioTagger.outputMimeType(format.getMimeType()),
                        tags.title, tags.artist);
                try (FileOutputStream output = destination.openOutput()) {
                    AudioTagger.write(temporary, format.getMimeType(), output, tags);
                }
                uri = NativeAudioStore.finish(videoId, destination);
                destination = null;
            } else if (work.keepsStreamCopy()) {
                if (!RawAudioStore.retain(videoId, temporary, format, request.individual())) {
                    throw new IOException("Could not keep the stream copy");
                }
                OfflineCopyStore.storeDownloaded(videoId, format, resolved.details(), tags);
            }
            awaitNotificationSlot();
            showDownloadNotification(videoId, title, 100, false, str(mode.localFiles()
                    ? "morphe_music_downloads_complete" : "morphe_music_downloads_stream_complete"));
            return new Saved(uri, true);
        } catch (SongRedirect redirect) {
            throw redirect;
        } catch (Exception ex) {
            awaitNotificationSlot();
            showDownloadNotification(videoId, title, 0, false,
                    str("morphe_music_downloads_failed_reason", PlaylistText.failureReason(ex)));
            throw ex;
        } finally {
            if (destination != null) NativeAudioStore.abort(destination);
            if (temporary != null) temporary.delete();
        }
    }

    private record ResolvedStream(Format format, VideoDetails details) {
    }

    /**
     * The song to save instead of this music video, or null to save the video's own audio under its own id (a
     * song, or a video with no song found, which is logged).
     */
    @Nullable
    private static String songOfVideo(String videoId, VideoDetails details) {
        boolean playerSaysVideo = SongIdResolver.isMusicVideo(details.hasMusicVideoType(),
                details.getMusicVideoType());
        SongIdResolver.Video video = new SongIdResolver.Video(videoId, details.getTitle(),
                details.getOwnerChannelName(), details.getLengthSeconds());
        String songId = SongIdLookup.songOf(video, playerSaysVideo);
        Logger.printDebug(() -> "Single download: v=" + videoId + " playerType="
                + (details.hasMusicVideoType() ? details.getMusicVideoType() : "none") + " song=" + songId);
        return songId == null || songId.equals(videoId) ? null : songId;
    }

    /** The server refused the stream's url itself, so another client's url may still work. */
    private static final class ForbiddenException extends IllegalStateException {
        ForbiddenException(String message) {
            super(message);
        }
    }

    /** A client's other formats remain candidates after its first URL is rejected. */
    private static DownloadCandidates<ResolvedStream> streamsFor(
            String videoId, boolean playableCopyOnly, DownloadQuality quality) {
        Iterator<ClientType> clients = StreamOrDetailsDataRequest.buildClientOrder(
                SpoofVideoStreamsPatch.getAvailableClients(),
                Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get()).iterator();
        return new DownloadCandidates<>(new Iterator<>() {
            @Override
            public boolean hasNext() {
                return clients.hasNext();
            }

            @Override
            public List<ResolvedStream> next() {
                ClientType client = clients.next();
                StreamOrDetailsDataRequest request = StreamOrDetailsDataRequest.fetchRequestForDownload(
                        videoId, List.of(client), client);
                return parseStreams(videoId, request, playableCopyOnly);
            }
        }, ResolvedStream::format, quality);
    }

    /** @return Whether a progress update may be posted without the system dropping it. */
    static boolean canPostProgress() { // shared with playlist progress.
        long now = System.currentTimeMillis();
        long previous = lastNotificationTime.get();
        return now - previous >= NOTIFICATION_INTERVAL_MILLISECONDS
                && lastNotificationTime.compareAndSet(previous, now);
    }

    /**
     * Waits for the next slot, so a notification that matters is never the one being dropped.
     * The loop sleeps exactly as long as the slot is away, and repeats only if another thread
     * took the slot first. Must be called off the main thread.
     */
    static void awaitNotificationSlot() {
        while (true) {
            long now = System.currentTimeMillis();
            long previous = lastNotificationTime.get();
            long remaining = NOTIFICATION_INTERVAL_MILLISECONDS - (now - previous);

            if (remaining <= 0) {
                if (lastNotificationTime.compareAndSet(previous, now)) return;
                continue;
            }

            try {
                //noinspection BusyWait
                Thread.sleep(remaining);
            } catch (InterruptedException ex) {
                Thread.currentThread().interrupt();
                return;
            }
        }
    }


    // The video copy download reuses the same bounded downloader.
    static void downloadWithResume(String videoId, String title, String url,
                                   NativeAudioStore.Destination temporary, long expectedLength) throws Exception {
        if (expectedLength <= 0) expectedLength = probeContentLength(url);
        final long totalLength = expectedLength;

        if (totalLength <= 0) {
            downloadUnknownLength(url, temporary);
        } else {
            downloadInParallel(videoId, title, url, temporary, totalLength);
        }

        if (totalLength > 0) {
            long actualLength = temporary.size();
            if (actualLength != totalLength) {
                throw new IllegalStateException("Incomplete audio file: " + actualLength + "/" + totalLength);
            }
        }
    }

    // bounded ranges are handed out from a shared queue to a
    // capped worker pool; the first failure stops every connection immediately.
    private static void downloadInParallel(String videoId, String title, String url,
                                           NativeAudioStore.Destination temporary, long totalLength) throws Exception {
        temporary.setLength(totalLength);

        AtomicLong downloaded = new AtomicLong();
        ProgressCallback progress = bytes -> {
            if (!canPostProgress()) return;
            int percent = (int) Math.min(99, bytes * 100 / totalLength);
            showDownloadNotification(videoId, title, percent, true,
                    str("morphe_music_downloads_progress", percent));
        };

        // Short files keep the original equal split, longer ones use ranges below the throttle.
        long rangeSize = Math.min(MAX_RANGE_SIZE, (totalLength + SEGMENT_COUNT - 1) / SEGMENT_COUNT);
        long rangeCount = (totalLength + rangeSize - 1) / rangeSize;
        int workers = (int) Math.min(MAX_CONNECTIONS, rangeCount);
        RangeQueue queue = new RangeQueue(url, temporary, totalLength, rangeSize, downloaded, progress);

        // Android's ExecutorService is not AutoCloseable, so it is shut down in the finally below.
        //noinspection resource
        ExecutorService executor = Executors.newFixedThreadPool(workers);
        ExecutorCompletionService<Void> completion = new ExecutorCompletionService<>(executor);

        try {
            for (int index = 0; index < workers; index++) {
                completion.submit(queue::work);
            }

            for (int index = 0; index < workers; index++) {
                try {
                    completion.take().get();
                } catch (ExecutionException ex) {
                    if (ex.getCause() instanceof Exception cause) throw cause;
                    throw ex;
                }
            }
        } finally {
            // No worker may still write to the file once this returns.
            queue.stop();
            executor.shutdownNow();
            boolean interrupted = false;
            while (!executor.isTerminated()) {
                try {
                    executor.awaitTermination(1, TimeUnit.SECONDS);
                } catch (InterruptedException ex) {
                    interrupted = true;
                }
            }
            if (interrupted) Thread.currentThread().interrupt();
        }
    }

    private interface ProgressCallback {
        void update(long bytes);
    }

    /** Hands out consecutive ranges of one file to the workers that download them. */
    private static final class RangeQueue {
        private final String url;
        private final NativeAudioStore.Destination destination;
        private final long totalLength;
        private final long rangeSize;
        private final AtomicLong downloaded;
        private final ProgressCallback progress;
        private final AtomicLong nextStart = new AtomicLong();
        private final Set<HttpURLConnection> connections = ConcurrentHashMap.newKeySet();
        private volatile boolean stopped;

        RangeQueue(String url, NativeAudioStore.Destination destination, long totalLength, long rangeSize,
                   AtomicLong downloaded, ProgressCallback progress) {
            this.url = url;
            this.destination = destination;
            this.totalLength = totalLength;
            this.rangeSize = rangeSize;
            this.downloaded = downloaded;
            this.progress = progress;
        }

        /** Aborts every connection, so blocked reads fail at once instead of timing out. */
        void stop() {
            stopped = true;
            for (HttpURLConnection connection : connections) connection.disconnect();
        }

        Void work() throws Exception {
            // each worker owns a seekable provider
            // descriptor; writes retain the existing reusable byte buffer without an extra copy.
            try (FileOutputStream output = destination.openOutput()) {
                FileChannel channel = output.getChannel();
                byte[] buffer = new byte[BUFFER_SIZE];
                while (true) {
                    long start = nextStart.getAndAdd(rangeSize);
                    if (start >= totalLength) return null;

                    downloadRange(start, Math.min(totalLength - 1, start + rangeSize - 1),
                            output, channel, buffer);
                }
            }
        }

        private void checkStopped() {
            if (stopped) throw new CancellationException("Download stopped");
        }

        private void downloadRange(long start, long end, FileOutputStream output,
                                   FileChannel channel, byte[] buffer) throws Exception {
            long position = start;
            int failures = 0;

            while (position <= end) {
                checkStopped();
                long before = position;
                HttpURLConnection connection = openAudioConnection(url, position, end);
                boolean reusable = false;
                connections.add(connection);

                try {
                    checkStopped();
                    int responseCode = connection.getResponseCode();
                    if (responseCode == HttpURLConnection.HTTP_FORBIDDEN) {
                        throw new ForbiddenException("Range request returned HTTP 403");
                    }
                    if (responseCode != HttpURLConnection.HTTP_PARTIAL) {
                        throw new IllegalStateException("Range request returned HTTP " + responseCode);
                    }

                    try (InputStream input = connection.getInputStream()) {
                        channel.position(position);

                        while (position <= end) {
                            int read = readBuffer(input, buffer,
                                    (int) Math.min(buffer.length, end - position + 1));
                            if (read == 0) break;

                            output.write(buffer, 0, read);
                            position += read;
                            progress.update(downloaded.addAndGet(read));
                        }

                        // Reading up to the end lets Android keep the connection for the next range.
                        reusable = position > end && input.read() < 0;
                    }
                } catch (IOException ex) {
                    checkStopped();
                    Logger.printDebug(() -> "Audio range interrupted; retrying", ex);
                } finally {
                    connections.remove(connection);
                    if (!reusable) connection.disconnect();
                }

                failures = position > before ? 0 : failures + 1;
                if (failures >= MAX_STALLED_ATTEMPTS) {
                    throw new IllegalStateException("Download range stalled at " + position);
                }
            }
        }

        // Android returns small socket reads, so fill the
        // buffer before each file write instead of writing every few KiB.
        private int readBuffer(InputStream input, byte[] buffer, int length) throws IOException {
            int filled = 0;
            while (filled < length) {
                checkStopped();
                int read = input.read(buffer, filled, length - filled);
                if (read < 0) break;
                filled += read;
            }
            return filled;
        }
    }

    // modified by lavinhoque33, 2026-11-09: package-private, the video copy download asks the length of its stream.
    static long probeContentLength(String url) {
        HttpURLConnection connection = null;
        try {
            connection = openAudioConnection(url, 0, 0);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_PARTIAL) return -1;

            String contentRange = connection.getHeaderField("Content-Range");
            if (contentRange == null) return -1;

            int slash = contentRange.lastIndexOf('/');
            return slash < 0 ? -1 : Long.parseLong(contentRange.substring(slash + 1));
        } catch (Exception ex) {
            Logger.printDebug(() -> "Could not probe audio length", ex);
            return -1;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static HttpURLConnection openAudioConnection(String url, long start, long end) throws Exception {
        HttpURLConnection connection = Requester.openConnection(url);
        connection.setConnectTimeout(CONNECT_TIMEOUT_MILLISECONDS);
        connection.setReadTimeout(READ_TIMEOUT_MILLISECONDS);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setRequestProperty("Referer", "https://music.youtube.com/");
        connection.setRequestProperty("Range", "bytes=" + start + "-" + end);
        return connection;
    }

    private static void downloadUnknownLength(String url, NativeAudioStore.Destination destination) throws Exception {
        HttpURLConnection connection = Requester.openConnection(url);
        connection.setConnectTimeout(CONNECT_TIMEOUT_MILLISECONDS);
        connection.setReadTimeout(READ_TIMEOUT_MILLISECONDS);
        connection.setRequestProperty("User-Agent", USER_AGENT);

        try {
            if (connection.getResponseCode() == HttpURLConnection.HTTP_FORBIDDEN) {
                throw new ForbiddenException("HTTP 403");
            }
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + connection.getResponseCode());
            }

            try (InputStream input = connection.getInputStream();
                 FileOutputStream output = destination.openOutput()) {
                byte[] buffer = new byte[BUFFER_SIZE];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    output.write(buffer, 0, read);
                }
            }
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Segments report progress from their own threads, and {@code notify} is a oneway binder
     * call whose order only holds per sending thread. Posting every update from the main thread
     * stops late progress from replacing the completed state on screen.
     */
    static void showDownloadNotification(String key, String title, int progress,
                                         boolean ongoing, String text) {
        Utils.runOnMainThread(() -> postDownloadNotification(key, title, progress, ongoing, text));
    }

    @SuppressLint("NotificationPermission") // The patch declares POST_NOTIFICATIONS.
    private static void postDownloadNotification(String key, String title, int progress,
                                                 boolean ongoing, String text) {
        Context context = Utils.getContext();
        NotificationManager manager =
                (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager == null) return;

        manager.createNotificationChannel(new NotificationChannel(DOWNLOAD_CHANNEL,
                str("morphe_music_downloads_notification_channel"),
                NotificationManager.IMPORTANCE_LOW));

        Notification.Builder builder = new Notification.Builder(context, DOWNLOAD_CHANNEL);
        builder.setSmallIcon(ongoing
                        ? android.R.drawable.stat_sys_download
                        : android.R.drawable.stat_sys_download_done)
                .setContentTitle(title == null || title.isBlank() ? "YouTube Music" : title)
                .setContentText(text)
                .setOngoing(ongoing)
                .setOnlyAlertOnce(true);

        if (ongoing) builder.setProgress(100, Math.max(0, progress), progress < 0);
        manager.notify(key.hashCode(), builder.build());
    }

    private static List<ResolvedStream> parseStreams(String videoId, StreamOrDetailsDataRequest request,
                                                    boolean playableCopyOnly) {
        StreamOrDetailsDataRequest.StreamData stream = request.getStream();
        if (stream == null) {
            Logger.printDebug(() -> "No stream data resolved for " + videoId);
            return List.of();
        }

        try {
            PlayerResponse response = PlayerResponse.parseFrom(stream.streamingData());
            if (!videoId.equals(response.getVideoDetails().getVideoId())) return List.of();
            List<ResolvedStream> formats = new ArrayList<>();
            for (Format format : DownloadFormats.audioFormats(response, playableCopyOnly)) {
                formats.add(new ResolvedStream(format, response.getVideoDetails()));
            }
            return formats;
        } catch (Exception ex) {
            Logger.printException(() -> "Could not parse audio formats: " + videoId, ex);
            return List.of();
        }
    }
}
