package app.jimaku.extension.gateway;

import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Stops the requests made for one video. Cancelling closes their connections, so a read that is
 * waiting on the network ends at once, and a request started afterwards doesn't connect.
 */
public final class Cancellation {
    private final List<Closeable> open = new ArrayList<>();
    private boolean cancelled = false;

    public synchronized boolean isCancelled() {
        return cancelled;
    }

    public void cancel() {
        List<Closeable> closing;
        synchronized (this) {
            if (cancelled) return;
            cancelled = true;
            closing = new ArrayList<>(open);
            open.clear();
        }
        for (Closeable connection : closing) closeQuietly(connection);
    }

    /** Keeps {@code connection} to close on cancel, or closes it now if already cancelled. */
    void attach(Closeable connection) throws CancelledException {
        synchronized (this) {
            if (!cancelled) {
                open.add(connection);
                return;
            }
        }
        closeQuietly(connection);
        throw new CancelledException();
    }

    synchronized void detach(Closeable connection) {
        open.remove(connection);
    }

    static void closeQuietly(Closeable connection) {
        try {
            connection.close();
        } catch (IOException ignored) {
            // Closing a connection that failed already.
        }
    }

    /** A request given up because its video was left. */
    static final class CancelledException extends IOException {
        CancelledException() {
            super("cancelled");
        }
    }
}
