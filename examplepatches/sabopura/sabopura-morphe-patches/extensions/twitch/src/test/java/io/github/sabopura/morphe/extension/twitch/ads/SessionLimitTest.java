package io.github.sabopura.morphe.extension.twitch.ads;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;

import org.junit.Test;

public class SessionLimitTest {
    private static Map<String, SessionLimit.Used> sessions(Object... keysAndTimes) {
        Map<String, SessionLimit.Used> map = new LinkedHashMap<>();
        for (int i = 0; i < keysAndTimes.length; i += 2) {
            long used = ((Number) keysAndTimes[i + 1]).longValue();
            map.put((String) keysAndTimes[i], () -> used);
        }
        return map;
    }

    private static void assertKeys(Map<String, ?> map, String... keys) {
        assertEquals(new LinkedHashSet<>(Arrays.asList(keys)), map.keySet());
    }

    /** The stream being watched was opened first, and the home feed then previews stream after stream. */
    @Test
    public void theStreamBeingPolledOutlivesNewerOnesNobodyPolls() {
        Map<String, SessionLimit.Used> map = sessions("watched", 9_000, "preview1", 0, "preview2", 0, "preview3", 0);
        SessionLimit.trim(map, "preview3", 2);
        assertKeys(map, "watched", "preview3");
    }

    @Test
    public void theOneJustOpenedStaysAlthoughNothingPolledItYet() {
        Map<String, SessionLimit.Used> map = sessions("a", 5_000, "b", 6_000, "new", 0);
        SessionLimit.trim(map, "new", 2);
        assertKeys(map, "b", "new");
    }

    @Test
    public void nothingIsDroppedWithinTheLimit() {
        Map<String, SessionLimit.Used> map = sessions("a", 1, "b", 2);
        SessionLimit.trim(map, "b", 2);
        assertKeys(map, "a", "b");
    }

    @Test
    public void aLimitBelowOneKeepsTheNewest() {
        Map<String, SessionLimit.Used> map = sessions("a", 1, "new", 0);
        SessionLimit.trim(map, "new", 0);
        assertKeys(map, "new");
    }
}
