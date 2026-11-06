package dev.twitchpatches.extension.settings;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

final class SettingRegistry {
    private final Map<String, SettingEntry> options = new LinkedHashMap<>();

    synchronized void register(SettingEntry option) {
        if (options.containsKey(option.key())) throw new IllegalStateException("Duplicate patch setting.");
        options.put(option.key(), option);
    }

    synchronized List<SettingEntry> snapshot() {
        List<SettingEntry> result = new ArrayList<>(options.values());
        result.sort(Comparator.comparing(SettingEntry::section).thenComparing(SettingEntry::title));
        return result;
    }

    synchronized SettingGroup group(String key) {
        if (key == null) return null;
        return findGroup(new ArrayList<>(options.values()), key, new java.util.HashSet<>());
    }

    private SettingGroup findGroup(List<? extends SettingEntry> entries, String key, java.util.Set<String> visited) {
        for (SettingEntry entry : entries) {
            if (!(entry instanceof SettingGroup)) continue;
            SettingGroup group = (SettingGroup) entry;
            if (!visited.add(group.key())) throw new IllegalStateException("Duplicate settings group: " + group.key());
            if (key.equals(group.key())) return group;
            SettingGroup child = findGroup(group.children(), key, visited);
            if (child != null) return child;
        }
        return null;
    }
}
