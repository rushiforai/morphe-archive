package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import io.github.sabopura.morphe.extension.twitch.chat.HistoryMessage;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * The Twitch emotes one chat message used, read from the "emotes" tag of its IRC line. Twitch draws
 * these itself in its own chat; a list of ours, such as the recent chat sheet, only has their names
 * unless it asks here.
 */
public final class TwitchEmotes {
    public static final TwitchEmotes NONE = new TwitchEmotes(Collections.emptyMap());
    /** More distinct emotes than one message holds; a longer tag is not believed past this. */
    private static final int LIMIT = 64;

    /** The emote's text in the message, to its id. */
    private final Map<String, String> ids;

    private TwitchEmotes(Map<String, String> ids) {
        this.ids = ids;
    }

    /** The emotes of a PRIVMSG line as Twitch, or a log of it, sends it; none for anything else. */
    public static TwitchEmotes ofIrc(String line) {
        String text = HistoryMessage.ircText(line);
        if (text == null || !line.startsWith("@")) return NONE;
        // Positions in a "/me" message count from the action's own text.
        String action = HistoryMessage.action(text);
        for (String tag : line.substring(1, line.indexOf(' ')).split(";"))
            if (tag.startsWith("emotes=")) return parse(tag.substring("emotes=".length()), action == null ? text : action);
        return NONE;
    }

    /**
     * {@code tag} lists each emote as {@code id:first-last,first-last}, joined by {@code /}; the
     * positions count the code points of {@code text}. Whatever is malformed is left as text, and so
     * is a position that is not a whole word: then the text is not the one the tag was made for.
     */
    public static TwitchEmotes parse(String tag, String text) {
        if (tag == null || tag.isEmpty() || text == null) return NONE;
        Map<String, String> ids = new LinkedHashMap<>();
        int points = text.codePointCount(0, text.length());
        for (String entry : tag.split("/")) {
            if (ids.size() >= LIMIT) break;
            int colon = entry.indexOf(':');
            if (colon <= 0 || !validId(entry, colon)) continue;
            // Every position of one emote holds the same text, so the first one names it.
            int comma = entry.indexOf(',', colon);
            String range = entry.substring(colon + 1, comma < 0 ? entry.length() : comma);
            int dash = range.indexOf('-');
            if (dash <= 0) continue;
            try {
                int first = Integer.parseInt(range.substring(0, dash));
                int last = Integer.parseInt(range.substring(dash + 1));
                if (first < 0 || last < first || last >= points) continue;
                int start = text.offsetByCodePoints(0, first);
                int end = text.offsetByCodePoints(start, last - first + 1);
                boolean whole = (start == 0 || EmoteSupport.isSeparator(text.charAt(start - 1)))
                        && (end == text.length() || EmoteSupport.isSeparator(text.charAt(end)));
                String name = text.substring(start, end);
                if (whole && isWord(name)) ids.putIfAbsent(name, entry.substring(0, colon));
            } catch (NumberFormatException ignored) {
            }
        }
        return ids.isEmpty() ? NONE : new TwitchEmotes(ids);
    }

    /** The id goes into an image address, so only the characters Twitch's ids have are accepted. */
    private static boolean validId(String entry, int length) {
        if (length > 64) return false;
        for (int i = 0; i < length; i++) {
            char c = entry.charAt(i);
            if (!(c >= '0' && c <= '9' || c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c == '_')) return false;
        }
        return true;
    }

    /** Rows are drawn word by word, so an emote that is not exactly one word could not be placed. */
    private static boolean isWord(String name) {
        if (name.isEmpty()) return false;
        for (int i = 0; i < name.length(); i++) if (EmoteSupport.isSeparator(name.charAt(i))) return false;
        return true;
    }

    public boolean isEmpty() {
        return ids.isEmpty();
    }

    /** The emote {@code word} is in this message, for a dark or a light background; null for plain text. */
    Emote find(String word, boolean dark) {
        String id = ids.get(word);
        return id == null ? null : new Emote("twitch", id, word, url(id, dark), false, false, true);
    }

    /** The still image at chat size: in a list of old messages an animated emote shows its first frame. */
    static String url(String id, boolean dark) {
        return "https://static-cdn.jtvnw.net/emoticons/v2/" + id + "/static/" + (dark ? "dark" : "light") + "/2.0";
    }
}
