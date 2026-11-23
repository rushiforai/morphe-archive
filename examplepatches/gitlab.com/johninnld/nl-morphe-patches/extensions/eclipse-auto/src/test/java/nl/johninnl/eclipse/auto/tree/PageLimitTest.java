package nl.johninnl.eclipse.auto.tree;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Test;

public class PageLimitTest {
    @After public void reset() { PageLimit.set(Integer.MAX_VALUE); }

    private static List<String> items(int count) {
        List<String> items = new ArrayList<>();
        for (int i = 0; i < count; i++) items.add("item " + i);
        return items;
    }

    @Test public void aListThatFitsIsTheSameListNotACopy() {
        List<String> shipped = items(10);
        assertSame("a list within the page is handed on exactly as the app built it", shipped, PageLimit.limit(shipped, 10));
        assertSame(shipped, PageLimit.limit(shipped, 11));
        assertSame(shipped, PageLimit.limit(shipped, Integer.MAX_VALUE));
        List<String> empty = new ArrayList<>();
        assertSame(empty, PageLimit.limit(empty, 0));
    }

    @Test public void aLongerListIsCutToItsFirstPageInOrder() {
        List<String> shipped = items(500);
        List<String> page = PageLimit.limit(shipped, 25);
        assertEquals(25, page.size());
        assertEquals(shipped.subList(0, 25), page);
        assertNotSame(shipped, page);
        assertEquals("the app's own list is not modified", 500, shipped.size());
    }

    @Test public void aPageOfOneOrNothingIsRespected() {
        assertEquals(Arrays.asList("item 0"), PageLimit.limit(items(3), 1));
        assertTrue(PageLimit.limit(items(3), 0).isEmpty());
        assertTrue(PageLimit.limit(items(3), -5).isEmpty());
    }

    @Test public void theNewestRequestOnAThreadSetsThePageSizeAndWithoutOneNothingIsCut() throws Exception {
        final AtomicInteger unset = new AtomicInteger();
        Thread fresh = new Thread(new Runnable() {
            @Override public void run() { unset.set(PageLimit.current()); }
        });
        fresh.start();
        fresh.join();
        assertEquals("a thread that never saw a request has no limit", Integer.MAX_VALUE, unset.get());
        PageLimit.set(30);
        assertEquals(30, PageLimit.current());
        PageLimit.set(7);
        assertEquals(7, PageLimit.current());
    }

    @Test public void eachThreadKeepsItsOwnPageSize() throws Exception {
        PageLimit.set(10);
        final AtomicInteger other = new AtomicInteger();
        Thread thread = new Thread(new Runnable() {
            @Override public void run() {
                PageLimit.set(99);
                other.set(PageLimit.current());
            }
        });
        thread.start();
        thread.join();
        assertEquals(99, other.get());
        assertEquals("another request cannot change this one's page size", 10, PageLimit.current());
    }
}
