/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-20.
 * Modified by lavinhoque33, 2026-11-19.
 * Modified by lavinhoque33, 2026-11-18.
 * Modified by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BooleanSupplier;
import java.util.function.Predicate;
import java.util.function.UnaryOperator;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Downloads a playlist or album, keeping interrupted Stream downloads available to resume. */
public final class PlaylistDownloads {
    private static final ConcurrentHashMap<String, Run> active = new ConcurrentHashMap<>();
    private static final ThreadLocal<Run> worker = new ThreadLocal<>();
    private static final BooleanSupplier NOT_STOPPED = () -> false;

    private static final class Run {
        final DownloadMode mode;
        final boolean automatic;
        final long startedAt = SystemClock.elapsedRealtime();
        DownloadKeepAlive.Hold hold;
        DownloadNetwork network;
        boolean madeProgress;
        boolean interrupted;
        volatile boolean removed;

        Run(DownloadMode mode, boolean automatic) {
            this.mode = mode;
            this.automatic = automatic;
        }

        boolean cancelled() {
            return removed || hold.timedOut();
        }

        void recordInterruption() {
            if (automatic) {
                interrupted = hold.timedOut() || Thread.currentThread().isInterrupted()
                        || network.connectionInterrupted();
            }
        }
    }

    private PlaylistDownloads() {}

    /**
     * A saved stream source (even if an automatic resume is filling it) offers Remove on the existing button.
     */
    static void onDownloadButton(String playlistId) {
        Run run = active.get(playlistId);
        if (run != null && run.automatic && !run.removed) {
            DownloadRemoval.confirmSource(playlistId);
            return;
        }

        boolean streamCopy = LocalDownloadManager.downloadMode().streamCopy();
        boolean running = run != null;
        HeaderDownloadState.Tap tap = HeaderDownloadState.tapOf(streamCopy,
                streamCopy && DownloadedMarkers.isSourceDownloaded(playlistId), running);
        Logger.printDebug(() -> "PlaylistDownloads: header Download of " + playlistId + ", tap=" + tap);
        switch (tap) {
            case REMOVE -> DownloadRemoval.confirmSource(playlistId);
            case IN_PROGRESS -> Utils.showToastShort(str("morphe_music_downloads_already_running"));
            case DOWNLOAD -> enqueue(playlistId);
        }
    }

    /** Whether any list is being downloaded. */
    static boolean anyRunning() {
        return !active.isEmpty();
    }

    /** Whether a download of the list is running. */
    static boolean isRunning(@Nullable String playlistId) {
        return playlistId != null && active.containsKey(playlistId);
    }

    /** The mode of an active run takes priority over a setting changed since it started. */
    static boolean showsStreamProgress(String playlistId) {
        Run run = active.get(playlistId);
        return run != null ? run.mode.streamCopy() : LocalDownloadManager.downloadMode().streamCopy();
    }

    static void resume(String playlistId) {
        enqueue(playlistId, LocalDownloadManager.downloadMode(), true, false);
    }

    enum ResumeStart { STARTED, WIFI_UNAVAILABLE, NOT_PENDING, ALREADY_RUNNING, MODE_CHANGED, STORAGE_DENIED }

    static ResumeStart resumeAutomatically(String playlistId) {
        return enqueue(playlistId, LocalDownloadManager.downloadMode(), true, true);
    }

    /** Called under the source mutation lock; an explicit Remove must win over an outstanding worker. */
    static void onSourceRemoved(String playlistId) {
        Run run = active.get(playlistId);
        if (run == null || !run.mode.streamCopy()) return;

        run.removed = true;
        DownloadNetwork.wakeWaiters();
        Logger.printInfo(() -> "PlaylistDownloads: removed active " + playlistId);
    }

    static BooleanSupplier stopSignal() {
        Run run = worker.get();
        if (run != null) return run::cancelled;

        BooleanSupplier sync = PlaylistSync.stopSignal();
        return sync == null ? NOT_STOPPED : sync;
    }

