package io.github.sabopura.morphe.extension.twitch.chat;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.function.Supplier;

/** Literal rules: no user-supplied regular expressions run on Twitch's UI thread. */
public final class ChatRules {
    private final List<String> blocked;
    private final List<String> highlighted;
    private final Set<String> users;
    private final Set<String> highlightedUsers;

    public ChatRules(String words, String usernames, String highlights, String highlightUsernames) {
        blocked = lines(words);
        highlighted = lines(highlights);
        users = names(usernames);
        highlightedUsers = names(highlightUsernames);
    }

    private static Set<String> names(String text) {
        Set<String> names = new HashSet<>();
        for (String user : lines(text)) names.add(user.startsWith("@") ? user.substring(1) : user);
        return names;
    }

    public boolean blocks(String text, String username, String userId) {
        return blocksUser(username, userId) || !blocked.isEmpty() && contains(blocked, normalize(text));
    }

    /** {@link #blocks} for text that is folded by {@link #normalize} only when a word rule needs it. */
    public boolean blocksFolded(Supplier<String> folded, String username, String userId) {
        return blocksUser(username, userId) || !blocked.isEmpty() && contains(blocked, folded.get());
    }

    private boolean blocksUser(String username, String userId) {
        return named(users, username, userId);
    }

    /** True for a sender whose every message is highlighted. */
    public boolean highlightsUser(String username, String userId) {
        return named(highlightedUsers, username, userId);
    }

    private static boolean named(Set<String> names, String username, String userId) {
        return !names.isEmpty() && (names.contains(normalize(username)) || names.contains(normalize(userId)));
    }

    public boolean highlights(String text) {
        return !highlighted.isEmpty() && contains(highlighted, normalize(text));
    }

    public boolean highlightsFolded(Supplier<String> folded) {
        return !highlighted.isEmpty() && contains(highlighted, folded.get());
    }

    private static boolean contains(List<String> rules, String folded) {
        for (String rule : rules) if (folded.contains(rule)) return true;
        return false;
    }

    private static List<String> lines(String text) {
        List<String> result = new ArrayList<>();
        if (text == null) return result;
        for (String line : text.split("[\\r\\n]+")) {
            String normalized = normalize(line);
            if (!normalized.isEmpty()) result.add(normalized);
            if (result.size() == 200) break;
        }
        return result;
    }

    /**
     * The message of a rendered chat row ("badges Name: message"), so word rules do not match
     * the sender's name. Rows without a name, such as notices, are used whole.
     */
    public static String body(String row) {
        if (row == null) return "";
        int split = row.indexOf(": ");
        return split < 0 ? row : row.substring(split + 2);
    }

    /** Whether {@code body} names {@code login} (lower case) as a whole word, with or without an @. */
    public static boolean mentions(String body, String login) {
        if (body == null || login == null || login.isEmpty()) return false;
        String lower = body.toLowerCase(Locale.ROOT);
        for (int at = lower.indexOf(login); at >= 0; at = lower.indexOf(login, at + 1)) {
            boolean startOk = at == 0 || !loginCharacter(lower.charAt(at - 1));
            int end = at + login.length();
            if (startOk && (end == lower.length() || !loginCharacter(lower.charAt(end)))) return true;
        }
        return false;
    }

    private static boolean loginCharacter(char value) {
        return value == '_' || value >= '0' && value <= '9' || value >= 'a' && value <= 'z';
    }

    /** Folds width, case, katakana to hiragana, and removes whitespace. */
    public static String normalize(String text) {
        if (text == null) return "";
        String folded = Normalizer.normalize(text, Normalizer.Form.NFKC).toLowerCase(Locale.ROOT);
        StringBuilder result = new StringBuilder(folded.length());
        for (int index = 0; index < folded.length(); index++) {
            char value = folded.charAt(index);
            if (Character.isWhitespace(value) || value == '⁠') continue;
            if (value >= 'ァ' && value <= 'ヶ') value = (char) (value - 0x60);
            result.append(value);
        }
        return result.toString();
    }
}
