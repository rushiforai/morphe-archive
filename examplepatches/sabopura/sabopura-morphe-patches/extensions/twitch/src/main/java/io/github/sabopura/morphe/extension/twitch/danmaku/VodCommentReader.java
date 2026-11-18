package io.github.sabopura.morphe.extension.twitch.danmaku;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Turns the fields of a VOD chat replay comment into a danmaku comment. Pure so it can be unit tested. */
final class VodCommentReader {
    /** An emote in a comment's body, starting at Twitch's character index {@code begin}. */
    static final class Emote {
        final String id;
        final int begin;

        Emote(String id, int begin) {
            this.id = id;
            this.begin = begin;
        }
    }

    private VodCommentReader() {
    }

    /** The comment, or null for one with no text. {@code color} is Twitch's "#RRGGBB" name colour. */
    static ChatMessageReader.Comment read(String id, String displayName, String login, String userId,
                                          String color, String body, List<Emote> emotes) {
        if (body == null || body.trim().isEmpty()) return null;
        String author = displayName == null || displayName.isEmpty() ? login : displayName;
        return new ChatMessageReader.Comment(id, author == null ? "" : author, login, userId, color(color),
                segments(body, emotes));
    }

    /**
     * Text runs and emotes. Twitch counts emote positions in code points, as in IRC, and an emote is
     * always a whole word of the body, so its start is enough.
     */
    static List<ChatTokens.Segment> segments(String body, List<Emote> emotes) {
        List<Emote> sorted = new ArrayList<>(emotes);
        Collections.sort(sorted, (a, b) -> Integer.compare(a.begin, b.begin));
        List<ChatTokens.Segment> result = new ArrayList<>(sorted.size() * 2 + 1);
        int codePoints = body.codePointCount(0, body.length());
        int done = 0;
        for (Emote emote : sorted) {
            if (emote.id == null || emote.id.isEmpty() || emote.begin < 0 || emote.begin >= codePoints) continue;
            int start = body.offsetByCodePoints(0, emote.begin);
            if (start < done || start > 0 && !Character.isWhitespace(body.charAt(start - 1))) continue;
            int end = wordEnd(body, start);
            if (end == start) continue;
            if (start > done) result.add(ChatTokens.Segment.text(body.substring(done, start)));
            result.add(ChatTokens.Segment.emote(emote.id, body.substring(start, end)));
            done = end;
        }
        if (done < body.length()) result.add(ChatTokens.Segment.text(body.substring(done)));
        return result;
    }

    /** The name colour as 0xRRGGBB, or null when Twitch gave none. */
    static Integer color(String hex) {
        if (hex == null || hex.length() != 7 || hex.charAt(0) != '#') return null;
        try {
            return Integer.parseInt(hex.substring(1), 16);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private static int wordEnd(String body, int from) {
        int at = from;
        while (at < body.length() && !Character.isWhitespace(body.charAt(at))) at++;
        return at;
    }
}
