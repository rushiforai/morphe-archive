package app.template.extension.extension;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

/** Unit tests for the identity-keyed LRU shared by the Reddit listing helpers. */
public class ProteusListMemoTest {

    @Test
    public void sameListReturnsMemoizedOutput() {
        List<String> list = new ArrayList<>(Arrays.asList("a", "b"));
        List<String> output = new ArrayList<>(Collections.singletonList("a"));
        ProteusListMemo.put(list, output);
        assertSame(output, ProteusListMemo.get(list));
    }

    @Test
    public void equalContentNewInstanceIsAMiss() {
        List<String> first = new ArrayList<>(Collections.singletonList("x"));
        List<String> second = new ArrayList<>(Collections.singletonList("x"));
        ProteusListMemo.put(first, first);
        assertNull(ProteusListMemo.get(second));
    }

    @Test
    public void staleEntryIsDiscardedWhenSizeChanges() {
        List<String> list = new ArrayList<>();
        list.add("only");
        ProteusListMemo.put(list, list);
        assertSame(list, ProteusListMemo.get(list));
        list.add("more");
        assertNull(ProteusListMemo.get(list));
    }

    @Test
    public void eldestEntryIsEvictedBeyondCapacity() {
        List<List<String>> created = new ArrayList<>();
        for (int i = 0; i < 17; i++) {
            List<String> list = new ArrayList<>(Collections.singletonList("item-" + i));
            created.add(list);
            ProteusListMemo.put(list, list);
        }
        assertNull("oldest fresh list should have been evicted",
                ProteusListMemo.get(created.get(0)));
        assertSame(created.get(16), ProteusListMemo.get(created.get(16)));
    }
}
