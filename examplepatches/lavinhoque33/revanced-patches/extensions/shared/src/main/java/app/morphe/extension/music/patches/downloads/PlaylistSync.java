/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-26.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.function.BooleanSupplier;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Foreground scheduling for interrupted downloads and saved-playlist refreshes. No jobs wake Music. */
public final class PlaylistSync {
    /** Serializes explicit removal, sync publication and first-download membership writes, not network work. */
    static final Object MUTATION = new Object();
    private static final long START_DELAY = 3_000;
    private static final long SWEEP_INTERVAL = 120_000;
    private static final long SOURCE_INTERVAL = 600_000;
    private static final long VISIT_INTERVAL = 45_000;
    private static final long INTERRUPTED_INTERVAL = 15_000;
    private static final long RESUME_RECHECK = 15_000;
    private static final int SOURCES_PER_SWEEP = 3;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final Runnable TICK = PlaylistSync::tick;
    private static final Runnable RESUME_SCAN = PlaylistSync::scanPending;
    private static final Map<String, Long> attempts = new HashMap<>();
    private static final Map<String, DownloadRetryPlan.Attempt> resumes = new HashMap<>();
    private static final ThreadLocal<Run> worker = new ThreadLocal<>();
    private static ConnectivityManager manager;
    private static volatile Activity visible;
    private static Network wifi;
    private static long nextTick = Long.MAX_VALUE;
    private static long nextResumeScan = Long.MAX_VALUE;
    private static long resumeScanNotBefore;
    private static boolean checkedWithoutWifi;
    private static String visited;
    private static boolean readingPending;
    private static String resuming;
    private static volatile Run active;

    private PlaylistSync() {}

    // Patched independently: Resume also exists on versions without the native offline browse hook.
    static boolean autoResumeSupported() { return false; }
    static boolean syncSupported() { return false; }

    /** Injected early in MainActivity.onCreate, before it first becomes visible. */
    @SuppressLint("MissingPermission")
    public static synchronized void install(Activity activity) {
        if (manager != null || Build.VERSION.SDK_INT < 24) return;
        Context context = activity.getApplicationContext();
        if (!(context.getSystemService(Context.CONNECTIVITY_SERVICE) instanceof ConnectivityManager connectivity)) {
            return;
        }

        try {
            connectivity.registerDefaultNetworkCallback(new WifiChanges());
            manager = connectivity;
            activity.getApplication().registerActivityLifecycleCallbacks(new Visibility(activity.getClass()));
        } catch (RuntimeException failure) {
            Logger.printException(() -> "PlaylistSync: could not monitor Music visibility and Wi-Fi", failure);
        }
    }

    static synchronized void onBrowse(String browseId) {
        if (!syncSupported() || visible == null || !browseId.startsWith("VL")) return;
        String id = OfflineReplayLogic.sourceOfBrowseId(browseId);
        OfflineSourceStore.Source source = OfflineCopyStore.source(id);
        if (source == null || source.kind() != OfflineSourceStore.Kind.PLAYLIST) return;

        visited = id;
        schedule(START_DELAY);
    }

    private static synchronized void shown(Activity activity) {
        if (visible != activity) {
            visible = activity;
            schedule(START_DELAY);
        }
        checkedWithoutWifi = false;
        scheduleResumeScan(START_DELAY);
    }

    private static synchronized void hidden(Activity activity) {
        if (visible != activity) return;
        visible = null;
        visited = null;
        cancelBrowsing();
        main.removeCallbacks(TICK);
        nextTick = Long.MAX_VALUE;
        main.removeCallbacks(RESUME_SCAN);
        nextResumeScan = Long.MAX_VALUE;
    }

    private static synchronized void wifiChanged(@Nullable Network network) {
        if (Objects.equals(wifi, network)) return;
        wifi = network;
        cancelBrowsing();
        schedule(START_DELAY);
        checkedWithoutWifi = false;
        scheduleResumeScan(START_DELAY);
    }

    private static synchronized void schedule(long delay) {
        long due = SystemClock.elapsedRealtime() + delay;
        if (visible == null || wifi == null || due >= nextTick) return;
        main.removeCallbacks(TICK);
        main.postDelayed(TICK, delay);
        nextTick = due;
    }

    private static synchronized void tick() {
        nextTick = Long.MAX_VALUE;
        if (visible == null || wifi == null) return;

        schedule(SWEEP_INTERVAL);
        if (active != null || !enabled()) return;

        Run run = new Run(wifi);
        active = run;
        Utils.runOnBackgroundThread(() -> sweep(run));
    }

