package io.github.sabopura.morphe.extension.twitch.danmaku;

import io.github.sabopura.morphe.extension.twitch.chat.ChatRules;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Pattern;

/** Immutable NG-word filter. Pure Java so it can be unit tested. */
final class CommentFilter {
    static final CommentFilter EMPTY = new CommentFilter(Collections.emptyList(),
            Collections.emptyList());
    /** Expressions run on text no longer than the longest comment danmaku shows, which bounds their time. */
    private static final int MAX_MATCHED_CHARS = 2 * DanmakuSettings.MAX_MAX_LENGTH;

    private final List<String> words;
    private final List<Pattern> patterns;

    private CommentFilter(List<String> words, List<Pattern> patterns) {
        this.words = words;
        this.patterns = patterns;
    }

    /**
     * Parses one rule per line or comma. Plain rules are case-, width- and
     * kana-insensitive substrings; {@code /expression/} rules are regular expressions.
     */
    static CommentFilter parse(String rules) {
        if (rules == null || rules.trim().isEmpty()) return EMPTY;
        List<String> words = new ArrayList<>();
        List<Pattern> patterns = new ArrayList<>();
        for (String line : rules.split("[\\r\\n]+")) {
            String trimmedLine = line.trim();
            String expression = expression(trimmedLine);
            if (expression != null) {
                Pattern pattern = compile(expression);
                if (pattern != null) patterns.add(pattern);
                continue;
            }
            for (String rule : trimmedLine.split("[,、，]")) {
                String normalized = ChatRules.normalize(rule);
                if (!normalized.isEmpty()) words.add(normalized);
            }
        }
        if (words.isEmpty() && patterns.isEmpty()) return EMPTY;
        return new CommentFilter(Collections.unmodifiableList(words),
                Collections.unmodifiableList(patterns));
    }

    /** The {@code /expression/} rules that are not applied, as written: invalid, or able to run too long. */
    static List<String> refused(String rules) {
        List<String> refused = new ArrayList<>();
        if (rules == null) return refused;
        for (String line : rules.split("[\\r\\n]+")) {
            String trimmedLine = line.trim();
            String expression = expression(trimmedLine);
            if (expression != null && compile(expression) == null) refused.add(trimmedLine);
        }
        return refused;
    }

    /** The inside of a {@code /expression/} rule, or null for a plain rule. */
    private static String expression(String trimmedLine) {
        return trimmedLine.length() > 2 && trimmedLine.startsWith("/") && trimmedLine.endsWith("/")
                ? trimmedLine.substring(1, trimmedLine.length() - 1) : null;
    }

    /** Null for an invalid or runaway expression, which must never disable the other rules. */
    private static Pattern compile(String expression) {
        try {
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
            return RegexShape.backtracksExponentially(expression) ? null : pattern;
        } catch (RuntimeException | StackOverflowError e) {
            return null;
        }
    }

    boolean isEmpty() {
        return words.isEmpty() && patterns.isEmpty();
    }

    boolean blocks(String text) {
        if (isEmpty() || text == null) return false;
        String normalized = ChatRules.normalize(text);
        for (String word : words) {
            if (normalized.contains(word)) return true;
        }
        if (text.length() > MAX_MATCHED_CHARS) return false;
        for (Pattern pattern : patterns) {
            try {
                if (pattern.matcher(text).find()) return true;
            } catch (RuntimeException | StackOverflowError ignored) {
                // ICU's backtracking stack ran out; the other rules still apply.
            }
        }
        return false;
    }
}
