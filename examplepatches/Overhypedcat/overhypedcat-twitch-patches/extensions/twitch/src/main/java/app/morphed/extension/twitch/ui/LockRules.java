package app.morphed.extension.twitch.ui;

/** When a locked screen lets go (plain arithmetic, tested without Android). */
public final class LockRules {
    /**
     * How long the screen may be out of full screen while locked before the lock goes too: turning the phone,
     * the app asks to leave full screen and is held horizontal again within a frame or two; anything longer is
     * the player really leaving it.
     */
    static final long LEFT_FULL_SCREEN_MS = 1500;

    /**
     * After a failure, the lock and the song pill are left alone a while, then tried again: 3 s after a first
     * one, longer when it keeps failing (each try takes a lock down), at most 30 s.
     */
    static final long[] FAILURE_PAUSES_MS = {3000, 10_000, 30_000};

    /** The pause after this many failures in a row (1 for the first). */
    static long failurePause(int failuresInARow) {
        int i = Math.max(0, Math.min(failuresInARow, FAILURE_PAUSES_MS.length) - 1);
        return FAILURE_PAUSES_MS[i];
    }

    /** How long is left of the pause (0: tried again now); never failed, or a clock that went back: none. */
    static long pauseLeft(long failedAtMs, int failuresInARow, long nowMs) {
        if (failedAtMs <= 0 || nowMs < failedAtMs) return 0;
        return Math.max(0, failurePause(failuresInARow) - (nowMs - failedAtMs));
    }

    private LockRules() {
    }

    static boolean leftFullScreen(long notFullSinceMs, long nowMs) {
        return notFullSinceMs > 0 && nowMs - notFullSinceMs >= LEFT_FULL_SCREEN_MS;
    }
}
