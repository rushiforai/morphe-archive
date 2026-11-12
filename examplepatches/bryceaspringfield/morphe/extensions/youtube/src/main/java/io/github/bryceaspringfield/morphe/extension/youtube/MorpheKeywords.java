package io.github.bryceaspringfield.morphe.extension.youtube;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import app.morphe.extension.youtube.settings.Settings;

/**
 * Morphe's "Hide keywords" list (Settings > Morphe > Feed), applied to the cards of Morphe's card layout, which its
 * own filter does not read. The list's syntax is Morphe's: one phrase a line, "quotes" for whole words, at least 3
 * characters otherwise; matched case-insensitively in the card's title, channel, and text.
 */
final class MorpheKeywords {

    private static volatile String parsed;
    private static volatile List<String[]> phrases = new ArrayList<>();

    private MorpheKeywords() {
    }

    /** Whether Morphe's keyword filter is on for the place (Home also covers the player's related videos). */
    static boolean applies(boolean search, boolean subscriptions) {
        if (search) return Settings.HIDE_KEYWORD_CONTENT_SEARCH.get();
        if (subscriptions) return Settings.HIDE_KEYWORD_CONTENT_SUBSCRIPTIONS.get();
        return Settings.HIDE_KEYWORD_CONTENT_HOME.get();
    }

    private static List<String[]> phrases() {
        String raw = Settings.HIDE_KEYWORD_CONTENT_PHRASES.get();
        //noinspection StringEquality
        if (raw != parsed) {
            List<String[]> out = new ArrayList<>();
            for (String line : raw.split("\n")) {
                String p = line.trim();
                boolean whole = p.length() > 2 && p.startsWith("\"") && p.endsWith("\"");
                if (whole) p = p.substring(1, p.length() - 1);
                if (p.isEmpty() || (!whole && p.length() < 3)) continue;
                out.add(new String[]{p.toLowerCase(Locale.ROOT), whole ? "1" : ""});
            }
            phrases = out;
            parsed = raw;
        }
        return phrases;
    }

    /** The first phrase found in the card, or null. */
    static String match(VideoItem item) {
        List<String[]> list = phrases();
        if (list.isEmpty()) return null;
        String text = item.text + "\n" + (item.channelName == null ? "" : item.channelName.toLowerCase(Locale.ROOT));
        for (String[] p : list) {
            if (ChannelRules.containsKeyword(text, p[0], !p[1].isEmpty())) return p[0];
        }
        return null;
    }
}
