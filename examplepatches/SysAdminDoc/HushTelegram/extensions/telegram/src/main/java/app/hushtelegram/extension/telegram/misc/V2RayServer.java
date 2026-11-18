/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import app.hushtelegram.extension.shared.Logger;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.Semaphore;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Supplier;

/**
 * The SOCKS5 proxy Telegram connects to, on 127.0.0.1 only and behind a user name and password
 * of its own, so no other app on the phone can use it. Each connection Telegram asks for goes
 * through one of the person's V2Ray-style servers: {@link V2RayDialer} opens the server, and
 * {@link V2RayTunnels} carries the data. TCP only, which is all Telegram's messages need; calls
 * want UDP, which this refuses, so they go the way Telegram sends them without a proxy.
 */
final class V2RayServer {
    /** How many of Telegram's connections it carries at once. Telegram keeps a handful open. */
    static final int MAX_CONNECTIONS = 64;
    /** A connection nothing has gone through for this long is closed. Telegram pings every minute or so. */
    static final long IDLE_MS = TimeUnit.MINUTES.toMillis(5);
    /** How long it waits after its answer for the first bytes Telegram sends, to go out with the request. */
    static final int EARLY_MS = 200;
    /** How many servers a connection tries before it gives up. */
    static final int TRIES = 3;
    private static final int ACCEPT_WAKE_MS = 30_000;

    private final Supplier<List<V2RayLinks.Server>> servers;
    private final Semaphore room = new Semaphore(MAX_CONNECTIONS);
    private final Set<Connection> open = ConcurrentHashMap.newKeySet();
    private final ThreadPoolExecutor workers;
    private final AtomicInteger threads = new AtomicInteger();
    private volatile ServerSocket listening;
    private volatile boolean stopped;
    private byte[] user = new byte[0];
    private byte[] pass = new byte[0];

    /** [servers] names the servers to try for each connection, best first. */
    V2RayServer(Supplier<List<V2RayLinks.Server>> servers) {
        this.servers = servers;
        workers = new ThreadPoolExecutor(0, MAX_CONNECTIONS * 2 + 2, 30, TimeUnit.SECONDS, new SynchronousQueue<>(), task -> {
            Thread thread = new Thread(task, "hushtelegram-v2ray-" + threads.incrementAndGet());
            thread.setDaemon(true);
            return thread;
        });
    }

    /** Starts listening on 127.0.0.1 at [port]. Throws when that port is taken. */
    synchronized void start(int port, String user, String pass) throws IOException {
        if (stopped) throw new IOException("stopped");
        if (listening != null) throw new IOException("already listening");
        this.user = user.getBytes(StandardCharsets.UTF_8);
        this.pass = pass.getBytes(StandardCharsets.UTF_8);
        ServerSocket server = new ServerSocket();
        try {
            server.setReuseAddress(true);
            server.bind(new InetSocketAddress(InetAddress.getByAddress(new byte[]{127, 0, 0, 1}), port), 50);
            server.setSoTimeout(ACCEPT_WAKE_MS);
        } catch (IOException taken) {
            server.close();
            throw taken;
        }
        listening = server;
        Thread accepting = new Thread(() -> accept(server), "hushtelegram-v2ray-accept");
        accepting.setDaemon(true);
        accepting.start();
    }

    /** The port it listens on, or 0 when it doesn't. */
    int port() {
        ServerSocket server = listening;
        return server == null ? 0 : server.getLocalPort();
    }

    boolean running() {
        return listening != null && !stopped;
    }

    /** How many connections are open now. */
    int connections() {
        return open.size();
    }

    /** Stops listening and closes every connection. It doesn't start again. */
    void stop() {
        ServerSocket server;
        synchronized (this) {
            stopped = true;
            server = listening;
        }
        closeQuietly(server);
        for (Connection connection : new ArrayList<>(open)) connection.close();
        workers.shutdownNow();
    }

