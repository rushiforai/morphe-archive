package io.github.sabopura.morphe.extension.twitch.player;

import android.content.SharedPreferences;
import android.util.Log;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** Keeps Twitch from following a video that ended with another one. */
public final class VodEnd {
    public static final String KEY = "no_autoplay_next";

    private VodEnd() {
    }

    /**
     * Injection point: a VOD or clip ended and Twitch is about to show its next video, with the
     * countdown that plays it. On the main thread.
     *
     * @return true to show nothing, which leaves the ended video as it is
     */
    public static boolean keepEnded() {
        try {
            // Asked first: this end uses up the timer's wait even when the setting holds the video too.
            boolean slept = Features.has(Feature.PLAY_SLEEP) && PlayerTools.endSleepReached();
            if (!slept && !enabled()) return false;
            Log.i("SabopuraTwitch", "Next video not started: " + (slept ? "sleep timer" : "setting"));
            return true;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.vod-end", e);
            return false;
        }
    }

    private static boolean enabled() {
        SharedPreferences prefs = PlayerTools.preferences();
        return Features.has(Feature.NO_AUTOPLAY) && prefs != null && prefs.getBoolean(KEY, false);
    }
}
