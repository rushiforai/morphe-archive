package dev.twitchpatches.extension.emotes;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

final class EmoteDraftTokens {
    static String normalize(String text, Map<String, Emote> catalog) {
        if (text.startsWith("/") || text.length() > 8192) return text;
        StringBuilder result = new StringBuilder(text.length());
        int at = 0;
        while (at < text.length()) {
            int start = at;
            if (EmoteTokens.separator(text.charAt(at))) { result.append(text.charAt(at++)); continue; }
            while (at < text.length() && !EmoteTokens.separator(text.charAt(at))) at++;
            String token = text.substring(start, at);
            if (token.length() > 2 && token.charAt(0) == ':' && token.charAt(token.length() - 1) == ':' &&
                    catalog.containsKey(token.substring(1, token.length() - 1))) {
                result.append(token, 1, token.length() - 1);
            } else result.append(token);
        }
        return result.toString();
    }

    static List<Emote> suggestions(String query, Map<String, Emote> catalog) {
        List<Emote> result = new ArrayList<>();
        if (query == null || query.length() < 2 || query.length() > 129 || query.charAt(0) != ':') return result;
        String needle = query.substring(1).toLowerCase(Locale.ROOT);
        for (Emote emote : catalog.values()) {
            if (emote.code.toLowerCase(Locale.ROOT).contains(needle)) result.add(emote);
        }
        result.sort(Comparator.comparing((Emote emote) -> !emote.code.toLowerCase(Locale.ROOT).startsWith(needle))
                .thenComparing(emote -> emote.code, String.CASE_INSENSITIVE_ORDER));
        return result.subList(0, Math.min(10, result.size()));
    }

    static int selection(String text, int caret, Map<String, Emote> catalog) {
        int offset = Math.max(0, Math.min(caret, text.length())), removed = 0, at = 0;
        if (text.startsWith("/") || text.length() > 8192) return offset;
        while (at < offset) {
            if (EmoteTokens.separator(text.charAt(at))) { at++; continue; }
            int start = at;
            while (at < text.length() && !EmoteTokens.separator(text.charAt(at))) at++;
            String token = text.substring(start, at);
            if (token.length() > 2 && token.charAt(0) == ':' && token.endsWith(":") &&
                    catalog.containsKey(token.substring(1, token.length() - 1))) {
                removed++;
                if (offset >= at) removed++;
            }
        }
        return offset - removed;
    }

    private EmoteDraftTokens() { }
}