    static boolean quietTransfer() {
        Run run = worker.get();
        return run == null ? PlaylistSync.transferring() : run.automatic;
    }

    static <T> T publishMedia(Callable<T> write) throws Exception {
        Run run = worker.get();
        if (run == null) return PlaylistSync.publishMedia(write);

        synchronized (PlaylistSync.MUTATION) {
            if (run.cancelled()) throw new IOException("Playlist download stopped");
            return write.call();
        }
    }

    public static void enqueue(String playlistId) {
        enqueue(playlistId, LocalDownloadManager.downloadMode(), false, false);
    }

    private static ResumeStart enqueue(String playlistId, DownloadMode mode, boolean resume, boolean automatic) {
        if (mode == DownloadMode.OFF || (automatic && !mode.streamCopy())) return ResumeStart.MODE_CHANGED;
        if (mode.localFiles() && !NativeDownloads.ensureStoragePermission()) return ResumeStart.STORAGE_DENIED;

        Run run;
        synchronized (PlaylistSync.MUTATION) {
            if (resume && !DownloadRetryPlan.canResume(mode.streamCopy(), automatic
                    ? DownloadedMarkers.hasPendingDownload(playlistId) : DownloadedMarkers.isPlaylistPending(playlistId))) {
                return ResumeStart.NOT_PENDING;
            }
            if (automatic && DownloadNetwork.eligibleWifi() == null) return ResumeStart.WIFI_UNAVAILABLE;

            run = new Run(mode, automatic);
            if (active.putIfAbsent(playlistId, run) != null) {
                if (!automatic) Utils.showToastShort(str("morphe_music_downloads_already_running"));
                return ResumeStart.ALREADY_RUNNING;
            }
            if (!automatic && mode.streamCopy() && !Utils.isInternetReachable()) {
                active.remove(playlistId, run);
                Utils.showToastShort(str("morphe_music_playlist_download_connect"));
                return ResumeStart.WIFI_UNAVAILABLE;
            }

            OfflineSourceStore.Source source = resume ? OfflineCopyStore.source(playlistId) : null;
            run.hold = DownloadKeepAlive.acquire("playlist:" + playlistId, source == null ? null : source.title());
            if (mode.streamCopy()) run.network = new DownloadNetwork(automatic, run::cancelled, run.hold);
        }

        if (mode.streamCopy()) DownloadedMarkers.onPlaylistActivityChanged();
        if (automatic) Logger.printInfo(() -> "PlaylistDownloads: auto-resume " + playlistId);
        else {
            if (resume) Logger.printInfo(() -> "PlaylistDownloads: manual resume " + playlistId);
            Utils.showToastShort(str("morphe_music_playlist_download_started"));
        }

        DownloadQuality quality = Settings.DOWNLOAD_QUALITY.get();
        Utils.runOnBackgroundThread(() -> downloadPlaylist(playlistId, run, quality));
        return ResumeStart.STARTED;
    }

