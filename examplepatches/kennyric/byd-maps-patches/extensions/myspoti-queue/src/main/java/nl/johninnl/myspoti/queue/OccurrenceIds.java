package nl.johninnl.myspoti.queue;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** IDs belong to occurrences, survive refresh/reorder, and are never recycled. */
final class OccurrenceIds {
    private Map<Object, ArrayDeque<Long>> previous = new HashMap<>();
    private long next = 1;

    List<Long> update(List<Object> keys) {
        Map<Object, ArrayDeque<Long>> retained = new HashMap<>();
        List<Long> result = new ArrayList<>(keys.size());
        for (Object key : keys) {
            ArrayDeque<Long> available = previous.get(key);
            long id = available == null || available.isEmpty() ? next++ : available.removeFirst();
            retained.computeIfAbsent(key, ignored -> new ArrayDeque<>()).addLast(id);
            result.add(id);
        }
        previous = retained;
        return result;
    }

    void clear() { previous.clear(); }
}
