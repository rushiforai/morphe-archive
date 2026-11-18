package io.github.sabopura.morphe.extension.twitch.danmaku;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Finds the shapes a backtracking engine can take exponential time on: a repeated group whose body
 * holds a quantifier, or alternatives that may start with the same character. Android matches in
 * ICU on its own copy of the text, so nothing can stop a match once it runs; such a rule has to be
 * refused before it is used. A repeated group whose body can match in only one way at each position
 * is safe, so "(w|草)+" and "(ab)+" are kept.
 */
final class RegexShape {
    private static final int VARIABLE = 1, AMBIGUOUS = 2;
    private static final Pattern BOUNDS = Pattern.compile("\\{(\\d+)(,(\\d*))?\\}");

    private final String regex;
    private int at;
    private boolean unsafe;

    private RegexShape(String regex) {
        this.regex = regex;
    }

    /** For an expression that compiles. */
    static boolean backtracksExponentially(String regex) {
        RegexShape shape = new RegexShape(regex);
        shape.alternatives();
        return shape.unsafe || shape.at < regex.length();
    }

    /** The body up to the closing parenthesis, as a quantifier outside it sees it. */
    private int alternatives() {
        int flags = 0, count = 0;
        boolean distinct = true;
        Set<Integer> starts = new HashSet<>();
        while (true) {
            int[] sequence = sequence();
            flags |= sequence[0];
            count++;
            if (sequence[1] < 0 || !starts.add(sequence[1])) distinct = false;
            if (at < regex.length() && regex.charAt(at) == '|') at++;
            else break;
        }
        return count > 1 && !distinct ? flags | AMBIGUOUS : flags;
    }

    /** {flags, folded first character or -1 when the first item is not one plain character}. */
    private int[] sequence() {
        int flags = 0, first = -1;
        boolean leading = true;
        while (at < regex.length()) {
            char c = regex.charAt(at);
            if (c == '|' || c == ')') break;
            int item = 0, literal = -1;
            if (c == '(') {
                at++;
                if (!groupPrefix()) continue;
                item = alternatives();
                if (at < regex.length()) at++;
            } else if (c == '[') {
                skipClass();
            } else if (c == '\\') {
                literal = escape();
            } else if (c == '.' || c == '^' || c == '$') {
                at++;
            } else {
                literal = regex.codePointAt(at);
                at += Character.charCount(literal);
            }
            int[] repeat = quantifier();
            if (repeat != null) {
                if (repeat[1] > 1 && item != 0) unsafe = true;
                if (repeat[0] != repeat[1]) item |= VARIABLE;
                literal = -1;
            }
            if (leading) first = literal < 0 ? -1 : fold(literal);
            leading = false;
            flags |= item;
        }
        return new int[] {flags, first};
    }

    /** Skips "(?:", "(?<name>", look-arounds and flags; false for a flags-only group such as "(?i)". */
    private boolean groupPrefix() {
        if (at >= regex.length() || regex.charAt(at) != '?') return true;
        at++;
        char c = at < regex.length() ? regex.charAt(at) : ')';
        if (c == ':' || c == '=' || c == '!' || c == '>') {
            at++;
        } else if (c == '<' && at + 1 < regex.length() && (regex.charAt(at + 1) == '=' || regex.charAt(at + 1) == '!')) {
            at += 2;
        } else if (c == '<') {
            skipPast('>');
        } else if (c == '#') {
            skipPast(')');
            return false;
        } else {
            while (at < regex.length() && regex.charAt(at) != ':' && regex.charAt(at) != ')') at++;
            boolean flagsOnly = at < regex.length() && regex.charAt(at) == ')';
            at++;
            return !flagsOnly;
        }
        return true;
    }

    private void skipClass() {
        at++;
        if (at < regex.length() && regex.charAt(at) == '^') at++;
        if (at < regex.length() && regex.charAt(at) == ']') at++;
        for (int depth = 1; at < regex.length() && depth > 0; at++) {
            char c = regex.charAt(at);
            if (c == '\\') at++;
            else if (c == '[') depth++;
            else if (c == ']') depth--;
        }
    }

    /** The escaped character when it is plain punctuation, otherwise -1. */
    private int escape() {
        at++;
        if (at >= regex.length()) return -1;
        char c = regex.charAt(at++);
        if (c == 'Q') {
            int end = regex.indexOf("\\E", at);
            at = end < 0 ? regex.length() : end + 2;
            return -1;
        }
        if ((c == 'p' || c == 'P' || c == 'x' || c == 'N' || c == 'k') && at < regex.length()
                && (regex.charAt(at) == '{' || regex.charAt(at) == '<')) {
            skipPast(regex.charAt(at) == '{' ? '}' : '>');
            return -1;
        }
        if (Character.isLetterOrDigit(c)) {
            while (Character.isDigit(c) && at < regex.length() && Character.isDigit(regex.charAt(at))) at++;
            return -1;
        }
        return c;
    }

    /** {min, max} of a quantifier at the current position, or null. */
    private int[] quantifier() {
        if (at >= regex.length()) return null;
        char c = regex.charAt(at);
        int[] repeat;
        if (c == '*') repeat = new int[] {0, Integer.MAX_VALUE};
        else if (c == '+') repeat = new int[] {1, Integer.MAX_VALUE};
        else if (c == '?') repeat = new int[] {0, 1};
        else if (c == '{') {
            Matcher bounds = BOUNDS.matcher(regex).region(at, regex.length());
            if (!bounds.lookingAt()) return null;
            int min = count(bounds.group(1));
            int max = bounds.group(2) == null ? min : bounds.group(3).isEmpty() ? Integer.MAX_VALUE : count(bounds.group(3));
            repeat = new int[] {min, max};
            at = bounds.end() - 1;
        } else return null;
        at++;
        if (at < regex.length() && (regex.charAt(at) == '?' || regex.charAt(at) == '+')) at++;
        return repeat;
    }

    private static int count(String digits) {
        return digits.length() > 9 ? Integer.MAX_VALUE : Integer.parseInt(digits);
    }

    /** A missing end cannot happen in an expression that compiled; it is refused rather than guessed. */
    private void skipPast(char end) {
        int found = regex.indexOf(end, at);
        if (found < 0) unsafe = true;
        at = found < 0 ? regex.length() : found + 1;
    }

    /** Rules match case-insensitively, so two starts that differ only in case are the same start. */
    private static int fold(int codePoint) {
        return Character.toLowerCase(Character.toUpperCase(codePoint));
    }
}
