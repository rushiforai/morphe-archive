/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.settings;

import androidx.annotation.Nullable;

import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.function.Function;

import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * One bounded HTTP/1.1 GET over a private TLS socket. Platform trust and HTTPS hostname checks
 * apply. Neither request nor response goes through the process's CookieHandler, cache or pool.
 * ReleaseCheck owns consent, the exact host policy, redirects and the decoded body limit.
 */
final class ReleaseTransport implements ReleaseCheck.Transport {
    static final int CONNECT_TIMEOUT_MS = 10_000;
    static final int READ_TIMEOUT_MS = 10_000;
    private static final int MAX_LINE_BYTES = 8 * 1024;
    private static final int MAX_METADATA_BYTES = 64 * 1024;
    // DNS may ignore interruption. One worker and one waiting request bound that leftover work.
    static final ThreadPoolExecutor CONNECTIONS = new ThreadPoolExecutor(1, 1,
            30, TimeUnit.SECONDS, new ArrayBlockingQueue<>(1), task -> {
                Thread thread = new Thread(task, "hushthreads-release-connect");
                thread.setDaemon(true);
                return thread;
            });
    private static final ScheduledThreadPoolExecutor DEADLINES = new ScheduledThreadPoolExecutor(1, task -> {
        Thread thread = new Thread(task, "hushthreads-release-deadline");
        thread.setDaemon(true);
        return thread;
    });
    static {
        CONNECTIONS.allowCoreThreadTimeOut(true);
        DEADLINES.setRemoveOnCancelPolicy(true);
    }
    private final SSLSocketFactory sockets;
    private final Function<URL, InetSocketAddress> addresses;

    ReleaseTransport() {
        this((SSLSocketFactory) SSLSocketFactory.getDefault());
    }

    ReleaseTransport(SSLSocketFactory sockets) {
        this(sockets, url -> new InetSocketAddress(url.getHost(), url.getPort() == -1 ? 443 : url.getPort()));
    }

    ReleaseTransport(SSLSocketFactory sockets, Function<URL, InetSocketAddress> addresses) {
        this.sockets = sockets;
        this.addresses = addresses;
    }

    /** A request refused before it went out. The message names no address. */
    static final class Refused extends IOException {
        Refused(String reason) {
            super(reason);
        }
    }

