package nl.johninnl.medium.reader;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public final class Cancellation {
    public interface Registration extends AutoCloseable { @Override void close(); }
    private final List<Handler> handlers = new ArrayList<>();
    private volatile boolean cancelled;

    public void cancel() {
        List<Handler> pending;
        synchronized (handlers) {
            if (cancelled) return;
            cancelled = true;
            pending = new ArrayList<>(handlers);
            handlers.clear();
        }
        for (Handler handler : pending) handler.run();
    }

    public boolean isCancelled() { return cancelled; }

    public Registration onCancel(Runnable action) {
        Handler handler = new Handler(action);
        synchronized (handlers) {
            if (!cancelled) { handlers.add(handler); return handler; }
        }
        handler.run();
        return handler;
    }

    public void check() throws ArticleException {
        if (cancelled || Thread.currentThread().isInterrupted()) {
            throw new ArticleException("CANCELLED", "Article request was cancelled");
        }
    }

    private final class Handler implements Registration {
        private final Runnable action;
        private final AtomicBoolean active = new AtomicBoolean(true);
        Handler(Runnable action) { this.action = action; }
        void run() {
            if (!active.compareAndSet(true, false)) return;
            try { action.run(); }
            catch (RuntimeException ignored) { /* One teardown must not prevent other resources closing. */ }
        }
        @Override public void close() {
            active.set(false);
            synchronized (handlers) { handlers.remove(this); }
        }
    }
}
