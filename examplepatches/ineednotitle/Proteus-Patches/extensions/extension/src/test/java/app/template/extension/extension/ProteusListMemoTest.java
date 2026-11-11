package app.template.extension.extension;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;

/** Unit tests for the identity- and helper-keyed LRU shared by Reddit filters. */
public class ProteusListMemoTest {

    private static final String TAG = "test";

    @Test
    public void sameListReturnsMemoizedOutput() {
        List<String> list = new ArrayList<>(Arrays.asList("a", "b"));
        List<String> output = new ArrayList<>(Collections.singletonList("a"));
        ProteusListMemo.put(TAG, list, output);
        assertSame(output, ProteusListMemo.get(TAG, list));
    }

    @Test
    public void differentHelperTagsDoNotCollide() {
        List<String> list = new ArrayList<>(Arrays.asList("a", "b"));
        List<String> first = new ArrayList<>(Collections.singletonList("a"));
        List<String> second = new ArrayList<>(Collections.singletonList("b"));
        ProteusListMemo.put("first", list, first);
        assertNull(ProteusListMemo.get("second", list));
        ProteusListMemo.put("second", list, second);
        assertSame(first, ProteusListMemo.get("first", list));
        assertSame(second, ProteusListMemo.get("second", list));
    }

    @Test
    public void equalContentNewInstanceIsAMiss() {
        List<String> first = new ArrayList<>(Collections.singletonList("x"));
        List<String> second = new ArrayList<>(Collections.singletonList("x"));
        ProteusListMemo.put(TAG, first, first);
        assertNull(ProteusListMemo.get(TAG, second));
    }

    @Test
    public void staleEntryIsDiscardedWhenSizeChanges() {
        List<String> list = new ArrayList<>();
        list.add("only");
        ProteusListMemo.put(TAG, list, list);
        assertSame(list, ProteusListMemo.get(TAG, list));
        list.add("more");
        assertNull(ProteusListMemo.get(TAG, list));
    }

    @Test
    public void eldestEntryIsEvictedBeyondCapacity() {
        List<List<String>> created = new ArrayList<>();
        for (int i = 0; i < 33; i++) {
            List<String> list = new ArrayList<>(Collections.singletonList("item-" + i));
            created.add(list);
            ProteusListMemo.put(TAG, list, list);
        }
        assertNull("oldest fresh list should have been evicted",
                ProteusListMemo.get(TAG, created.get(0)));
        assertSame(created.get(32), ProteusListMemo.get(TAG, created.get(32)));
    }
}
