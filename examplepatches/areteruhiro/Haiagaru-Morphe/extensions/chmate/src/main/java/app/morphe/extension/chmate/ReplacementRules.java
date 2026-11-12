package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Immutable, bounded literal and opt-in regex replacement rules. No Android dependencies. */
public final class ReplacementRules {
    private static final int MAX_RESULT = 262144;
    private static final long REGEX_BUDGET_NS = 30_000_000L;
    private final List<Rule> rules;
    private ReplacementRules(List<Rule> rules) { this.rules = rules; }
    public static ReplacementRules empty() { return new ReplacementRules(new ArrayList<>()); }
    public int size() { return rules.size(); }

    public static ReplacementRules parse(String text) {
        if (text.length() > 131072) throw new IllegalArgumentException("TXTは128KBまでです");
        List<Rule> rules = new ArrayList<>();
        String[] lines = text.replace("\uFEFF", "").split("\r?\n", -1);
        for (int index = 0; index < lines.length; index++) {
            String line = lines[index];
            String trimmed = line.trim();
            if (trimmed.isEmpty() || trimmed.startsWith(";") || trimmed.startsWith("'")
                    || trimmed.startsWith("//")) continue;
            String[] columns = line.split("\t", -1);
            if (columns.length < 2 || columns.length > 4) throw invalid(index, "タブ区切りの2～4列で指定してください");
            String search = columns[0];
            boolean sensitive = false;
            boolean regex = false;
            if (search.startsWith("<ex2>")) { sensitive = true; search = search.substring(5); }
            else if (search.startsWith("<ex>")) search = search.substring(4);
            else if (search.startsWith("<rx2>")) { sensitive = true; regex = true; search = search.substring(5); }
            else if (search.startsWith("<rx>")) { regex = true; search = search.substring(4); }
            else if (search.startsWith("<")) throw invalid(index, "対応する指定は<ex>、<ex2>、<rx>、<rx2>です");
            String target = columns.length >= 3 ? columns[2] : "msg";
            if (!target.isEmpty() && !target.equals("msg") && !target.equals("all"))
                throw invalid(index, "置換対象は本文(msg)のみです");
            if (columns.length == 4 && !columns[3].isEmpty()) throw invalid(index, "URL・タイトル条件は未対応です");
            if (search.isEmpty() || search.length() > 1024 || columns[1].length() > 4096)
                throw invalid(index, "検索文字は1～1024文字、置換後は4096文字までです");
            if (rules.size() >= 256) throw invalid(index, "ルールは256件までです");
            try {
                Pattern compiled = Pattern.compile(regex ? search : Pattern.quote(search), sensitive ? 0
                        : Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
                rules.add(new Rule(compiled, columns[1], regex));
            } catch (java.util.regex.PatternSyntaxException invalid) {
                throw invalid(index, "正規表現が不正です: " + invalid.getDescription());
            }
        }
        return new ReplacementRules(rules);
    }

    private static IllegalArgumentException invalid(int index, String message) {
        return new IllegalArgumentException((index + 1) + "行目: " + message);
    }

    public String apply(String input) {
        if (input == null || input.length() > 65536 || rules.isEmpty()) return input;
        String text = input;
        for (Rule rule : rules) {
            try {
                // Java's backtracking regex engine may run on a render thread. Bound the
                // work, not only the output size, even for user-supplied nested patterns.
                Matcher matcher = rule.pattern.matcher(rule.regex
                        ? new TimedText(text, System.nanoTime() + REGEX_BUDGET_NS) : text);
                if (!matcher.find()) continue;
                StringBuilder output = new StringBuilder(text.length());
                int end = 0, matches = 0;
                do {
                    if (++matches > 8192 || (long) output.length() + matcher.start() - end > MAX_RESULT)
                        return input;
                    output.append(text, end, matcher.start());
                    if (rule.regex) appendRegexReplacement(output, matcher, rule.replacement);
                    else appendBounded(output, rule.replacement);
                    end = matcher.end();
                } while (matcher.find());
                if ((long) output.length() + text.length() - end > MAX_RESULT) return input;
                text = output.append(text, end, text.length()).toString();
            } catch (IllegalArgumentException | RegexTimeout invalid) {
                // An invalid group reference or expensive match must never block a thread.
                return input;
            }
        }
        return text;
    }

    private static void appendBounded(StringBuilder output, String addition) {
        if ((long) output.length() + addition.length() > MAX_RESULT)
            throw new IllegalArgumentException("置換後の文字数上限を超えました");
        output.append(addition);
    }

    /** Java Matcher-compatible $1/${name} and backslash escapes for regex rules only. */
    private static void appendRegexReplacement(StringBuilder output, Matcher match, String replacement) {
        for (int i = 0; i < replacement.length(); i++) {
            char current = replacement.charAt(i);
            if (current == '\\') {
                if (++i == replacement.length()) throw new IllegalArgumentException("末尾のエスケープ");
                appendBounded(output, String.valueOf(replacement.charAt(i)));
            } else if (current == '$') {
                if (++i == replacement.length()) throw new IllegalArgumentException("グループ指定が不正");
                String value;
                if (replacement.charAt(i) == '{') {
                    int close = replacement.indexOf('}', i + 1);
                    if (close < 0 || close == i + 1) throw new IllegalArgumentException("名前付きグループが不正");
                    value = match.group(replacement.substring(i + 1, close)); i = close;
                } else {
                    char digit = replacement.charAt(i);
                    if (digit < '0' || digit > '9') throw new IllegalArgumentException("グループ番号が不正");
                    int group = digit - '0';
                    if (group > match.groupCount()) throw new IllegalArgumentException("存在しないグループ");
                    while (i + 1 < replacement.length() && Character.isDigit(replacement.charAt(i + 1))) {
                        int candidate = group * 10 + replacement.charAt(i + 1) - '0';
                        if (candidate > match.groupCount()) break;
                        group = candidate; i++;
                    }
                    value = match.group(group);
                }
                if (value != null) appendBounded(output, value);
            } else appendBounded(output, String.valueOf(current));
        }
    }

    private static final class RegexTimeout extends RuntimeException { }
    private static final class TimedText implements CharSequence {
        private final CharSequence text;
        private final long deadline;
        private int calls;
        TimedText(CharSequence text, long deadline) { this.text = text; this.deadline = deadline; }
        @Override public int length() { return text.length(); }
        @Override public char charAt(int index) {
            if ((++calls & 255) == 0 && System.nanoTime() - deadline >= 0) throw new RegexTimeout();
            return text.charAt(index);
        }
        @Override public CharSequence subSequence(int start, int end) {
            return new TimedText(text.subSequence(start, end), deadline);
        }
        @Override public String toString() { return text.toString(); }
    }

    private static final class Rule {
        final Pattern pattern;
        final String replacement;
        final boolean regex;
        Rule(Pattern pattern, String replacement, boolean regex) {
            this.pattern = pattern; this.replacement = replacement; this.regex = regex;
        }
    }
}
