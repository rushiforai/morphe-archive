package com.waze.gw;

/**
 * Debounces xADAS's "too close" verdict so the widget, edge effect and sound do not flicker on a
 * single noisy frame: the verdict must hold for {@code onMs} before it turns on, and must be gone
 * for {@code offMs} before it turns off. Time-based and idempotent, so several readers (phone
 * widgets, alert loop, Android Auto render thread) can share one instance.
 */
final class XadasDebounce {
    private final long onMs;
    private final long offMs;
    private boolean output;
    private boolean pending;     // the raw value differs from the output and is being timed
    private long since;

    XadasDebounce(long onMs, long offMs) {
        this.onMs = onMs;
        this.offMs = offMs;
    }

    synchronized boolean update(boolean raw, long nowMs) {
        if (raw == output) {
            pending = false;
            return output;
        }
        if (!pending) {
            pending = true;
            since = nowMs;
        }
        if (nowMs - since >= (raw ? onMs : offMs)) {
            output = raw;
            pending = false;
        }
        return output;
    }

    /** Forget everything, e.g. when the measurement is lost. */
    synchronized void reset() {
        output = false;
        pending = false;
    }
}
