package software.santodan.extension.nuviomerged;

import java.util.*;

/** Selects one coherent watched history per show; never unions episode numbering. */
public final class NuvioWatchedHistory {
    private NuvioWatchedHistory() {}

    public static Map<String, String> sources(Map<String, ? extends Map<String, ? extends Set<?>>> histories,
            Map<String, String> origins, Map<String, Set<String>> siblings) {
        Map<String, String> result = new LinkedHashMap<>(origins);
        Set<String> ids = new LinkedHashSet<>();
        histories.values().forEach(history -> ids.addAll(history.keySet()));
        for (String id : ids) {
            if (result.containsKey(id)) continue;
            String selected = null;
            Set<String> related = siblings.getOrDefault(id, Collections.emptySet());
            for (String alias : related.contains("__ambiguous__") ? Collections.<String>emptySet() : related) {
                if (origins.containsKey(alias)) { selected = origins.get(alias); break; }
            }
            if (selected == null) {
                int largest = -1;
                for (Map.Entry<String, ? extends Map<String, ? extends Set<?>>> entry : histories.entrySet()) {
                    Set<?> episodes = entry.getValue().get(id);
                    if (episodes != null && episodes.size() > largest) {
                        selected = entry.getKey();
                        largest = episodes.size();
                    }
                }
            }
            if (selected != null) result.put(id, selected);
        }
        return result;
    }

    public static <T> Map<String, Set<T>> select(Map<String, ? extends Map<String, Set<T>>> histories,
            Map<String, String> sources, Map<String, Set<String>> siblings) {
        Map<String, Set<T>> result = new LinkedHashMap<>();
        for (Map.Entry<String, String> entry : sources.entrySet()) {
            Map<String, Set<T>> history = histories.get(entry.getValue());
            if (history == null) continue;
            Set<T> episodes = history.get(entry.getKey());
            Set<String> related = siblings.getOrDefault(entry.getKey(), Collections.emptySet());
            if (episodes == null) for (String alias : related.contains("__ambiguous__") ? Collections.<String>emptySet() : related) {
                episodes = history.get(alias);
                if (episodes != null) break;
            }
            result.put(entry.getKey(), episodes == null ? Collections.emptySet() : new HashSet<>(episodes));
        }
        // Include alternate catalog IDs so library/collection cards need no details visit.
        for (Map.Entry<String, Set<String>> entry : siblings.entrySet()) {
            if (entry.getValue().contains("__ambiguous__")) continue;
            Set<T> episodes = result.get(entry.getKey());
            if (episodes == null) continue;
            for (String alias : entry.getValue()) result.putIfAbsent(alias, new HashSet<>(episodes));
        }
        return result;
    }
}
