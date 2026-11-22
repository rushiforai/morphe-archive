/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.extension.yandexmusic.lyrics;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Called from the patched app. Lyrics come only from LRCLIB; the app's own lyrics API is not used.
 *
 * {@link #rememberTrack} runs at the end of the track model constructor and keeps the metadata
 * LRCLIB needs (the lyrics repository only receives the track id). {@link #lyrics} replaces the
 * lyrics repository's download: it returns LRCLIB lyrics, or null when LRCLIB has none or cannot
 * be reached. Only an unreachable LRCLIB is shown to the user, as a toast. {@link #prefetch}
 * runs whenever the player asks for the next item of the queue and loads that track's lyrics
 * in the background.
 *
 * Answers are kept in memory and on disk (the app's cache directory), so replays and offline
 * tracks need no network. "No lyrics" is kept for {@link #MISS_TTL_MS} because LRCLIB grows.
 *
 * {@link #cacheRow} sees every row of the app's track cache (a downloaded or a temporarily cached
 * track). Lyrics of downloaded tracks are loaded too, and by default kept in the app's files
 * directory, which Android does not clear and the cache limit does not count.
 */
@SuppressWarnings("unused")
public final class LrcLibLyrics {
    private static final String TAG = "NyandexLrcLib";
    private static final String USER_AGENT =
            "Nyandex/1.0 (Yandex Music lyrics from LRCLIB; https://github.com/Ser1-1y/nyandex)";
    private static final int CONNECT_TIMEOUT_MS = 4000;
    private static final int READ_TIMEOUT_MS = 5000;
    private static final int MAX_TRACKS = 4096;
    private static final String[] NOT_FOUND = new String[0];
    private static final long TOAST_INTERVAL_MS = 30_000;
    private static final String UNREACHABLE_MESSAGE = "Не удалось подключиться к LRCLIB";

    /** How long "LRCLIB has no lyrics for this track" is trusted. */
    static final long MISS_TTL_MS = 3L * 24 * 60 * 60 * 1000;
    private static final String CACHE_DIRECTORY = "nyandex-lyrics";
    /** Lyrics of downloaded tracks: in the files directory, not limited. */
    private static final String KEEP_DIRECTORY = "nyandex-lyrics-downloads";
    private static final String[] DISK_FORMATS = {LrcLibCore.FORMAT_LRC, LrcLibCore.FORMAT_TEXT};
    /** Pause between LRCLIB lookups for downloaded tracks, to go easy on LRCLIB. */
    private static final long DOWNLOAD_GAP_MS = 1000;
    /** After LRCLIB could not be reached, downloaded tracks wait this long before asking again. */
    private static final long DOWNLOAD_BACKOFF_MS = 60_000;
    /**
     * Delay after the first downloaded row of a process before the downloads folder is checked
     * for tracks that are no longer downloaded (the app reads its cache database by then).
     */
    private static final long RECONCILE_DELAY_MS = 120_000;
    /** Default number of answers kept on disk; the settings page can change it (0 turns the disk cache off). */
    static final int DEFAULT_CACHE_LIMIT = 3000;
    private static final int PRUNE_EVERY_WRITES = 25;

    /** Format the app asks for when a track has synced lyrics; every track has them after the patch. */
    private static final String PREFETCH_FORMAT = LrcLibCore.FORMAT_LRC;
    private static final int MAX_PREFETCHED = 256;

    /** Preferences of the Nyandex settings page (same file as NyandexSettings). */
    static final String PREFERENCES = "nyandex";
    /** Lyrics timing offset in milliseconds; positive shows lines earlier. */
    static final String OFFSET_KEY = "lyrics_offset_ms";
    /** Whether the next track's lyrics are loaded in advance (default on). */
    static final String PREFETCH_KEY = "lyrics_prefetch";
    /** Maximum number of answers kept on disk; 0 keeps nothing on disk. */
    static final String CACHE_LIMIT_KEY = "lyrics_cache_limit";
    /** Whether downloading a track also loads its lyrics (default on). */
    static final String DOWNLOAD_KEY = "lyrics_download_with_tracks";
    /** Whether lyrics of downloaded tracks are kept apart from the limited cache (default on). */
    static final String KEEP_DOWNLOADED_KEY = "lyrics_keep_downloaded";

    /** LRCLIB could not be reached: network error or an HTTP status other than 200 and 404. */
    private static class UnreachableException extends IOException {
        UnreachableException(String message) {
            super(message);
        }
    }

    /** LRCLIB answered with an HTTP status other than 200 and 404. */
    private static final class StatusException extends UnreachableException {
        final int status;
        /** The response's Retry-After in milliseconds, or -1. */
        final long retryAfterMs;

        StatusException(int status, long retryAfterMs, String url) {
            super("HTTP " + status + " for " + url);
            this.status = status;
            this.retryAfterMs = retryAfterMs;
        }
    }

    /**
     * The lookup stopped before LRCLIB failed three times (interrupted, or LRCLIB's Retry-After
     * has not passed yet), so it is not reported as unreachable.
     */
    private static class QuietException extends IOException {
        QuietException(String message, Throwable cause) {
            super(message, cause);
        }
    }

    /** Not sent: LRCLIB's last Retry-After has not passed yet. */
    private static final class WaitException extends QuietException {
        WaitException(String message) {
            super(message, null);
        }
    }

    private static final class Track {
        final String title;
        final long durationMs;
        final List<?> artists;

        Track(String title, long durationMs, List<?> artists) {
            this.title = title;
            this.durationMs = durationMs;
            this.artists = artists;
        }
    }

    private static final Map<String, Track> TRACKS = new LinkedHashMap<String, Track>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Track> eldest) {
            return size() > MAX_TRACKS;
        }
    };

    /** Answers per track and format, including "no lyrics"; an unreachable LRCLIB is not cached. */
    private static final Map<String, String[]> CACHE = new ConcurrentHashMap<>();

    /** One lock per track and format, so a prefetch and a real request never query twice. */
    private static final Map<String, Object> LOCKS = new ConcurrentHashMap<>();

    /** Tracks already handed to the prefetcher in this process (bounded, most recent kept). */
    private static final Set<String> PREFETCHED = Collections.newSetFromMap(
            new LinkedHashMap<String, Boolean>(64, 0.75f, false) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
                    return size() > MAX_PREFETCHED;
                }
            });

    /** Tracks seen as downloaded in this process. */
    private static final Set<String> DOWNLOADED = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    /** Tracks seen only as temporarily cached in this process. */
    private static final Set<String> NOT_DOWNLOADED = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());
    /** Downloaded tracks waiting for their metadata (title, artists) before LRCLIB can be asked. */
    private static final Set<String> PENDING = Collections.newSetFromMap(new ConcurrentHashMap<String, Boolean>());

    /**
     * Downloaded-track lookups and every bulk file operation (moving, trimming, clearing), on one
     * thread so they never race each other and never run on the UI thread.
     */
    private static final ScheduledExecutorService DOWNLOADER = Executors.newSingleThreadScheduledExecutor(runnable -> {
        Thread thread = new Thread(runnable, "NyandexLyricsDownload");
        thread.setDaemon(true);
        thread.setPriority(Thread.MIN_PRIORITY);
        return thread;
    });

    /** Background loads for callers on the main thread (the "Show lyrics" sheet). */
    private static final ExecutorService LOADER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "NyandexLyricsLoad");
        thread.setDaemon(true);
        return thread;
    });

    /** Name of the patch's static helper that builds the app's lyrics result (see the patch). */
    private static final String RESULT_HELPER = "nyandexLrcLibLyrics";

    private static final ExecutorService PREFETCHER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "NyandexLyricsPrefetch");
        thread.setDaemon(true);
        thread.setPriority(Thread.MIN_PRIORITY);
        return thread;
    });

    private static volatile long lastToastAt;
    /** No LRCLIB request before this time ({@link SystemClock#elapsedRealtime}): its last Retry-After. */
    private static volatile long waitUntil;
    /** Until when downloaded tracks do not ask LRCLIB, after it could not be reached. */
    private static volatile long downloadBackoffUntil;
    private static volatile boolean reconcileScheduled;
    private static volatile Context context;
    private static int diskWrites;

    private LrcLibLyrics() {
    }

    /** Injected at the end of the track model constructor. Must stay cheap and never throw. */
    public static void rememberTrack(String id, String title, long durationMs, List<?> artists) {
        try {
            if (id == null || title == null) return;
            synchronized (TRACKS) {
                TRACKS.put(id, new Track(title, durationMs, artists));
            }
            if (!PENDING.isEmpty() && PENDING.remove(id)) {
                DOWNLOADER.execute(() -> fetchDownloaded(id));
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Injected at the end of the track cache row constructor: one row per cached file of a track,
     * built when a track is cached or downloaded and whenever the cache database is read. Must
     * stay cheap and never throw.
     *
     * @param rowTrackId The row's track id; smart previews carry an "_sm" suffix.
     * @param cacheType  The app's cache type enum (TemporaryCache, AutoCache, SmartCache,
     *                   PermanentStrong, PermanentWeak).
     */
    public static void cacheRow(String rowTrackId, Object cacheType) {
        try {
            String trackId = LrcLibCore.normalizeTrackId(rowTrackId);
            if (trackId == null || cacheType == null) return;
            String type = cacheType instanceof Enum ? ((Enum<?>) cacheType).name() : String.valueOf(cacheType);
            if (LrcLibCore.isDownloadedCacheType(type)) {
                if (DOWNLOADED.add(trackId)) DOWNLOADER.execute(() -> onDownloaded(trackId));
                scheduleReconcile();
            } else if (!DOWNLOADED.contains(trackId) && NOT_DOWNLOADED.add(trackId)) {
                DOWNLOADER.execute(() -> onNotDownloaded(trackId));
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Downloaded lyrics are only fetched in the background when they can be kept: with "keep
     * lyrics of downloaded tracks" off they would land in the limited cache and could be evicted
     * and fetched again on every launch.
     */
    private static boolean downloadsEnabled() {
        return setting(DOWNLOAD_KEY, true) && setting(KEEP_DOWNLOADED_KEY, true);
    }

    private static void onDownloaded(String trackId) {
        try {
            if (!setting(KEEP_DOWNLOADED_KEY, true)) return;
            moveFiles(trackId, cacheDirectory(), keepDirectory());
            if (downloadsEnabled()) storeDownloaded(trackId);
        } catch (Throwable throwable) {
            Log.e(TAG, "Downloaded track lyrics failed", throwable);
        }
    }

    /** A track that is no longer downloaded: its lyrics go back to the limited cache. */
    private static void onNotDownloaded(String trackId) {
        try {
            if (!DOWNLOADED.contains(trackId)) moveFiles(trackId, keepDirectory(), cacheDirectory());
        } catch (Throwable throwable) {
            Log.e(TAG, "Moving lyrics back to the cache failed", throwable);
        }
    }

    private static void fetchDownloaded(String trackId) {
        try {
            if (downloadsEnabled() && DOWNLOADED.contains(trackId)) storeDownloaded(trackId);
        } catch (Throwable throwable) {
            Log.e(TAG, "Lyrics of downloaded track failed", throwable);
        }
    }

    /**
     * Make sure a downloaded track's answer is on disk (in the downloads folder). Uses an answer
     * already in memory if there is one; otherwise asks LRCLIB without filling the in-memory
     * cache, so a large download library does not stay in memory. Waits between lookups, and
     * longer after LRCLIB could not be reached.
     */
    private static void storeDownloaded(String trackId) throws InterruptedException {
        if (readDisk(trackId, PREFETCH_FORMAT) != null) return;
        String cacheKey = trackId + '|' + PREFETCH_FORMAT;
        String[] cached = CACHE.get(cacheKey);
        if (cached != null) {
            writeDisk(trackId, PREFETCH_FORMAT, cached.length == 0 ? null : cached);
            return;
        }
        Track track = track(trackId);
        if (track == null || System.currentTimeMillis() < downloadBackoffUntil) {
            PENDING.add(trackId); // Retried when the track's metadata is seen again.
            return;
        }

        Object lock = lock(cacheKey);
        boolean queried = false;
        try {
            synchronized (lock) {
                if (CACHE.containsKey(cacheKey) || readDisk(trackId, PREFETCH_FORMAT) != null) {
                    cached = CACHE.get(cacheKey);
                    if (cached != null) writeDisk(trackId, PREFETCH_FORMAT, cached.length == 0 ? null : cached);
                    return;
                }
                queried = true;
                String[] lyrics = query(track, PREFETCH_FORMAT);
                writeDisk(trackId, PREFETCH_FORMAT, lyrics);
                Log.i(TAG, "Downloaded track " + trackId + ": " + (lyrics == null ? "no lyrics" : lyrics[0]));
            }
        } catch (IOException exception) {
            downloadBackoffUntil = System.currentTimeMillis() + DOWNLOAD_BACKOFF_MS;
            PENDING.add(trackId);
            Log.i(TAG, "Lyrics of downloaded track " + trackId + " failed: " + exception);
        } finally {
            LOCKS.remove(cacheKey, lock);
            if (queried) Thread.sleep(DOWNLOAD_GAP_MS);
        }
    }

    /**
     * Once per process, some time after the app has read its cache database: lyrics in the
     * downloads folder of tracks that were not seen as downloaded go back to the limited cache.
     * If a download is only seen later, it is moved back to the downloads folder then.
     */
    private static void scheduleReconcile() {
        if (reconcileScheduled) return;
        reconcileScheduled = true;
        DOWNLOADER.schedule(LrcLibLyrics::reconcile, RECONCILE_DELAY_MS, TimeUnit.MILLISECONDS);
    }

    private static void reconcile() {
        try {
            File keep = keepDirectory();
            File cache = cacheDirectory();
            if (keep == null || cache == null || DOWNLOADED.isEmpty()) return;
            Set<String> downloaded = new java.util.HashSet<>();
            for (String trackId : DOWNLOADED) {
                for (String format : DISK_FORMATS) downloaded.add(LrcLibCore.cacheFileName(trackId, format));
            }
            File[] files = keep.listFiles();
            if (files == null) return;
            int moved = 0;
            for (File file : files) {
                if (downloaded.contains(file.getName())) continue;
                File target = new File(cache, file.getName());
                //noinspection ResultOfMethodCallIgnored
                target.delete();
                if (file.renameTo(target)) moved++;
            }
            if (moved > 0) {
                Log.i(TAG, "Moved lyrics of " + moved + " no longer downloaded track file(s) to the cache");
                trimNow();
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "Reconciling downloaded lyrics failed", throwable);
        }
    }

    /**
     * Replaces the app's lyrics download.
     *
     * @param trackId Track id passed to the lyrics repository.
     * @param format  The app's requested lyrics format enum (TEXT, LRC, RICH_JSON).
     * @return {formatName, content}, or null if LRCLIB has no lyrics or cannot be reached.
     */
    public static String[] lyrics(String trackId, Object format) {
        try {
            if (trackId == null) return null;
            String requested = format instanceof Enum ? ((Enum<?>) format).name() : String.valueOf(format);

            if (Looper.myLooper() == Looper.getMainLooper()) {
                // Never block the UI thread; the repository normally runs on a background dispatcher.
                String[] cached = CACHE.get(trackId + '|' + requested);
                if (cached == null) {
                    Log.w(TAG, "Called on the main thread, skipping LRCLIB");
                    return null;
                }
                return withOffset(cached.length == 0 ? null : cached);
            }

            String[] lyrics;
            try {
                lyrics = load(trackId, requested);
            } catch (IOException exception) {
                Log.w(TAG, "LRCLIB unreachable for track " + trackId + ": " + exception);
                toastUnreachable(exception);
                return null;
            }
            return withOffset(lyrics);
        } catch (Throwable throwable) {
            Log.e(TAG, "LRCLIB lookup failed", throwable);
            return null;
        }
    }

    /**
     * Called first by the patched lyrics download (a suspend function). On a background thread
     * it returns false and the caller loads right away. On the main thread, where the "Show
     * lyrics" sheet calls it, the lyrics are loaded on a background thread instead: this returns
     * true, the caller returns COROUTINE_SUSPENDED, and once the lyrics are ready the patch's
     * result helper builds the app's result on the main thread and the continuation is resumed
     * with it.
     *
     * @param owner The lyrics repository class, which has the static result helper.
     */
    public static boolean lyricsAsync(String trackId, Object format, Object continuation, Class<?> owner) {
        try {
            if (Looper.myLooper() != Looper.getMainLooper()) return false;
            if (trackId == null || format == null || continuation == null || owner == null) return false;
            String requested = format instanceof Enum ? ((Enum<?>) format).name() : String.valueOf(format);
            if (CACHE.containsKey(trackId + '|' + requested)) return false;

            Class<?> formatClass = format instanceof Enum ? ((Enum<?>) format).getDeclaringClass() : format.getClass();
            final java.lang.reflect.Method build = owner.getMethod(RESULT_HELPER, String.class, formatClass);
            final java.lang.reflect.Method resume = Class.forName("kotlin.coroutines.Continuation")
                    .getMethod("resumeWith", Object.class);
            final Handler main = new Handler(Looper.getMainLooper());
            LOADER.execute(() -> {
                try {
                    load(trackId, requested);
                } catch (IOException exception) {
                    Log.w(TAG, "LRCLIB unreachable for track " + trackId + ": " + exception);
                    toastUnreachable(exception);
                } catch (Throwable throwable) {
                    Log.e(TAG, "LRCLIB lookup failed", throwable);
                }
                main.post(() -> {
                    try {
                        // Answered from the memory cache now; a failed load gives the app's error result.
                        resume.invoke(continuation, build.invoke(null, trackId, format));
                    } catch (Throwable throwable) {
                        Log.e(TAG, "Resuming the lyrics request failed", throwable);
                    }
                });
            });
            return true;
        } catch (Throwable throwable) {
            Log.e(TAG, "Async lyrics setup failed", throwable);
            return false;
        }
    }

    /**
     * Called with the queue item the player will play next (a static helper in the track class
     * extracts the id). Must stay cheap and never throw: the player calls it often.
     */
    public static void prefetch(String trackId) {
        try {
            if (trackId == null) return;
            synchronized (PREFETCHED) {
                if (!PREFETCHED.add(trackId)) return;
            }
            PREFETCHER.execute(() -> prefetchNow(trackId));
        } catch (Throwable ignored) {
        }
    }

    private static void prefetchNow(String trackId) {
        try {
            SharedPreferences preferences = preferences();
            if (preferences != null && !preferences.getBoolean(PREFETCH_KEY, true)) return;
            String[] lyrics = load(trackId, PREFETCH_FORMAT);
            Log.i(TAG, "Prefetched track " + trackId + ": " + (lyrics == null ? "no lyrics" : lyrics[0]));
        } catch (IOException exception) {
            // Silent: the real request shows the toast if LRCLIB is still unreachable then.
            synchronized (PREFETCHED) {
                PREFETCHED.remove(trackId);
            }
            Log.i(TAG, "Prefetch of track " + trackId + " failed: " + exception);
        } catch (Throwable throwable) {
            Log.e(TAG, "Prefetch failed", throwable);
        }
    }

    /**
     * Lyrics from the memory cache, the disk cache or LRCLIB, in that order. Never on the main
     * thread. One query per track and format at a time.
     *
     * @return {formatName, content} without offset, or null when LRCLIB has no lyrics.
     * @throws IOException If LRCLIB cannot be reached.
     */
    private static String[] load(String trackId, String requested) throws IOException {
        String cacheKey = trackId + '|' + requested;
        String[] cached = CACHE.get(cacheKey);
        if (cached != null) return cached.length == 0 ? null : cached;

        Object lock = lock(cacheKey);
        synchronized (lock) {
            try {
                cached = CACHE.get(cacheKey);
                if (cached != null) return cached.length == 0 ? null : cached;

                cached = readDisk(trackId, requested);
                if (cached != null) {
                    CACHE.put(cacheKey, cached);
                    return cached.length == 0 ? null : cached;
                }

                Track track = track(trackId);
                if (track == null) {
                    Log.w(TAG, "No metadata captured for track " + trackId);
                    return null;
                }

                String[] lyrics = query(track, requested);
                CACHE.put(cacheKey, lyrics == null ? NOT_FOUND : lyrics);
                writeDisk(trackId, requested, lyrics);
                Log.i(TAG, lyrics == null
                        ? "LRCLIB has no lyrics for " + track.title
                        : "Using LRCLIB " + lyrics[0] + " lyrics for " + track.title);
                return lyrics;
            } finally {
                LOCKS.remove(cacheKey, lock);
            }
        }
    }

    /** The lock of a track and format; release with {@code LOCKS.remove(key, lock)}. */
    private static Object lock(String cacheKey) {
        Object lock = LOCKS.get(cacheKey);
        if (lock == null) {
            Object created = new Object();
            lock = LOCKS.putIfAbsent(cacheKey, created);
            if (lock == null) lock = created;
        }
        return lock;
    }

    private static Track track(String trackId) {
        synchronized (TRACKS) {
            Track track = TRACKS.get(trackId);
            if (track == null) {
                int separator = trackId.indexOf(':');
                if (separator > 0) track = TRACKS.get(trackId.substring(0, separator));
            }
            return track;
        }
    }

    /** Apply the timing offset from the Nyandex settings page to LRC lyrics. */
    private static String[] withOffset(String[] lyrics) {
        if (lyrics == null || !LrcLibCore.FORMAT_LRC.equals(lyrics[0])) return lyrics;
        SharedPreferences preferences = preferences();
        int offset = preferences == null ? 0 : preferences.getInt(OFFSET_KEY, 0);
        if (offset == 0) return lyrics;
        return new String[]{lyrics[0], LrcLibCore.shiftLrc(lyrics[1], offset)};
    }

    /**
     * Forget every cached answer, in memory and on disk. Called by the Nyandex settings page; the
     * files are deleted on the background thread. With downloaded lyrics enabled, the lyrics of
     * downloaded tracks are then loaded again.
     *
     * @return 0; the deletion runs in the background.
     */
    public static int clearCache() {
        CACHE.clear();
        synchronized (PREFETCHED) {
            PREFETCHED.clear();
        }
        PENDING.clear();
        NOT_DOWNLOADED.clear();
        DOWNLOADER.execute(() -> {
            deleteAll(cacheDirectory());
            deleteAll(keepDirectory());
            for (String trackId : DOWNLOADED) onDownloaded(trackId);
        });
        return 0;
    }

    private static int deleteAll(File directory) {
        int deleted = 0;
        File[] files = directory == null ? null : directory.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.delete()) deleted++;
            }
        }
        return deleted;
    }

    /**
     * Apply the "download lyrics with tracks" and "keep lyrics of downloaded tracks" settings in
     * the background: move the lyrics of downloaded tracks out of the limited cache and load the
     * missing ones, or move them all back into the cache. Called by the settings page.
     *
     * @return 0; the work runs in the background.
     */
    public static int applyStorageSettings() {
        DOWNLOADER.execute(() -> {
            try {
                File cache = cacheDirectory();
                File keep = keepDirectory();
                if (cache == null || keep == null) return;
                if (setting(KEEP_DOWNLOADED_KEY, true)) {
                    for (String trackId : DOWNLOADED) onDownloaded(trackId);
                    return;
                }
                File[] files = keep.listFiles();
                if (files != null) {
                    for (File file : files) {
                        File target = new File(cache, file.getName());
                        //noinspection ResultOfMethodCallIgnored
                        target.delete();
                        //noinspection ResultOfMethodCallIgnored
                        file.renameTo(target);
                    }
                }
                trimNow();
            } catch (Throwable throwable) {
                Log.e(TAG, "Applying lyrics storage settings failed", throwable);
            }
        });
        return 0;
    }

    /** Number of saved lyrics of downloaded tracks (kept apart from the limited cache). */
    public static int downloadedCacheSize() {
        File directory = keepDirectory();
        File[] files = directory == null ? null : directory.listFiles();
        return files == null ? 0 : files.length;
    }

    /**
     * Apply the disk cache limit from the settings page, in the background. Called by the
     * settings page after the limit changes.
     *
     * @return 0; the work runs in the background.
     */
    public static int trimCache() {
        DOWNLOADER.execute(LrcLibLyrics::trimNow);
        return 0;
    }

    private static void trimNow() {
        File directory = cacheDirectory();
        if (directory == null) return;
        int limit = cacheLimit();
        if (limit > 0) prune(directory, limit);
        else deleteAll(directory);
    }

    /** Number of answers in the limited disk cache, for the settings page. */
    public static int cacheSize() {
        File directory = cacheDirectory();
        File[] files = directory == null ? null : directory.listFiles();
        return files == null ? 0 : files.length;
    }

    // region Disk cache

    private static int cacheLimit() {
        SharedPreferences preferences = preferences();
        int limit = preferences == null ? DEFAULT_CACHE_LIMIT : preferences.getInt(CACHE_LIMIT_KEY, DEFAULT_CACHE_LIMIT);
        return Math.max(0, limit);
    }

    private static File cacheDirectory() {
        Context current = appContext();
        return current == null ? null : directory(new File(current.getCacheDir(), CACHE_DIRECTORY));
    }

    private static File keepDirectory() {
        Context current = appContext();
        return current == null ? null : directory(new File(current.getFilesDir(), KEEP_DIRECTORY));
    }

    private static File directory(File directory) {
        return directory.isDirectory() || directory.mkdirs() ? directory : null;
    }

    /** Where a new answer for the track is written. */
    private static File targetDirectory(String trackId) {
        return setting(KEEP_DOWNLOADED_KEY, true) && DOWNLOADED.contains(trackId) ? keepDirectory() : cacheDirectory();
    }

    /** Move a track's saved answers (every format) between the two directories. */
    private static int moveFiles(String trackId, File from, File to) {
        if (from == null || to == null) return 0;
        int moved = 0;
        for (String format : DISK_FORMATS) {
            String name = LrcLibCore.cacheFileName(trackId, format);
            File source = new File(from, name);
            if (!source.isFile()) continue;
            File target = new File(to, name);
            //noinspection ResultOfMethodCallIgnored
            target.delete();
            if (source.renameTo(target)) moved++;
        }
        return moved;
    }

    private static boolean setting(String key, boolean defaultValue) {
        SharedPreferences preferences = preferences();
        return preferences == null ? defaultValue : preferences.getBoolean(key, defaultValue);
    }

    /** @return Cached lyrics, an empty array for a fresh "no lyrics", or null if not cached. */
    private static String[] readDisk(String trackId, String requested) {
        String[] lyrics = readDisk(keepDirectory(), trackId, requested);
        if (lyrics != null || cacheLimit() == 0) return lyrics;
        return readDisk(cacheDirectory(), trackId, requested);
    }

    private static String[] readDisk(File directory, String trackId, String requested) {
        try {
            if (directory == null) return null;
            File file = new File(directory, LrcLibCore.cacheFileName(trackId, requested));
            if (!file.isFile()) return null;
            String entry;
            try (InputStream input = new FileInputStream(file)) {
                entry = readAll(input);
            }
            String[] lyrics = LrcLibCore.decodeCacheEntry(entry, System.currentTimeMillis(), MISS_TTL_MS);
            if (lyrics == null) {
                //noinspection ResultOfMethodCallIgnored
                file.delete();
                return null;
            }
            //noinspection ResultOfMethodCallIgnored
            file.setLastModified(System.currentTimeMillis()); // Pruning removes the least recently used.
            return lyrics;
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not read cached lyrics", throwable);
            return null;
        }
    }

    private static void writeDisk(String trackId, String requested, String[] lyrics) {
        try {
            File directory = targetDirectory(trackId);
            if (directory == null) return;
            File cache = cacheDirectory();
            boolean limited = directory.equals(cache);
            int limit = cacheLimit();
            if (limited && limit == 0) return;
            File file = new File(directory, LrcLibCore.cacheFileName(trackId, requested));
            File temporary = new File(directory, file.getName() + ".tmp");
            try (OutputStream output = new FileOutputStream(temporary)) {
                output.write(LrcLibCore.encodeCacheEntry(lyrics, System.currentTimeMillis()).getBytes("UTF-8"));
            }
            if (!temporary.renameTo(file)) {
                //noinspection ResultOfMethodCallIgnored
                temporary.delete();
                return;
            }
            boolean prune;
            synchronized (LrcLibLyrics.class) {
                prune = diskWrites++ % PRUNE_EVERY_WRITES == 0;
            }
            if (!limited && cache != null) {
                //noinspection ResultOfMethodCallIgnored
                new File(cache, file.getName()).delete();
            }
            if (prune && limited) prune(directory, limit);
        } catch (Throwable throwable) {
            Log.w(TAG, "Could not cache lyrics", throwable);
        }
    }

    /**
     * Keep the disk cache bounded: above {@code limit} entries, drop the least recently used
     * down to five sixths of the limit, so pruning does not run on every write.
     *
     * @return The number of files deleted.
     */
    private static int prune(File directory, int limit) {
        File[] files = directory.listFiles();
        if (files == null || files.length <= limit) return 0;
        int keep = limit - limit / 6;
        final long[] modified = new long[files.length];
        Integer[] order = new Integer[files.length];
        for (int i = 0; i < files.length; i++) {
            modified[i] = files[i].lastModified();
            order[i] = i;
        }
        Arrays.sort(order, (a, b) -> Long.compare(modified[a], modified[b]));
        int deleted = 0;
        for (int i = 0; i < files.length - keep; i++) {
            if (files[order[i]].delete()) deleted++;
        }
        return deleted;
    }

    // endregion

    private static Context appContext() {
        Context current = context;
        if (current != null) return current;
        try {
            Object application = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (application instanceof Context) {
                current = ((Context) application).getApplicationContext();
                context = current;
            }
        } catch (Throwable ignored) {
        }
        return current;
    }

    private static SharedPreferences preferences() {
        Context current = appContext();
        return current == null ? null : current.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    /**
     * Toast that LRCLIB cannot be reached, after a request failed all its attempts. Not shown
     * when the lookup stopped early ({@link QuietException}) or when the phone has no working
     * internet connection at all: then the problem is not LRCLIB. At most one toast per
     * {@link #TOAST_INTERVAL_MS}: the app retries failed lyrics loads.
     */
    private static void toastUnreachable(IOException exception) {
        try {
            if (exception instanceof QuietException) return;
            final Context current = appContext();
            if (current == null) return;
            if (isOffline(current)) {
                Log.i(TAG, "No internet connection, no LRCLIB toast");
                return;
            }

            long now = SystemClock.elapsedRealtime();
            if (lastToastAt != 0 && now - lastToastAt < TOAST_INTERVAL_MS) return;
            lastToastAt = now;
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Toast.makeText(current, UNREACHABLE_MESSAGE, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                }
            });
        } catch (Throwable ignored) {
        }
    }

    /**
     * Whether the phone has no working internet connection: no network, or one that Android
     * did not validate (no internet, or a captive portal). False when it cannot be told.
     */
    private static boolean isOffline(Context context) {
        try {
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return false;
            Network network = manager.getActiveNetwork();
            if (network == null) return true;
            NetworkCapabilities capabilities = manager.getNetworkCapabilities(network);
            return capabilities == null
                    || !capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    || !capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
        } catch (Throwable throwable) {
            return false;
        }
    }

    /**
     * Look the track up on LRCLIB, from the most to the least exact query:
     * <ol>
     *   <li>/api/get with each artist form and the title as the app has it;</li>
     *   <li>/api/get with the main artist and the cleaned title ({@link LrcLibCore#cleanTitle});</li>
     *   <li>/api/search by artist and cleaned title (LRCLIB filters by artist);</li>
     *   <li>/api/search?q= "artist title", then by cleaned title alone: LRCLIB does not filter
     *       these by artist, so the result's artist must match one of the track's artists.</li>
     * </ol>
     * Search results must also be within a few seconds of the track's duration.
     */
    private static String[] query(Track track, String requested) throws IOException {
        List<String> artists = new ArrayList<>();
        if (track.artists != null) {
            for (Object artist : track.artists) {
                if (artist != null) artists.add(String.valueOf(artist));
            }
        }
        long seconds = LrcLibCore.secondsFromMillis(track.durationMs);
        List<String> artistQueries = LrcLibCore.artistCandidates(artists);
        List<String> titles = LrcLibCore.titleCandidates(track.title);
        if (titles.isEmpty()) return null;
        String mainArtist = artistQueries.isEmpty() ? null : artistQueries.get(artistQueries.size() - 1);
        String cleanTitle = titles.get(titles.size() - 1);

        for (String artist : artistQueries) {
            String[] lyrics = getLyrics(LrcLibCore.buildGetUrl(artist, titles.get(0), seconds), requested);
            if (lyrics != null) return lyrics;
        }
        if (mainArtist != null && titles.size() > 1) {
            String[] lyrics = getLyrics(LrcLibCore.buildGetUrl(mainArtist, cleanTitle, seconds), requested);
            if (lyrics != null) return lyrics;
        }

        String[] lyrics = searchLyrics(LrcLibCore.buildSearchUrl(mainArtist, cleanTitle), seconds, null, requested);
        if (lyrics != null || mainArtist == null) return lyrics;

        lyrics = searchLyrics(LrcLibCore.buildQuerySearchUrl(mainArtist + " " + cleanTitle), seconds, artists, requested);
        if (lyrics != null) return lyrics;
        return searchLyrics(LrcLibCore.buildSearchUrl(null, cleanTitle), seconds, artists, requested);
    }

    private static String[] getLyrics(String url, String requested) throws IOException {
        String body = get(url);
        if (body == null) return null;
        Object json = LrcLibCore.parseJson(body);
        if (!(json instanceof Map)) return null;
        @SuppressWarnings("unchecked")
        Map<String, Object> record = (Map<String, Object>) json;
        return LrcLibCore.chooseLyrics(record, requested);
    }

    private static String[] searchLyrics(String url, long seconds, List<String> artists, String requested)
            throws IOException {
        String body = get(url);
        if (body == null) return null;
        Object json = LrcLibCore.parseJson(body);
        if (!(json instanceof List)) return null;
        @SuppressWarnings("unchecked")
        Map<String, Object> best = LrcLibCore.pickSearchResult((List<Object>) json, seconds, artists);
        return LrcLibCore.chooseLyrics(best, requested);
    }

    /**
     * One request, tried up to {@link LrcLibCore#MAX_ATTEMPTS} times after network errors and
     * temporary HTTP errors ({@link LrcLibCore#retryDelayMs}). A Retry-After from LRCLIB is
     * honored: the retry waits for it, and no request is sent before it has passed. Only the
     * failure of the last attempt reaches the caller (and so the toast).
     *
     * @return The response body for HTTP 200, null for 404 (no such lyrics).
     * @throws IOException If LRCLIB cannot be reached or answers with another status.
     */
    private static String get(String url) throws IOException {
        for (int attempt = 1; ; attempt++) {
            IOException failure;
            long delay;
            try {
                return getOnce(url);
            } catch (StatusException exception) {
                failure = exception;
                delay = LrcLibCore.retryDelayMs(attempt, exception.status, exception.retryAfterMs);
            } catch (WaitException exception) {
                throw exception;
            } catch (IOException exception) {
                failure = exception;
                delay = LrcLibCore.retryDelayMs(attempt, 0, -1);
            }
            if (delay < 0) throw failure;
            Log.i(TAG, "LRCLIB attempt " + attempt + " failed (" + failure + "), retrying in " + delay + " ms");
            try {
                Thread.sleep(delay);
            } catch (InterruptedException exception) {
                Thread.currentThread().interrupt();
                throw new QuietException("Interrupted before attempt " + (attempt + 1), failure);
            }
        }
    }

    private static String getOnce(String url) throws IOException {
        long wait = waitUntil - SystemClock.elapsedRealtime();
        if (wait > 0) throw new WaitException("LRCLIB asked to wait " + wait + " ms more");

        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        try {
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("User-Agent", USER_AGENT);
            connection.setRequestProperty("Lrclib-Client", USER_AGENT);
            connection.setRequestProperty("Accept", "application/json");
            int status = connection.getResponseCode();
            if (status == HttpURLConnection.HTTP_NOT_FOUND) return null;
            if (status != HttpURLConnection.HTTP_OK) {
                long retryAfterMs = LrcLibCore.parseRetryAfterMs(connection.getHeaderField("Retry-After"));
                if (retryAfterMs > 0) waitUntil = SystemClock.elapsedRealtime() + retryAfterMs;
                throw new StatusException(status, retryAfterMs, url);
            }
            try (InputStream input = connection.getInputStream()) {
                return readAll(input);
            }
        } finally {
            connection.disconnect();
        }
    }

    private static String readAll(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int read;
        while ((read = input.read(buffer)) != -1) output.write(buffer, 0, read);
        return output.toString("UTF-8");
    }
}
