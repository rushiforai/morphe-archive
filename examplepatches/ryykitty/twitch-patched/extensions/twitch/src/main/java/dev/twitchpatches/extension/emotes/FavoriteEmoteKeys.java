package dev.twitchpatches.extension.emotes;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class FavoriteEmoteKeys {
    static final int LIMIT = 200;
    private static final Pattern VALID = Pattern.compile("[tc]:\\S{1,128}");
    private static final Pattern PROVIDER_IMAGE =
            Pattern.compile("^https://cdn\\.(betterttv|7tv|frankerfacez)\\.[a-z]+/emote/([^/]+)/");

    private FavoriteEmoteKeys() { }

    static String ofPickerId(String id) {
        return id.startsWith(EmotePickerRuntime.PREFIX) ? ofProviderImage(id.substring(EmotePickerRuntime.PREFIX.length())) : ofTwitchEmote(id);
    }

    static String ofTwitchEmote(String id) { return "t:" + id; }

    // Keyed by provider and emote id so another channel's emote with the same name stays separate.
    static String ofProviderImage(String url) {
        Matcher match = PROVIDER_IMAGE.matcher(url);
        return match.find() ? "c:" + match.group(1) + ":" + match.group(2) : null;
    }

    static boolean valid(String key) { return key != null && VALID.matcher(key).matches(); }

    static List<String> toggled(List<String> keys, String key) {
        List<String> next = new ArrayList<>(keys);
        if (next.remove(key)) return next;
        next.add(key);
        return next.size() > LIMIT ? new ArrayList<>(next.subList(next.size() - LIMIT, next.size())) : next;
    }
}
