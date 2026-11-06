package dev.twitchpatches.extension.diagnostics;

import com.amazonaws.ivs.player.Statistics;
import java.lang.ref.WeakReference;

final class FrameSampler implements Runnable, AutoCloseable {
    interface Host {
        Statistics read(Object player);
        void record(FrameSampler sampler, Object player, Statistics statistics);
        void schedule(Runnable task);
        void cancel(Runnable task);
        void unavailable();
    }
    private final WeakReference<Object> player;
    private final Host host;
    private volatile boolean closed;

    FrameSampler(WeakReference<Object> player, Host host) { this.player = player; this.host = host; }
    void start() { enqueue(); }
    private synchronized void enqueue() { if (!closed) host.schedule(this); }
    boolean isClosed() { return closed; }

    @Override public void run() {
        if (closed) return;
        Object current = player.get();
        if (current == null) { close(); return; }
        Statistics statistics;
        try { statistics = host.read(current); }
        catch (IllegalStateException exception) { close(); host.unavailable(); return; }
        if (closed) return;
        if (statistics == null) { close(); return; }
        host.record(this, current, statistics);
        enqueue();
    }

    @Override public synchronized void close() { closed = true; host.cancel(this); }
}
