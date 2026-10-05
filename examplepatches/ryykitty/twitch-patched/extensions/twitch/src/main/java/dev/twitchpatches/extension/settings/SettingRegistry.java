package dev.twitchpatches.extension.settings;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

final class SettingRegistry {
    private final Map<String, ToggleSetting> options = new LinkedHashMap<>();

    synchronized void register(ToggleSetting option) {
        if (options.containsKey(option.key())) throw new IllegalStateException("Duplicate patch setting.");
        options.put(option.key(), option);
    }

    synchronized List<ToggleSetting> snapshot() {
        List<ToggleSetting> result = new ArrayList<>(options.values());
        result.sort(Comparator.comparing(ToggleSetting::section).thenComparing(ToggleSetting::title));
        return result;
    }
}
