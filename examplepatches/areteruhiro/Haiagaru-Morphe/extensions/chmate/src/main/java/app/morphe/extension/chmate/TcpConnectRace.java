package app.morphe.extension.chmate;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadFactory;
import javax.net.SocketFactory;

/** TCP only: never sends HTTP/TLS data. The caller retains native TLS and HTTP handling. */
public final class TcpConnectRace {
    public interface Cancellation { boolean cancelled(); }
    public static final class Result {
        public final int index;
        public final Socket socket;
        Result(int index, Socket socket) { this.index = index; this.socket = socket; }
    }
    private static final Semaphore SLOTS = new Semaphore(8);
    private static final ExecutorService WORKERS = Executors.newCachedThreadPool(new ThreadFactory() {
        @Override public Thread newThread(Runnable task) {
            Thread thread = new Thread(task, "Haiagaru-TCP");
            thread.setDaemon(true);
            return thread;
        }
    });
    private static final class State {
        final List<Socket> sockets = new ArrayList<>();
        int running;
        boolean done;
        Result winner;
        IOException failure;
    }
    private TcpConnectRace() { }

    /** Null means the global worker budget was busy; the caller must use native sequential I/O. */
    public static Result connect(final List<InetSocketAddress> addresses, final SocketFactory factory,
            final int timeout, Cancellation cancellation) throws IOException {
        if (addresses.size() < 2) return null;
        final State state = new State();
        int next = 0;
        long nextStart = 0;
        Result result = null;
        try {
            while (true) {
                if (cancellation.cancelled() || Thread.currentThread().isInterrupted())
                    throw new InterruptedIOException("TCP connection cancelled");
                synchronized (state) {
                    if (state.winner != null) { result = state.winner; return result; }
                    if (next == addresses.size() && state.running == 0)
                        throw state.failure == null ? new IOException("No TCP candidate available") : state.failure;
                    long now = System.nanoTime();
                    if (next < addresses.size() && (state.running == 0 || now >= nextStart)) {
                        if (SLOTS.tryAcquire()) {
                            final int index = next++;
                            state.running++;
                            try {
                                WORKERS.execute(new Runnable() {
                                    @Override public void run() {
                                        Socket socket = null;
                                        try {
                                            socket = factory.createSocket();
                                            synchronized (state) {
                                                if (state.done) { close(socket); return; }
                                                state.sockets.add(socket);
                                            }
                                            socket.connect(addresses.get(index), timeout);
                                            synchronized (state) {
                                                if (!state.done) {
                                                    state.winner = new Result(index, socket);
                                                    state.done = true;
                                                } else close(socket);
                                            }
                                        } catch (IOException failure) {
                                            close(socket);
                                            synchronized (state) { state.failure = failure; }
                                        } catch (RuntimeException failure) {
                                            close(socket);
                                            synchronized (state) { state.failure = new IOException(failure); }
                                        } finally {
                                            synchronized (state) { state.running--; state.notifyAll(); }
                                            SLOTS.release();
                                        }
                                    }
                                });
                            } catch (RuntimeException rejected) {
                                state.running--;
                                SLOTS.release();
                                if (state.running == 0) return null;
                            }
                            nextStart = now + 50000000L;
                            continue;
                        } else if (state.running == 0) {
                            return null;
                        }
                    }
                    try { state.wait(20); }
                    catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                        throw new InterruptedIOException("TCP connection interrupted");
                    }
                }
            }
        } finally {
            synchronized (state) {
                state.done = true;
                for (Socket socket : state.sockets) if (result == null || socket != result.socket) close(socket);
            }
        }
    }

    static void close(Socket socket) {
        if (socket != null) try { socket.close(); } catch (IOException ignored) { }
    }
}
