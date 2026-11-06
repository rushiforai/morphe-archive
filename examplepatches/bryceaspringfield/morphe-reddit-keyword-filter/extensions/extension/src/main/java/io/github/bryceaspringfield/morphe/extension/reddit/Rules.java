package io.github.bryceaspringfield.morphe.extension.reddit;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

/**
 * A keyword list, one rule a line:
 * <ul>
 *     <li>{@code r/name}: posts in the community {@code name}.</li>
 *     <li>{@code u/name}: posts or comments by the account {@code name}.</li>
 *     <li>{@code flair:Text}: posts whose flair is {@code Text}; {@code !flair:Text}: posts without it.</li>
 *     <li>{@code "phrase"}: the phrase as whole words.</li>
 *     <li>Any other text: the text anywhere, case-insensitively.</li>
 * </ul>
 * Any rule may start with communities and a colon ({@code r/pics: cat} or {@code r/pics, r/aww: flair:Meme}),
 * which limits it to posts in those communities; a rule without one applies everywhere.
 */
final class Rules {

    enum Kind {COMMUNITY, AUTHOR, FLAIR, NOT_FLAIR, PHRASE, TEXT}

    static final class Rule {
        final Kind kind;
        final String value;
        final Pattern pattern;
        final Set<String> scope;

        Rule(Kind kind, String value, Set<String> scope) {
            this.kind = kind;
            this.value = value;
            this.scope = scope;
            this.pattern = kind == Kind.PHRASE
                    ? Pattern.compile("(?<![\\p{L}\\p{N}_])" + Pattern.quote(value) + "(?![\\p{L}\\p{N}_])")
                    : null;
        }

        /**
         * Whether the rule applies to an item of these communities and accounts (names without r/ or u/).
         */
        boolean inScope(Collection<String> communities, Collection<String> accounts) {
            if (scope.isEmpty()) return true;
            for (String community : communities) {
                if (scope.contains("r/" + community)) return true;
            }
            for (String account : accounts) {
                if (scope.contains("u/" + account)) return true;
            }
            return false;
        }

        boolean matchesText(String text) {
            if (text == null || text.isEmpty()) return false;
            return kind == Kind.PHRASE ? pattern.matcher(text).find() : text.contains(value);
        }
    }

    final String source;
    final List<Rule> rules = new ArrayList<>();

    Rules(String source) {
        this.source = source == null ? "" : source;
        for (String line : this.source.split("\n")) {
            Rule rule = parse(line.trim());
            if (rule != null) rules.add(rule);
        }
    }

    private static Rule parse(String line) {
        if (line.isEmpty() || line.startsWith("#")) return null;
        String lower = line.toLowerCase(Locale.ROOT);
        Set<String> scope = new HashSet<>();

        // Communities and accounts before a colon limit the rule to them.
        Prefix prefix = prefix(line);
        if (prefix != null) {
            scope = new HashSet<>(prefix.scopes);
            line = prefix.rest;
            lower = line.toLowerCase(Locale.ROOT);
            if (lower.isEmpty()) return new Rule(Kind.COMMUNITY, "", scope);
        }

        if (lower.startsWith("!flair:") && lower.length() > 7) {
            return new Rule(Kind.NOT_FLAIR, flairKey(unquote(lower.substring(7))), scope);
        }
        if (lower.startsWith("flair:") && lower.length() > 6) {
            return new Rule(Kind.FLAIR, flairKey(unquote(lower.substring(6))), scope);
        }
        if (lower.length() > 2 && lower.startsWith("r/") && !lower.contains(" ")) {
            return new Rule(Kind.COMMUNITY, community(lower.substring(2)), scope);
        }
        if (lower.length() > 2 && lower.startsWith("u/") && !lower.contains(" ")) {
            return new Rule(Kind.AUTHOR, lower.substring(2), scope);
        }
        if (lower.length() > 2 && lower.startsWith("\"") && lower.endsWith("\"")) {
            return new Rule(Kind.PHRASE, lower.substring(1, lower.length() - 1), scope);
        }
        return new Rule(Kind.TEXT, lower, scope);
    }

    /**
     * The communities and accounts a rule line starts with ("r/pics, u/name: cat"), as scope keys.
     */
    static final class Prefix {
        final List<String> scopes;
        final String rest;

        Prefix(List<String> scopes, String rest) {
            this.scopes = scopes;
            this.rest = rest;
        }
    }

    static Prefix prefix(String line) {
        String lower = line.toLowerCase(Locale.ROOT);
        int colon = lower.indexOf(':');
        if (colon <= 2 || !(lower.startsWith("r/") || lower.startsWith("u/"))) return null;
        String head = lower.substring(0, colon);
        if (head.endsWith("flair")) return null;
        List<String> scopes = new ArrayList<>();
        for (String part : head.split(",")) {
            String name = part.trim();
            if (name.length() <= 2 || name.contains(" ") || !(name.startsWith("r/") || name.startsWith("u/"))) return null;
            scopes.add(scopeKey(name));
        }
        return new Prefix(scopes, line.substring(colon + 1).trim());
    }

    /**
     * A community or account as a scope key: "r/name" or "u/name", lowercase.
     */
    static String scopeKey(String name) {
        name = name.trim().toLowerCase(Locale.ROOT);
        if (name.startsWith("u/")) return "u/" + name.substring(2).trim();
        return "r/" + community(name);
    }

    private static final Pattern SHORTCODE = Pattern.compile(":[\\p{L}_][\\p{L}\\p{N}_+\\-]*:");
    private static final Pattern SPACES = Pattern.compile("\\s+");

    /**
     * A flair as stored and shown: lower case, in Unicode's compatibility form (NFKC), without emoji or :emoji:
     * codes, with single spaces.
     */
    static String flairKey(String text) {
        if (text == null) return "";
        String s = Normalizer.normalize(text, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        s = SHORTCODE.matcher(s).replaceAll(" ");
        StringBuilder out = new StringBuilder(s.length());
        s.codePoints().forEach(c -> {
            int type = Character.getType(c);
            boolean drop = type == Character.OTHER_SYMBOL || type == Character.SURROGATE || type == Character.FORMAT
                    || type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK
                    || type == Character.PRIVATE_USE || type == Character.UNASSIGNED;
            out.appendCodePoint(drop ? ' ' : c);
        });
        return SPACES.matcher(out).replaceAll(" ").trim();
    }

    /**
     * A flair's letters and digits alone, for matching: "Meme", "MEME :snoo:", and "[Meme]" all give "meme".
     */
    static String flairMatchKey(String text) {
        String key = flairKey(text);
        StringBuilder out = new StringBuilder(key.length());
        key.codePoints().forEach(c -> {
            if (Character.isLetterOrDigit(c)) out.appendCodePoint(c);
        });
        return out.toString();
    }

    private static String unquote(String text) {
        text = text.trim();
        if (text.length() > 1 && text.startsWith("\"") && text.endsWith("\"")) {
            text = text.substring(1, text.length() - 1);
        }
        return text.trim();
    }

    /**
     * A community name as compared: lowercase, without the r/ prefix.
     */
    static String community(String name) {
        name = name == null ? "" : name.trim().toLowerCase(Locale.ROOT);
        return name.startsWith("r/") ? name.substring(2) : name;
    }

    boolean isEmpty() {
        return rules.isEmpty();
    }

    int size() {
        return rules.size();
    }
}