    private void accept(ServerSocket server) {
        while (!stopped && !server.isClosed()) {
            Socket client;
            try {
                client = server.accept();
            } catch (SocketTimeoutException wake) {
                reapIdle();
                continue;
            } catch (IOException failure) {
                if (!stopped) Logger.printException(() -> "V2Ray proxy: stopped taking connections", failure);
                break;
            }
            reapIdle();
            if (!room.tryAcquire()) {
                closeQuietly(client);
                continue;
            }
            Connection connection = new Connection(client);
            open.add(connection);
            if (!run(connection::serve)) connection.close();
        }
        closeQuietly(server);
    }

    private boolean run(Runnable task) {
        try {
            workers.execute(task);
            return true;
        } catch (RejectedExecutionException full) {
            return false;
        }
    }

    private void reapIdle() {
        long now = System.nanoTime();
        for (Connection connection : new ArrayList<>(open)) {
            if (now - connection.lastActive > TimeUnit.MILLISECONDS.toNanos(IDLE_MS)) connection.close();
        }
    }

    private static void closeQuietly(java.io.Closeable closeable) {
        if (closeable == null) return;
        try {
            closeable.close();
        } catch (IOException ignored) {
            // Closing is all that's asked.
        }
    }

    /** One of Telegram's connections and the tunnel it goes through. */
    private final class Connection {
        private final Socket client;
        private volatile V2RayTunnels.Wire wire;
        volatile long lastActive = System.nanoTime();
        private volatile boolean closed;

        Connection(Socket client) {
            this.client = client;
        }

        void serve() {
            try {
                client.setSoTimeout(V2RayDialer.SETUP_MS);
                client.setTcpNoDelay(true);
                InputStream in = client.getInputStream();
                OutputStream out = client.getOutputStream();
                if (!greet(in, out)) return;
                V2RayTunnels.Target target = request(in, out);
                if (target == null) return;
                V2RayLinks.Server server = null;
                V2RayTunnels.Wire dialed = null;
                IOException last = null;
                List<V2RayLinks.Server> tries = servers.get();
                for (int i = 0; i < tries.size() && i < TRIES && dialed == null; i++) {
                    try {
                        dialed = V2RayDialer.dial(tries.get(i));
                        server = tries.get(i);
                    } catch (IOException | RuntimeException failed) {
                        last = failed instanceof IOException ? (IOException) failed : new IOException(failed);
                    }
                }
                if (dialed == null) {
                    // Counts only: a server's address stays out of the log.
                    IOException why = last;
                    Logger.printDebug(() -> "V2Ray proxy: no server answered of " + Math.min(tries.size(), TRIES)
                            + (why == null ? "" : " (" + why.getClass().getSimpleName() + ")"));
                    out.write(reply(tries.isEmpty() ? 0x02 : 0x04));
                    return;
                }
                wire = dialed;
                // A close while it dialed couldn't see this connection to the server yet.
                if (closed) {
                    dialed.close();
                    return;
                }
                out.write(reply(0x00));
                out.flush();
                byte[] early = early(in);
                V2RayTunnels.Tunnel through = V2RayTunnels.open(server, dialed, target, early);
                dialed.timeout(0);
                client.setSoTimeout(0);
                if (!run(() -> pump(through.in, out, true))) return;
                pump(in, through.out, false);
            } catch (IOException | RuntimeException failure) {
                Logger.printDebug(() -> "V2Ray proxy: a connection ended (" + failure.getClass().getSimpleName() + ")");
            } finally {
                close();
            }
        }

