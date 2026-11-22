package local.lunaredge.cast;

import java.io.Closeable;
import java.util.concurrent.atomic.AtomicBoolean;

/** Una sola sesión posee el mantenimiento de segundo plano; los cierres antiguos no la afectan. */
public final class SessionLease implements Closeable {
    public static final class Registry {
        private SessionLease current;
        public SessionLease open(Runnable stopRemote, Runnable onLastClosed) {
            SessionLease next = new SessionLease(this, stopRemote, onLastClosed);
            SessionLease previous;
            synchronized (this) { previous = current; current = next; }
            if (previous != null) try { previous.stop(); } catch (RuntimeException ignored) { }
            return next;
        }
        private void finished(SessionLease lease) {
            synchronized (this) {
                if (current != lease) return;
                current = null;
            }
            lease.onLastClosed.run();
        }
        public void stop() {
            SessionLease lease;
            synchronized (this) { lease = current; }
            if (lease != null) lease.stop();
        }
    }
    private final Registry registry;
    private final Runnable stopRemote;
    private final Runnable onLastClosed;
    private final AtomicBoolean closed = new AtomicBoolean();
    private SessionLease(Registry registry, Runnable stopRemote, Runnable onLastClosed) {
        this.registry = registry; this.stopRemote = stopRemote; this.onLastClosed = onLastClosed;
    }
    public boolean isCurrent() {
        synchronized (registry) { return registry.current == this && !closed.get(); }
    }
    public void stop() { finish(true); }
    @Override public void close() { finish(false); }
    private void finish(boolean stop) {
        if (!closed.compareAndSet(false, true)) return;
        try { if (stop) stopRemote.run(); }
        finally { registry.finished(this); }
    }
}
