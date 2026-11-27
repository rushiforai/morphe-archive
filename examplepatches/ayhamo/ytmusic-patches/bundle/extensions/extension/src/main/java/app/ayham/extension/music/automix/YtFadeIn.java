package app.ayham.extension.music.automix;

/**
 * YT's volume on the next song's player, as the incoming deck should follow it. When YT moves on it
 * starts that player from silence and ramps it up (its own short crossfade, ~0.5 s). The deck is
 * already playing that song by then, so following the ramp dropped it to silence and back (phone,
 * 2026-11-19, every mix). The deck follows YT's volume only once the ramp is over: steady for
 * {@link #STEADY_MS} above silence, or {@link #MAX_MS} after the player came.
 */
final class YtFadeIn {
    static final long STEADY_MS = 200, MAX_MS = 3000;
    static final float SILENT = 0.05f;

    private long firstAt = Long.MIN_VALUE, changedAt;
    private float last = Float.NaN;
    private boolean over;

    /** YT's volume [v] at [now]: the level to follow, or NaN while YT's ramp runs. */
    float follow(long now, float v) {
        if (firstAt == Long.MIN_VALUE) firstAt = now;
        if (v != last) {
            last = v;
            changedAt = now;
        }
        if (!over && ((v > SILENT && now - changedAt >= STEADY_MS) || now - firstAt >= MAX_MS)) over = true;
        return over ? v : Float.NaN;
    }
}
