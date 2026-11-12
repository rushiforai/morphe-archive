/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import android.content.SharedPreferences;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.Nullable;

import com.google.protobuf.MessageLite;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Green "downloaded" checks for the stream copies of Play downloads locally: a small check at the end of every song
 * row of a list (next to its menu) that has a stream copy, and one on the Download button of a playlist or album
 * page whose every track has one. A song that was only saved as a local file has no stream copy and no check. The
 * checks are our own views, driven by an in-memory {@link DownloadedRegistry} of the stream copies: nothing is read
 * from disk or MediaStore while a row or header binds.
 */
@SuppressWarnings("unused")
public final class DownloadedMarkers {
    private static final String TRACKS_PREFERENCES = "rvx_native_playlist_tracks";
    /** The lists whose download started and did not end, by list id. */
    private static final String PENDING_PREFERENCES = "rvx_playlist_downloads_pending";
    private static final long REVALIDATE_INTERVAL_MILLIS = 5_000;

    private static final DownloadedRegistry registry = new DownloadedRegistry();
    private static final long LOAD_RETRY_MILLIS = 30_000;
    private static final AtomicBoolean loadStarted = new AtomicBoolean();
    /** When the last load failed, so the next try waits; 0 when none failed. */
    private static volatile long loadFailedAt;
    private static final CoalescedRunner refresh = new CoalescedRunner(Utils::runOnMainThread,
            DownloadedMarkers::refreshViews);
    private static final AtomicBoolean revalidating = new AtomicBoolean();
    private static volatile boolean loaded;
    private static volatile long lastRevalidation;
    private static final DownloadedRowLog rowLog = new DownloadedRowLog();

    // Main thread only. Values hold weak references: a value must never keep its key's view tree alive.
    private static final Map<View, RowState> rows = new WeakHashMap<>();
    private static final Map<ViewGroup, DownloadedHeaders.State> headers = new WeakHashMap<>();

    /** What is known of a list row's view; the model is only weakly held, the row's view tree owns the check. */
    static final class RowState {
        static final RowState NOT_A_ROW = new RowState("none");

        /** The end slot of the row's layout, see {@link RowEndCheck#slotKind}. */
        final String kind;
        WeakReference<Object> model = new WeakReference<>(null);
        final RowEndCheck end = new RowEndCheck();
        String lastOutcome = "";

        RowState(String kind) {
            this.kind = kind;
        }
    }

    private DownloadedMarkers() {}

    static boolean enabled() {
        return StreamSwap.supported() && Settings.DOWNLOADED_CHECKMARKS.get();
    }

    /** Starts the background load of the stream copy ids, if it has not started. */
    static void warmUp() {
        ensureLoaded();
    }

    /** The in-memory stream copies once they are loaded, otherwise null. No I/O. */
    @Nullable
    static DownloadedRegistry loadedRegistry() {
        return loaded ? registry : null;
    }

    static boolean isSourceDownloaded(@Nullable String sourceId) {
        return loaded && HeaderDownloadState.isSaved(registry.isSourceDownloaded(sourceId),
                PlaylistDownloads.isRunning(sourceId));
    }

    /** Injection point: the final bind of every list row presenter, with its root view and its model. */
    public static void onRowBound(View view, Object model) {
        try {
            RowState state = rows.get(view);
            // Switched off: only a row that shows a check has anything to do (hide it).
            if (!enabled() && (state == null || !state.end.isShown())) return;

            if (state == null) {
                String kind = RowEndCheck.slotKind(view);
                state = kind == null ? RowState.NOT_A_ROW : new RowState(kind);
                rows.put(view, state);
                if (kind == null) rowLog.notASongRow(view.getClass().getSimpleName());
            }
            if (state == RowState.NOT_A_ROW) return;

            state.model = new WeakReference<>(model);
            if (enabled()) ensureLoaded();
            applyRow(view, state);
        } catch (Exception ex) {
            Logger.printException(() -> "Could not mark a downloaded song", ex);
        }
    }

    /** Injection point: the header of a playlist or album page, after its elements were added to the container. */
    public static void onHeaderBound(ViewGroup container, Object model) {
        try {
            DownloadedHeaders.State state = headers.get(container);
            if (state == null) {
                state = new DownloadedHeaders.State();
                headers.put(container, state);
            }
            boolean enabled = enabled();
            state.sourceIds = enabled && model instanceof MessageLite lite
                    ? HeaderPlaylistId.findAll(lite.toByteArray()) : Collections.emptyList();
            state.host = new WeakReference<>(null);
            if (enabled) {
                ensureLoaded();
                revalidateLater();
                for (String sourceId : state.sourceIds) OfflineCopyStore.captureHeaderLater(sourceId);
            }
            DownloadedAlbumRows.onBound(container, state.albumRows);
            DownloadedHeaders.apply(container, state);
        } catch (Exception ex) {
            Logger.printException(() -> "Could not mark a downloaded playlist", ex);
        }
    }

