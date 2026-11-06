package dev.twitchpatches.extension.settings;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.Comparator;

final class SettingsSearch {
    static final class Result {
        final SettingEntry entry;
        final String context;
        final int rank;
        Result(SettingEntry entry, String context, int rank) { this.entry = entry; this.context = context; this.rank = rank; }
        String summary() { return context + (entry.summary().isEmpty() ? "" : "\n" + entry.summary()); }
    }

    static List<Result> find(List<? extends SettingEntry> entries, String query, String scope) {
        List<Result> results = new ArrayList<>();
        String normalized = query.trim().toLowerCase(Locale.ROOT);
        if (normalized.isEmpty()) return results;
        visit(entries, normalized.split("\\s+"), scope, null, results, new HashSet<>());
        results.sort(Comparator.comparingInt(result -> result.rank));
        return results;
    }

    private static void visit(List<? extends SettingEntry> entries, String[] words, String path, SettingSection parentSection,
            List<Result> results, Set<String> visited) {
        for (SettingEntry entry : entries) {
            String identity = (entry instanceof SettingGroup ? "group:" : "setting:") + entry.key();
            if (!visited.add(identity)) throw new IllegalStateException("Duplicate settings entry: " + entry.key());
            String context = parentSection == entry.section() ? path : path.isEmpty()
                    ? entry.section().title() : path + " / " + entry.section().title();
            String searchable = (context + " " + entry.title() + " " + entry.summary()).toLowerCase(Locale.ROOT);
            if (contains(searchable, words)) {
                String title = entry.title().toLowerCase(Locale.ROOT);
                int rank = title.equals(String.join(" ", words)) ? 0 : contains(title, words) ? 1 : 2;
                results.add(new Result(entry, context, rank));
            }
            if (entry instanceof SettingGroup)
                visit(((SettingGroup) entry).children(), words, context + " / " + entry.title(), entry.section(), results, visited);
        }
    }

    private static boolean contains(String value, String[] words) {
        for (String word : words) if (!value.contains(word)) return false;
        return true;
    }
}
