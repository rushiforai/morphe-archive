package io.github.ilikeadofai.vocacolle.extension.network;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Objects;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.net.ssl.HttpsURLConnection;

/** Small fail-closed HTTPS GET client for extension-owned endpoints. */
public final class MorpheHttpClient {
    public static final int MAX_CONNECT_TIMEOUT_MILLIS = 60_000;
    public static final int MAX_READ_TIMEOUT_MILLIS = 120_000;
    public static final int MAX_BODY_BYTES = 16 * 1024 * 1024;
    public static final int DEFAULT_CONNECT_TIMEOUT_MILLIS = 10_000;
    public static final int DEFAULT_READ_TIMEOUT_MILLIS = 15_000;
    public static final int DEFAULT_MAX_BODY_BYTES = 1024 * 1024;
    public static final String USER_AGENT = "Morphe/1.1";
    public static final String ACCEPT = "application/json";
    private static final ScheduledThreadPoolExecutor DEADLINE_EXECUTOR = createDeadlineExecutor();

    public interface ConnectionFactory {
        HttpsURLConnection open(URL url) throws IOException;
    }

    public static final class Response {
        private final int statusCode;
        private final String contentType;
        private final byte[] body;

        private Response(int statusCode, String contentType, byte[] body) {
            this.statusCode = statusCode;
            this.contentType = contentType;
            this.body = body.clone();
        }

        public int statusCode() { return statusCode; }
        public String contentType() { return contentType; }
        public byte[] body() { return body.clone(); }
    }

    private final ConnectionFactory connectionFactory;
    private final int connectTimeoutMillis;
    private final int readTimeoutMillis;
    private final int maxBodyBytes;

    public MorpheHttpClient() {
        this(MorpheHttpClient::openHttpsConnection, DEFAULT_CONNECT_TIMEOUT_MILLIS,
                DEFAULT_READ_TIMEOUT_MILLIS, DEFAULT_MAX_BODY_BYTES);
    }

    public MorpheHttpClient(ConnectionFactory connectionFactory, int connectTimeoutMillis,
                            int readTimeoutMillis, int maxBodyBytes) {
        this.connectionFactory = Objects.requireNonNull(connectionFactory, "connectionFactory");
        requireBounded("connectTimeoutMillis", connectTimeoutMillis, MAX_CONNECT_TIMEOUT_MILLIS);
        requireBounded("readTimeoutMillis", readTimeoutMillis, MAX_READ_TIMEOUT_MILLIS);
        requireBounded("maxBodyBytes", maxBodyBytes, MAX_BODY_BYTES);
        this.connectTimeoutMillis = connectTimeoutMillis;
        this.readTimeoutMillis = readTimeoutMillis;
        this.maxBodyBytes = maxBodyBytes;
    }

    public Response get(URL url) throws IOException {
        validateUrl(url);
        HttpsURLConnection connection = Objects.requireNonNull(
                connectionFactory.open(url), "connectionFactory result");
        try {
            configure(connection);
            int status = connection.getResponseCode();
            if (status >= 300 && status <= 399) {
                throw new ProtocolException("Redirect responses are not allowed: " + status);
            }
            int declaredLength = connection.getContentLength();
            if (declaredLength > maxBodyBytes) {
                throw new IOException("Response body exceeds limit of " + maxBodyBytes + " bytes");
            }
            InputStream stream = status >= 400
                    ? connection.getErrorStream()
                    : connection.getInputStream();
            byte[] body;
            try (InputStream input = stream) {
                body = input == null ? new byte[0] : readWithDeadline(input, connection);
            }
            return new Response(status, connection.getContentType(), body);
        } finally {
            connection.disconnect();
        }
    }

    private void configure(HttpsURLConnection connection) throws ProtocolException {
        connection.setConnectTimeout(connectTimeoutMillis);
        connection.setReadTimeout(readTimeoutMillis);
        connection.setInstanceFollowRedirects(false);
        connection.setUseCaches(false);
        connection.setDoInput(true);
        connection.setRequestMethod("GET");
        connection.setRequestProperty("User-Agent", USER_AGENT);
        connection.setRequestProperty("Accept", ACCEPT);
    }

    private byte[] readWithDeadline(InputStream input, HttpsURLConnection connection)
            throws IOException {
        AtomicBoolean deadlineExceeded = new AtomicBoolean(false);
        ScheduledFuture<?> deadline = DEADLINE_EXECUTOR.schedule(() -> {
            deadlineExceeded.set(true);
            connection.disconnect();
        }, readTimeoutMillis, TimeUnit.MILLISECONDS);
        try {
            byte[] body = readBounded(input);
            if (deadlineExceeded.get()) throw deadlineExceeded(null);
            return body;
        } catch (IOException failure) {
            if (deadlineExceeded.get()) throw deadlineExceeded(failure);
            throw failure;
        } finally {
            deadline.cancel(false);
        }
    }

    private byte[] readBounded(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(Math.min(maxBodyBytes, 8192));
        byte[] buffer = new byte[Math.min(maxBodyBytes + 1, 8192)];
        int total = 0;
        while (true) {
            int read = input.read(buffer, 0, Math.min(buffer.length, maxBodyBytes - total + 1));
            if (read == -1) return output.toByteArray();
            total += read;
            if (total > maxBodyBytes) {
                throw new IOException("Response body exceeds limit of " + maxBodyBytes + " bytes");
            }
            output.write(buffer, 0, read);
        }
    }

    private SocketTimeoutException deadlineExceeded(IOException cause) {
        SocketTimeoutException timeout = new SocketTimeoutException(
                "Response body exceeded total deadline of " + readTimeoutMillis + " ms");
        if (cause != null) timeout.initCause(cause);
        return timeout;
    }

    private static ScheduledThreadPoolExecutor createDeadlineExecutor() {
        ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(1, task -> {
            Thread thread = new Thread(task, "morphe-http-deadline");
            thread.setDaemon(true);
            return thread;
        });
        executor.setRemoveOnCancelPolicy(true);
        return executor;
    }

    private static void validateUrl(URL url) {
        Objects.requireNonNull(url, "url");
        if (!"https".equalsIgnoreCase(url.getProtocol())) {
            throw new IllegalArgumentException("Only HTTPS URLs are allowed");
        }
        if (url.getHost() == null || url.getHost().isEmpty()) {
            throw new IllegalArgumentException("URL host is required");
        }
        if (url.getUserInfo() != null) {
            throw new IllegalArgumentException("URL credentials are not allowed");
        }
    }

    private static void requireBounded(String name, int value, int maximum) {
        if (value <= 0 || value > maximum) {
            throw new IllegalArgumentException(name + " must be between 1 and " + maximum);
        }
    }

    private static HttpsURLConnection openHttpsConnection(URL url) throws IOException {
        URLConnection connection = url.openConnection();
        if (!(connection instanceof HttpsURLConnection)) {
            throw new IOException("URL did not open an HTTPS connection");
        }
        return (HttpsURLConnection) connection;
    }
}
