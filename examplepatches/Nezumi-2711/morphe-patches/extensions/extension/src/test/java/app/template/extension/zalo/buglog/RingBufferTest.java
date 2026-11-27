package app.template.extension.zalo.buglog;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;

public class RingBufferTest {
    @Test
    public void keepsTheLast200Lines() {
        RingBuffer ring = new RingBuffer();
        for (int index = 0; index < 250; index++) {
            ring.add(index, 'I', "core", "Tag", "main", "line " + index, null);
        }
        List<RingBuffer.Entry> entries = ring.drain();
        assertEquals(RingBuffer.CAPACITY, entries.size());
        assertEquals("line 50", entries.get(0).message);
        assertEquals("line 249", entries.get(entries.size() - 1).message);
        assertEquals(0, ring.size());
    }

    @Test
    public void capsEachLineAt2KB() {
        RingBuffer ring = new RingBuffer();
        StringBuilder message = new StringBuilder();
        while (message.length() < 5000) message.append("word ");
        ring.add(1, 'W', "core", "Tag", "main", message.toString(), "trace that no longer fits");
        RingBuffer.Entry entry = ring.drain().get(0);
        assertTrue(entry.message.length() <= RingBuffer.MAX_LINE_CHARS);
        assertTrue(entry.message.endsWith(RingBuffer.TRUNCATED));
        assertNull(entry.detail);
    }

    @Test
    public void stackTraceSharesTheCap() {
        RingBuffer ring = new RingBuffer();
        StringBuilder trace = new StringBuilder();
        while (trace.length() < 5000) trace.append("\tat a.b.C.d(C.java:1)\n");
        ring.add(1, 'W', "core", "Tag", "main", "short message", trace.toString());
        RingBuffer.Entry entry = ring.drain().get(0);
        assertEquals("short message", entry.message);
        assertTrue(entry.message.length() + 1 + entry.detail.length() <= RingBuffer.MAX_LINE_CHARS);
        assertTrue(entry.detail.endsWith(RingBuffer.TRUNCATED));
    }

    @Test
    public void truncationDropsAWordCutInHalf() {
        // Cutting inside the number would leave a short digit run the redactor no longer recognises.
        String text = "phone 0912345678 and more text here";
        String cut = RingBuffer.truncate(text, 12 + RingBuffer.TRUNCATED.length());
        assertEquals("phone " + RingBuffer.TRUNCATED, cut);
    }

    @Test
    public void shortLinesAreUntouched() {
        assertEquals("fits", RingBuffer.truncate("fits", 100));
    }
}
