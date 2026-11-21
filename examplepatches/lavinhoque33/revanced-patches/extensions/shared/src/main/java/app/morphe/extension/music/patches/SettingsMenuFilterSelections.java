/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License, version 3 or later.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.music.patches;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.patches.BaseSettingsMenuFilter.DiscoveredNode;

/** Music stores explicit key selections separately from exact, free-form titles. */
final class SettingsMenuFilterSelections {
    record Saved(String titles, String keys) {}

    private final Saved saved;
    private final Set<String> titles;
    private final Map<String, Boolean> keys;

    SettingsMenuFilterSelections(Saved saved) {
        this.saved = saved;
        titles = new HashSet<>();
        keys = new LinkedHashMap<>();

        for (String title : saved.titles().split("\n")) {
            String normalized = normalize(title);
            if (!normalized.isEmpty()) titles.add(normalized);
        }
        for (String line : saved.keys().split("\n")) {
            String entry = line.trim();
            if (entry.isEmpty()) continue;
            boolean hidden = !entry.startsWith("!");
            keys.put(hidden ? entry : entry.substring(1), hidden);
        }
    }

    boolean isCurrent(String rawTitles, String rawKeys) {
        return saved.titles().equals(rawTitles) && saved.keys().equals(rawKeys);
    }

    boolean hasSelections() {
        return !titles.isEmpty() || !keys.isEmpty();
    }

    boolean isHidden(@Nullable String key, @Nullable String title) {
        Boolean explicit = key == null ? null : keys.get(key);
        return explicit != null ? explicit : matchesTitle(title);
    }

    private boolean matchesTitle(@Nullable String title) {
        return !titles.isEmpty() && titles.contains(normalize(title));
    }

    Saved toggle(DiscoveredNode node) {
        String key = node.key();
        if (key != null) {
            boolean hide = !isHidden(key, node.title());
            Map<String, Boolean> updated = new LinkedHashMap<>(keys);
            if (hide || matchesTitle(node.title())) {
                updated.put(key, hide);
            } else {
                updated.remove(key);
            }
            return new Saved(saved.titles(), encodeKeys(updated));
        }

        String selected = normalize(node.title());
        List<String> updated = new ArrayList<>();
        if (!saved.titles().isEmpty()) {
            for (String line : saved.titles().split("\n")) {
                if (!selected.equals(normalize(line))) updated.add(line);
            }
        }
        if (!titles.contains(selected)) updated.add(node.title());
        return new Saved(String.join("\n", updated), saved.keys());
    }

    /** Ambiguous, unobserved, and free-form entries remain literal titles, never guessed keys. */
    Saved migrate(Map<String, String> stockAliases, List<DiscoveredNode> rows) {
        if (titles.isEmpty() || stockAliases.isEmpty()) return saved;

        Set<String> mountedKeys = new HashSet<>();
        Map<String, String> mountedAliases = new LinkedHashMap<>();
        for (DiscoveredNode row : rows) {
            if (row.key() != null) mountedKeys.add(row.key());
            addAlias(mountedAliases, row.title(), row.key() == null ? "" : row.key());
        }

        List<String> remaining = new ArrayList<>();
        Map<String, Boolean> migrated = new LinkedHashMap<>(keys);
        boolean changed = false;
        for (String line : saved.titles().split("\n")) {
            String title = normalize(line);
            String key = stockAliases.get(title);
            String mountedOwner = mountedAliases.getOrDefault(title, key);
            if (key != null && mountedKeys.contains(key) && key.equals(mountedOwner)) {
                migrated.putIfAbsent(key, true);
                changed = true;
            } else {
                remaining.add(line);
            }
        }
        return changed ? new Saved(String.join("\n", remaining), encodeKeys(migrated)) : saved;
    }

    static void addAlias(Map<String, String> aliases, String title, String key) {
        String normalized = normalize(title);
        if (!normalized.isEmpty()) {
            aliases.merge(normalized, key, (previous, next) -> previous.equals(next) ? previous : "");
        }
    }

    static String normalize(@Nullable String title) {
        return title == null ? "" : title.trim().toLowerCase(Locale.ROOT);
    }

    private static String encodeKeys(Map<String, Boolean> selected) {
        List<String> lines = new ArrayList<>(selected.size());
        selected.forEach((key, hidden) -> lines.add(hidden ? key : "!" + key));
        return String.join("\n", lines);
    }
}