    private static synchronized void scheduleResumeScan(long delay) {
        long due = Math.max(SystemClock.uptimeMillis() + delay, resumeScanNotBefore);
        if (!autoResumeSupported() || visible == null || due >= nextResumeScan) return;

        main.removeCallbacks(RESUME_SCAN);
        main.postAtTime(RESUME_SCAN, due);
        nextResumeScan = due;
    }

    private static synchronized void scanPending() {
        nextResumeScan = Long.MAX_VALUE;
        if (visible == null || readingPending || resuming != null
                || !LocalDownloadManager.downloadMode().streamCopy()) return;

        resumeScanNotBefore = SystemClock.uptimeMillis() + RESUME_RECHECK;
        Logger.printDebug(() -> "PlaylistSync: checking pending automatic resumes");

        readingPending = true;
        Utils.runOnBackgroundThread(() -> {
            Set<String> pending = Set.of();
            try {
                pending = DownloadedMarkers.pendingPlaylistIds();
            } catch (RuntimeException failure) {
                Logger.printWarn(() -> "PlaylistDownloads: could not read pending sources", failure);
            } finally {
                Set<String> candidates = pending;
                main.post(() -> selectPending(candidates));
            }
        });
    }

    private static synchronized void selectPending(Set<String> pending) {
        readingPending = false;
        boolean streamMode = LocalDownloadManager.downloadMode().streamCopy();
        if (visible == null || resuming != null || pending.isEmpty() || !streamMode) return;

        long now = SystemClock.elapsedRealtime();
        long delay = Long.MAX_VALUE;
        for (String source : pending) {
            long remaining = DownloadRetryPlan.delayUntilAutomaticResume(
                    PlaylistDownloads.isRunning(source), resumes.get(source), now);
            if (remaining > 0) {
                delay = Math.min(delay, remaining);
                continue;
            }

            PlaylistDownloads.ResumeStart result = PlaylistDownloads.resumeAutomatically(source);
            if (result == PlaylistDownloads.ResumeStart.STARTED) {
                resuming = source;
                return;
            }
            Logger.printDebug(() -> "PlaylistSync: auto-resume deferred for " + source + ": " + result
                    + " (Wi-Fi callback eligible=" + (wifi != null) + ")");
            if (result == PlaylistDownloads.ResumeStart.WIFI_UNAVAILABLE) {
                // The uid's active network can lag the default-network callback on foreground return.
                // If both lack Wi-Fi, probe just once before waiting for a network or visibility event.
                if (wifi != null || !checkedWithoutWifi) {
                    checkedWithoutWifi = true;
                    delay = RESUME_RECHECK;
                }
                break;
            }
        }
        if (delay != Long.MAX_VALUE) scheduleResumeScan(delay);
    }

    static void resumeFinished(String sourceId, long startedAt, boolean madeProgress, boolean interrupted) {
        main.post(() -> {
            DownloadRetryPlan.Attempt attempt;
            synchronized (PlaylistSync.class) {
                attempt = DownloadRetryPlan.finish(resumes.get(sourceId), startedAt, madeProgress, interrupted);
                resumes.put(sourceId, attempt);
                resuming = null;
                scheduleResumeScan(0);
            }
            if (!madeProgress && !interrupted) {
                Logger.printInfo(() -> "PlaylistDownloads: auto-resume idle " + attempt.idleAttempts()
                        + "/" + DownloadRetryPlan.IDLE_LIMIT + " for " + sourceId);
            }
            if (attempt.held()) Logger.printInfo(() -> "PlaylistDownloads: auto-resume held for " + sourceId);
        });
    }

    static void manualTransferPending() {
        scheduleResumeScan(SWEEP_INTERVAL);
    }

