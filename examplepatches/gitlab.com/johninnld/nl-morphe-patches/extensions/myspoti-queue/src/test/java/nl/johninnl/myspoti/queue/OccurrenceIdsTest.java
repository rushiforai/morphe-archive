package nl.johninnl.myspoti.queue;

import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

public class OccurrenceIdsTest {
    @Test public void duplicatesStayDistinctThroughReorderAndTransition() {
        OccurrenceIds ids = new OccurrenceIds();
        Object first = List.of("track:a", "occurrence:1");
        Object second = List.of("track:a", "occurrence:2");
        Object third = List.of("track:b", "occurrence:3");
        List<Long> initial = ids.update(List.of(first, second, third));
        assertNotEquals(initial.get(0), initial.get(1));
        assertEquals(List.of(initial.get(0), initial.get(2), initial.get(1)), ids.update(List.of(first, third, second)));
        assertEquals(List.of(initial.get(1), initial.get(2)), ids.update(List.of(second, third)));
    }

    @Test public void missingProviderUidsStillGiveDuplicateRowsDifferentIds() {
        OccurrenceIds ids = new OccurrenceIds();
        List<Long> initial = ids.update(List.of("a", "a", "b"));
        assertNotEquals(initial.get(0), initial.get(1));
        assertEquals(initial, ids.update(List.of("a", "a", "b")));
    }

    @Test public void removedOrClearedOccurrencesCannotBeSelectedByRecycledId() {
        OccurrenceIds ids = new OccurrenceIds();
        long first = ids.update(List.of("a")).get(0);
        ids.update(List.of());
        long second = ids.update(List.of("a")).get(0);
        ids.clear();
        long third = ids.update(List.of("a")).get(0);
        assertTrue(first < second && second < third);
        assertNotEquals(-1L, third);
    }
}
