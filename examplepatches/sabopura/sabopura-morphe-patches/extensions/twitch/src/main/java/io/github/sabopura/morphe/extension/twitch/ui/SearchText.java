package io.github.sabopura.morphe.extension.twitch.ui;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** Settings search: multi-word AND, ignoring case and character width. */
final class SearchText {
    private SearchText() {
    }

    /** The query's words; empty for a blank query. */
    static List<String> tokens(String query) {
        List<String> tokens = new ArrayList<>();
        for (String part : normalize(query).trim().split("\\s+"))
            if (!part.isEmpty()) tokens.add(part);
        return tokens;
    }

    static boolean matches(String text, List<String> tokens) {
        String normalized = normalize(text);
        for (String token : tokens) if (!normalized.contains(token)) return false;
        return !tokens.isEmpty();
    }

    /** Pairs of [start, end) in the original text to highlight, merged where they overlap. */
    static List<int[]> ranges(String text, List<String> tokens) {
        int[] origin = new int[text.length() * 3 + 4];
        StringBuilder out = new StringBuilder();
        int i = 0;
        while (i < text.length()) {
            int length = unitLength(text, i);
            String unit = normalize(text.substring(i, i + length));
            for (int j = 0; j < unit.length(); j++) origin[out.length() + j] = i;
            out.append(unit);
            i += length;
        }
        origin[out.length()] = text.length();
        String normalized = out.toString();
        boolean[] mark = new boolean[text.length() + 1];
        for (String token : tokens) {
            for (int at = normalized.indexOf(token); at >= 0; at = normalized.indexOf(token, at + 1)) {
                int from = origin[at], to = origin[at + token.length()];
                for (int p = from; p < Math.max(from + 1, to); p++) mark[p] = true;
            }
        }
        List<int[]> ranges = new ArrayList<>();
        for (int p = 0; p < text.length(); p++) {
            if (!mark[p]) continue;
            int end = p;
            while (end < text.length() && mark[end]) end++;
            ranges.add(new int[]{p, end});
            p = end;
        }
        return ranges;
    }

    /** Half-width voiced marks combine with the kana before them, so the pair normalises as one. */
    private static int unitLength(String text, int at) {
        int length = Character.charCount(text.codePointAt(at));
        if (at + length < text.length()) {
            char next = text.charAt(at + length);
            if (next == 0xFF9E || next == 0xFF9F) length++;
        }
        return length;
    }

    static String normalize(String text) {
        return Normalizer.normalize(text, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
    }
}