    /** The transfer already knows the saved queue; fetch its genuine renderer independently of all media work. */
    static void captureDownload(OfflineSourceStore.Source source, boolean automatic, BooleanSupplier stopped) {
        if (!OfflineReplayHooks.usable() || !OfflineReplayHooks.localDetailSupported()
                || !OfflineBrowsePagesLogic.isPlaylistId(source.id())) return;

        Utils.runOnBackgroundThread(() -> {
            Network network = automatic ? DownloadNetwork.eligibleWifi() : null;
            if (automatic && network == null) return;

            BooleanSupplier allowed = () -> !stopped.getAsBoolean()
                    && !Thread.currentThread().isInterrupted()
                    && (network == null ? Utils.isInternetReachable() : network.equals(DownloadNetwork.eligibleWifi()));
            try {
                if (network == null) captureSavedMembership(source, allowed);
                else Requester.withConnection(new Requester.ConnectionProvider() {
                    @Override public boolean cancelled() {
                        return stopped.getAsBoolean() || Thread.currentThread().isInterrupted();
                    }

                    @Override public HttpURLConnection openConnection(URL url) throws IOException {
                        if (!allowed.getAsBoolean()) throw new IOException("Playlist snapshot Wi-Fi is no longer eligible");
                        return (HttpURLConnection) network.openConnection(url);
                    }
                }, () -> {
                    captureSavedMembership(source, allowed);
                    return null;
                });
            } catch (Exception ex) {
                Logger.printDebug(() -> "PlaylistSync: could not capture downloaded detail " + source.id(), ex);
            }
        });
    }

    private static void captureSavedMembership(OfflineSourceStore.Source source, BooleanSupplier allowed)
            throws Exception {
        if (!allowed.getAsBoolean() || OfflineCopyStore.source(source.id()) != source) return;
        byte[] existing = OfflineBrowsePages.committed(source);
        if (existing != null) {
            OfflineBrowsePages.rememberCover(source.id(), existing, source.thumbnailUrl());
            return;
        }

        int saved = -1;
        try {
            PlaylistSyncPage.Snapshot fresh = fetchPage(source.id(), allowed);
            if (source.videoIds().equals(fresh.tracks())) {
                saved = OfflineBrowsePages.publishCapture(source, fresh.browseBytes(), allowed);
            }
            if (saved >= 0) Logger.printDebug(() -> "PlaylistSync: saved native detail for " + source.id());
        } finally {
            if (saved < 0 && allowed.getAsBoolean()) {
                OfflinePlaylistArtwork.rememberCover(source.id(), source.thumbnailUrl());
            }
        }
    }

    private static PlaylistSyncPage.Snapshot fetchPage(String id, BooleanSupplier allowed) throws Exception {
        return PlaylistSyncPage.fetch(id, token -> {
            if (!allowed.getAsBoolean()) throw new IOException("Playlist browse was stopped");
            return MusicBrowseRequest.browseNative(Utils.getContext(), "VL" + id, token);
        });
    }

    private static boolean enabled() {
        return (syncSupported() || OfflineReplayHooks.localDetailSupported())
                && OfflineReplayHooks.usable() && LocalDownloadManager.downloadMode().streamCopy();
    }

    private static void cancelBrowsing() {
        Run run = active;
        if (run != null && run.hold == null) run.cancelled = true;
    }

    static void cancel() {
        Run run = active;
        if (run != null) {
            run.cancelled = true;
            DownloadNetwork.wakeWaiters();
        }
    }

    /** Browse on the visible Wi-Fi; once additions start, finish this source even if the activity stops. */
    private static final class Run implements Requester.ConnectionProvider {
        private final Network network;
        private volatile boolean cancelled;
        private volatile DownloadKeepAlive.Hold hold;

        Run(Network network) {
            this.network = network;
        }

        boolean allowed() {
            return !cancelled && visible != null && enabled() && network.equals(DownloadNetwork.eligibleWifi())
                    && !Thread.currentThread().isInterrupted();
        }

        boolean mayCommit() {
            return hold == null ? allowed() : !cancelled() && enabled();
        }

        boolean beginTransfer(OfflineSourceStore.Source source) {
            synchronized (PlaylistSync.class) {
                if (!allowed()) return false;

                hold = DownloadKeepAlive.acquire("playlist:" + source.id(), source.title());
                return true;
            }
        }

        void check() throws IOException {
            if (!allowed()) {
                cancelled = true;
                throw new IOException("Foreground Wi-Fi is no longer eligible");
            }
        }

        @Override public boolean cancelled() {
            DownloadKeepAlive.Hold current = hold;
            return cancelled || (current != null && current.timedOut());
        }

        @Override public HttpURLConnection openConnection(URL url) throws IOException {
            check();
            return (HttpURLConnection) network.openConnection(url);
        }
    }

    static boolean transferring() {
        return worker.get() != null;
    }

    @Nullable
    static BooleanSupplier stopSignal() {
        Run run = worker.get();
        return run == null ? null : run::cancelled;
    }

