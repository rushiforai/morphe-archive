/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.*;

import org.junit.Test;

import java.util.ArrayDeque;
import java.util.concurrent.atomic.AtomicInteger;

public class CoalescedRunnerTest {
    @Test public void requestsWhileQueuedShareOnePass() {
        ArrayDeque<Runnable> queue = new ArrayDeque<>();
        AtomicInteger passes = new AtomicInteger();
        CoalescedRunner runner = new CoalescedRunner(queue::add, passes::incrementAndGet);

        runner.request();
        runner.request();
        runner.request();
        assertEquals(1, queue.size());
        queue.remove().run();
        assertEquals(1, passes.get());

        runner.request();
        queue.remove().run();
        assertEquals(2, passes.get());
    }

    @Test public void aRequestDuringAPassCausesExactlyOneMorePass() {
        AtomicInteger passes = new AtomicInteger();
        CoalescedRunner[] holder = new CoalescedRunner[1];
        holder[0] = new CoalescedRunner(Runnable::run, () -> {
            // Several changes arrive while the first pass is still running.
            if (passes.incrementAndGet() == 1) {
                holder[0].request();
                holder[0].request();
            }
        });

        holder[0].request();
        assertEquals(2, passes.get());
    }
}
