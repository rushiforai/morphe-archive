package io.github.sabopura.morphe.extension.twitch.original;

import android.content.SharedPreferences;

import io.github.sabopura.morphe.extension.twitch.danmaku.LiveChat;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;

/** Counts live chat messages for the sparkline over the player. */
public final class HypeMeter {
    public static final String KEY = "hype_meter";
    static final HypeSeries SERIES = new HypeSeries();
    private static volatile String room;

    private HypeMeter() {
    }

    public static final LiveChat.Subscriber SUBSCRIBER = new LiveChat.Subscriber() {
        @Override
        public boolean wants() {
            return enabled();
        }

        @Override
        public void onMessage(LiveChat.Message message) {
            if (message.room != null && !message.room.equals(room)) {
                room = message.room;
                SERIES.clear();
            }
            SERIES.add(System.currentTimeMillis());
        }
    };

    static boolean enabled() {
        SharedPreferences prefs = Original.prefs();
        return Features.has(Feature.HYPE_METER) && prefs != null && prefs.getBoolean(KEY, false);
    }
}