    static <T> T publishMedia(Callable<T> write) throws Exception {
        Run run = worker.get();
        if (run == null) return write.call();
        synchronized (MUTATION) {
            if (!run.mayCommit()) throw new IOException("Playlist sync was stopped");
            return write.call();
        }
    }

    private static void sweep(Run run) {
        worker.set(run);
        try {
            run.check();
            List<OfflineSourceStore.Source> sources = candidates();
            for (OfflineSourceStore.Source source : sources) {
                if (!run.allowed()) break;
                String id = source.id();
                noteAttempt(id);
                try {
                    Requester.withConnection(run, () -> {
                        sync(run, source);
                        return null;
                    });
                } catch (Exception failure) {
                    if (run.allowed()) Logger.printWarn(() -> "PlaylistSync: kept previous playlist " + id, failure);
                    else shortenCooldown(id);
                }
            }
        } catch (Exception failure) {
            if (run.allowed()) Logger.printException(() -> "PlaylistSync: could not scan saved playlists", failure);
        } finally {
            worker.remove();
            finished(run);
        }
    }

    private static List<OfflineSourceStore.Source> candidates() {
        List<OfflineSourceStore.Source> retained = OfflineCopyStore.sources();
        long now = SystemClock.elapsedRealtime();
        synchronized (PlaylistSync.class) {
            attempts.keySet().retainAll(OfflineCopyStore.tracksBySource().keySet());
            List<OfflineSourceStore.Source> result = new ArrayList<>();
            for (OfflineSourceStore.Source source : retained) {
                if (!canRefresh(source)) continue;
                String id = source.id();
                long interval = id.equals(visited) ? VISIT_INTERVAL : SOURCE_INTERVAL;
                Long previous = attempts.get(id);
                if (previous == null || now - previous >= interval) result.add(source);
                else if (id.equals(visited)) schedule(interval - (now - previous));
            }
            result.sort(Comparator.comparing((OfflineSourceStore.Source source) -> !source.id().equals(visited))
                    .thenComparingLong(source -> attempts.getOrDefault(source.id(), 0L)));
            return result.subList(0, Math.min(result.size(), SOURCES_PER_SWEEP));
        }
    }

    private static synchronized void noteAttempt(String id) {
        attempts.put(id, SystemClock.elapsedRealtime());
        if (id.equals(visited)) visited = null;
    }

    private static synchronized void shortenCooldown(String id) {
        attempts.put(id, SystemClock.elapsedRealtime() - SOURCE_INTERVAL + INTERRUPTED_INTERVAL);
    }

    private static synchronized void finished(Run run) {
        if (active == run) active = null;
        schedule(visited != null || run.cancelled ? START_DELAY : SWEEP_INTERVAL);
    }

    private static boolean canRefresh(OfflineSourceStore.Source source) {
        return OfflineBrowsePagesLogic.isPlaylistId(source.id()) && !PlaylistDownloads.isRunning(source.id())
                && DownloadedMarkers.completedStreamSource(source);
    }

    private static void sync(Run run, OfflineSourceStore.Source source) throws Exception {
        String id = source.id();
        if (OfflineCopyStore.source(id) != source || !canRefresh(source)) return;

        if (!syncSupported()) {
            captureSavedMembership(source, run::allowed);
            return;
        }

        PlaylistSyncPage.Snapshot fresh = fetchPage(id, run::allowed);
        run.check();
        if (source.videoIds().equals(fresh.tracks())) {
            byte[] existing = OfflineBrowsePages.committed(source);
            if (existing != null) {
                OfflineBrowsePages.rememberCover(id, existing, source.thumbnailUrl());
                return;
            }
        }

        Set<String> additions = PlaylistSyncPlan.additions(source.videoIds(), fresh.tracks());
        if (additions.isEmpty()) {
            applyRefresh(run, source, fresh, additions, null);
        } else if (run.beginTransfer(source)) {
            try (DownloadKeepAlive.Hold hold = run.hold) {
                Logger.printInfo(() -> "PlaylistSync: downloading additions for " + id);
                applyRefresh(run, source, fresh, additions, new DownloadNetwork(true,
                        () -> run.cancelled() || !enabled(), hold));
            } finally {
                if (run.cancelled()) run.cancelled = true;
                run.hold = null;
            }
        }
    }

