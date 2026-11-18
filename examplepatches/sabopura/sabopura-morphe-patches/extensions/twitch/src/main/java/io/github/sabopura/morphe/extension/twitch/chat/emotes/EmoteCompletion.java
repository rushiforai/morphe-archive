// Ranking follows ryykitty/twitch-patched (GPL-3.0); see NOTICE.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.function.Predicate;

/** What the ':' suggestions show and how a closed ":name:" resolves. */
final class EmoteCompletion {
    private EmoteCompletion() {}

    /** Case-insensitive matches of {@code query} anywhere: prefix matches first, each group alphabetically. */
    static List<String> rank(Collection<String> names, String query, int limit) {
        String needle = query.toLowerCase(Locale.ROOT);
        List<String> found = new ArrayList<>();
        for (String name : names) if (name.toLowerCase(Locale.ROOT).contains(needle)) found.add(name);
        found.sort(Comparator.comparing((String name) -> !name.toLowerCase(Locale.ROOT).startsWith(needle))
                .thenComparing(String.CASE_INSENSITIVE_ORDER));
        return new ArrayList<>(found.subList(0, Math.min(limit, found.size())));
    }

    /** The bare emote name when {@code token} is {@code :name:} of a known emote, else null. */
    static String closedName(String token, Predicate<String> known) {
        if (token.length() < 3 || token.charAt(0) != ':' || token.charAt(token.length() - 1) != ':') return null;
        String name = token.substring(1, token.length() - 1);
        return known.test(name) ? name : null;
    }
}