    private static void applyRow(View view, RowState state) {
        Object model = state.model.get();
        byte[] bytes = null;
        String videoId = null;
        String reason;
        if (!enabled()) {
            reason = "setting-off";
        } else if (model == null) {
            reason = "model-gone";
        } else if (!registry.hasTracks()) {
            reason = "registry-empty";
        } else if ((bytes = DownloadedModels.serialize(model)) == null) {
            reason = "model-has-no-proto";
        } else {
            videoId = registry.findDownloaded(bytes);
            if (videoId == null) videoId = registry.findDownloadedLoose(bytes);
            reason = videoId == null ? "id-not-downloaded" : "downloaded";
        }

        String outcome;
        if (videoId == null) {
            state.end.hide();
            outcome = "hidden";
        } else {
            outcome = state.end.show(view);
        }
        rowLog.decided(state, reason, videoId, outcome);
    }

    /** Called when a stream copy was kept: the track has one from now on. */
    static void onStreamCopyKept(String videoId) {
        registry.add(videoId);
        refreshLater();
    }

    /** Called when a music video id was recorded as the same song as a song with a stream copy. */
    static void onAlias(String alias, String songId) {
        registry.addAlias(alias, songId);
        refreshLater();
    }

    /** Called when a track's stream copy was deleted. */
    static void onStreamCopyRemoved(String videoId) {
        registry.remove(videoId);
        refreshLater();
    }

    /** Called when every stream copy was deleted: no row or header keeps its check. */
    static void onStreamCopiesCleared() {
        registry.clear();
        refreshLater();
    }

    /**
     * Called when the download of a whole playlist or album with stream copies starts: the list is remembered at once,
     * with its tracks, as not finished. The songs it holds are then not loose whatever happens to the download, and
     * it is not saved (no check, no Remove) until {@link #onPlaylistCompleted}; a download that is cut off leaves it
     * pending across restarts, and the header Download resumes it. The offline store also keeps the header
     * ({@code title}, subtitle, cover url) the download resolved, for the offline lists.
     */
    static void onPlaylistStarted(String sourceId, List<String> videoIds, SourceHeader header) {
        registry.start(sourceId, videoIds);
        if (!pendingPreferences().edit().putBoolean(sourceId, true).commit()) {
            Logger.printException(() -> "Could not remember that a playlist download started");
        }
        rememberSource(sourceId, videoIds, header);
        refreshLater();
    }

    /** Called when the whole download of a list, its videos included, ended: the list is saved from now on. */
    static void onPlaylistCompleted(String sourceId) {
        registry.finish(sourceId);
        if (!pendingPreferences().edit().remove(sourceId).commit()) {
            Logger.printException(() -> "Could not remember that a playlist download ended");
        }
        refreshLater();
    }

    /** Called when the download of a list ended: its header may now show the check. */
    static void onPlaylistFinished() {
        refreshLater();
    }

    /** Called when a downloaded playlist or album was removed: its track list and its header check go. */
    static void onSourceRemoved(String sourceId) {
        registry.removeSource(sourceId);
        if (!trackPreferences().edit().remove(sourceId).commit()
                || !pendingPreferences().edit().remove(sourceId).commit()) {
            Logger.printException(() -> "Could not forget the tracks of a removed playlist");
        }
        refreshLater();
    }

    private static SharedPreferences pendingPreferences() {
        return Utils.getContext().getSharedPreferences(PENDING_PREFERENCES, 0);
    }

    private static SharedPreferences trackPreferences() {
        return Utils.getContext().getSharedPreferences(TRACKS_PREFERENCES, 0);
    }

    /**
     * The track lists of every playlist and album remembered as downloaded, in track order, including those saved
     * before the offline store existed. Reads the preferences: a worker thread only.
     */
    static Map<String, List<String>> savedTrackLists() {
        Map<String, List<String>> saved = new HashMap<>();
        for (Map.Entry<String, ?> entry : trackPreferences().getAll().entrySet()) {
            if (entry.getValue() instanceof String encoded) {
                saved.put(entry.getKey(), DownloadedRegistry.decode(encoded));
            }
        }
        return saved;
    }

