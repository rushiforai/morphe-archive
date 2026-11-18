package io.github.sabopura.morphe.extension.twitch.danmaku;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Converts Twitch's parsed chat tokens into danmaku segments.
 *
 * <p>Twitch obfuscates the token classes and their fields, but keeps the Kotlin data-class
 * {@code toString()} output ("TextToken(text=...)", "EmoteToken(id=..., text=...)", ...).
 * Those strings are the stable contract used here, so no class or field name is needed.
 * Pure Java so it can be unit tested.
 */
final class ChatTokens {
    private static final Pattern NUM_BITS = Pattern.compile(", numBits=(\\d+)\\)$");
    private static final Pattern CHEER_PREFIX = Pattern.compile("prefix=([^,)]+)");

    private ChatTokens() {
    }

    /** One run of text or one emote image. */
    static final class Segment {
        final String text;
        /** Twitch emote id, or null for a text run. */
        final String emoteId;

        private Segment(String text, String emoteId) {
            this.text = text;
            this.emoteId = emoteId;
        }

        static Segment text(String text) {
            return new Segment(text, null);
        }

        static Segment emote(String id, String code) {
            return new Segment(code, id);
        }

        boolean isEmote() {
            return emoteId != null;
        }
    }

    /** True when a token list element looks like one of Twitch's chat tokens. */
    static boolean isToken(String description) {
        return description != null && description.contains("Token(")
                && description.endsWith(")");
    }

    /** Parses one token description; unknown tokens are ignored (null). */
    static Segment parse(String description) {
        if (!isToken(description)) return null;
        int open = description.indexOf('(');
        String kind = description.substring(0, open);
        String body = description.substring(open + 1, description.length() - 1);
        switch (kind) {
            case "TextToken": {
                // Newer builds append ", flags=AutoModMessageFlags(...)".
                String text = after(body, "text=");
                int flags = text.lastIndexOf(", flags=");
                if (flags >= 0) text = text.substring(0, flags);
                return text.isEmpty() ? null : Segment.text(text);
            }
            case "CensoredTextToken": {
                String text = after(body, "text=");
                int tracking = text.lastIndexOf(", trackingInfo=");
                if (tracking >= 0) text = text.substring(0, tracking);
                return text.isEmpty() ? null : Segment.text(text);
            }
            case "EmoteToken":
            case "EmoticonToken": {
                String id = value(body, "id=");
                String code = value(body, "text=");
                if (id == null || id.isEmpty()) return code == null ? null : Segment.text(code);
                return Segment.emote(id, code == null ? "" : code);
            }
            case "GifToken":
            case "MentionToken": {
                String text = value(body, "text=");
                return text == null || text.isEmpty() ? null : Segment.text(text);
            }
            case "UrlToken": {
                String url = value(body, "url=");
                return url == null || url.isEmpty() ? null : Segment.text(url);
            }
            case "BitsToken": {
                Matcher bits = NUM_BITS.matcher(description);
                if (!bits.find()) return null;
                Matcher prefix = CHEER_PREFIX.matcher(body);
                String name = prefix.find() ? prefix.group(1) : "Cheer";
                return Segment.text(name + bits.group(1));
            }
            default:
                return null;
        }
    }

    /** Parses a token list, merging adjacent text runs. */
    static List<Segment> parseAll(List<?> tokens) {
        if (tokens == null || tokens.isEmpty()) return Collections.emptyList();
        List<Segment> result = new ArrayList<>(tokens.size());
        StringBuilder pending = new StringBuilder();
        for (Object token : tokens) {
            if (token == null) continue;
            Segment segment = parse(String.valueOf(token));
            if (segment == null) continue;
            if (segment.isEmote()) {
                if (pending.length() > 0) {
                    result.add(Segment.text(pending.toString()));
                    pending.setLength(0);
                }
                result.add(segment);
            } else {
                pending.append(segment.text);
            }
        }
        if (pending.length() > 0) result.add(Segment.text(pending.toString()));
        return result;
    }

    /** Text used for NG-word matching, length limits and duplicate detection. */
    static String plainText(List<Segment> segments) {
        StringBuilder text = new StringBuilder();
        for (Segment segment : segments) text.append(segment.text);
        return text.toString().trim();
    }

    /** What was typed as words: an emote's name stands for a picture. */
    static String withoutEmotes(List<Segment> segments) {
        StringBuilder text = new StringBuilder();
        for (Segment segment : segments) text.append(segment.isEmote() ? " " : segment.text);
        return text.toString().trim();
    }

    /** Everything after {@code key} up to the end of the body. */
    private static String after(String body, String key) {
        int index = body.indexOf(key);
        return index < 0 ? "" : body.substring(index + key.length());
    }

    /** A comma-free value such as an id, a user name, or an emote code. */
    private static String value(String body, String key) {
        int index = body.startsWith(key) ? 0 : body.indexOf(", " + key);
        if (index < 0) return null;
        int start = index + (index == 0 ? key.length() : key.length() + 2);
        int end = body.indexOf(", ", start);
        return end < 0 ? body.substring(start) : body.substring(start, end);
    }
}
