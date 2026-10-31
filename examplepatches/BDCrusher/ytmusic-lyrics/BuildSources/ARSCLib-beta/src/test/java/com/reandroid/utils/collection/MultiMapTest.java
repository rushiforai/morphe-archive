package com.reandroid.utils.collection;

import com.reandroid.arsc.item.TableString;
import com.reandroid.arsc.pool.TableStringPool;
import org.junit.Assert;
import org.junit.Test;

import java.util.Iterator;
import java.util.List;

public class MultiMapTest {

    @Test
    public void testValuesSortedAndDistinct() {
        MultiMap<String, Integer> map = new MultiMap<>();
        map.setFavouriteObjectsSorter(Integer::compare);
        Integer three = 3;
        map.put("key", three);
        map.put("key", 1);
        map.put("key", three);
        map.put("key", 2);
        map.put("key", three);

        Iterator<Integer> iterator = map.getAll("key");
        Assert.assertEquals(Integer.valueOf(1), iterator.next());
        Assert.assertEquals(Integer.valueOf(2), iterator.next());
        Assert.assertEquals(Integer.valueOf(3), iterator.next());
        Assert.assertFalse(iterator.hasNext());
        Assert.assertEquals(Integer.valueOf(1), map.get("key"));
    }

    @Test
    public void testRemoveValueAddedTwice() {
        MultiMap<String, Integer> map = new MultiMap<>();
        Integer one = 1;
        Integer two = 2;
        map.put("key", one);
        map.put("key", two);
        map.put("key", one);
        map.put("key", two);

        map.remove("key", one);
        Assert.assertEquals(two, map.get("key"));
        Assert.assertFalse(map.containsValue("key", value -> value == one));
    }

    @Test
    public void testManyStringsSetToSameText() {
        TableStringPool pool = new TableStringPool(true);
        int count = 200000;
        for (int i = 0; i < count; i++) {
            pool.getOrCreate("string " + i);
        }
        List<TableString> unused = pool.listUnused();
        Assert.assertEquals(count, unused.size());

        // Each string joined the same, ever growing entry, which was sorted again every time
        long start = System.nanoTime();
        for (TableString item : unused) {
            item.set("");
        }
        long millis = (System.nanoTime() - start) / 1000000;
        Assert.assertTrue("Took " + millis + " ms", millis < 10000);

        Assert.assertFalse(pool.contains("string 0"));
        Assert.assertEquals(count, CollectionUtil.count(pool.getAll("")));
        Assert.assertSame(pool.get(0), pool.getString(""));
    }
}
