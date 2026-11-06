package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.RECENT_COMMUNITIES;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.getString;
import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.putString;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * The communities whose feeds the user opened, newest first, offered as suggestions in the list of communities to
 * hide. Every profile shares the list.
 */
final class RecentCommunities {

    private static final int MAX_KEPT = 30;
    private static volatile String last = "";

    private RecentCommunities() {
    }

    /** Records a community feed opened, as its name without r/. */
    static void visited(String community) {
        if (community == null) return;
        String trimmed = community.trim();
        String name = trimmed.regionMatches(true, 0, "r/", 0, 2) ? trimmed.substring(2) : trimmed;
        if (name.isEmpty() || name.equalsIgnoreCase(last)) return;
        last = name;
        List<String> names = list();
        names.removeIf(n -> n.equalsIgnoreCase(name));
        names.add(0, name);
        while (names.size() > MAX_KEPT) names.remove(names.size() - 1);
        putString(RECENT_COMMUNITIES, String.join("\n", names));
    }

    /** The communities opened, newest first. */
    static List<String> list() {
        List<String> names = new ArrayList<>();
        for (String line : getString(RECENT_COMMUNITIES, "").split("\n")) {
            if (!line.trim().isEmpty()) names.add(line.trim());
        }
        return names;
    }
}