    private static void rememberSource(String sourceId, List<String> videoIds, @Nullable SourceHeader header) {
        registry.putSource(sourceId, videoIds);
        if (!trackPreferences().edit().putString(sourceId, DownloadedRegistry.encode(videoIds)).commit()) {
            Logger.printException(() -> "Could not remember the tracks of a downloaded playlist");
        }
        OfflineCopyStore.rememberSource(sourceId, header, videoIds);
    }

    /** Fills the registry once, in the background. Until then no check is shown. */
    private static void ensureLoaded() {
        long failedAt = loadFailedAt;
        if (failedAt != 0 && SystemClock.elapsedRealtime() - failedAt < LOAD_RETRY_MILLIS) return;
        if (!loadStarted.compareAndSet(false, true)) return;

        Utils.submitOnBackgroundThread(() -> {
            try {
                registry.addAll(RawAudioStore.copyIds());
                registry.setAliases(RawAudioStore.aliases());
                for (Map.Entry<String, ?> entry : trackPreferences().getAll().entrySet()) {
                    if (entry.getValue() instanceof String encoded) {
                        registry.putSource(entry.getKey(), DownloadedRegistry.decode(encoded));
                    }
                }
                registry.setPending(pendingPreferences().getAll().keySet());
                loaded = true;
                refreshLater();

                recoverEarlierPlaylists();
                rescanStreamCopies();
            } catch (Exception ex) {
                Logger.printException(() -> "Could not load the downloaded songs", ex);
            } finally {
                // A load that did not finish is tried again, after a while, instead of never.
                if (!loaded) {
                    loadFailedAt = SystemClock.elapsedRealtime();
                    loadStarted.set(false);
                }
            }
            return null;
        });
    }

    /**
     * Playlists downloaded before the track lists were remembered: read their tracks back from the native
     * playlist database. A playlist with a track the app did not download keeps no check, and neither does one
     * whose tracks have no stream copy: a remembered playlist is checked through the stream copies of its tracks.
     */
    private static void recoverEarlierPlaylists() {
        Map<Long, List<Long>> nativeTracks = null;
        Map<Long, String> videoIdByMediaId = null;
        for (Map.Entry<String, Long> saved : NativePlaylistStore.savedPlaylists().entrySet()) {
            if (registry.hasSource(saved.getKey())) continue;

            if (nativeTracks == null) {
                nativeTracks = NativePlaylistStore.readPlaylistTracks();
                videoIdByMediaId = NativeAudioStore.videoIdsByMediaId();
            }
            List<Long> mediaIds = nativeTracks.get(saved.getValue());
            List<String> videoIds = mediaIds == null ? null
                    : DownloadedRegistry.resolveTracks(mediaIds, videoIdByMediaId);
            if (videoIds != null) rememberSource(saved.getKey(), videoIds, null);
        }
        refreshLater();
    }

    /** Checks in the background that the stream copies still exist; at most once in a while. */
    private static void revalidateLater() {
        long now = System.currentTimeMillis();
        if (!loaded || now - lastRevalidation < REVALIDATE_INTERVAL_MILLIS
                || !revalidating.compareAndSet(false, true)) return;

        lastRevalidation = now;
        Utils.submitOnBackgroundThread(() -> {
            try {
                rescanStreamCopies();
            } finally {
                revalidating.set(false);
            }
            return null;
        });
    }

    /**
     * Forgets the stream copies that vanished from the store (copies tied to a deleted local file, a cleanup).
     * The known set is taken before the scan, so a copy kept while the scan runs is never forgotten.
     */
    static void rescanStreamCopies() {
        Set<String> knownBefore = registry.snapshot();
        Set<String> present = RawAudioStore.copyIds();

        registry.prune(knownBefore, present);
        registry.setAliases(RawAudioStore.aliases());
        refreshLater();
    }

    /** Re-evaluates every known row and header on the main thread; requests made while queued are merged. */
    private static void refreshLater() {
        refresh.request();
        DownloadsPage.onCopiesChanged();
    }

    private static void refreshViews() {
        for (Map.Entry<View, RowState> row : new ArrayList<>(rows.entrySet())) {
            View view = row.getKey();
            if (view == null || row.getValue() == RowState.NOT_A_ROW) continue;

            try {
                applyRow(view, row.getValue());
            } catch (Exception ex) {
                Logger.printException(() -> "Could not refresh a downloaded song", ex);
            }
        }
        for (Map.Entry<ViewGroup, DownloadedHeaders.State> header : new ArrayList<>(headers.entrySet())) {
            ViewGroup container = header.getKey();
            if (container != null) DownloadedHeaders.apply(container, header.getValue());
        }
    }
}
