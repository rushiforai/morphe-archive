package com.reandroid.utils;

import org.junit.Assert;
import org.junit.Test;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

public class HashSetStoreTest {

    @Test
    public void testRandomAddRemoveMatchesHashSet() {
        Random random = new Random(7);
        Object[] pool = new Object[300];
        for (int i = 0; i < pool.length; i++) {
            // few distinct hash codes to force long probe runs
            final int id = i;
            pool[i] = new Object() {
                @Override
                public int hashCode() {
                    return id % 13;
                }
            };
        }
        Object container = null;
        Set<Object> expected = new HashSet<>();
        for (int round = 0; round < 20000; round++) {
            Object item = pool[random.nextInt(pool.length)];
            if (random.nextInt(3) == 0) {
                container = HashSetStore.remove(container, item);
                expected.remove(item);
            } else {
                container = HashSetStore.add(container, item);
                expected.add(item);
            }
            Assert.assertEquals(expected.size(), HashSetStore.size(container));
            if (round % 97 == 0) {
                assertSameElements(expected, container);
            }
        }
        assertSameElements(expected, container);
        for (Object item : pool) {
            Assert.assertEquals(expected.contains(item), HashSetStore.contains(container, item));
        }
    }

    @Test
    public void testSmallContainers() {
        Object a = "a";
        Object b = "b";
        Object container = HashSetStore.add(null, a);
        Assert.assertSame(a, container);
        container = HashSetStore.add(container, b);
        Assert.assertEquals(2, HashSetStore.size(container));
        container = HashSetStore.add(container, "b");
        Assert.assertEquals(2, HashSetStore.size(container));
        container = HashSetStore.remove(container, a);
        Assert.assertSame(b, container);
        container = HashSetStore.remove(container, b);
        Assert.assertNull(container);
        Assert.assertTrue(HashSetStore.isEmpty(container));
    }

    private static void assertSameElements(Set<Object> expected, Object container) {
        Set<Object> actual = new HashSet<>();
        Iterator<Object> iterator = HashSetStore.iterator(container);
        while (iterator.hasNext()) {
            Assert.assertTrue("duplicate element", actual.add(iterator.next()));
        }
        Assert.assertEquals(expected, actual);
        Iterator<Object> cloned = HashSetStore.clonedIterator(container);
        int count = 0;
        while (cloned.hasNext()) {
            Assert.assertTrue(expected.contains(cloned.next()));
            count++;
        }
        Assert.assertEquals(expected.size(), count);
    }
}
