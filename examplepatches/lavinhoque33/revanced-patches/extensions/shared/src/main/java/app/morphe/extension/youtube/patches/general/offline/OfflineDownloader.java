/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-10-10.
 * Modified by lavinhoque33, 2026-10-25.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Activity;
import android.app.Notification;
import android.content.Context;
import android.net.Uri;
import android.text.format.Formatter;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorCompletionService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;

import app.morphe.extension.music.patches.downloads.AudioTagger;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Built-in downloader: format picker, chunked parallel download of the DASH (and for the 1080p
 * Premium stream, HLS) streams, muxing, and saving videos to {@code Movies}, audio to {@code Music}
 * and thumbnails to {@code Pictures}. Downloads run one at a time, further downloads wait in a
 * queue. The process is kept alive by the hooked {@code OfflineKeepAliveService}.
 */
public final class OfflineDownloader {
    enum State {QUEUED, DOWNLOADING, MERGING, SAVING}

    private static final Pattern VIDEO_ID = Pattern.compile("[A-Za-z0-9_-]{11}");
    private static final String THUMBNAIL_URL = "https://i.ytimg.com/vi/%s/hqdefault.jpg";

    // Measured 16 MiB response throttling; six connections saturate below it.
    private static final long CHUNK_SIZE = 8L * 1024 * 1024;
    private static final int PARALLEL_CONNECTIONS = 6;
    private static final int CHUNK_ATTEMPTS = 3;
    private static final int BUFFER_SIZE = 64 * 1024;
    private static final int CONNECT_TIMEOUT_MS = 15_000;
    private static final int READ_TIMEOUT_MS = 30_000;
    private static final double REQUIRED_SPACE_FACTOR = 2.2;
    private static final long NOTIFICATION_INTERVAL_MS = 1000;

    /** A download in the queue or in progress. */
    static final class Task {
        /** {@link OfflineVideo#keyOf}: a video and the audio-only download of it are separate tasks. */
        final String key;
        final String videoId;
        final String title;
        // Empty while a playlist download has not chosen its stream yet.
        volatile String qualityLabel;
        /** Position in the playlist, 1-based. Only set with {@link #batch}. */
        final int index;
        @Nullable
        final Batch batch;
        /** Set once by {@link #run}, so a playlist summary counts every task exactly once. */
        volatile boolean succeeded;
        volatile boolean failed;
        final AtomicBoolean counted = new AtomicBoolean();
        final AtomicLong done = new AtomicLong();
        // Abort blocking reads and retain displayed progress across client restarts.
        final Set<HttpURLConnection> connections = ConcurrentHashMap.newKeySet();
        final AtomicInteger percent = new AtomicInteger(-1);
        volatile boolean transferStopped;
        volatile long total;
        volatile State state = State.QUEUED;
        @Nullable
        volatile String subtitleStatus;
        volatile boolean cancelled;
        volatile boolean timedOut;
        @Nullable
        volatile Future<?> future;

        volatile OfflineFormats.Resolved resolved;
        /** The video stream, or the audio stream of an audio-only download. */
        volatile OfflineFormats.Stream stream;
        final OfflineCaptions.Selection subtitles;

        Task(OfflineFormats.Resolved resolved, OfflineFormats.Stream stream) {
            this.key = OfflineVideo.keyOf(resolved.videoId(), stream.isAudioOnly());
            this.videoId = resolved.videoId();
            this.title = resolved.title();
            this.qualityLabel = qualityLabel(stream);
            this.resolved = resolved;
            this.stream = stream;
            this.index = 0;
            this.batch = null;
            this.subtitles = stream.isAudioOnly() ? OfflineCaptions.Selection.none() : resolved.captions().selection();
        }

        /** A playlist entry. Stream urls expire, so the stream is chosen when the task starts. */
        Task(String videoId, String title, int index, Batch batch) {
            this.key = OfflineVideo.keyOf(videoId, false);
            this.videoId = videoId;
            this.title = title;
            this.qualityLabel = "";
            this.index = index;
            this.batch = batch;
            this.subtitles = OfflineCaptions.Selection.none();
        }

        State getState() {
            return state;
        }

        void preparingTranslatedSubtitles() {
            subtitleStatus = str("revanced_offline_subtitles_preparing");
            notifyChanged(true);
        }

        /** @return 0-100 without retreating during fallback, or -1 until a size is known. */
        int getPercent() {
            long totalBytes = total;
            if (totalBytes <= 0) return percent.get();
            int current = (int) Math.min(100, done.get() * 100 / totalBytes);
            return percent.accumulateAndGet(current, Math::max);
        }
    }

    /** The videos of one playlist download, which share a quality limit and one summary. */
    static final class Batch {
        private static final AtomicInteger NEXT_ID = new AtomicInteger();

        final int id = NEXT_ID.incrementAndGet();
        final String title;
        final int total;
        /** Largest video height to download. */
        final int heightLimit;
        /** Videos left out because the library already has them. */
        final int alreadyDownloaded;
        final AtomicInteger remaining;
        final AtomicInteger succeeded = new AtomicInteger();
        final AtomicInteger failed = new AtomicInteger();
        final AtomicInteger cancelled = new AtomicInteger();
        volatile boolean timedOut;

        Batch(String title, int total, int heightLimit, int alreadyDownloaded) {
            this.title = title;
            this.total = total;
            this.heightLimit = heightLimit;
            this.alreadyDownloaded = alreadyDownloaded;
            this.remaining = new AtomicInteger(total);
        }

        String summary() {
            List<String> parts = new ArrayList<>();
            if (succeeded.get() > 0) parts.add(str("revanced_offline_batch_part_downloaded", succeeded.get()));
            if (failed.get() > 0) parts.add(str("revanced_offline_batch_part_failed", failed.get()));
            if (cancelled.get() > 0) parts.add(str("revanced_offline_batch_part_cancelled", cancelled.get()));
            if (alreadyDownloaded > 0) {
                parts.add(str("revanced_offline_batch_part_already_downloaded", alreadyDownloaded));
            }
            String text = String.join(" · ", parts);
            return timedOut ? text + "\n" + str("revanced_offline_error_time_limit") : text;
        }
    }

    /** HTTP 403: the stream url of this client is not accepted, another client may work. */
    static final class ForbiddenException extends IOException {
        ForbiddenException() {
            super("HTTP 403");
        }
    }

