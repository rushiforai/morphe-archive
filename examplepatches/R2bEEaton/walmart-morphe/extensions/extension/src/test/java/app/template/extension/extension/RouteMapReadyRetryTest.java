package app.template.extension.extension;

import org.junit.Test;
import java.util.ArrayDeque;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;

public class RouteMapReadyRetryTest {
    @Test public void waitsForWebViewAndSvgEvenWhenCoordinatesAreAlreadyReady() {
        Queue<Runnable> queue = new ArrayDeque<>();
        AtomicInteger attempts = new AtomicInteger();
        AtomicBoolean lineVisible = new AtomicBoolean();
        RouteMapReadyRetry.start(() -> true, queue::add, done -> {
            // First no WebView, then no SVG, finally a mounted map.
            boolean ready = attempts.incrementAndGet() == 3;
            lineVisible.set(ready);
            done.accept(ready);
        });
        while (!queue.isEmpty()) queue.remove().run();
        assertTrue("The line must eventually render after the map mounts", lineVisible.get());
        assertEquals(3, attempts.get());
    }

    @Test public void cancelsWhenUserLeavesTheRoute() {
        Queue<Runnable> queue = new ArrayDeque<>();
        AtomicBoolean active = new AtomicBoolean(true);
        AtomicInteger attempts = new AtomicInteger();
        RouteMapReadyRetry.start(active::get, queue::add, done -> {
            attempts.incrementAndGet();
            done.accept(false);
        });
        active.set(false);
        while (!queue.isEmpty()) queue.remove().run();
        assertEquals(1, attempts.get());
    }

    @Test public void boundsRetriesWhenMapNeverLoads() {
        Queue<Runnable> queue = new ArrayDeque<>();
        AtomicInteger attempts = new AtomicInteger();
        RouteMapReadyRetry.start(() -> true, queue::add, done -> {
            attempts.incrementAndGet();
            done.accept(false);
        });
        while (!queue.isEmpty() && attempts.get() < 100) queue.remove().run();
        assertTrue(attempts.get() > 1);
        assertTrue(attempts.get() < 100);
        assertTrue(queue.isEmpty());
    }
}
