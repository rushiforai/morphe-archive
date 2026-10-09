package software.santodan.extension.nuviomerged;
import java.util.*;
/** Tracks only the current bounded metadata cache; unchanged entries need no publication. */
public final class NuvioBadgeDelta {
    private Map<String, List<Object>> previous = Collections.emptyMap();
    public synchronized <T> Map<String, Set<T>> changed(Map<String, Set<T>> history, Map<?, ?> cache) {
        Map<String, List<Object>> current = new HashMap<>();
        Map<String, Set<T>> changed = new LinkedHashMap<>();
        for (Map.Entry<?, ?> entry : cache.entrySet()) {
            String key = String.valueOf(entry.getKey());
            if (!(entry.getValue() instanceof Set)) continue;
            String id;
            if (key.startsWith("series:")) id = key.substring(7);
            else if (key.startsWith("tv:")) id = key.substring(3);
            else continue;
            Set<T> watched = history.get(id);
            if (watched == null) continue;
            // Keep the same series-first preference as native publishBadgeUpdate.
            Object aired = cache.get("series:" + id);
            if (!(aired instanceof Set)) aired = entry.getValue();
            List<Object> state = Arrays.asList(watched, aired);
            current.put(id, state);
            if (!state.equals(previous.get(id))) changed.put(id, watched);
        }
        previous = current;
        return changed;
    }
}