    private static void downloadPlaylist(String playlistId, Run run, DownloadQuality quality) {
        worker.set(run);
        try (DownloadKeepAlive.Hold hold = run.hold) {
            if (run.cancelled()) {
                run.recordInterruption();
                return;
            }
            if (run.mode.localFiles()) NativeDownloads.migrateLegacy();

            String browseId = "VL" + playlistId;
            JSONObject first = browse(run, browseId, null);
            SourceHeader header = run.network == null ? header(playlistId, first)
                    : run.network.transfer(() -> header(playlistId, first));
            if (!header.hasTitle()) throw new IOException("Playlist title is unavailable");
            hold.progress(header.title(), -1, str("morphe_music_downloads_starting"));

            List<String> tracks = PlaylistPage.readPlaylist(run.mode.streamCopy() ? playlistId : null, first,
                    token -> browse(run, browseId, token));
            List<String> available = PlaylistPage.available(tracks);
            int skipped = tracks.size() - available.size();
            if (available.isEmpty()) throw new IOException("Playlist contains no downloadable tracks");
            if (skipped > 0) Logger.printDebug(() -> "PlaylistDownloads: " + playlistId + " skips " + skipped
                    + " unavailable of " + tracks.size() + " tracks");

            if (run.mode.streamCopy()) {
                downloadStream(playlistId, header, tracks, available, skipped, quality, run);
            } else {
                downloadDeviceFiles(playlistId, header.title(), available, skipped, quality, run,
                        AlbumFileTracks.batch(browseId, first));
            }
        } catch (Exception ex) {
            if (run.removed) return;
            if (ex instanceof InterruptedException) Thread.currentThread().interrupt();

            Logger.printWarn(() -> "PlaylistDownloads: list " + playlistId + " stopped", ex);
            run.recordInterruption();
            if (!DownloadRetryPlan.reportFailure(run.automatic, run.interrupted)) return;

            LocalDownloadManager.awaitNotificationSlot();
            if (run.removed) return;

            String failed = str("morphe_music_playlist_download_failed", PlaylistText.failureReason(ex));
            LocalDownloadManager.showDownloadNotification(run.hold.key(), run.hold.title(), 0, false, failed);
            if (!run.automatic) Utils.showToastLong(failed);
        } finally {
            worker.remove();
            active.remove(playlistId, run);
            if (run.mode.streamCopy()) DownloadedMarkers.onPlaylistFinished();
            if (run.mode.localFiles()) NativePlaylistStore.refreshUnsortedLater();
            if (run.automatic) {
                PlaylistSync.resumeFinished(playlistId, run.startedAt, run.madeProgress, run.interrupted);
            } else if (run.mode.streamCopy() && !run.removed && DownloadedMarkers.hasPendingDownload(playlistId)) {
                PlaylistSync.manualTransferPending();
            }
        }
    }

    private static JSONObject browse(Run run, String browseId, @Nullable String continuation) throws Exception {
        Callable<JSONObject> request = () -> MusicBrowseRequest.browse(Utils.getContext(), browseId, continuation, null);
        return run.network == null ? request.call() : run.network.transfer(request);
    }

    private static void downloadDeviceFiles(String playlistId, String title, List<String> tracks,
                                            int skipped, DownloadQuality quality, Run run,
                                            AlbumFileTracks albumTracks) throws Exception {
        List<Long> mediaIds = new ArrayList<>(tracks.size());
        LocalDownloadManager.Saved onlyNewFile = null;
        int newFiles = 0;
        for (int index = 0; index < tracks.size(); index++) {
            if (DownloadKeepAlive.supported() || LocalDownloadManager.canPostProgress()) {
                run.hold.progress(title, index * 100 / tracks.size(),
                        str("morphe_music_playlist_download_progress", index + 1, tracks.size()));
            }
            LocalDownloadManager.Saved saved = LocalDownloadManager.downloadDeviceFile(tracks.get(index), quality,
                    albumTracks);
            if (saved.downloaded()) {
                newFiles++;
                onlyNewFile = newFiles == 1 ? saved : null;
            }
            mediaIds.add(NativeAudioStore.mediaId(saved.nativeTrack()));
        }
        if (!run.hold.finish()) throw new IOException("Playlist download stopped");
        NativePlaylistStore.save(playlistId, title, mediaIds);
        reportComplete(run, playlistId, title, completionText(run.mode, 0, tracks.size(), skipped,
                VideoCopyDownloader.Outcome.NONE), onlyNewFile);
    }

