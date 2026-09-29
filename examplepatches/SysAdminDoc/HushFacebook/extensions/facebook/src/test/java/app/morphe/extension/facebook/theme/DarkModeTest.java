/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;

/** Facebook's own dark mode answer, as the patched controller hands it over on each return. */
public class DarkModeTest {
    private final Runnable listener = DarkMode.changed;

    @After
    public void darkModeAsBefore() {
        DarkMode.answer(true);
        DarkMode.changed = listener;
    }

    @Test
    public void theControllerGetsItsOwnAnswerBackAndTheLatestIsKept() {
        assertFalse("hands back what Facebook answered", DarkMode.answer(false));
        assertFalse(DarkMode.on());
        assertTrue(DarkMode.answer(true));
        assertTrue(DarkMode.on());
    }

    /** Material You writes its route three fields again only when the answer changes, not on every ask. */
    @Test
    public void theListenerRunsOnAChangeOnly() {
        AtomicInteger runs = new AtomicInteger();
        DarkMode.changed = runs::incrementAndGet;
        DarkMode.answer(true);
        assertEquals("the same answer again", 0, runs.get());
        DarkMode.answer(false);
        DarkMode.answer(false);
        assertEquals("light mode", 1, runs.get());
        DarkMode.answer(true);
        assertEquals("dark mode again", 2, runs.get());
    }

    /**
     * Facebook asks from several threads. When they give the new answer at the same moment, one of
     * them makes the change and runs the listener, and the rest find it made.
     */
    @Test
    public void aChangeRunsTheListenerOnceHoweverManyThreadsAnswerIt() throws Exception {
        int threads = 8;
        AtomicInteger runs = new AtomicInteger();
        DarkMode.answer(true);
        DarkMode.changed = runs::incrementAndGet;
        ExecutorService pool = Executors.newFixedThreadPool(threads);
        try {
            for (int round = 0; round < 20000; round++) {
                boolean dark = round % 2 == 1;
                CyclicBarrier start = new CyclicBarrier(threads);
                List<Future<Boolean>> answers = new ArrayList<>();
                for (int t = 0; t < threads; t++) {
                    answers.add(pool.submit(() -> {
                        start.await();
                        return DarkMode.answer(dark);
                    }));
                }
                for (Future<Boolean> answer : answers) assertEquals(dark, answer.get());
                assertEquals("changes by round " + round, round + 1, runs.get());
                assertEquals(dark, DarkMode.on());
            }
        } finally {
            pool.shutdownNow();
        }
    }
}
