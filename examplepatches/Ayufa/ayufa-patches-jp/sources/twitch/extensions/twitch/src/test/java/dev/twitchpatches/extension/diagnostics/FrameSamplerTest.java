package dev.twitchpatches.extension.diagnostics;

import com.amazonaws.ivs.player.Statistics;
import java.lang.ref.WeakReference;
import org.junit.Test;
import static org.junit.Assert.*;

public final class FrameSamplerTest {
    private static final class Host implements FrameSampler.Host {
        int scheduled;
        int cancelled;
        int recorded;
        int unavailable;
        Statistics snapshot = new Statistics();
        Runnable duringRead;
        boolean released;
        @Override public Statistics read(Object player) {
            if (duringRead != null) duringRead.run();
            if (released) throw new IllegalStateException("synthetic released player");
            return snapshot;
        }
        @Override public void record(FrameSampler sampler, Object player, Statistics statistics) { recorded++; }
        @Override public void schedule(Runnable task) { scheduled++; }
        @Override public void cancel(Runnable task) { cancelled++; }
        @Override public void unavailable() { unavailable++; }
    }

    @Test public void stoppedPlayerEndsSamplingWithoutFabricatingProgress() {
        Object owner = new Object(); Host host = new Host();
        FrameSampler sampler = new FrameSampler(new WeakReference<>(owner), host);
        sampler.start(); sampler.run();
        assertEquals(1, host.recorded); assertEquals(2, host.scheduled);
        host.snapshot = null; sampler.run(); sampler.run();
        assertTrue(sampler.isClosed()); assertEquals(1, host.recorded);
        assertEquals(2, host.scheduled); assertEquals(1, host.cancelled);
    }

    @Test public void collectedOwnerAndReleasedNativeHandleCancelTheirTasks() {
        Object owner = new Object(); Host host = new Host(); WeakReference<Object> reference = new WeakReference<>(owner);
        FrameSampler sampler = new FrameSampler(reference, host); sampler.start();
        reference.clear(); sampler.run();
        assertTrue(sampler.isClosed()); assertEquals(0, host.recorded);
        FrameSampler released = new FrameSampler(new WeakReference<>(owner), host);
        host.released = true; released.start(); released.run();
        assertTrue(released.isClosed()); assertEquals(1, host.unavailable);
        assertEquals(0, host.recorded);
    }

    @Test public void cancellationDuringNativeReadDiscardsLateSnapshot() {
        Object owner = new Object(); Host host = new Host();
        FrameSampler sampler = new FrameSampler(new WeakReference<>(owner), host);
        host.duringRead = sampler::close;
        sampler.start(); sampler.run();
        assertTrue(sampler.isClosed()); assertEquals(0, host.recorded); assertEquals(1, host.scheduled);
    }
}