    @Override
    public ReleaseCheck.Exchange get(URL url, Map<String, String> headers, long deadline) throws IOException {
        if (!"https".equalsIgnoreCase(url.getProtocol()) || url.getUserInfo() != null) {
            throw new Refused("the address isn't an anonymous HTTPS request");
        }
        String target;
        try {
            URI uri = new URI(url.toURI().toASCIIString());
            target = uri.getRawPath();
            if (target == null || target.isEmpty()) target = "/";
            if (uri.getRawQuery() != null) target += "?" + uri.getRawQuery();
        } catch (URISyntaxException malformed) {
            throw new Refused("the address isn't a URI");
        }
        String authority = url.getAuthority();
        if (authority == null || !ascii(authority) || !ascii(target) || target.length() > 2048) {
            throw new Refused("the request address isn't bounded ASCII");
        }
        StringBuilder request = new StringBuilder("GET ").append(target).append(" HTTP/1.1\r\nHost: ")
                .append(authority).append("\r\nConnection: close\r\nAccept-Encoding: identity\r\n");
        Map<String, String> seen = new LinkedHashMap<>();
        for (Map.Entry<String, String> header : headers.entrySet()) {
            String name = header.getKey();
            String value = header.getValue();
            if (name == null || value == null || !ascii(value) || value.length() > 256) {
                throw new Refused("a request header isn't bounded ASCII");
            }
            String lower = name.toLowerCase(Locale.ROOT);
            if (!(lower.equals("accept") || lower.equals("user-agent") || lower.equals("x-github-api-version"))
                    || seen.put(lower, value) != null) {
                throw new Refused("a request header isn't allowed");
            }
            request.append(name).append(": ").append(value).append("\r\n");
        }
        byte[] wire = request.append("\r\n").toString().getBytes(StandardCharsets.US_ASCII);
        timeout(deadline, CONNECT_TIMEOUT_MS);
        int port = url.getPort() == -1 ? 443 : url.getPort();
        Socket connection = new Socket();
        ScheduledFuture<?> expiry = DEADLINES.schedule(() -> {
            try {
                // Close the plain socket, without waiting for a TLS provider's handshake/write lock.
                connection.close();
            } catch (IOException ignored) {
                // The request still has its timed wait and per-read deadline checks.
            }
        }, Math.max(0, deadline - System.nanoTime()), TimeUnit.NANOSECONDS);
        FutureTask<Answer> work = new FutureTask<>(() -> {
            SSLSocket tls = null;
            try {
                InetSocketAddress address = addresses.apply(url);
                connection.connect(address, timeout(deadline, CONNECT_TIMEOUT_MS));
                tls = (SSLSocket) sockets.createSocket(connection, url.getHost(), port, true);
                SSLParameters parameters = tls.getSSLParameters();
                parameters.setEndpointIdentificationAlgorithm("HTTPS");
                tls.setSSLParameters(parameters);
                tls.setSoTimeout(timeout(deadline, READ_TIMEOUT_MS));
                tls.startHandshake();
                OutputStream output = tls.getOutputStream();
                timeout(deadline, READ_TIMEOUT_MS);
                output.write(wire);
                timeout(deadline, READ_TIMEOUT_MS);
                return new Answer(tls, connection, deadline, expiry);
            } catch (IOException | RuntimeException failure) {
                try { connection.close(); } catch (IOException closing) { failure.addSuppressed(closing); }
                if (tls != null) {
                    try { tls.close(); } catch (IOException closing) { failure.addSuppressed(closing); }
                }
                throw failure;
            }
        });
        Answer answer = null;
        boolean handedOff = false;
        try {
            CONNECTIONS.execute(work);
            answer = work.get(Math.max(0, deadline - System.nanoTime()), TimeUnit.NANOSECONDS);
            timeout(deadline, READ_TIMEOUT_MS);
            handedOff = true;
            return answer;
        } catch (TimeoutException ended) {
            throw new SocketTimeoutException("the check ran out of time");
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
            throw new InterruptedIOException("the check was interrupted");
        } catch (RejectedExecutionException busy) {
            throw new Refused("a previous release connection is still waiting");
        } catch (ExecutionException failed) {
            timeout(deadline, READ_TIMEOUT_MS);
            Throwable cause = failed.getCause();
            if (cause instanceof IOException) throw (IOException) cause;
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new IOException("the release connection failed", cause);
        } finally {
            if (!handedOff) {
                expiry.cancel(false);
                try { connection.close(); } catch (IOException ignored) { }
                work.cancel(true);
                CONNECTIONS.remove(work);
                if (answer != null) answer.close();
            }
        }
    }

