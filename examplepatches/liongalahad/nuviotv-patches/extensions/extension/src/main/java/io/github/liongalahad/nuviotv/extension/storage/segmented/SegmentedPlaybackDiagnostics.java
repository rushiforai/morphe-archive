package io.github.liongalahad.nuviotv.extension.storage.segmented;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;

import androidx.media3.common.MediaItem;
import androidx.media3.common.PlaybackException;
import androidx.media3.common.Player;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

/** Structured diagnostics for storage latency and actual Media3 stalls on segmented media. */
public final class SegmentedPlaybackDiagnostics {
    public static final String TAG = "MorpheSegmentedTrace";
    static final long STUTTER_MS = 250L;
    static final long SLOW_READ_US = 50_000L;
    static final long SUMMARY_DELAY_MS = 750L;

    private static final Map<String, Metrics> METRICS = new ConcurrentHashMap<>();
    private static final Map<Player, Observer> OBSERVERS = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private SegmentedPlaybackDiagnostics() {}

    static void descriptorOpened(SegmentedMedia.Manifest manifest) {
        if (manifest == null) return;
        metrics(manifest.bundleId);
        Log.i(TAG, "event=descriptor_open bundle=" + manifest.bundleId +
                " segments=" + manifest.segments.size() + " totalBytes=" + manifest.totalLength +
                " handles=preopened");
    }

    static void readCompleted(String bundleId, long offset, int bytes, int firstSegment,
                              int lastSegment, boolean sequentialBoundary, long elapsedUs,
                              long gapSincePreviousReadUs) {
        if (bundleId == null || bundleId.isEmpty()) return;
        Metrics value = metrics(bundleId);
        updateMax(value.maxReadUs, elapsedUs);
        boolean crossed = lastSegment > firstSegment || sequentialBoundary;
        if (elapsedUs >= SLOW_READ_US) value.slowReads.incrementAndGet();
        if (crossed) {
            value.boundaryReads.incrementAndGet();
            value.lastBoundaryMs.set(SystemClock.elapsedRealtime());
            updateMax(value.maxBoundaryReadUs, elapsedUs);
            Log.i(TAG, "event=boundary_read bundle=" + bundleId + " offset=" + offset +
                    " bytes=" + bytes + " firstSegment=" + firstSegment +
                    " lastSegment=" + lastSegment + " sequential=" + sequentialBoundary +
                    " elapsedUs=" + elapsedUs + " readGapUs=" + gapSincePreviousReadUs +
                    " result=" + (elapsedUs >= SLOW_READ_US ? "SLOW_STORAGE" : "OK"));
        } else if (elapsedUs >= SLOW_READ_US) {
            Log.w(TAG, "event=slow_read bundle=" + bundleId + " offset=" + offset +
                    " bytes=" + bytes + " segment=" + firstSegment +
                    " elapsedUs=" + elapsedUs + " result=SLOW_STORAGE");
        }
    }

    public static void observePlaybackState(Object listener, int state) {
        Player player = playerFromListener(listener);
        if (player == null) return;
        Uri uri = currentUri(player);
        String bundleId = SegmentedMedia.bundleId(uri);
        if (bundleId == null) return;
        Observer observer;
        synchronized (OBSERVERS) {
            observer = OBSERVERS.get(player);
            if (observer == null || !bundleId.equals(observer.bundleId)) {
                observer = new Observer(player, bundleId);
                OBSERVERS.put(player, observer);
                player.addListener(observer);
                attachDroppedFrameListener(player, observer);
                Log.i(TAG, "event=playback_observer bundle=" + bundleId +
                        " uri=" + uri + " stutterThresholdMs=" + STUTTER_MS +
                        " slowReadThresholdUs=" + SLOW_READ_US);
            }
        }
        observer.observeState(state);
    }

    static boolean isStutter(long durationMs) { return durationMs >= STUTTER_MS; }
    static boolean isSlowRead(long durationUs) { return durationUs >= SLOW_READ_US; }

    private static final class Observer implements Player.Listener {
        final WeakReference<Player> player;
        final String bundleId;
        final Metrics metrics;
        volatile Object analyticsProxy;
        boolean everReady;
        long bufferingStartedMs = -1L;
        int lastObservedState = Integer.MIN_VALUE;
        long lastObservedStateMs;
        int summaryGeneration;

        Observer(Player player, String bundleId) {
            this.player = new WeakReference<>(player);
            this.bundleId = bundleId;
            this.metrics = metrics(bundleId);
        }

        @Override public void onPlaybackStateChanged(int state) { observeState(state); }

