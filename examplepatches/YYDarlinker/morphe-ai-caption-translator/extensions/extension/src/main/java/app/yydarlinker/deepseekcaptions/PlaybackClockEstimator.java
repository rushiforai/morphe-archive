package app.yydarlinker.deepseekcaptions;

/** Small monotonic playback-clock estimator with explicit callback freshness handling. */
final class PlaybackClockEstimator {
    static final long MAX_FRESH_CALLBACK_GAP_MS = 3_500L;
    static final long MAX_PRECISE_CALLBACK_GAP_MS = 2_400L;
    static final long MAX_CLOCK_EXTRAPOLATION_MS = 4_500L;
    private static final long MIN_RATE_SAMPLE_MS = 120L;
    static final long BACKWARD_SEEK_TOLERANCE_MS = 250L;
    private static final float MIN_RATE = 0.25f;
    private static final float MAX_RATE = 3.0f;
    private static final float MAX_PLAUSIBLE_RATE = 3.25f;
    private static final long RATE_TRANSITION_TOLERANCE_MS = 500L;
    private static final float RATE_OLD_WEIGHT = 0.65f;
    private static final float RATE_NEW_WEIGHT = 0.35f;

    static final class Update {
        final boolean seek;
        final boolean callbackWasStale;
        final float playbackRate;

        Update(boolean seek, boolean callbackWasStale, float playbackRate) {
            this.seek = seek;
            this.callbackWasStale = callbackWasStale;
            this.playbackRate = playbackRate;
        }
    }

    private long lastEstimate;
    private long confirmedPosition;

    /** Display never advances from wall time: pause without a callback is indistinguishable from silence. */
    synchronized long confirmedPosition() { return confirmedPosition; }
    private long videoTimeMs;
    private long realtimeMs;
    private float playbackRate = 1f;
    private boolean stableRateSample;

    synchronized void reset(long videoTimeMs, long realtimeMs, float initialRate) {
        this.videoTimeMs = Math.max(0L, videoTimeMs);
        this.realtimeMs = Math.max(0L, realtimeMs);
        this.playbackRate = clampRate(initialRate <= 0f ? 1f : initialRate);
        this.stableRateSample = false;
        this.lastEstimate = this.videoTimeMs;
        this.confirmedPosition = this.videoTimeMs;
    }

    synchronized Update update(long newVideoTimeMs, long newRealtimeMs, long seekThresholdMs) {
        long cleanVideo = Math.max(0L, newVideoTimeMs);
        confirmedPosition = cleanVideo;
        long cleanRealtime = Math.max(0L, newRealtimeMs);
        if (realtimeMs <= 0L || cleanRealtime <= realtimeMs) {
            boolean backward=realtimeMs>0 && cleanVideo<videoTimeMs-BACKWARD_SEEK_TOLERANCE_MS;
            if(backward){lastEstimate=cleanVideo;playbackRate=1f;}
            videoTimeMs = cleanVideo;
            realtimeMs = cleanRealtime;
            stableRateSample = false;
            return new Update(backward, true, playbackRate);
        }

        long realDelta = cleanRealtime - realtimeMs;
        long videoDelta = cleanVideo - videoTimeMs;
        if(realDelta<MIN_RATE_SAMPLE_MS && videoDelta>=-BACKWARD_SEEK_TOLERANCE_MS && Math.abs(videoDelta)<seekThresholdMs)
            return new Update(false,false,playbackRate);
        boolean stale = realDelta > MAX_FRESH_CALLBACK_GAP_MS;
        boolean uncertain = !stale && realDelta > MAX_PRECISE_CALLBACK_GAP_MS;
        boolean obviousBackwardSeek = videoDelta < -BACKWARD_SEEK_TOLERANCE_MS;
        boolean paused = !obviousBackwardSeek && Math.abs(videoDelta) <= 40L;
        boolean seek;
        if (obviousBackwardSeek) {
            seek = true;
        } else if (paused) {
            seek = false;
        } else if (stale || uncertain) {
            long tolerance = stale ? seekThresholdMs : RATE_TRANSITION_TOLERANCE_MS;
            long maximumForward = Math.round(realDelta * MAX_PLAUSIBLE_RATE) + tolerance;
            seek = videoDelta > maximumForward;
        } else {
            long expected = videoTimeMs + Math.round(realDelta * Math.max(0f, playbackRate));
            seek = Math.abs(cleanVideo - expected) > seekThresholdMs;
        }

        if (seek) {
            playbackRate = 1f;
            stableRateSample = false;
        } else if (paused) {
            playbackRate = 0f;
            stableRateSample = false;
        } else if (stale) {
            if (videoDelta <= 40L) playbackRate = 0f;
            else playbackRate = Math.max(1f, clampRate(playbackRate));
            stableRateSample = false;
        } else if (uncertain) {
            if (videoDelta <= 40L) {
                playbackRate = 0f;
                stableRateSample = false;
            } else {
                playbackRate = clampRate(videoDelta / (float) realDelta);
                stableRateSample = true;
            }
        } else if (realDelta >= MIN_RATE_SAMPLE_MS && videoDelta >= 0L &&
                videoDelta <= Math.round(realDelta * MAX_PLAUSIBLE_RATE) + 500L) {
            if (videoDelta <= 40L) {
                playbackRate = 0f;
                stableRateSample = false;
            } else {
                float sample = clampRate(videoDelta / (float) realDelta);
                playbackRate = stableRateSample && playbackRate > 0f
                        ? clampRate(playbackRate * RATE_OLD_WEIGHT + sample * RATE_NEW_WEIGHT)
                        : sample;
                stableRateSample = true;
            }
        }

        if(seek || paused) lastEstimate=cleanVideo;
        videoTimeMs = cleanVideo;
        realtimeMs = cleanRealtime;
        return new Update(seek, stale, playbackRate);
    }

    synchronized long estimate(long nowRealtimeMs) {
        if (realtimeMs <= 0L || playbackRate <= 0f) return videoTimeMs;
        long elapsed = Math.max(0L, nowRealtimeMs - realtimeMs);
        long estimate=videoTimeMs + Math.round(Math.min(elapsed, MAX_CLOCK_EXTRAPOLATION_MS) * playbackRate);
        lastEstimate=Math.max(lastEstimate,estimate);
        return lastEstimate;
    }

    synchronized float playbackRate() {
        return playbackRate;
    }

    synchronized boolean isFresh(long nowRealtimeMs) {
        return realtimeMs > 0L && nowRealtimeMs - realtimeMs <= MAX_FRESH_CALLBACK_GAP_MS;
    }

    private static float clampRate(float value) {
        return Math.max(MIN_RATE, Math.min(MAX_RATE, value));
    }
}
