package io.github.sabopura.morphe.extension.twitch.player;

import android.content.Context;
import android.util.Log;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * "Back closes the player". Twitch's back shrinks the player to the mini player; with the setting
 * on, the mini player is then closed the way its own close button does, before it is ever drawn.
 * Twitch's shrink still runs first, so the screen's orientation and the keyboard are put back as
 * they are for the mini player.
 */
@SuppressWarnings("unused")
public final class PlayerClose {
    public static final String KEY = "back_closes_player";

    private PlayerClose() {
    }

    /** Injection point: Twitch's back handler asked the player screen to shrink. Main thread. */
    public static void afterBack(Object theatre, boolean shrunk) {
        try {
            if (!shrunk || !Features.has(Feature.BACK_CLOSES_PLAYER)) return;
            Context context = PlayerTools.app();
            if (context == null || !ChatSettings.preferences(context).getBoolean(KEY, false)) return;
            close(theatre, null, null);
            Log.i("SabopuraTwitch", "Back closed the player instead of the mini player");
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("player.back-close", e);
        }
    }

    /** Replaced at patch time: the call that closes Twitch's player screen. The nulls are scratch registers. */
    private static void close(Object theatre, Object router, Object activity) {
    }
}