        synchronized void observeState(int state) {
            long now = SystemClock.elapsedRealtime();
            if (state == lastObservedState && now - lastObservedStateMs < 50L) return;
            lastObservedState = state;
            lastObservedStateMs = now;
            Player current = player.get();
            long position = safePosition(current);
            long buffered = safeBufferedPosition(current);
            boolean playWhenReady = current != null && current.getPlayWhenReady();
            Log.i(TAG, "event=player_state bundle=" + bundleId + " state=" + stateName(state) +
                    " positionMs=" + position + " bufferedMs=" + buffered +
                    " playWhenReady=" + playWhenReady);
            if (state == Player.STATE_READY) {
                summaryGeneration++;
                everReady = true;
                finishBuffering(now, position);
            } else if (state == Player.STATE_BUFFERING && everReady && playWhenReady &&
                    bufferingStartedMs < 0L) {
                summaryGeneration++;
                bufferingStartedMs = now;
                long sinceBoundary = sinceBoundary(now);
                Log.w(TAG, "event=stall_start bundle=" + bundleId + " positionMs=" + position +
                        " sinceBoundaryMs=" + sinceBoundary +
                        " nearBoundary=" + (sinceBoundary >= 0L && sinceBoundary <= 3000L));
            } else if (state == Player.STATE_ENDED || state == Player.STATE_IDLE) {
                finishBuffering(now, position);
                scheduleSummary(state == Player.STATE_ENDED ? "ENDED" : "IDLE");
            }
        }

        private void finishBuffering(long now, long position) {
            if (bufferingStartedMs < 0L) return;
            long duration = Math.max(0L, now - bufferingStartedMs);
            bufferingStartedMs = -1L;
            metrics.stalls.incrementAndGet();
            metrics.totalStallMs.addAndGet(duration);
            updateMax(metrics.maxStallMs, duration);
            if (isStutter(duration)) metrics.stutters.incrementAndGet();
            long sinceBoundary = sinceBoundary(now);
            Log.w(TAG, "event=stall_end bundle=" + bundleId + " positionMs=" + position +
                    " durationMs=" + duration + " sinceBoundaryMs=" + sinceBoundary +
                    " nearBoundary=" + (sinceBoundary >= 0L && sinceBoundary <= 3000L) +
                    " result=" + (isStutter(duration) ? "STUTTER" : "SHORT_BUFFER"));
        }

        @Override public void onIsPlayingChanged(boolean isPlaying) {
            Log.i(TAG, "event=is_playing bundle=" + bundleId + " value=" + isPlaying +
                    " positionMs=" + safePosition(player.get()));
        }

        @Override public void onPlayerError(PlaybackException error) {
            metrics.errors.incrementAndGet();
            Log.e(TAG, "event=player_error bundle=" + bundleId + " code=" +
                    (error == null ? -1 : error.errorCode) + " result=ERROR", error);
            scheduleSummary("ERROR");
        }

        @Override public void onPositionDiscontinuity(Player.PositionInfo oldPosition,
                                                       Player.PositionInfo newPosition, int reason) {
            Log.i(TAG, "event=position_discontinuity bundle=" + bundleId + " reason=" + reason +
                    " oldPositionMs=" + oldPosition.positionMs +
                    " newPositionMs=" + newPosition.positionMs);
        }

        void droppedFrames(int count, long elapsedMs) {
            metrics.droppedFrames.addAndGet(Math.max(0, count));
            Log.w(TAG, "event=dropped_frames bundle=" + bundleId + " count=" + count +
                    " elapsedMs=" + elapsedMs + " result=" + (count > 0 ? "DROPPED" : "OK"));
        }

        private long sinceBoundary(long now) {
            long boundary = metrics.lastBoundaryMs.get();
            return boundary <= 0L ? -1L : Math.max(0L, now - boundary);
        }

        private synchronized void scheduleSummary(String reason) {
            int generation = ++summaryGeneration;
            MAIN.postDelayed(() -> {
                synchronized (Observer.this) {
                    if (generation != summaryGeneration) return;
                    logSummary(reason);
                }
            }, SUMMARY_DELAY_MS);
        }

