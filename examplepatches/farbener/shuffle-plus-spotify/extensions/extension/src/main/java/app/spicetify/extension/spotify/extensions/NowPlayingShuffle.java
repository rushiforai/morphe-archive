package app.spicetify.extension.spotify.extensions;

import android.annotation.SuppressLint;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

/**
 * Gives Now Playing's shuffle button a long-press that runs Shuffle+. With the patch's "tap shuffles"
 * option on, a tap runs it too, so Spotify's own shuffle is never switched on from this button.
 */
public final class NowPlayingShuffle {
    private NowPlayingShuffle() {}

    /** Replaced by the patch with {@code return true} when its "tap shuffles" option is on. */
    private static boolean tapShuffles() {
        return false;
    }

    /** Hook N1, at the end of the button's constructor. Never throws into Spotify. */
    @SuppressLint("ClickableViewAccessibility")
    public static void onButton(View button) {
        try {
            button.setOnLongClickListener(v -> {
                ShufflePlus.shuffleWhatsPlaying(v.getContext());
                return true; // consumed: no tap, and haptic feedback
            });
            if (tapShuffles()) {
                // Spotify sets its own click listener again whenever it redraws the button, so ours
                // goes back on at each touch-down, before the tap is dispatched.
                button.setOnTouchListener((v, event) -> {
                    if (event.getAction() == MotionEvent.ACTION_DOWN) {
                        v.setOnClickListener(c -> ShufflePlus.shuffleWhatsPlaying(c.getContext()));
                    }
                    return false;
                });
            }
        } catch (Throwable e) {
            Log.w("ShufflePlus", "Couldn't hook Now Playing's shuffle button", e);
        }
    }
}
