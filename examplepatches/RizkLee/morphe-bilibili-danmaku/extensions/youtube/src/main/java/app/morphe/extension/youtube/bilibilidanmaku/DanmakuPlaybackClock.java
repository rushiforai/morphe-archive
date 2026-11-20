package app.morphe.extension.youtube.bilibilidanmaku;

/** Interpolates the player's sparse progress reports for the overlay's animation frames. */
final class DanmakuPlaybackClock {
    private static final long CORRECTION_WINDOW_MS = 1000;

    private long lastReportMs = -1;
    private double anchorMs;
    private long anchorRealtimeMs;
    private double displayOffsetMs;
    private double speed = 1;
    private boolean playing;

    void reset() {
        lastReportMs = -1;
        displayOffsetMs = 0;
    }

    boolean isPlaying() {
        return playing;
    }

    long position(long now) {
        return lastReportMs < 0 ? -1 : Math.round(displayTime(now));
    }

    void sample(long videoMs, long now) {
        if (videoMs < 0) {
            reset();
            return;
        }
        if (!playing && videoMs == lastReportMs) return;
        double displayed = displayTime(now);
        // A late report can trail the displayed frame even when the player advanced.
        // Compare raw reports for rewinds. Large forward jumps are already unambiguous.
        double reportIntervalMs = CORRECTION_WINDOW_MS * speed;
        boolean jump = lastReportMs < 0 || !playing || lastReportMs - videoMs > reportIntervalMs
                || videoMs - displayed > CORRECTION_WINDOW_MS;
        displayOffsetMs = jump ? 0 : displayed - videoMs;
        lastReportMs = videoMs;
        anchorMs = videoMs;
        anchorRealtimeMs = now;
    }

    void setPlaying(boolean next, long now) {
        if (playing == next) return;
        reanchor(now);
        playing = next;
    }

    void setSpeed(float value, long now) {
        double next = value > 0 && Float.isFinite(value) ? value : 1;
        if (next == speed) return;
        reanchor(now);
        speed = next;
    }

    private void reanchor(long now) {
        double displayed = displayTime(now);
        anchorMs += elapsed(now) * speed;
        displayOffsetMs = displayed - anchorMs;
        anchorRealtimeMs = now;
    }

    private long elapsed(long now) {
        return playing ? Math.max(0, now - anchorRealtimeMs) : 0;
    }

    private double displayTime(long now) {
        long dt = elapsed(now);
        // Spread the correction over one report interval. If far ahead, extend the
        // window so that removing the offset can never make playback run backwards.
        double window = Math.max(CORRECTION_WINDOW_MS, Math.abs(displayOffsetMs) / speed);
        double remaining = Math.max(0, 1 - dt / window);
        return anchorMs + dt * speed + displayOffsetMs * remaining;
    }
}
