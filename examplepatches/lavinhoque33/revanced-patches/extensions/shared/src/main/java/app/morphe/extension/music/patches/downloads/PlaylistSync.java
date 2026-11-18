/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches.downloads;

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
import java.util.Set;
import java.util.concurrent.Callable;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/** Only the running phone app refreshes its retained stream playlists. No Android job survives the process. */
public final class PlaylistSync {
    /** Serializes explicit removal, sync publication and first-download membership writes, not network work. */
    static final Object MUTATION = new Object();
    private static final long START_DELAY = 3_000;
    private static final long SWEEP_INTERVAL = 120_000;
    private static final long SOURCE_INTERVAL = 600_000;
    private static final long VISIT_INTERVAL = 45_000;
    private static final long INTERRUPTED_INTERVAL = 15_000;
    private static final int SOURCES_PER_SWEEP = 3;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final Runnable TICK = PlaylistSync::tick;
    private static final Map<String, Long> attempts = new HashMap<>();
    private static ConnectivityManager manager;
    private static Activity visible;
    private static Network wifi;
    private static long nextTick = Long.MAX_VALUE;
    private static String visited;
    private static volatile Run active;

    private PlaylistSync() {}

    /** Injected into MainActivity only with a working native offline browse hook. */
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
            Logger.printException(() -> "PlaylistSync: could not monitor foreground Wi-Fi", failure);
        }
    }

    static synchronized void onBrowse(String browseId) {
        if (visible == null || !browseId.startsWith("VL")) return;
        String id = OfflineReplayLogic.sourceOfBrowseId(browseId);
        OfflineSourceStore.Source source = OfflineCopyStore.source(id);
        if (source == null || source.kind() != OfflineSourceStore.Kind.PLAYLIST) return;

        visited = id;
        schedule(START_DELAY);
    }

    private static synchronized void shown(Activity activity) {
        visible = activity;
        schedule(START_DELAY);
    }

    private static synchronized void hidden(Activity activity) {
        if (visible != activity) return;
        visible = null;
        visited = null;
        cancel();
        main.removeCallbacks(TICK);
        nextTick = Long.MAX_VALUE;
    }

    private static synchronized void wifiChanged(@Nullable Network network) {
        if (java.util.Objects.equals(wifi, network)) return;
        wifi = network;
        cancel();
        schedule(START_DELAY);
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

        Run run = new Run(manager, wifi);
        active = run;
        Utils.runOnBackgroundThread(() -> sweep(run));
    }

    private static boolean enabled() {
        return OfflineReplayHooks.usable() && LocalDownloadManager.downloadMode().streamCopy();
    }

    static void cancel() {
        Run run = active;
        if (run != null) run.cancelled = true;
    }

    /** Work delegated by the ordinary downloaders is pinned to this run's Wi-Fi, including its range workers. */
    private static final class Run implements Requester.ConnectionProvider {
        private final ConnectivityManager manager;
        private final Network network;
        private volatile boolean cancelled;

        Run(ConnectivityManager manager, Network network) {
            this.manager = manager;
            this.network = network;
        }

        @SuppressLint("MissingPermission")
        boolean allowed() {
            try {
                return !cancelled && enabled() && network.equals(manager.getActiveNetwork())
                        && eligible(manager.getNetworkCapabilities(network)) && !Thread.currentThread().isInterrupted();
            } catch (RuntimeException unknown) {
                return false;
            }
        }

        void check() throws IOException {
            if (!allowed()) {
                cancelled = true;
                throw new IOException("Foreground Wi-Fi is no longer eligible");
            }
        }

        @Override public boolean cancelled() { return cancelled; }

        @Override public HttpURLConnection openConnection(URL url) throws IOException {
            check();
            return (HttpURLConnection) network.openConnection(url);
        }
    }

    static boolean automaticTransfer() {
        return Requester.scopedConnection() instanceof Run;
    }

    static <T> T publishMedia(Callable<T> write) throws Exception {
        if (!(Requester.scopedConnection() instanceof Run run)) return write.call();
        synchronized (MUTATION) {
            run.check();
            return write.call();
        }
    }

    private static void sweep(Run run) {
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
        return source.kind() == OfflineSourceStore.Kind.PLAYLIST && !OfflineReplay.SONGS.equals(source.id())
                && OfflineBrowsePagesLogic.isFileSafe(source.id()) && !PlaylistDownloads.isRunning(source.id())
                && DownloadedMarkers.completedStreamSource(source);
    }

    private static void sync(Run run, OfflineSourceStore.Source source) throws Exception {
        String id = source.id();
        if (OfflineCopyStore.source(id) != source || !canRefresh(source)) return;

        PlaylistSyncPage.Snapshot fresh = PlaylistSyncPage.fetch(id,
                token -> MusicBrowseRequest.browseNative(Utils.getContext(), "VL" + id, token));
        run.check();
        if (source.browsePage() != null && source.videoIds().equals(fresh.tracks())) return;

        Set<String> additions = PlaylistSyncPlan.additions(source.videoIds(), fresh.tracks());
        DownloadQuality quality = Settings.DOWNLOAD_QUALITY.get();
        Set<String> own = RawAudioStore.copyIds();
        Map<String, String> aliases = RawAudioStore.aliases();
        Map<String, String> ready = new HashMap<>();
        for (String videoId : additions) {
            run.check();
            ready.put(videoId, ensureAudio(videoId, OfflineCopyStore.copyId(videoId, own, aliases), quality));
        }
        if (!additions.isEmpty()) {
            run.check();
            VideoCopyDownloader.ensureForSync(id, source.title(), PlaylistPage.available(fresh.tracks()), additions,
                    ready::get, quality);
        }
        if (!hasPlayableTrack(fresh.tracks(), ready, own, aliases)) {
            throw new IOException("The refreshed playlist would have no playable copy");
        }

        run.check();
        File staged = OfflineCopyStore.stagePlaylistPage(fresh.browseBytes());
        boolean committed = false;
        try {
            synchronized (MUTATION) {
                if (canRefresh(source) && ready.values().stream().allMatch(OfflineCopyStore::has)) {
                    committed = OfflineCopyStore.commitPlaylist(source, fresh.tracks(), staged, run::allowed);
                    if (committed) DownloadedMarkers.onPlaylistSynced(id, fresh.tracks());
                }
            }
        } finally {
            if (!committed) staged.delete();
        }
        if (committed) Logger.printInfo(() -> "PlaylistSync: committed " + id + " tracks=" + fresh.tracks().size()
                + " additions=" + additions.size());
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

    private static boolean eligible(@Nullable NetworkCapabilities caps) {
        return caps != null && PlaylistSyncPlan.wifiEligible(caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI),
                caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET),
                caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED),
                caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED));
    }

    private static final class WifiChanges extends ConnectivityManager.NetworkCallback {
        @Override public void onCapabilitiesChanged(Network network, NetworkCapabilities caps) {
            wifiChanged(eligible(caps) ? network : null);
        }

        @Override public void onLost(Network network) {
            synchronized (PlaylistSync.class) {
                if (network.equals(wifi)) wifiChanged(null);
            }
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
        @Override public void onActivityResumed(Activity activity) {}
        @Override public void onActivityPaused(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) { hidden(activity); }
    }
}
