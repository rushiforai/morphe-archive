package app.afterglow.extension.settings;

/** The iOS scrubber's 200 ms linear transition, with continuous retargeting. */
public final class SeekMotion {
    private boolean initialized;
    private float from, target;
    private long start;
    public float update(float position, long now, boolean animate) {
        if (!initialized || !animate) {
            initialized = true; from = target = position; start = now; return position;
        }
        float current = value(now);
        if (target != position) { from = current; target = position; start = now; }
        return current;
    }
    public float value(long now) { return from + (target - from) * Math.max(0, Math.min(1, (now - start) / 200f)); }
    public boolean active(long now) { return from != target && now - start < 200; }
}
