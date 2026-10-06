package app.morphe.extension.chmate;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Immutable, bounded literal replacement rules. No Android or filesystem dependencies. */
public final class ReplacementRules {
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
            if (search.startsWith("<ex2>")) { sensitive = true; search = search.substring(5); }
            else if (search.startsWith("<ex>")) search = search.substring(4);
            else if (search.startsWith("<")) throw invalid(index, "対応する指定は<ex>と<ex2>です（正規表現は未対応）");
            String target = columns.length >= 3 ? columns[2] : "msg";
            if (!target.isEmpty() && !target.equals("msg") && !target.equals("all"))
                throw invalid(index, "置換対象は本文(msg)のみです");
            if (columns.length == 4 && !columns[3].isEmpty()) throw invalid(index, "URL・タイトル条件は未対応です");
            if (search.isEmpty() || search.length() > 1024 || columns[1].length() > 4096)
                throw invalid(index, "検索文字は1～1024文字、置換後は4096文字までです");
            if (rules.size() >= 256) throw invalid(index, "ルールは256件までです");
            rules.add(new Rule(Pattern.compile(Pattern.quote(search), sensitive ? 0
                    : Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE), columns[1]));
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
            Matcher matcher = rule.pattern.matcher(text);
            if (!matcher.find()) continue;
            StringBuilder output = new StringBuilder(text.length());
            int end = 0;
            do {
                // Avoid allocating a huge result before checking the expansion limit.
                if ((long) output.length() + matcher.start() - end + rule.replacement.length() > 262144)
                    return input;
                output.append(text, end, matcher.start()).append(rule.replacement);
                end = matcher.end();
            } while (matcher.find());
            if ((long) output.length() + text.length() - end > 262144) return input;
            text = output.append(text, end, text.length()).toString();
        }
        return text;
    }

    private static final class Rule {
        final Pattern pattern;
        final String replacement;
        Rule(Pattern pattern, String replacement) { this.pattern = pattern; this.replacement = replacement; }
    }
}