    private static boolean ascii(String text) {
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c < 0x20 || c > 0x7e) return false;
        }
        return true;
    }

    private static int timeout(long deadline, int maximum) throws SocketTimeoutException {
        long remaining = deadline - System.nanoTime();
        if (remaining <= 0) throw new SocketTimeoutException("the check ran out of time");
        return (int) Math.min(maximum, Math.max(1, TimeUnit.NANOSECONDS.toMillis(remaining)));
    }

    private static final class Answer extends InputStream implements ReleaseCheck.Exchange {
        private final SSLSocket socket;
        private final Socket connection;
        private final long deadline;
        private final ScheduledFuture<?> expiry;
        private final InputStream input;
        private final Map<String, String> headers = new LinkedHashMap<>();
        private final int status;
        private final long length;
        private final boolean chunked;
        private int metadataBytes;
        private long remaining;
        private boolean chunkEnd;
        private boolean finished;

        Answer(SSLSocket socket, Socket connection, long deadline, ScheduledFuture<?> expiry) throws IOException {
            this.socket = socket;
            this.connection = connection;
            this.deadline = deadline;
            this.expiry = expiry;
            input = new BufferedInputStream(socket.getInputStream(), 8 * 1024);
            String first = line();
            if (!first.matches("HTTP/1\\.[01] [1-5][0-9]{2}( .*)?")) throw new IOException("invalid HTTP status");
            status = Integer.parseInt(first.substring(9, 12));
            String header;
            while (!(header = line()).isEmpty()) {
                int colon = header.indexOf(':');
                if (colon <= 0 || !header.substring(0, colon).matches("[!#$%&'*+.^_`|~0-9A-Za-z-]+")) {
                    throw new IOException("invalid HTTP header");
                }
                String name = header.substring(0, colon).toLowerCase(Locale.ROOT);
                String value = header.substring(colon + 1).trim();
                // Cookies are neither retained nor offered to any shared store.
                if (name.equals("set-cookie") || name.equals("set-cookie2")) continue;
                String previous = headers.get(name);
                if (previous != null && (name.equals("content-length") || name.equals("transfer-encoding")
                        || name.equals("content-encoding") || name.equals("location"))) {
                    throw new IOException("duplicate HTTP framing or location");
                }
                headers.put(name, previous == null ? value : previous + ", " + value);
            }
            String transfer = header("Transfer-Encoding");
            String size = header("Content-Length");
            if (transfer != null && (!transfer.equalsIgnoreCase("chunked") || size != null)) {
                throw new IOException("unsupported HTTP framing");
            }
            String encoding = header("Content-Encoding");
            if (encoding != null && !encoding.equalsIgnoreCase("identity")) {
                throw new IOException("unsupported HTTP encoding");
            }
            chunked = transfer != null;
            try {
                if (size != null && !size.matches("[0-9]{1,19}")) throw new NumberFormatException();
                length = size == null ? -1 : Long.parseLong(size);
            } catch (NumberFormatException invalid) {
                throw new IOException("invalid HTTP length", invalid);
            }
            remaining = chunked ? 0 : length;
        }

        private String line() throws IOException {
            StringBuilder result = new StringBuilder();
            for (;;) {
                int c = octet();
                if (++metadataBytes > MAX_METADATA_BYTES || result.length() >= MAX_LINE_BYTES) {
                    throw new IOException("HTTP metadata too large");
                }
                if (c == '\r') {
                    if (octet() != '\n') throw new IOException("invalid HTTP line ending");
                    metadataBytes++;
                    return result.toString();
                }
                if ((c < 0x20 && c != '\t') || c > 0x7e) throw new IOException("invalid HTTP line");
                result.append((char) c);
            }
        }

        private int octet() throws IOException {
            int c;
            try {
                socket.setSoTimeout(timeout(deadline, READ_TIMEOUT_MS));
                c = input.read();
            } catch (IOException failure) {
                timeout(deadline, READ_TIMEOUT_MS);
                throw failure;
            }
            timeout(deadline, READ_TIMEOUT_MS);
            if (c < 0) throw new EOFException("truncated HTTP response");
            return c;
        }

        @Override
        public int status() {
            return status;
        }

        @Nullable
        @Override
        public String header(String name) {
            return headers.get(name.toLowerCase(Locale.ROOT));
        }

        @Override
        public long length() {
            return length;
        }

        @Override
        public InputStream body() {
            return this;
        }

        @Override
        public int read() throws IOException {
            byte[] one = new byte[1];
            return read(one, 0, 1) < 0 ? -1 : one[0] & 0xff;
        }

        @Override
        public int read(byte[] bytes, int offset, int count) throws IOException {
            if (offset < 0 || count < 0 || offset > bytes.length - count) throw new IndexOutOfBoundsException();
            if (count == 0) return 0;
            if (finished) return -1;
            if (chunked && remaining == 0) {
                if (chunkEnd && (octet() != '\r' || octet() != '\n')) throw new IOException("invalid chunk end");
                String size = line();
                int extension = size.indexOf(';');
                if (extension >= 0) size = size.substring(0, extension);
                if (!size.matches("[0-9a-fA-F]{1,8}")) throw new IOException("invalid HTTP chunk");
                remaining = Long.parseLong(size, 16);
                chunkEnd = true;
                if (remaining == 0) {
                    // Bound trailers, but don't retain them or feed them to a cookie handler.
                    while (!line().isEmpty()) { }
                    finished = true;
                    return -1;
                }
            } else if (!chunked && remaining == 0) {
                finished = true;
                return -1;
            }
            int read;
            try {
                socket.setSoTimeout(timeout(deadline, READ_TIMEOUT_MS));
                read = input.read(bytes, offset, remaining < 0 ? count : (int) Math.min(remaining, count));
            } catch (IOException failure) {
                timeout(deadline, READ_TIMEOUT_MS);
                throw failure;
            }
            timeout(deadline, READ_TIMEOUT_MS);
            if (read < 0) {
                if (remaining >= 0) throw new EOFException("truncated HTTP body");
                finished = true;
                return -1;
            }
            if (remaining >= 0) remaining -= read;
            return read;
        }

        @Override
        public void close() {
            finished = true;
            expiry.cancel(false);
            try { connection.close(); } catch (IOException ignored) { }
            try {
                socket.close();
            } catch (IOException ignored) {
                // This socket isn't pooled or shared with another request.
            }
        }
    }
}
