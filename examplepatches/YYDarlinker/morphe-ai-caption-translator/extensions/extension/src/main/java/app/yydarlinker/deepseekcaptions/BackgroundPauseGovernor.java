package app.yydarlinker.deepseekcaptions;

import android.content.Context;
import android.os.SystemClock;

/**
 * Shared playback-demand governor for semantic requests.
 *
 * <p>Background requests wait before their timeout budget and HTTP attempt begin while playback is
 * confidently paused or player-time callbacks have gone quiet. The Priority scheduler reads the
 * same immutable snapshot so it can suppress future-gap rescues without cancelling an already
 * useful in-flight request or blocking one bounded repair at the current play head.</p>
 */
final class BackgroundPauseGovernor {
    private static final long MIN_SAMPLE_MS = 120L;
    private static final long MAX_SAMPLE_MS = 5_000L;
    private static final long STAGNANT_VIDEO_DELTA_MS = 40L;
    private static final long NO_CALLBACK_HOLD_MS = 4_500L;
    private static final long WAIT_POLL_MS = 250L;

    private static final Object LOCK = new Object();

    private static volatile Context appContext;
    private static long lastVideoTimeMs = -1L;
    private static long lastCallbackRealtimeMs;
    private static boolean confirmedPaused;
    private static boolean holdLogged;
    private static long playbackGeneration;
    private static String videoId = "";

    private BackgroundPauseGovernor() {}

    static void setContext(Context context) {
        if (context != null) appContext = context.getApplicationContext();
    }

    static void onVideoId(String rawVideoId) {
        String clean = rawVideoId == null ? "" : rawVideoId.trim();
        synchronized (LOCK) {
            if (clean.equals(videoId)) return;
            videoId = clean;
            lastVideoTimeMs = -1L;
            lastCallbackRealtimeMs = 0L;
            confirmedPaused = false;
            holdLogged = false;
            playbackGeneration++;
        }
    }

    static void onVideoTime(long rawTimeMs) {
        long clean = Math.max(0L, rawTimeMs);
        long now = SystemClock.elapsedRealtime();
        boolean resumed = false;
        synchronized (LOCK) {
            if (lastCallbackRealtimeMs > 0L && lastVideoTimeMs >= 0L) {
                long realDelta = now - lastCallbackRealtimeMs;
                long videoDelta = clean - lastVideoTimeMs;
                if (realDelta >= MIN_SAMPLE_MS && realDelta <= MAX_SAMPLE_MS) {
                    if (Math.abs(videoDelta) <= STAGNANT_VIDEO_DELTA_MS) {
                        if (!confirmedPaused) playbackGeneration++;
                        confirmedPaused = true;
                    } else {
                        boolean wasHeld = confirmedPaused || holdLogged;
                        confirmedPaused = false;
                        if (wasHeld) {
                            holdLogged = false;
                            playbackGeneration++;
                            resumed = true;
                        }
                    }
                }
            }
            lastVideoTimeMs = clean;
            lastCallbackRealtimeMs = now;
        }
        if (resumed) {
            Context context = appContext;
            if (context != null) {
                CaptionDiagnostics.mark(
                        context,
                        "PLAYBACK_DEMAND_RESUMED",
                        "检测到播放时间重新推进；恢复后台固定块补货和未来 Priority 缺口修复"
                );
            }
        }
    }

    static Snapshot snapshot() {
        synchronized (LOCK) {
            long now = SystemClock.elapsedRealtime();
            boolean callbackQuiet = lastCallbackRealtimeMs > 0L &&
                    now - lastCallbackRealtimeMs >= NO_CALLBACK_HOLD_MS;
            return new Snapshot(
                    confirmedPaused || callbackQuiet,
                    playbackGeneration,
                    lastVideoTimeMs,
                    lastCallbackRealtimeMs
            );
        }
    }

    static void awaitBackgroundPermit(DeepSeekApiClient.RequestControl control)
            throws InterruptedException {
        while (true) {
            if (Thread.currentThread().isInterrupted()) {
                throw new InterruptedException("后台字幕预取已取消");
            }
            if (control != null && control.isCancelled()) {
                throw new InterruptedException("后台字幕预取已重新调度");
            }

            boolean hold;
            boolean logHold = false;
            synchronized (LOCK) {
                long now = SystemClock.elapsedRealtime();
                boolean callbackQuiet = lastCallbackRealtimeMs > 0L &&
                        now - lastCallbackRealtimeMs >= NO_CALLBACK_HOLD_MS;
                hold = confirmedPaused || callbackQuiet;
                if (hold && !holdLogged) {
                    holdLogged = true;
                    logHold = true;
                }
            }

            if (!hold) return;
            if (logHold) {
                Context context = appContext;
                if (context != null) {
                    CaptionDiagnostics.mark(
                            context,
                            "PLAYBACK_DEMAND_HELD",
                            "播放已暂停或时间回调持续静止；当前在途请求允许自然结束，暂停新增后台 API 和未来 Priority 缺口修复"
                    );
                }
            }
            Thread.sleep(WAIT_POLL_MS);
        }
    }

    static final class Snapshot {
        final boolean held;
        final long generation;
        final long videoTimeMs;
        final long callbackRealtimeMs;

        Snapshot(
                boolean held,
                long generation,
                long videoTimeMs,
                long callbackRealtimeMs
        ) {
            this.held = held;
            this.generation = generation;
            this.videoTimeMs = videoTimeMs;
            this.callbackRealtimeMs = callbackRealtimeMs;
        }
    }
}
