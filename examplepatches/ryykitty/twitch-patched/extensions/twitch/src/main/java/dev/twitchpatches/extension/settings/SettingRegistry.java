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
        SettingEntry entry = options.get(key);
        return entry instanceof SettingGroup ? (SettingGroup) entry : null;
    }
}
