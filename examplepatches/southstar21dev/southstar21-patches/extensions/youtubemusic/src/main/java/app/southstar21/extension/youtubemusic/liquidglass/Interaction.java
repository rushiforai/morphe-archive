package app.southstar21.extension.youtubemusic.liquidglass;

import android.os.SystemClock;

/**
 * When the user last touched the screen. Glass only needs redrawing when what's behind it can
 * have moved, and in YouTube Music that's mostly while a finger is down or a fling is still running.
 * Redrawing the glass every frame instead (blur and refraction each time) kept the app drawing
 * nonstop and made the phone hot.
 */
final class Interaction {
    /** How long after the last touch content may still be moving (flings, snapping). */
    private static final long SETTLE_MS = 1500;

    private static volatile long lastTouch;

    private Interaction() {
    }

    static void touched() {
        lastTouch = SystemClock.uptimeMillis();
    }

    /** Whether content may still be moving from a touch at {@code now} (uptime ms). */
    static boolean recent(long now) {
        return now - lastTouch < SETTLE_MS;
    }
}
