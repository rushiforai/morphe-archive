package dev.twitchpatches.extension.emotes;

import java.util.Collections;
import java.util.Map;

public final class TwitchEmotes {
    private static volatile Map<?, ?> catalogue = Collections.emptyMap();

    private TwitchEmotes() { }

    public static void bind(Map<?, ?> tokens) { catalogue = tokens; }

    static Emote find(String token) {
        Object model = catalogue.get(token);
        return model == null ? null : new Emote(token, imageUrl(EmoteInputBridge.id(model)), false, false);
    }

    static String imageUrl(String id) {
        return "https://static-cdn.jtvnw.net/emoticons/v2/" + id + "/default/dark/2.0";
    }
}
