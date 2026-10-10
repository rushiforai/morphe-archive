package app.vantage.extension.music;

import android.util.Log;

/**
 * Shows the podcast-style rewind / fast-forward buttons in the media
 * notification for any track longer than a threshold, not only for podcast
 * episodes.
 *
 * <p>YouTube Music keeps one "seek-focused" flag in its media-session state
 * (baxh.J(Z) in 9.15.51). The flag is set from the player response's own
 * config (two booleans the server sends for podcast episodes), and every media
 * session custom action reads it: rewind 10 s, forward 30 s, next and previous
 * show while it is true; like, shuffle, repeat and dislike while it is false. The patch runs the app's value
 * through {@link #showSeekButtons} right before it is stored, so a long track
 * gets exactly the layout a podcast episode gets.
 */
public final class LongTrackSeekButtons {

    private static final String TAG = "VSEEK";

    private LongTrackSeekButtons() {}

    /**
     * Called with the app's own seek-focused value and the player response
     * (an apcv in 9.15.51) it was read from. Returns the value to store.
     */
    public static boolean showSeekButtons(boolean appValue, Object playerResponse) {
        if (appValue || playerResponse == null) {
            return appValue;
        }
        try {
            int seconds = lengthSeconds(playerResponse);
            boolean show = seconds > minimumSeconds();
            Log.d(TAG, "length=" + seconds + "s seekButtons=" + show);
            return show;
        } catch (Throwable t) {
            Log.e(TAG, "length lookup failed", t);
            return appValue;
        }
    }

    /**
     * Rewritten by the patch to call the player response's videoDetails
     * lengthSeconds getter. Kept public so no compiler inlines the stub.
     */
    public static int lengthSeconds(Object playerResponse) {
        return 0;
    }

    /** Rewritten by the patch from its minimumMinutes option. */
    public static int minimumSeconds() {
        return 1200;
    }
}
