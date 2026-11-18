package io.github.sabopura.morphe.extension.twitch.app;

import android.content.SharedPreferences;
import android.util.Log;

import java.util.Collections;
import java.util.List;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/**
 * Hides stream recaps, the reels of a stream's clips, where Twitch's native screens show them: the
 * recap cards and the recap shelf of the home feed, and the shelf on channel pages. The React
 * Native home that Twitch 31.9.0 and later show signed-in phones loads and draws its own shelf,
 * which stays; Twitch's recap switch for viewers is left alone because that shelf opens recaps
 * through it.
 */
@SuppressWarnings("unused")
public final class Recaps {
    public static final String KEY = "hide_recaps";
    private static final String TAG = "SabopuraTwitch";

    private Recaps() {
    }

    /**
     * Injection point: the recap entry of a feed response, null for every other kind of entry.
     * Twitch's parser adds nothing for a null entry, as for a kind of entry it does not know.
     */
    public static Object feedEntry(Object entry) {
        return entry == null ? null : feedEntry(entry, hidden("app.recaps-feed"));
    }

    static Object feedEntry(Object entry, boolean hide) {
        return hide ? null : entry;
    }

    /** Injection point: the items of the recap shelf section of a channel page. Twitch draws nothing for a section without items. */
    public static List<?> channelShelf(List<?> items) {
        return channelShelf(items, hidden("app.recaps-channel"));
    }

    static List<?> channelShelf(List<?> items, boolean hide) {
        return hide ? Collections.emptyList() : items;
    }

    /**
     * Injection point: the name of Twitch's switch for the recap shelf of the native feed, where
     * Twitch defines the switch. Asked for a name it does not know, Twitch's experiment service
     * answers the switch's default, off, and the feed keeps its stories shelf.
     */
    public static String feedShelfSwitch(String name) {
        try {
            if (!Features.has(Feature.HIDE_RECAPS)) return name;
            SharedPreferences prefs = ChatSettings.preferences();
            // Twitch defines the switch once; an answer that came too late could not be made up for in this run.
            if (prefs == null) throw new IllegalStateException("settings not readable when Twitch defined " + name);
            if (!prefs.getBoolean(KEY, false)) return name;
            Log.i(TAG, "Recaps: the native feed's recap shelf stays off");
            return unknownSwitch(name);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.recaps-switch", e);
            return name;
        }
    }

    static String unknownSwitch(String name) {
        return name + ".hidden";
    }

    private static boolean hidden(String place) {
        try {
            return AppHooks.on(Feature.HIDE_RECAPS, KEY);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note(place, e);
            return false;
        }
    }
}
