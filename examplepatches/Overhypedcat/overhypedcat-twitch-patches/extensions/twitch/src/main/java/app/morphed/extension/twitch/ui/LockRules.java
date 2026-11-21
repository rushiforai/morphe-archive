package app.morphed.extension.twitch.ui;

/** When a locked screen lets go (plain arithmetic, tested without Android). */
public final class LockRules {
    /**
     * How long the screen may be out of full screen while locked before the lock goes too: turning the phone,
     * the app asks to leave full screen and is held horizontal again within a frame or two; anything longer is
     * the player really leaving it.
     */
    static final long LEFT_FULL_SCREEN_MS = 1500;

    private LockRules() {
    }

    static boolean leftFullScreen(long notFullSinceMs, long nowMs) {
        return notFullSinceMs > 0 && nowMs - notFullSinceMs >= LEFT_FULL_SCREEN_MS;
    }
}
