package app.morphed.extension.twitch.ui;

/** Counts quick taps in a row: three, each within GAP_MS of the one before, is the unlock. */
public final class TripleTap {
    static final int NEEDED = 3;
    static final long GAP_MS = 600;

    private int count;
    private long lastAt = Long.MIN_VALUE;

    /** A tap at this time (ms); the taps in the row so far, NEEDED when it's complete (then it starts over). */
    public int tap(long now) {
        count = lastAt != Long.MIN_VALUE && now - lastAt <= GAP_MS ? count + 1 : 1;
        lastAt = now;
        if (count < NEEDED) return count;
        reset();
        return NEEDED;
    }

    /** The taps so far still count at this time (the row isn't broken off yet). */
    public int current(long now) {
        return lastAt != Long.MIN_VALUE && now - lastAt <= GAP_MS ? count : 0;
    }

    public void reset() {
        count = 0;
        lastAt = Long.MIN_VALUE;
    }
}
