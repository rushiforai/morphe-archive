package dev.twitchpatches.extension.emotes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

final class EmoteTokens {
    static final class Match {
        final int start;
        final int end;
        final Emote emote;
        Match(int start, int end, Emote emote) { this.start = start; this.end = end; this.emote = emote; }
    }

    static List<Match> find(CharSequence text, Map<String, Emote> catalog) {
        List<Match> matches = new ArrayList<>();
        if (text.length() > 8192) return matches;
        int offset = 0;
        while (offset < text.length() && matches.size() < 32) {
            while (offset < text.length() && separator(text.charAt(offset))) offset++;
            int start = offset;
            while (offset < text.length() && !separator(text.charAt(offset))) offset++;
            if (offset > start && offset - start <= 128) {
                Emote emote = catalog.get(text.subSequence(start, offset).toString());
                if (emote != null) matches.add(new Match(start, offset, emote));
            }
        }
        return matches;
    }

    static boolean separator(char value) {
        return Character.isWhitespace(value) || Character.isSpaceChar(value) || (value >= '\u2066' && value <= '\u2069');
    }

    static boolean overlaps(int start, int end, int protectedStart, int protectedEnd) {
        return protectedStart < end && protectedEnd > start;
    }

    private EmoteTokens() { }
}