    private static void downloadStream(String playlistId, SourceHeader header, List<String> tracks,
                                       List<String> available, int skipped, DownloadQuality quality, Run run)
            throws Exception {
        synchronized (PlaylistSync.MUTATION) {
            if (run.removed) return;
            DownloadedMarkers.onPlaylistStarted(playlistId, tracks, header);
        }

        UnaryOperator<String> canonical = streamCopyIds();
        Predicate<String> ready = PlaylistDownloads::offlineReady;
        Set<String> failures = new HashSet<>();
        String title = header.title();
        var progress = new PlaylistTransfer.ProgressCounter(available, canonical, ready);
        PlaylistTransfer.Progress initial = progress.snapshot();
        showProgress(run, title, initial);
        PlaylistTransfer.Outcome transfer = PlaylistTransfer.fill(available, canonical, ready,
                () -> !run.network.stopped(),
                id -> {
                    boolean saved = run.network.transfer(() -> ensureStreamTrack(id, quality));
                    progress.saved(id);
                    if (DownloadKeepAlive.supported() || LocalDownloadManager.canPostProgress()) {
                        showProgress(run, title, progress.snapshot());
                    }
                    return saved;
                }, (id, ex) -> {
                    if (run.removed) return;
                    failures.add(id);
                    Logger.printDebug(() -> "PlaylistDownloads: list=" + playlistId + " track=" + id + " failed", ex);
                });
        if (run.removed) return;

        VideoCopyDownloader.Outcome videos = transfer.allReady() && !run.network.stopped()
                ? VideoCopyDownloader.ensure(playlistId, title, available, quality, canonical, run.network, run.hold)
                : VideoCopyDownloader.Outcome.NONE;
        boolean connected = transfer.allReady() && !run.network.stopped() && run.network.awaitTransferConnection();

        PlaylistTransfer.Progress result;
        boolean completed;
        synchronized (PlaylistSync.MUTATION) {
            if (run.removed) return;
            // A song or all copies may have been explicitly deleted during the transfers.
            result = playlistProgress(available, streamCopyIds(), ready);
            run.madeProgress = result.ready() > initial.ready();
            completed = result.complete() && connected && !run.network.stopped() && run.hold.finish();
            if (completed) DownloadedMarkers.onPlaylistCompleted(playlistId);
        }
        if (completed) {
            reportComplete(run, playlistId, title, completionText(run.mode, transfer.downloaded(), result.total(),
                    skipped, videos), null);
        } else {
            int failed = 0;
            for (String id : available) if (failures.contains(canonical.apply(id))) failed++;
            reportPartial(run, playlistId, title, result, Math.min(failed, result.total() - result.ready()));
        }
    }

    private static UnaryOperator<String> streamCopyIds() {
        Set<String> own = RawAudioStore.copyIds();
        var aliases = RawAudioStore.aliases();
        return id -> {
            String copyId = OfflineCopyStore.copyId(id, own, aliases);
            return !id.equals(copyId) && RawAudioStore.find(copyId) == null ? id : copyId;
        };
    }

    private static PlaylistTransfer.Progress playlistProgress(List<String> tracks, UnaryOperator<String> canonical,
                                                               Predicate<String> ready) {
        var readyCopies = new HashMap<String, Boolean>();
        return PlaylistTransfer.progress(tracks, id -> readyCopies.computeIfAbsent(canonical.apply(id), ready::test));
    }

    private static boolean offlineReady(String copyId) {
        return OfflineCopyStore.metadataOf(copyId) != null && RawAudioStore.find(copyId) != null;
    }

    private static void showProgress(Run run, String title, PlaylistTransfer.Progress progress) {
        run.hold.progress(title, progress.ready() * 100 / progress.total(), progressText(progress, false));
    }

    private static boolean ensureStreamTrack(String id, DownloadQuality quality) throws Exception {
        return PlaylistTransfer.prepare(id, key -> RawAudioStore.find(key) != null,
                key -> OfflineCopyStore.metadataOf(key) != null,
                key -> LocalDownloadManager.download(key, DownloadMode.STREAM_COPY, quality).downloaded(),
                key -> OfflineBackfill.fetchAndStore(key, true));
    }

    static String progressText(PlaylistTransfer.Progress progress, boolean resume) {
        return str(resume ? "morphe_music_playlist_resume" : "morphe_music_playlist_ready",
                progress.ready(), progress.total());
    }