        /** SOCKS5's greeting, then the user name and password (RFC 1929). False when either is wrong. */
        private boolean greet(InputStream in, OutputStream out) throws IOException {
            byte[] head = new byte[2];
            V2RayTunnels.readFully(in, head, false);
            if (head[0] != 5) return false;
            byte[] methods = new byte[head[1] & 0xff];
            V2RayTunnels.readFully(in, methods, false);
            boolean password = false;
            for (byte method : methods) password |= method == 2;
            if (!password) {
                out.write(new byte[]{5, (byte) 0xff});
                return false;
            }
            out.write(new byte[]{5, 2});
            byte[] version = new byte[2];
            V2RayTunnels.readFully(in, version, false);
            byte[] name = new byte[version[1] & 0xff];
            V2RayTunnels.readFully(in, name, false);
            byte[] length = new byte[1];
            V2RayTunnels.readFully(in, length, false);
            byte[] word = new byte[length[0] & 0xff];
            V2RayTunnels.readFully(in, word, false);
            boolean right = version[0] == 1 & MessageDigest.isEqual(name, user) & MessageDigest.isEqual(word, pass);
            out.write(new byte[]{1, (byte) (right ? 0 : 1)});
            return right;
        }

        /** Telegram's CONNECT request, or null after an answer that says why it can't be. */
        private V2RayTunnels.Target request(InputStream in, OutputStream out) throws IOException {
            byte[] head = new byte[4];
            V2RayTunnels.readFully(in, head, false);
            if (head[0] != 5) return null;
            int type = head[3] & 0xff;
            byte[] address;
            if (type == V2RayTunnels.Target.IPV4) {
                address = new byte[4];
            } else if (type == V2RayTunnels.Target.IPV6) {
                address = new byte[16];
            } else if (type == V2RayTunnels.Target.DOMAIN) {
                byte[] length = new byte[1];
                V2RayTunnels.readFully(in, length, false);
                address = new byte[length[0] & 0xff];
            } else {
                out.write(reply(0x08));
                return null;
            }
            V2RayTunnels.readFully(in, address, false);
            byte[] port = new byte[2];
            V2RayTunnels.readFully(in, port, false);
            // CONNECT only. UDP ASSOCIATE, which calls would want, and BIND aren't carried.
            if (head[1] != 1) {
                out.write(reply(0x07));
                return null;
            }
            try {
                return new V2RayTunnels.Target(type, address, (port[0] & 0xff) << 8 | (port[1] & 0xff));
            } catch (IllegalArgumentException unreadable) {
                out.write(reply(0x08));
                return null;
            }
        }

        /** What Telegram sends right after the answer, if it comes within {@link #EARLY_MS}. */
        private byte[] early(InputStream in) throws IOException {
            client.setSoTimeout(EARLY_MS);
            byte[] some = new byte[16 * 1024];
            try {
                int n = in.read(some);
                if (n < 0) throw new IOException("Telegram closed the connection");
                return java.util.Arrays.copyOf(some, n);
            } catch (SocketTimeoutException nothingYet) {
                return new byte[0];
            } finally {
                client.setSoTimeout(V2RayDialer.SETUP_MS);
            }
        }

        private void pump(InputStream from, OutputStream to, boolean toTelegram) {
            byte[] buffer = new byte[16 * 1024];
            try {
                int n;
                while ((n = from.read(buffer)) >= 0) {
                    if (n == 0) continue;
                    to.write(buffer, 0, n);
                    to.flush();
                    lastActive = System.nanoTime();
                }
            } catch (IOException | RuntimeException ended) {
                if (!closed) {
                    Logger.printDebug(() -> "V2Ray proxy: " + (toTelegram ? "the server's side" : "Telegram's side")
                            + " ended (" + ended.getClass().getSimpleName() + ")");
                }
            } finally {
                // Either side ending ends the connection, as Telegram opens a new one when it wants.
                close();
            }
        }

        void close() {
            synchronized (this) {
                if (closed) return;
                closed = true;
            }
            closeQuietly(client);
            V2RayTunnels.Wire dialed = wire;
            if (dialed != null) dialed.close();
            if (open.remove(this)) room.release();
        }
    }

    /** A SOCKS5 answer with [code] and an empty bound address. */
    static byte[] reply(int code) {
        return new byte[]{5, (byte) code, 0, 1, 0, 0, 0, 0, 0, 0};
    }
}