    private static void applyRefresh(Run run, OfflineSourceStore.Source source, PlaylistSyncPage.Snapshot fresh,
                                     Set<String> additions, @Nullable DownloadNetwork network) throws Exception {
        String id = source.id();
        DownloadQuality quality = Settings.DOWNLOAD_QUALITY.get();
        Set<String> own = RawAudioStore.copyIds();
        Map<String, String> aliases = RawAudioStore.aliases();
        Map<String, String> ready = new HashMap<>();
        if (network != null) {
            int index = 0;
            for (String videoId : additions) {
                run.hold.progress(source.title(), index * 100 / additions.size(),
                        str("morphe_music_playlist_ready", index, additions.size()));
                String copyId = OfflineCopyStore.copyId(videoId, own, aliases);
                ready.put(videoId, network.transfer(() -> ensureAudio(videoId, copyId, quality)));
                index++;
            }
            VideoCopyDownloader.ensureForSync(id, source.title(), PlaylistPage.available(fresh.tracks()), additions,
                    ready::get, quality, network, run.hold);
            if (!network.awaitTransferConnection()) throw new IOException("Playlist sync lost its transfer Wi-Fi");
        }
        if (!hasPlayableTrack(fresh.tracks(), ready, own, aliases)) {
            throw new IOException("The refreshed playlist would have no playable copy");
        }

        if (!run.mayCommit()) throw new IOException("Playlist sync was stopped");
        byte[] response = fresh.browseBytes();
        File staged = OfflineCopyStore.stagePlaylistPage(response);
        boolean committed = false;
        try {
            synchronized (MUTATION) {
                if (canRefresh(source) && ready.values().stream().allMatch(OfflineCopyStore::has)
                        && (run.hold == null || run.hold.finish())) {
                    committed = OfflineCopyStore.commitPlaylist(source, fresh.tracks(), staged, run::mayCommit);
                    if (committed) DownloadedMarkers.onPlaylistSynced(id, fresh.tracks());
                }
            }
        } finally {
            if (!committed) staged.delete();
        }
        if (committed) {
            Logger.printInfo(() -> "PlaylistSync: committed " + id + " tracks=" + fresh.tracks().size()
                    + " additions=" + additions.size());
            OfflineBrowsePages.rememberCover(id, response, source.thumbnailUrl());
        }
    }

    private static String ensureAudio(String id, String copyId, DownloadQuality quality) throws Exception {
        if (RawAudioStore.find(copyId) == null) {
            LocalDownloadManager.download(id, DownloadMode.STREAM_COPY, quality);
            copyId = id;
        } else if (OfflineCopyStore.find(copyId) == null) {
            String failure = OfflineBackfill.fetchAndStore(copyId);
            if (failure != null) throw new IOException("An added playlist track has no saved response: " + failure);
        }
        if (OfflineCopyStore.find(copyId) == null) throw new IOException("An added playlist track is not offline ready");
        return copyId;
    }

    private static boolean hasPlayableTrack(List<String> tracks, Map<String, String> added, Set<String> own,
                                            Map<String, String> aliases) {
        if (!added.isEmpty()) return true;
        for (String track : tracks) {
            String id = OfflineCopyStore.copyId(track, own, aliases);
            if (own.contains(id) && OfflineCopyStore.find(id) != null) return true;
        }
        return false;
    }

    private static final class WifiChanges extends ConnectivityManager.NetworkCallback {
        private Network current;

        @Override public void onCapabilitiesChanged(Network network, NetworkCapabilities caps) {
            current = network;
            boolean internet = caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    && caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
            Network eligible = DownloadNetwork.eligible(caps) ? network : null;
            DownloadNetwork.changed(internet ? network : null, eligible);
            wifiChanged(eligible);
        }

        @Override public void onBlockedStatusChanged(Network network, boolean blocked) {
            if (!blocked && network.equals(current)) scheduleResumeScan(START_DELAY);
        }

        @Override public void onLost(Network network) {
            if (!network.equals(current)) return;

            current = null;
            DownloadNetwork.changed(null, null);
            wifiChanged(null);
        }
    }

    private static final class Visibility implements Application.ActivityLifecycleCallbacks {
        private final Class<?> mainActivity;

        Visibility(Class<?> mainActivity) {
            this.mainActivity = mainActivity;
        }

        @Override public void onActivityStarted(Activity activity) {
            if (mainActivity.isInstance(activity)) shown(activity);
        }

        @Override public void onActivityStopped(Activity activity) { hidden(activity); }
        @Override public void onActivityCreated(Activity activity, Bundle state) {}
        @Override public void onActivityResumed(Activity activity) {
            if (mainActivity.isInstance(activity)) shown(activity);
        }
        @Override public void onActivityPaused(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) { hidden(activity); }
    }
}
