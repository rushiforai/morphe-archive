package dev.materialtidal.extension.tidal.player.lyrics;

/**
 * High-precision monotonic playback clock synchronized with TIDAL's native millisecond
 * progress ticks ({@code ProgressTracker}) and smoothed across 60/120Hz display frames.
 */
public final class SyllablePlaybackClock {

    public static final long VISUAL_LOOKAHEAD_MS = 40L;
    public static final long SNAP_THRESHOLD_MS = 200L;
    public static final float DRIFT_BLEND = 0.25f;

    private long anchorPosMs = 0L;
    private long anchorElapsedMs = 0L;
    private long durationMs = 0L;
    private boolean hasNativeClock = false;
    private boolean wasPlaying = false;

    public synchronized void resetForNewTrack() {
        anchorPosMs = 0L;
        anchorElapsedMs = 0L;
        durationMs = 0L;
        hasNativeClock = false;
        wasPlaying = false;
    }

    public synchronized void copyFrom(SyllablePlaybackClock other) {
        if (other == null) return;
        synchronized (other) {
            this.anchorPosMs = other.anchorPosMs;
            this.anchorElapsedMs = other.anchorElapsedMs;
            this.durationMs = other.durationMs;
            this.hasNativeClock = other.hasNativeClock;
            this.wasPlaying = other.wasPlaying;
        }
    }

    public synchronized void onNativeProgressTick(
            long positionMs,
            long durationMs,
            long nowElapsedMs,
            boolean forceSnap
    ) {
        if (durationMs > 0L) {
            this.durationMs = durationMs;
        }
        long clampedPos = Math.max(0L, positionMs);
        if (this.durationMs > 0L) {
            clampedPos = Math.min(this.durationMs, clampedPos);
        }

        if (!hasNativeClock || forceSnap || anchorElapsedMs == 0L) {
            anchorPosMs = clampedPos;
            anchorElapsedMs = nowElapsedMs;
            hasNativeClock = true;
            return;
        }

        long estimated = computeRawPosLocked(nowElapsedMs, wasPlaying);
        long drift = clampedPos - estimated;
        if (Math.abs(drift) > SNAP_THRESHOLD_MS) {
            anchorPosMs = clampedPos;
        } else {
            anchorPosMs = estimated + Math.round(drift * DRIFT_BLEND);
        }
        anchorElapsedMs = nowElapsedMs;
    }

    public synchronized void onFallbackProgress(float progressFrac, long durationMs, long nowElapsedMs) {
        if (durationMs > 0L && this.durationMs <= 0L) {
            this.durationMs = durationMs;
        }
        if (hasNativeClock || this.durationMs <= 0L) {
            return;
        }
        float clampedFrac = Math.max(0f, Math.min(1f, progressFrac));
        long targetPos = Math.round(clampedFrac * this.durationMs);
        if (anchorElapsedMs == 0L) {
            anchorPosMs = targetPos;
            anchorElapsedMs = nowElapsedMs;
            return;
        }
        long estimated = computeRawPosLocked(nowElapsedMs, wasPlaying);
        if (Math.abs(targetPos - estimated) > 900L) {
            anchorPosMs = targetPos;
            anchorElapsedMs = nowElapsedMs;
        }
    }

    public synchronized void onPlayStateChanged(boolean playing, long nowElapsedMs) {
        if (playing == wasPlaying) {
            if (anchorElapsedMs == 0L) {
                anchorElapsedMs = nowElapsedMs;
            }
            return;
        }
        if (anchorElapsedMs > 0L) {
            anchorPosMs = computeRawPosLocked(nowElapsedMs, wasPlaying);
        }
        anchorElapsedMs = nowElapsedMs;
        wasPlaying = playing;
    }

    public synchronized void onUserSeek(long targetPosMs, long nowElapsedMs) {
        long clamped = Math.max(0L, targetPosMs);
        if (durationMs > 0L) {
            clamped = Math.min(durationMs, clamped);
        }
        anchorPosMs = clamped;
        anchorElapsedMs = nowElapsedMs;
    }

    public synchronized long getInterpolatedPositionMs(
            long nowElapsedMs,
            boolean playing,
            boolean isScrubbing,
            float scrubProgress
    ) {
        if (isScrubbing && durationMs > 0L) {
            float clampedFrac = Math.max(0f, Math.min(1f, scrubProgress));
            return Math.round(clampedFrac * durationMs);
        }
        if (playing != wasPlaying) {
            onPlayStateChanged(playing, nowElapsedMs);
        }
        long pos = computeRawPosLocked(nowElapsedMs, playing);
        if (playing) {
            pos += VISUAL_LOOKAHEAD_MS;
            if (durationMs > 0L) {
                pos = Math.min(durationMs, pos);
            }
        }
        return pos;
    }

    public synchronized long getDurationMs() {
        return durationMs;
    }

    public synchronized boolean hasNativeClock() {
        return hasNativeClock;
    }

    private long computeRawPosLocked(long nowElapsedMs, boolean playing) {
        if (anchorElapsedMs <= 0L) {
            return anchorPosMs;
        }
        long pos = playing
                ? anchorPosMs + Math.max(0L, nowElapsedMs - anchorElapsedMs)
                : anchorPosMs;
        if (pos < 0L) pos = 0L;
        if (durationMs > 0L && pos > durationMs) pos = durationMs;
        return pos;
    }
}
