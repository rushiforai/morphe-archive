package io.github.sabopura.morphe.extension.twitch.player;

import android.util.Log;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;

/**
 * A link opened while a VOD plays in picture-in-picture shows the channel page, which asks the
 * player screen to shrink to the mini player. Twitch's VOD player only shrinks from full size, and
 * Android may deliver the link before it reports that picture-in-picture ended: the shrink is then
 * dropped, the VOD comes back full size, and the live stream the page opens next does not replace
 * it. Such a shrink is made again right after picture-in-picture ends, the order Twitch expects.
 */
@SuppressWarnings("unused")
public final class PipShrink {
    private static final PipShrinks PLAYERS = new PipShrinks();

    private PipShrink() {
    }

    /** Injection point: another screen asks the player screen to shrink. */
    public static void asked(Object player) {
        try {
            PLAYERS.asked(player);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.pip-shrink", e);
        }
    }

    /** Injection point: picture-in-picture began or ended for the player screen. True: shrink it now. Main thread. */
    public static boolean changed(Object player, boolean pip) {
        try {
            if (!PLAYERS.changed(player, pip)) return false;
            Log.i("SabopuraTwitch", "Shrinking the player after picture-in-picture, for the link opened during it");
            return true;
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.pip-shrink", e);
            return false;
        }
    }
}