        void logSummary(String reason) {
            boolean failed = metrics.stutters.get() > 0L || metrics.droppedFrames.get() > 0L ||
                    metrics.errors.get() > 0L;
            Log.i(TAG, "event=summary bundle=" + bundleId + " reason=" + reason +
                    " stalls=" + metrics.stalls.get() + " stutters=" + metrics.stutters.get() +
                    " maxStallMs=" + metrics.maxStallMs.get() +
                    " totalStallMs=" + metrics.totalStallMs.get() +
                    " droppedFrames=" + metrics.droppedFrames.get() +
                    " boundaryReads=" + metrics.boundaryReads.get() +
                    " maxBoundaryReadUs=" + metrics.maxBoundaryReadUs.get() +
                    " slowReads=" + metrics.slowReads.get() +
                    " maxReadUs=" + metrics.maxReadUs.get() +
                    " errors=" + metrics.errors.get() +
                    " result=" + (failed ? "STUTTER_OR_ERROR" : "NO_PLAYER_STUTTER_DETECTED"));
        }
    }

    private static void attachDroppedFrameListener(Player player, Observer observer) {
        try {
            Class<?> analytics = Class.forName(
                    "androidx.media3.exoplayer.analytics.AnalyticsListener", false,
                    player.getClass().getClassLoader());
            Object proxy = Proxy.newProxyInstance(analytics.getClassLoader(),
                    new Class<?>[]{analytics}, (instance, method, arguments) -> {
                        String name = method.getName();
                        if ("onDroppedVideoFrames".equals(name) && arguments != null &&
                                arguments.length >= 3 && arguments[1] instanceof Integer &&
                                arguments[2] instanceof Long) {
                            observer.droppedFrames((Integer) arguments[1], (Long) arguments[2]);
                        }
                        if ("toString".equals(name)) return "MorpheSegmentedAnalytics";
                        if ("hashCode".equals(name)) return System.identityHashCode(instance);
                        if ("equals".equals(name)) return arguments != null && arguments.length == 1 &&
                                instance == arguments[0];
                        return null;
                    });
            Method add = player.getClass().getMethod("addAnalyticsListener", analytics);
            add.setAccessible(true);
            add.invoke(player, proxy);
            observer.analyticsProxy = proxy;
            Log.i(TAG, "event=dropped_frame_observer bundle=" + observer.bundleId + " result=ATTACHED");
        } catch (Throwable error) {
            Log.i(TAG, "event=dropped_frame_observer bundle=" + observer.bundleId +
                    " result=UNAVAILABLE type=" + error.getClass().getSimpleName());
        }
    }

    private static Player playerFromListener(Object listener) {
        if (listener == null) return null;
        for (Class<?> owner = listener.getClass(); owner != null; owner = owner.getSuperclass()) {
            for (Field field : owner.getDeclaredFields()) {
                try {
                    field.setAccessible(true);
                    Object value = field.get(listener);
                    if (value instanceof Player) return (Player) value;
                } catch (Throwable ignored) { }
            }
        }
        return null;
    }

    private static Uri currentUri(Player player) {
        try {
            MediaItem item = player.getCurrentMediaItem();
            return item == null || item.localConfiguration == null
                    ? null : item.localConfiguration.uri;
        } catch (Throwable ignored) { return null; }
    }

    private static long safePosition(Player player) {
        try { return player == null ? -1L : player.getCurrentPosition(); }
        catch (Throwable ignored) { return -1L; }
    }

    private static long safeBufferedPosition(Player player) {
        try { return player == null ? -1L : player.getBufferedPosition(); }
        catch (Throwable ignored) { return -1L; }
    }

    private static String stateName(int state) {
        if (state == Player.STATE_IDLE) return "IDLE";
        if (state == Player.STATE_BUFFERING) return "BUFFERING";
        if (state == Player.STATE_READY) return "READY";
        if (state == Player.STATE_ENDED) return "ENDED";
        return "UNKNOWN_" + state;
    }

    private static Metrics metrics(String bundleId) {
        return METRICS.computeIfAbsent(bundleId, ignored -> new Metrics());
    }

    private static void updateMax(AtomicLong target, long value) {
        long current;
        do { current = target.get(); }
        while (value > current && !target.compareAndSet(current, value));
    }

    private static final class Metrics {
        final AtomicLong boundaryReads = new AtomicLong();
        final AtomicLong slowReads = new AtomicLong();
        final AtomicLong maxReadUs = new AtomicLong();
        final AtomicLong maxBoundaryReadUs = new AtomicLong();
        final AtomicLong lastBoundaryMs = new AtomicLong();
        final AtomicLong stalls = new AtomicLong();
        final AtomicLong stutters = new AtomicLong();
        final AtomicLong totalStallMs = new AtomicLong();
        final AtomicLong maxStallMs = new AtomicLong();
        final AtomicLong droppedFrames = new AtomicLong();
        final AtomicLong errors = new AtomicLong();
    }
}