    private static void reportComplete(Run run, String playlistId, String title, String text,
                                       @Nullable LocalDownloadManager.Saved onlyNewFile) {
        run.hold.close();
        LocalDownloadManager.awaitNotificationSlot();
        if (run.removed) return;

        Logger.printInfo(() -> "PlaylistDownloads: completed " + playlistId);
        LocalDownloadManager.showDownloadNotification("playlist:" + playlistId, title, 100, false, text, onlyNewFile);
        if (!run.automatic) Utils.showToastShort(text);
    }

    private static void reportPartial(Run run, String playlistId, String title, PlaylistTransfer.Progress progress,
                                      int failed) {
        String text = failed == 0 ? progressText(progress, true)
                : str("morphe_music_playlist_partial_failed", progress.ready(), progress.total(), failed);
        Logger.printInfo(() -> "PlaylistDownloads: pending " + playlistId + " ready=" + progress.ready()
                + " total=" + progress.total() + " failed=" + failed);
        run.hold.close();
        run.recordInterruption();
        if (!DownloadRetryPlan.reportFailure(run.automatic, run.interrupted)) return;

        LocalDownloadManager.awaitNotificationSlot();
        if (run.removed) return;

        LocalDownloadManager.showDownloadNotification("playlist:" + playlistId, title, 0, false, text);
        if (!run.automatic) Utils.showToastLong(text);
    }

    /**
     * The text of a finished playlist download: {@code total} tracks were available and {@code skipped} were not. A
     * stream-only download that found every copy already saved, audio and videos, says so, because nothing was
     * downloaded. The videos the list has are counted; videos that failed are said last.
     */
    static String completionText(DownloadMode mode, int downloaded, int total, int skipped,
                                 VideoCopyDownloader.Outcome videos) {
        String done;
        if (mode.localFiles()) {
            done = str("morphe_music_playlist_download_complete", total);
        } else {
            String key = VideoCopyLogic.completionKey(downloaded, videos.saved(), videos.videos());
            done = videos.videos() > 0 ? str(key, total, videos.videos()) : str(key, total);
        }
        if (mode.streamCopy() && videos.failed() > 0) {
            done += " (" + str("morphe_music_playlist_videos_failed", videos.failed()) + ")";
        }
        return skipped == 0 ? done : done + " (" + str("morphe_music_playlist_unavailable_skipped", skipped) + ")";
    }

    /** The header of a playlist or album, read off the network. For use on a worker thread. */
    static SourceHeader fetchHeader(String playlistId) throws Exception {
        return header(playlistId, MusicBrowseRequest.browse(Utils.getContext(), "VL" + playlistId, null, null));
    }

    private static SourceHeader header(String playlistId, JSONObject response) throws Exception {
        SourceHeader header = SourceHeader.read(response);
        return header.hasTitle() ? header : albumHeader(playlistId, response);
    }

    /**
     * Album playlists (OLAK…) have no header in their playlist response. Every row links to
     * the album page instead; use that page's header only if all rows agree on one album and
     * the album page itself points back at this playlist.
     */
    private static SourceHeader albumHeader(String playlistId, JSONObject response) throws Exception {
        Set<String> albums = new HashSet<>();
        collectAlbums(response, albums);
        if (albums.size() != 1) return SourceHeader.EMPTY;
        JSONObject album = MusicBrowseRequest.browse(Utils.getContext(), albums.iterator().next(), null, null);
        return album.toString().contains("\"" + playlistId + "\"") ? SourceHeader.read(album) : SourceHeader.EMPTY;
    }

    private static void collectAlbums(Object node, Set<String> albums) {
        if (node instanceof JSONObject object) {
            JSONObject endpoint = object.optJSONObject("browseEndpoint");
            String id = endpoint == null ? "" : endpoint.optString("browseId");
            if (id.startsWith("MPREb_")) albums.add(id);
            Iterator<String> keys = object.keys();
            while (keys.hasNext()) collectAlbums(object.opt(keys.next()), albums);
        } else if (node instanceof JSONArray array) {
            for (int i = 0; i < array.length(); i++) collectAlbums(array.opt(i), albums);
        }
    }
}