    /** A stream and the work file it is downloaded to. */
    private record Part(OfflineFormats.Stream stream, File file) {
    }

    private static final Map<String, Task> tasks = new LinkedHashMap<>();
    private static final Set<String> resolving = ConcurrentHashMap.newKeySet();
    private static final Set<String> resolvingPlaylists = ConcurrentHashMap.newKeySet();
    private static final CopyOnWriteArrayList<Runnable> listeners = new CopyOnWriteArrayList<>();
    private static final AtomicLong lastNotification = new AtomicLong();
    private static final ExecutorService queue = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "rvx-offline-download");
        thread.setPriority(Thread.NORM_PRIORITY - 1);
        return thread;
    });

    private OfflineDownloader() {
    }

    // region entry point and picker

    /**
     * Entry point of every video download button while the built-in downloader is on.
     */
    public static void download(@Nullable String videoId) {
        Utils.runOnMainThread(() -> downloadOnMainThread(videoId));
    }

    private static void downloadOnMainThread(@Nullable String videoId) {
        if (videoId == null || !VIDEO_ID.matcher(videoId).matches()) {
            Logger.printInfo(() -> "Refusing to download an unusable video id: " + videoId);
            Utils.showToastShort(str("revanced_offline_download_unavailable"));
            return;
        }
        synchronized (tasks) {
            // The video and its audio-only download are separate tasks, so the picker opens while one of them runs.
            boolean bothQueued = tasks.containsKey(OfflineVideo.keyOf(videoId, false))
                    && tasks.containsKey(OfflineVideo.keyOf(videoId, true));
            if (bothQueued || resolving.contains(videoId)) {
                Utils.showToastShort(str("revanced_offline_already_downloading"));
                return;
            }
        }
        Activity activity = Utils.getActivity();
        if (activity == null || activity.isFinishing()) {
            Logger.printInfo(() -> "No activity to show the quality picker");
            return;
        }

        resolving.add(videoId);
        // Set once: either the user dismissed the sheet while loading, or the formats arrived.
        AtomicBoolean settled = new AtomicBoolean();
        OfflinePickerSheet sheet = new OfflinePickerSheet(activity, videoId, () -> {
            if (settled.compareAndSet(false, true)) resolving.remove(videoId);
        });
        sheet.show();

        Utils.runOnBackgroundThread(() -> {
            final Set<String> savedKeys = savedKeys(videoId);
            final OfflineFormats.Resolved resolved = OfflineFormats.resolve(videoId, 0, true, true);
            Utils.runOnMainThread(() -> {
                if (!settled.compareAndSet(false, true)) return; // The user cancelled.
                resolving.remove(videoId);
                if (resolved == null) {
                    sheet.dismiss();
                    Utils.showToastLong(str("revanced_offline_no_formats"));
                } else if (activity.isFinishing()) {
                    sheet.dismiss();
                } else {
                    showFormats(sheet, resolved, savedKeys);
                }
            });
        });
    }

    private static void showFormats(OfflinePickerSheet sheet, OfflineFormats.Resolved resolved,
                                    Set<String> savedKeys) {
        sheet.showFormats(resolved, stream -> {
            sheet.dismiss();
            if (savedKeys.contains(OfflineVideo.keyOf(resolved.videoId(), stream.isAudioOnly()))) {
                Utils.showToastShort(str("revanced_offline_already_downloaded"));
            } else {
                enqueue(resolved, stream);
            }
        }, () -> {
            sheet.dismiss();
            saveThumbnailOnly(resolved.videoId(), resolved.title());
        });
    }

    /** The keys of the downloads of this video whose files still exist. Must be called off the main thread. */
    private static Set<String> savedKeys(String videoId) {
        Set<String> keys = new HashSet<>();
        for (boolean audioOnly : new boolean[]{false, true}) {
            OfflineVideo existing = OfflineIndex.get(OfflineVideo.keyOf(videoId, audioOnly));
            if (existing != null && OfflineMediaStore.exists(Utils.getContext(), existing.contentUri)) {
                keys.add(existing.key());
            }
        }
        return keys;
    }

    /** E.g. {@code 1080p60}, {@code 1080p Premium} or {@code Opus audio}. */
    static String qualityLabel(OfflineFormats.Stream stream) {
        if (stream.isAudioOnly()) return str("revanced_offline_audio_label", stream.codec());
        String label = stream.height() + "p" + (stream.fps() > 30 ? String.valueOf(stream.fps()) : "");
        return stream.premium() ? label + " " + str("revanced_offline_premium") : label;
    }

    /** The bitrate the library shows on the download cards. */
    private static int bitrateKbps(OfflineFormats.Stream stream) {
        return Math.round(stream.bitrate() / 1000f);
    }

    /** Saves only the thumbnail of a video. It is not a library entry, so it does not go through the queue. */
    private static void saveThumbnailOnly(String videoId, String title) {
        Utils.runOnBackgroundThread(() -> {
            final Context context = Utils.getContext();
            final String folder = OfflineMediaStore.Collection.IMAGE.relativePath(OfflineOptions.thumbnailFolder());
            try {
                OfflineThumbnails.Image image = OfflineThumbnails.fetchOriginal(videoId);
                if (image == null) throw new IOException("No thumbnail");
                Uri uri = OfflineThumbnails.save(context, image, baseName(title, videoId));
                Logger.printInfo(() -> "Saved the thumbnail of " + videoId + " to " + uri);
                Utils.showToastShort(str("revanced_offline_thumbnail_saved", folder));
            } catch (Exception ex) {
                Logger.printException(() -> "Could not save the thumbnail of " + videoId, ex);
                Utils.showToastLong(str("revanced_offline_thumbnail_failed"));
            }
        });
    }

    // region playlist

    /**
     * Entry point of the playlist download buttons while the built-in downloader is on.
     */
    public static void downloadPlaylist(@Nullable String playlistId) {
        Utils.runOnMainThread(() -> downloadPlaylistOnMainThread(Utils.getActivity(), playlistId));
    }

    /** From the offline library, whose activity is not always the one {@link Utils#getActivity()} reports. */
    static void downloadPlaylist(Activity activity, String playlistId) {
        downloadPlaylistOnMainThread(activity, playlistId);
    }

    private static void downloadPlaylistOnMainThread(@Nullable Activity activity, @Nullable String playlistId) {
        if (!OfflinePlaylist.isValidId(playlistId)) {
            Logger.printInfo(() -> "Refusing to download an unusable playlist id: " + playlistId);
            Utils.showToastShort(str("revanced_offline_download_unavailable"));
            return;
        }
        if (activity == null || activity.isFinishing()) {
            Logger.printInfo(() -> "No activity to show the playlist picker");
            return;
        }
        if (!resolvingPlaylists.add(playlistId)) {
            Utils.showToastShort(str("revanced_offline_already_downloading"));
            return;
        }

        // Set once: either the user dismissed the sheet while loading, or the playlist arrived.
        AtomicBoolean settled = new AtomicBoolean();
        OfflinePickerSheet sheet = new OfflinePickerSheet(activity, null, () -> {
            if (settled.compareAndSet(false, true)) resolvingPlaylists.remove(playlistId);
        });
        sheet.setLoadingText(str("revanced_offline_batch_loading"));
        sheet.show();

        Utils.runOnBackgroundThread(() -> {
            final OfflinePlaylist.Result playlist = OfflinePlaylist.fetch(playlistId);
            Utils.runOnMainThread(() -> {
                if (!settled.compareAndSet(false, true)) return; // The user cancelled.
                resolvingPlaylists.remove(playlistId);
                if (playlist == null) {
                    sheet.dismiss();
                    Utils.showToastLong(str("revanced_offline_batch_unavailable"));
                } else if (activity.isFinishing()) {
                    sheet.dismiss();
                } else {
                    sheet.showHeightLimits(playlist.title(), playlist.entries().size(),
                            playlist.entries().get(0).videoId(), limit -> {
                                sheet.dismiss();
                                enqueuePlaylist(playlist, limit);
                            });
                }
            });
        });
    }

    private static void enqueuePlaylist(OfflinePlaylist.Result playlist, int heightLimit) {
        Utils.runOnBackgroundThread(() -> {
            final Context context = Utils.getContext();
            List<OfflinePlaylist.Entry> pending = new ArrayList<>();
            int alreadyDownloaded = 0;
            for (OfflinePlaylist.Entry entry : playlist.entries()) {
                OfflineVideo existing = OfflineIndex.get(entry.videoId());
                if (existing != null && OfflineMediaStore.exists(context, existing.contentUri)) {
                    alreadyDownloaded++;
                } else {
                    pending.add(entry);
                }
            }

            int queued = 0;
            synchronized (tasks) {
                // A video already being downloaded on its own keeps its task.
                pending.removeIf(entry -> tasks.containsKey(entry.videoId()));
                if (!pending.isEmpty()) {
                    Batch batch = new Batch(playlist.title(), pending.size(), heightLimit, alreadyDownloaded);
                    for (OfflinePlaylist.Entry entry : pending) {
                        Task task = new Task(entry.videoId(), entry.title(), ++queued, batch);
                        tasks.put(task.key, task);
                        task.future = queue.submit(() -> run(task));
                    }
                }
            }

            final int count = queued;
            final int skipped = alreadyDownloaded;
            Logger.printInfo(() -> "Queued " + count + " videos of playlist " + playlist.title()
                    + ", " + skipped + " already downloaded, height limit " + heightLimit);
            Utils.runOnMainThread(() -> {
                if (count == 0) {
                    Utils.showToastLong(str("revanced_offline_batch_nothing_new"));
                    return;
                }
                Utils.showToastShort(str("revanced_offline_batch_queued", count)
                        + (skipped > 0 ? " · " + str("revanced_offline_batch_part_already_downloaded", skipped) : ""));
                if (OfflineOptions.allVideoCodecsOff()) Utils.showToastLong(str("revanced_offline_codecs_all_off"));
                // The user just picked a limit, so the app is in the foreground and may start the service.
                OfflineServiceHooks.startDownloadForeground();
                notifyChanged(true);
            });
        });
    }

    /**
     * The best stream of a video that is no taller than {@code heightLimit}, among the codecs and the
     * quality range of the settings: the tallest, then the highest frame rate, then the codec that
     * plays everywhere. The Premium stream is left out: it takes extra requests per video.
     */
    @Nullable
    private static OfflineFormats.Stream selectStream(OfflineFormats.Resolved resolved, int heightLimit) {
        OfflineFormats.Stream best = null;
        for (OfflineFormats.Stream candidate : OfflineOptions.filterVideos(resolved.videos())) {
            if (!candidate.playable() || candidate.premium() || candidate.hls()) continue;
            if (candidate.height() > heightLimit) continue;
            if (best == null || isBetter(candidate, best)) best = candidate;
        }
        return best;
    }

    private static boolean isBetter(OfflineFormats.Stream candidate, OfflineFormats.Stream best) {
        if (candidate.height() != best.height()) return candidate.height() > best.height();
        if (candidate.fps() != best.fps()) return candidate.fps() > best.fps();
        return codecRank(candidate) > codecRank(best);
    }

    private static int codecRank(OfflineFormats.Stream stream) {
        return OfflineFormats.CODEC_H264.equals(stream.codec()) ? 2
                : OfflineFormats.CODEC_VP9.equals(stream.codec()) ? 1 : 0;
    }

    // endregion

    private static void enqueue(OfflineFormats.Resolved resolved, OfflineFormats.Stream stream) {
        Task task = new Task(resolved, stream);
        synchronized (tasks) {
            if (tasks.containsKey(task.key)) {
                Utils.showToastShort(str("revanced_offline_already_downloading"));
                return;
            }
            tasks.put(task.key, task);
            task.future = queue.submit(() -> run(task));
        }
        Logger.printInfo(() -> "Queued " + task.key + " at " + task.qualityLabel + " " + stream.codec()
                + " (itag " + stream.itag() + describeAudio(resolved, stream) + ")");
        Utils.showToastShort(str("revanced_offline_download_started"));
        // The user just picked a quality, so the app is in the foreground and may start the service.
        OfflineServiceHooks.startDownloadForeground();
        notifyChanged(true);
    }

    private static String describeAudio(OfflineFormats.Resolved resolved, OfflineFormats.Stream stream) {
        return stream.isAudioOnly() ? "" : ", audio itag " + resolved.audioFor(stream).itag();
    }

    // endregion

    // region queue state

    static boolean hasWork() {
        synchronized (tasks) {
            return !tasks.isEmpty();
        }
    }

    static List<Task> getTasks() {
        synchronized (tasks) {
            return new ArrayList<>(tasks.values());
        }
    }

    /** @param key {@link Task#key}. */
    static void cancel(String key) {
        Task task;
        synchronized (tasks) {
            task = tasks.get(key);
        }
        if (task == null) return;
        Logger.printInfo(() -> "Cancelling download " + key);
        synchronized (task) {
            task.cancelled = true;
            task.notifyAll();
        }
        // Cancellation must unblock socket reads, not wait for their timeout.
        stopTransfer(task);
        if (task.state == State.QUEUED) {
            Future<?> future = task.future;
            if (future != null) future.cancel(false);
            finish(task);
        }
    }

    static void cancelAll(boolean timedOut) {
        for (Task task : getTasks()) {
            task.timedOut = timedOut;
            cancel(task.key);
        }
    }

    static void addListener(Runnable listener) {
        listeners.addIfAbsent(listener);
    }

    static void removeListener(Runnable listener) {
        listeners.remove(listener);
    }

    private static void notifyChanged(boolean force) {
        if (!force) {
            long now = System.currentTimeMillis();
            long previous = lastNotification.get();
            if (now - previous < NOTIFICATION_INTERVAL_MS || !lastNotification.compareAndSet(previous, now)) {
                return;
            }
        }
        Utils.runOnMainThread(() -> {
            OfflineServiceHooks.updateDownloadNotification();
            for (Runnable listener : listeners) listener.run();
        });
    }

    static Notification buildProgressNotification(Context context) {
        Task current = null;
        int count;
        synchronized (tasks) {
            count = tasks.size();
            for (Task task : tasks.values()) {
                if (task.state != State.QUEUED) {
                    current = task;
                    break;
                }
            }
            if (current == null && !tasks.isEmpty()) current = tasks.values().iterator().next();
        }
        return OfflineNotifications.buildDownloadProgress(context, current, Math.max(0, count - 1));
    }

    private static void finish(Task task) {
        boolean empty;
        synchronized (tasks) {
            tasks.remove(task.key);
            empty = tasks.isEmpty();
        }
        // A task can finish twice when it is cancelled while it starts. Count it once.
        final Batch batch = task.batch;
        final boolean batchDone;
        if (batch != null && task.counted.compareAndSet(false, true)) {
            if (task.succeeded) batch.succeeded.incrementAndGet();
            else if (task.failed) batch.failed.incrementAndGet();
            else batch.cancelled.incrementAndGet();
            if (task.timedOut) batch.timedOut = true;
            batchDone = batch.remaining.decrementAndGet() == 0;
        } else {
            batchDone = false;
        }
        Utils.runOnMainThread(() -> {
            if (empty) OfflineServiceHooks.stopDownloadForeground();
            else OfflineServiceHooks.updateDownloadNotification();
            if (batchDone) {
                final String summary = batch.summary();
                Logger.printInfo(() -> "Playlist " + batch.title + " finished: " + summary.replace('\n', ' '));
                OfflineNotifications.showBatchSummary(Utils.getContext(), batch, summary);
                Utils.showToastLong(batch.title.isEmpty() ? summary : batch.title + "\n" + summary);
            }
            for (Runnable listener : listeners) listener.run();
        });
    }

    // endregion

    // region download

    private static File workDirectory(Context context) {
        File base = context.getExternalCacheDir();
        if (base == null) base = context.getCacheDir();
        File directory = new File(base, "rvx_offline_tmp");
        //noinspection ResultOfMethodCallIgnored
        directory.mkdirs();
        return directory;
    }

    private static void run(Task task) {
        if (task.cancelled) return;
        final Context context = Utils.getContext();
        final File work = workDirectory(context);
        final File[] files = {new File(work, task.key + ".video"), new File(work, task.key + ".audio")};
        try {
            task.state = State.DOWNLOADING;
            notifyChanged(true);
            if (task.resolved == null) chooseBatchStream(task);

            downloadWithFallback(task, work, files);
            checkCancelled(task);

            OfflineVideo saved = task.stream.isAudioOnly()
                    ? saveAudio(context, task, files[0])
                    : saveVideo(context, task, files[0], files[1]);
            OfflineCaptions.download(context, saved, task);
            OfflineIndex.put(saved);
            if (OfflineOptions.saveThumbnailWithDownloads()) saveThumbnailCopy(context, task);

            task.succeeded = true;
            // A playlist reports once at its end instead of once per video.
            if (task.batch == null) {
                OfflineNotifications.showDownloadFinished(context, task.key, task.title);
                Utils.showToastShort(str("revanced_offline_download_complete_toast", task.title));
            }
        } catch (Throwable ex) {
            reportFailure(context, task, ex);
        } finally {
            for (File file : files) deleteQuietly(file);
            finish(task);
        }
    }

    private static void reportFailure(Context context, Task task, Throwable ex) {
        if (task.cancelled) {
            Logger.printInfo(() -> "Download cancelled: " + task.key);
            if (task.timedOut && task.batch == null) {
                OfflineNotifications.showDownloadFailed(context, task.key, task.title,
                        str("revanced_offline_error_time_limit"));
            }
            return;
        }

        Logger.printException(() -> "Download failed: " + task.key, ex);
        task.failed = true;
        if (task.batch != null) return;

        String reason = ex instanceof ForbiddenException
                ? str("revanced_offline_error_forbidden")
                : ex.getMessage() != null ? ex.getMessage() : ex.getClass().getSimpleName();
        OfflineNotifications.showDownloadFailed(context, task.key, task.title, reason);
        Utils.showToastLong(str("revanced_offline_download_failed", reason));
    }

    /** A playlist entry: its formats are resolved now, since stream urls expire within hours. */
    private static void chooseBatchStream(Task task) throws IOException {
        OfflineFormats.Resolved resolved = OfflineFormats.resolve(task.videoId, 0, false, false);
        checkCancelled(task);
        if (resolved == null) throw new IOException(str("revanced_offline_no_formats"));

        OfflineFormats.Stream video = selectStream(resolved, task.batch.heightLimit);
        if (video == null) throw new IOException(str("revanced_offline_batch_no_quality"));

        task.resolved = resolved;
        task.stream = video;
        task.qualityLabel = qualityLabel(video);
        Logger.printInfo(() -> "Chose " + task.qualityLabel + " " + video.codec() + " for " + task.videoId);
        notifyChanged(true);
    }

    /**
     * Downloads the streams of the task. When the urls of a client are refused (HTTP 403), starts
     * over with the next client, so the files never mix pieces of different clients.
     */
    private static void downloadWithFallback(Task task, File work, File[] files) throws IOException {
        while (true) {
            try {
                downloadParts(task, parts(task, files), work);
                return;
            } catch (ForbiddenException ex) {
                final OfflineFormats.Stream stream = task.stream;
                final int next = task.resolved.clientIndex() + 1;
                final OfflineFormats.Resolved other = next < OfflineFormats.clientCount()
                        ? OfflineFormats.resolve(task.videoId, next, stream.premium() && stream.hls(),
                                !task.subtitles.tracks().isEmpty())
                        : null;
                final OfflineFormats.Stream match = other == null ? null : other.find(stream.key());
                if (match == null) throw ex;

                Logger.printInfo(() -> "HTTP 403 for " + task.key + ", retrying with client #" + other.clientIndex());
                task.resolved = other;
                task.stream = match;
            }
        }
    }

    /** An audio-only download is one stream; a video is the video stream and the audio of its container. */
    private static List<Part> parts(Task task, File[] files) {
        List<Part> parts = new ArrayList<>(2);
        parts.add(new Part(task.stream, files[0]));
        if (!task.stream.isAudioOnly()) parts.add(new Part(task.resolved.audioFor(task.stream), files[1]));
        return parts;
    }

    /** HLS streams are downloaded first, segment by segment; then all DASH streams share the workers. */
    private static void downloadParts(Task task, List<Part> parts, File work) throws IOException {
        checkCancelled(task);
        task.transferStopped = false;
        final OfflineFormats.Resolved resolved = task.resolved;
        final long[] lengths = new long[parts.size()];
        for (int i = 0; i < parts.size(); i++) {
            deleteQuietly(parts.get(i).file());
            lengths[i] = streamLength(task, parts.get(i).stream(), resolved.userAgent());
        }
        reserveSpace(task, lengths, work);
        logParts(task, parts, lengths);

        List<DownloadSource> dashSources = new ArrayList<>(parts.size());
        for (int i = 0; i < parts.size(); i++) {
            Part part = parts.get(i);
            if (part.stream().hls()) downloadHls(task, part, resolved.hlsUserAgent());
            else dashSources.add(new DownloadSource(part.stream().url(), lengths[i], part.file()));
        }
        if (!dashSources.isEmpty()) {
            downloadRanges(task, dashSources.toArray(new DownloadSource[0]), resolved.userAgent());
        }

        task.total = task.done.get(); // Unknown-length streams now have an exact total.
        notifyChanged(true);
    }

    /** For HLS the size of the file the segments are cut from, which is close enough for the progress bar. */
    private static long streamLength(Task task, OfflineFormats.Stream stream, @Nullable String userAgent)
            throws IOException {
        if (stream.contentLength() > 0 || stream.hls()) return stream.contentLength();
        return probeLength(task, stream.url(), userAgent);
    }

    private static void reserveSpace(Task task, long[] lengths, File work) throws IOException {
        long knownBytes = 0;
        boolean allKnown = true;
        for (long length : lengths) {
            knownBytes += Math.max(0, length);
            allKnown &= length > 0;
        }
        task.done.set(0);
        task.total = allKnown ? knownBytes : 0;

        long required = (long) (knownBytes * REQUIRED_SPACE_FACTOR);
        if (knownBytes > 0 && work.getUsableSpace() < required) {
            throw new IOException(str("revanced_offline_error_space",
                    Formatter.formatShortFileSize(Utils.getContext(), required)));
        }
    }

    private static void logParts(Task task, List<Part> parts, long[] lengths) {
        StringBuilder text = new StringBuilder("Downloading ").append(task.key).append(':');
        for (int i = 0; i < parts.size(); i++) {
            OfflineFormats.Stream stream = parts.get(i).stream();
            text.append(i == 0 ? " " : ", ").append(stream.isAudioOnly() ? "audio" : "video")
                    .append(" itag ").append(stream.itag()).append(stream.hls() ? " HLS" : "")
                    .append(" (").append(lengths[i]).append(" bytes)");
        }
        Logger.printInfo(text::toString);
    }

    // Share workers across both streams and reuse complete bounded responses.
    private static void downloadRanges(Task task, DownloadSource[] sources, @Nullable String userAgent)
            throws IOException {
        RangeQueue ranges = new RangeQueue(sources);
        long requests = 0;
        for (DownloadSource source : sources) {
            requests += source.length <= 0 ? 1 : (source.length + CHUNK_SIZE - 1) / CHUNK_SIZE;
        }
        runWorkers(task, (int) Math.min(PARALLEL_CONNECTIONS, requests), () -> {
            byte[] buffer = new byte[BUFFER_SIZE];
            RandomAccessFile[] outputs = new RandomAccessFile[sources.length];
            try {
                DownloadRange range;
                while ((range = ranges.take()) != null) {
                    checkTransfer(task);
                    int index = range.sourceIndex;
                    DownloadSource source = sources[index];
                    if (source.length <= 0) {
                        downloadWhole(task, source, userAgent, buffer);
                    } else {
                        RandomAccessFile output = outputs[index];
                        if (output == null) outputs[index] = output = new RandomAccessFile(source.file, "rw");
                        downloadChunk(task, source.url, range.start, range.end, output, userAgent, buffer);
                    }
                }
                return null;
            } finally {
                for (RandomAccessFile output : outputs) {
                    if (output != null) output.close();
                }
            }
        });
    }

    /** Segments are downloaded in parallel into one file each, then joined in playlist order. */
    private static void downloadHls(Task task, Part part, @Nullable String userAgent) throws IOException {
        final List<OfflineHls.Segment> segments =
                OfflineHls.fetchMediaPlaylist(part.stream().url(), userAgent).segments();
        final File[] pieces = new File[segments.size()];
        for (int i = 0; i < pieces.length; i++) pieces[i] = new File(part.file().getPath() + ".hls" + i);

        AtomicInteger next = new AtomicInteger();
        try {
            runWorkers(task, Math.min(PARALLEL_CONNECTIONS, segments.size()), () -> {
                byte[] buffer = new byte[BUFFER_SIZE];
                int index;
                while ((index = next.getAndIncrement()) < segments.size()) {
                    downloadSegment(task, segments.get(index), pieces[index], userAgent, buffer);
                }
                return null;
            });
            joinFiles(pieces, part.file());
        } finally {
            for (File piece : pieces) deleteQuietly(piece);
        }
    }

    /**
     * Runs {@code workers} copies of {@code worker} and waits for all of them. The first failure
     * stops the others. No worker is still running when this returns or throws.
     */
    private static void runWorkers(Task task, int workers, Callable<Void> worker) throws IOException {
        task.transferStopped = false;
        ExecutorService pool = Executors.newFixedThreadPool(workers);
        ExecutorCompletionService<Void> completed = new ExecutorCompletionService<>(pool);
        try {
            for (int i = 0; i < workers; i++) completed.submit(worker);
            for (int i = 0; i < workers; i++) {
                try {
                    completed.take().get();
                } catch (ExecutionException ex) {
                    Throwable cause = ex.getCause();
                    if (cause instanceof IOException io) throw io;
                    if (cause instanceof RuntimeException runtime) throw runtime;
                    throw new IOException(cause);
                } catch (InterruptedException ex) {
                    Thread.currentThread().interrupt();
                    throw new IOException("Interrupted", ex);
                }
            }
            checkTransfer(task);
        } finally {
            stopTransfer(task);
            pool.shutdownNow();
            // No worker may still write when fallback truncates files or cancellation deletes them.
            boolean interrupted = false;
            while (!pool.isTerminated()) {
                try {
                    pool.awaitTermination(1, TimeUnit.SECONDS);
                } catch (InterruptedException ex) {
                    interrupted = true;
                }
            }
            if (interrupted) Thread.currentThread().interrupt();
        }
    }

    private static final class DownloadSource {
        final String url;
        final long length;
        final File file;
        long next;
        boolean claimed;

        DownloadSource(String url, long length, File file) throws IOException {
            this.url = url;
            this.length = length;
            this.file = file;
            if (length > 0) {
                try (RandomAccessFile output = new RandomAccessFile(file, "rw")) {
                    output.setLength(length);
                }
            }
        }
    }

    private record DownloadRange(int sourceIndex, long start, long end) {
    }

    /** Assign bounded ranges from the largest unscheduled remainder of either stream. */
    private static final class RangeQueue {
        final DownloadSource[] sources;

        RangeQueue(DownloadSource[] sources) {
            this.sources = sources;
        }

        synchronized DownloadRange take() {
            int largest = -1;
            long remaining = 0;
            for (int i = 0; i < sources.length; i++) {
                DownloadSource source = sources[i];
                if (source.length <= 0 && !source.claimed) {
                    source.claimed = true;
                    return new DownloadRange(i, 0, -1);
                }
                long candidate = source.length - source.next;
                if (candidate > remaining) {
                    largest = i;
                    remaining = candidate;
                }
            }
            if (largest < 0) return null;
            DownloadSource source = sources[largest];
            long size = Math.min(remaining, CHUNK_SIZE);
            long start = source.next;
            source.next += size;
            return new DownloadRange(largest, start, source.next - 1);
        }
    }

    private static void downloadChunk(Task task, String url, long start, long end, RandomAccessFile output,
                                      @Nullable String userAgent, byte[] buffer) throws IOException {
        long position = start;
        for (int attempt = 1; ; attempt++) {
            checkTransfer(task);
            HttpURLConnection connection = openTransfer(task, url, position, end, userAgent);
            boolean reusable = false;
            try {
                int code = connection.getResponseCode();
                if (code == HttpURLConnection.HTTP_FORBIDDEN) throw new ForbiddenException();
                if (code != HttpURLConnection.HTTP_PARTIAL) {
                    throw new IOException("Range request returned HTTP " + code);
                }
                String expectedRange = "bytes " + position + "-" + end + "/";
                String actualRange = connection.getHeaderField("Content-Range");
                if (actualRange == null || !actualRange.startsWith(expectedRange)) {
                    throw new IOException("Unexpected Content-Range: " + actualRange);
                }
                try (InputStream input = connection.getInputStream()) {
                    output.seek(position);
                    while (position <= end) {
                        int read = readBuffer(task, input, buffer,
                                (int) Math.min(buffer.length, end - position + 1));
                        if (read == 0) throw new IOException("Incomplete range " + position + "-" + end);
                        output.write(buffer, 0, read);
                        position += read;
                        task.done.addAndGet(read);
                        notifyChanged(false);
                    }
                    // Consume EOF before closing so Android can return the socket to its keep-alive pool.
                    if (input.read() != -1) throw new IOException("Oversized range response");
                    reusable = true;
                }
                return;
            } catch (ForbiddenException | CancellationException ex) {
                throw ex;
            } catch (IOException ex) {
                checkTransfer(task);
                if (attempt >= CHUNK_ATTEMPTS || position > end) throw ex;
                final int failedAttempt = attempt;
                Logger.printInfo(() -> "Chunk " + start + "-" + end + " failed (attempt " + failedAttempt + "), resuming", ex);
                waitBeforeRetry(attempt);
            } finally {
                releaseTransfer(task, connection, reusable);
            }
        }
    }

    /** Fallback for streams whose size the server does not reveal. */
    private static void downloadWhole(Task task, DownloadSource source, @Nullable String userAgent,
                                      byte[] buffer) throws IOException {
        HttpURLConnection connection = openTransfer(task, source.url, -1, -1, userAgent);
        boolean reusable = false;
        try {
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_FORBIDDEN) throw new ForbiddenException();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("HTTP " + code);
            try (InputStream input = connection.getInputStream();
                 OutputStream output = new FileOutputStream(source.file)) {
                int read;
                while ((read = readBuffer(task, input, buffer, buffer.length)) != 0) {
                    output.write(buffer, 0, read);
                    task.done.addAndGet(read);
                    notifyChanged(false);
                }
                reusable = true;
            }
        } finally {
            releaseTransfer(task, connection, reusable);
        }
    }

    /** One HLS segment into its own file. A failed attempt starts the segment over. */
    private static void downloadSegment(Task task, OfflineHls.Segment segment, File file,
                                        @Nullable String userAgent, byte[] buffer) throws IOException {
        final boolean ranged = segment.length() >= 0;
        final long start = ranged ? segment.offset() : -1;
        final long end = ranged ? segment.offset() + segment.length() - 1 : -1;
        final int expectedCode = ranged ? HttpURLConnection.HTTP_PARTIAL : HttpURLConnection.HTTP_OK;
        for (int attempt = 1; ; attempt++) {
            checkTransfer(task);
            HttpURLConnection connection = openTransfer(task, segment.url(), start, end, userAgent);
            boolean reusable = false;
            long written = 0;
            try {
                int code = connection.getResponseCode();
                if (code == HttpURLConnection.HTTP_FORBIDDEN) throw new ForbiddenException();
                if (code != expectedCode) throw new IOException("HLS segment returned HTTP " + code);

                try (InputStream input = connection.getInputStream();
                     OutputStream output = new FileOutputStream(file)) {
                    int read;
                    while ((read = readBuffer(task, input, buffer, buffer.length)) != 0) {
                        output.write(buffer, 0, read);
                        written += read;
                        task.done.addAndGet(read);
                        notifyChanged(false);
                    }
                }
                if (ranged && written != segment.length()) throw new IOException("Incomplete HLS segment");
                reusable = true;
                return;
            } catch (ForbiddenException | CancellationException ex) {
                throw ex;
            } catch (IOException ex) {
                task.done.addAndGet(-written);
                checkTransfer(task);
                if (attempt >= CHUNK_ATTEMPTS) throw ex;
                final int failedAttempt = attempt;
                Logger.printInfo(() -> "HLS segment failed (attempt " + failedAttempt + "), retrying", ex);
                waitBeforeRetry(attempt);
            } finally {
                releaseTransfer(task, connection, reusable);
            }
        }
    }

    private static void waitBeforeRetry(int attempt) throws IOException {
        try {
            //noinspection BusyWait
            Thread.sleep(1000L * attempt);
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new IOException("Interrupted", interrupted);
        }
    }

    /** Appends the pieces to {@code destination} in order, deleting each once it is copied. */
    private static void joinFiles(File[] pieces, File destination) throws IOException {
        try (FileChannel output = new FileOutputStream(destination).getChannel()) {
            for (File piece : pieces) {
                try (FileChannel input = new FileInputStream(piece).getChannel()) {
                    long size = input.size();
                    long position = 0;
                    while (position < size) position += input.transferTo(position, size - position, output);
                }
                deleteQuietly(piece);
            }
        }
    }

    // Coalesce Android's small socket reads into one cache write without copying.
    private static int readBuffer(Task task, InputStream input, byte[] buffer, int length) throws IOException {
        int filled = 0;
        while (filled < length) {
            checkTransfer(task);
            int read = input.read(buffer, filled, length - filled);
            if (read < 0) break;
            filled += read;
        }
        return filled;
    }

    private static long probeLength(Task task, String url, @Nullable String userAgent) throws IOException {
        HttpURLConnection connection = openTransfer(task, url, 0, 0, userAgent);
        try {
            int code = connection.getResponseCode();
            if (code == HttpURLConnection.HTTP_FORBIDDEN) throw new ForbiddenException();
            String range = connection.getHeaderField("Content-Range");
            if (code == HttpURLConnection.HTTP_PARTIAL && range != null) {
                int slash = range.lastIndexOf('/');
                if (slash >= 0) {
                    try {
                        return Long.parseLong(range.substring(slash + 1).trim());
                    } catch (NumberFormatException ignored) {
                    }
                }
            }
            return -1;
        } finally {
            releaseTransfer(task, connection, false);
        }
    }

    private static HttpURLConnection openTransfer(Task task, String url, long start, long end,
                                                   @Nullable String userAgent) throws IOException {
        HttpURLConnection connection = open(url, start, end, userAgent);
        synchronized (task.connections) {
            try {
                checkTransfer(task);
                task.connections.add(connection);
            } catch (CancellationException ex) {
                connection.disconnect();
                throw ex;
            }
        }
        return connection;
    }

    private static void releaseTransfer(Task task, HttpURLConnection connection, boolean reusable) {
        if (!reusable) connection.disconnect();
        task.connections.remove(connection);
    }

    private static void stopTransfer(Task task) {
        synchronized (task.connections) {
            task.transferStopped = true;
            for (HttpURLConnection connection : task.connections) connection.disconnect();
        }
    }

    private static void checkTransfer(Task task) {
        checkCancelled(task);
        if (task.transferStopped || Thread.currentThread().isInterrupted()) throw new CancellationException();
    }

    private static HttpURLConnection open(String url, long start, long end, @Nullable String userAgent) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
        connection.setReadTimeout(READ_TIMEOUT_MS);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("Accept", "*/*");
        connection.setRequestProperty("Accept-Encoding", "identity");
        if (userAgent != null) connection.setRequestProperty("User-Agent", userAgent);
        if (start >= 0) connection.setRequestProperty("Range", "bytes=" + start + "-" + end);
        return connection;
    }

    private static void checkCancelled(Task task) {
        if (task.cancelled) throw new CancellationException();
    }

    // endregion

    // region files

    /** {@code Title [videoId]}, safe as a file name. */
    static String baseName(String title, String videoId) {
        String clean = title.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").replaceAll("\\s+", " ").trim();
        if (clean.startsWith(".")) clean = "_" + clean.substring(1);
        if (clean.length() > 120) clean = clean.substring(0, 120).trim();
        if (clean.isEmpty()) clean = "video";
        return String.format(Locale.US, "%s [%s]", clean, videoId);
    }

    static String displayName(String title, String videoId, String extension) {
        return baseName(title, videoId) + "." + extension;
    }

    /** The size and uri of a published download. */
    private record Published(Uri uri, long size) {
    }

    /** Writes the download into a pending MediaStore item. */
    private interface ContentWriter {
        void write(FileDescriptor output) throws IOException;
    }

    /** Lets {@code writer} fill the pending item, then publishes it. Discards it on any failure. */
    private static Published publish(Task task, OfflineMediaStore.Pending pending, ContentWriter writer)
            throws IOException {
        try {
            writer.write(pending.fileDescriptor());
            checkCancelled(task);
            task.state = State.SAVING;
            notifyChanged(true);
            final long size = pending.length();
            return new Published(pending.commit(), size);
        } catch (Throwable ex) {
            pending.abort();
            throw ex;
        }
    }

    // Merge straight into the pending MediaStore item.
    private static OfflineVideo saveVideo(Context context, Task task, File videoFile, File audioFile)
            throws IOException {
        final OfflineFormats.Resolved resolved = task.resolved;
        final OfflineFormats.Stream video = task.stream;
        task.state = State.MERGING;
        notifyChanged(true);
        Logger.printInfo(() -> "Merging " + task.key);

        final String displayName = displayName(resolved.title(), task.videoId, video.fileExtension());
        OfflineMediaStore.Pending pending = OfflineMediaStore.create(context, OfflineMediaStore.Collection.VIDEO,
                OfflineOptions.videoFolder(), displayName);
        Published published = publish(task, pending, output -> {
            merge(task, video, videoFile, audioFile, output);
            deleteQuietly(videoFile);
            deleteQuietly(audioFile);
        });
        Logger.printInfo(() -> "Saved " + task.key + " to " + published.uri() + " (" + published.size() + " bytes)");

        String thumbnail = saveLibraryThumbnail(context, task.key, task.videoId, resolved.thumbnailUrl());
        return new OfflineVideo(task.videoId, resolved.title(), resolved.author(), resolved.channelId(),
                resolved.lengthMs(), published.uri().toString(), displayName, published.size(), task.qualityLabel,
                video.codec(), video.itag(), bitrateKbps(video), System.currentTimeMillis(), thumbnail, false, 0);
    }

    // .webm for VP9 downloads.
    private static void merge(Task task, OfflineFormats.Stream video, File videoFile, File audioFile,
                              FileDescriptor output) throws IOException {
        if (video.hls()) {
            Mp4Merger.mergeHlsVp9(videoFile, audioFile, output, () -> task.cancelled);
        } else if (video.isWebm()) {
            Mp4Merger.mergeWebm(videoFile, audioFile, output, () -> task.cancelled);
        } else {
            Mp4Merger.merge(videoFile, audioFile, output, () -> task.cancelled);
        }
    }

    /**
     * Opus is repackaged into tagged Ogg Opus, AAC into tagged M4A, the same way YouTube Music's
     * downloads are, so music players show the title, the channel and the thumbnail.
     */
    private static OfflineVideo saveAudio(Context context, Task task, File audioFile) throws IOException {
        final OfflineFormats.Resolved resolved = task.resolved;
        final OfflineFormats.Stream audio = task.stream;
        task.state = State.SAVING;
        notifyChanged(true);

        final AudioTagger.Tags tags = new AudioTagger.Tags(resolved.title(), resolved.author(), null,
                artwork(task.videoId));
        final String displayName = displayName(resolved.title(), task.videoId, audio.fileExtension());
        OfflineMediaStore.Pending pending = OfflineMediaStore.create(context, OfflineMediaStore.Collection.AUDIO,
                OfflineOptions.audioFolder(), displayName);
        Published published = publish(task, pending, output -> {
            // Not closed: the descriptor belongs to the pending item, which closes it.
            AudioTagger.write(audioFile, audio.mimeType(), new FileOutputStream(output), tags);
            deleteQuietly(audioFile);
        });
        Logger.printInfo(() -> "Saved " + task.key + " to " + published.uri() + " (" + published.size() + " bytes)");

        String thumbnail = saveLibraryThumbnail(context, task.key, task.videoId, resolved.thumbnailUrl());
        return new OfflineVideo(task.videoId, resolved.title(), resolved.author(), resolved.channelId(),
                resolved.lengthMs(), published.uri().toString(), displayName, published.size(), task.qualityLabel,
                audio.codec(), audio.itag(), bitrateKbps(audio), System.currentTimeMillis(), thumbnail, true, 0);
    }

    /** @return The thumbnail as embedded cover art (JPEG or PNG only), or null. */
    @Nullable
    private static byte[] artwork(String videoId) {
        OfflineThumbnails.Image image = OfflineThumbnails.fetchOriginal(videoId);
        if (image == null || AudioTagger.imageMimeType(image.bytes()) == null) return null;
        return image.bytes();
    }

    /** "Save thumbnail with downloads". The download is already saved, so a failure here is only logged. */
    private static void saveThumbnailCopy(Context context, Task task) {
        try {
            OfflineThumbnails.Image image = OfflineThumbnails.fetchOriginal(task.videoId);
            if (image == null) throw new IOException("No thumbnail");
            Uri uri = OfflineThumbnails.save(context, image, baseName(task.resolved.title(), task.videoId));
            Logger.printInfo(() -> "Saved the thumbnail of " + task.key + " to " + uri);
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not save the thumbnail of " + task.key, ex);
        }
    }

    /** The small copy the library shows. @return Its path, or an empty string. */
    @NonNull
    private static String saveLibraryThumbnail(Context context, String key, String videoId,
                                               @Nullable String preferredUrl) {
        File destination = OfflineIndex.getThumbnailFile(context, key);
        String[] urls = {preferredUrl, String.format(Locale.US, THUMBNAIL_URL, videoId)};
        for (String url : urls) {
            if (url == null || url.isEmpty()) continue;
            HttpURLConnection connection = null;
            try {
                connection = open(url, -1, -1, null);
                if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) continue;
                try (InputStream input = connection.getInputStream();
                     OutputStream output = new FileOutputStream(destination)) {
                    byte[] buffer = new byte[BUFFER_SIZE];
                    int read;
                    while ((read = input.read(buffer)) != -1) output.write(buffer, 0, read);
                }
                return destination.getAbsolutePath();
            } catch (Exception ex) {
                Logger.printDebug(() -> "Could not fetch thumbnail " + url, ex);
            } finally {
                if (connection != null) connection.disconnect();
            }
        }
        return "";
    }

    private static void deleteQuietly(File file) {
        if (file.exists() && !file.delete()) {
            Logger.printDebug(() -> "Could not delete " + file);
        }
    }

    // endregion
}
