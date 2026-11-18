package io.github.sabopura.morphe.extension.twitch.original;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class SpeechQueueTest {
    @Test
    public void fullQueueDropsTheOldest() {
        SpeechQueue<String> queue = new SpeechQueue<>(2);
        queue.add("a");
        queue.add("b");
        queue.add("c");
        assertEquals("b", queue.next());
        assertEquals("c", queue.next());
        assertNull(queue.next());
    }
}
