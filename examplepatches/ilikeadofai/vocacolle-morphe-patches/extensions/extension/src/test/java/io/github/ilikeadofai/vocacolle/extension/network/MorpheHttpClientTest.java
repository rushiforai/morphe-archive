package io.github.ilikeadofai.vocacolle.extension.network;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.ProtocolException;
import java.security.Principal;
import java.security.cert.Certificate;
import java.util.HashMap;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;
import org.junit.Test;

public class MorpheHttpClientTest {
    @Test
    public void successfulGetReturnsMetadataAndBodyAndCleansUp() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/data"));
        connection.status = 200;
        connection.contentType = "application/json";
        connection.body = "ok".getBytes("UTF-8");
        MorpheHttpClient client = new MorpheHttpClient(url -> connection, 1234, 2345, 16);

        MorpheHttpClient.Response response = client.get(new URL("https://example.com/data"));

        assertEquals(200, response.statusCode());
        assertEquals("application/json", response.contentType());
        assertEquals("ok", new String(response.body(), "UTF-8"));
        assertEquals(1234, connection.connectTimeout);
        assertEquals(2345, connection.readTimeout);
        assertEquals("GET", connection.method);
        assertEquals("Morphe/1.1", connection.headers.get("User-Agent"));
        assertEquals("application/json", connection.headers.get("Accept"));
        assertTrue(connection.disconnected);
        assertTrue(connection.input.closed);
        assertFalse(connection.followRedirects);
    }

    @Test
    public void rejectsUnsafeUrlsBeforeOpeningAConnection() throws Exception {
        int[] opens = {0};
        MorpheHttpClient client = new MorpheHttpClient(url -> {
            opens[0]++;
            return new FakeConnection(url);
        }, 1000, 1000, 16);

        assertThrows(IllegalArgumentException.class, () -> client.get(new URL("http://example.com")));
        assertThrows(IllegalArgumentException.class, () -> client.get(new URL("https://user:pass@example.com")));
        assertThrows(IllegalArgumentException.class, () -> client.get(new URL("https:/missing-host")));
        assertEquals(0, opens[0]);
    }

    @Test
    public void rejectsRedirectWithoutFollowingAndDisconnects() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/redirect"));
        connection.status = 302;
        MorpheHttpClient client = new MorpheHttpClient(url -> connection, 1000, 1000, 16);

        assertThrows(ProtocolException.class, () -> client.get(connection.getURL()));

        assertFalse(connection.followRedirects);
        assertEquals(0, connection.inputOpenCount);
        assertTrue(connection.disconnected);
    }

    @Test
    public void bodyOverLimitFailsAndClosesStreamAndConnection() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/large"));
        connection.status = 200;
        connection.body = new byte[] {1, 2, 3, 4, 5};
        MorpheHttpClient client = new MorpheHttpClient(url -> connection, 1000, 1000, 4);

        assertThrows(IOException.class, () -> client.get(connection.getURL()));

        assertTrue(connection.input.closed);
        assertTrue(connection.disconnected);
    }

    @Test
    public void totalBodyDeadlineDisconnectsAnActivelyBlockedRead() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/slow"));
        connection.status = 200;
        connection.bodyInput = new BlockingUntilClosedInputStream(200L);
        MorpheHttpClient client = new MorpheHttpClient(url -> connection, 1000, 20, 16);

        assertThrows(SocketTimeoutException.class, () -> client.get(connection.getURL()));

        assertTrue(connection.input.closed);
        assertTrue(connection.disconnected);
    }

    @Test
    public void httpErrorUsesErrorBodyAndStillReturnsStatus() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/error"));
        connection.status = 404;
        connection.contentType = "text/plain";
        connection.errorBody = "missing".getBytes("UTF-8");
        MorpheHttpClient client = new MorpheHttpClient(url -> connection, 1000, 1000, 16);

        MorpheHttpClient.Response response = client.get(connection.getURL());

        assertEquals(404, response.statusCode());
        assertEquals("missing", new String(response.body(), "UTF-8"));
        assertTrue(connection.errorInput.closed);
        assertTrue(connection.disconnected);
    }

    @Test
    public void httpErrorWithoutErrorStreamReturnsEmptyBody() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/no-error-body"));
        connection.status = 500;
        MorpheHttpClient client = new MorpheHttpClient(url -> connection, 1000, 1000, 16);

        MorpheHttpClient.Response response = client.get(connection.getURL());

        assertEquals(500, response.statusCode());
        assertEquals(0, response.body().length);
        assertEquals(0, connection.inputOpenCount);
        assertTrue(connection.disconnected);
    }

    @Test
    public void responseBodyIsDefensivelyCopied() throws Exception {
        FakeConnection connection = new FakeConnection(new URL("https://example.com/copy"));
        connection.status = 200;
        connection.body = new byte[] {7};
        MorpheHttpClient.Response response =
                new MorpheHttpClient(url -> connection, 1000, 1000, 16).get(connection.getURL());

        response.body()[0] = 9;

        assertEquals(7, response.body()[0]);
    }

    @Test
    public void constructorRejectsUnboundedConfiguration() {
        MorpheHttpClient.ConnectionFactory factory = url -> new FakeConnection(url);
        assertThrows(IllegalArgumentException.class, () -> new MorpheHttpClient(factory, 0, 1000, 1));
        assertThrows(IllegalArgumentException.class, () -> new MorpheHttpClient(factory, 1000, 0, 1));
        assertThrows(IllegalArgumentException.class, () -> new MorpheHttpClient(factory, 1000, 1000, 0));
        assertThrows(IllegalArgumentException.class,
                () -> new MorpheHttpClient(factory, MorpheHttpClient.MAX_CONNECT_TIMEOUT_MILLIS + 1, 1000, 1));
        assertThrows(IllegalArgumentException.class,
                () -> new MorpheHttpClient(factory, 1000, MorpheHttpClient.MAX_READ_TIMEOUT_MILLIS + 1, 1));
        assertThrows(IllegalArgumentException.class,
                () -> new MorpheHttpClient(factory, 1000, 1000, MorpheHttpClient.MAX_BODY_BYTES + 1));
    }

    static final class FakeConnection extends HttpsURLConnection {
        int status;
        String contentType;
        byte[] body = new byte[0];
        InputStream bodyInput;
        byte[] errorBody;
        final TrackingInputStream input = new TrackingInputStream();
        final TrackingInputStream errorInput = new TrackingInputStream();
        final Map<String, String> headers = new HashMap<>();
        boolean disconnected;
        int connectTimeout;
        int readTimeout;
        String method;
        boolean followRedirects = true;
        int inputOpenCount;

        FakeConnection(URL url) { super(url); }
        @Override public void setConnectTimeout(int value) { connectTimeout = value; }
        @Override public void setReadTimeout(int value) { readTimeout = value; }
        @Override public int getReadTimeout() { return readTimeout; }
        @Override public void setRequestMethod(String value) { method = value; }
        @Override public void setRequestProperty(String key, String value) { headers.put(key, value); }
        @Override public void setInstanceFollowRedirects(boolean value) { followRedirects = value; }
        @Override public int getResponseCode() { return status; }
        @Override public String getContentType() { return contentType; }
        @Override public TrackingInputStream getInputStream() {
            inputOpenCount++;
            input.delegate = bodyInput == null ? new ByteArrayInputStream(body) : bodyInput;
            return input;
        }
        @Override public java.io.InputStream getErrorStream() {
            if (errorBody == null) return null;
            errorInput.delegate = new ByteArrayInputStream(errorBody);
            return errorInput;
        }
        @Override public void disconnect() {
            disconnected = true;
            try {
                input.close();
            } catch (IOException ignored) {
                // Test double cleanup only.
            }
        }
        @Override public boolean usingProxy() { return false; }
        @Override public void connect() { }
        @Override public String getCipherSuite() { return "fake"; }
        @Override public Certificate[] getLocalCertificates() { return null; }
        @Override public Certificate[] getServerCertificates() throws SSLPeerUnverifiedException { return null; }
        @Override public Principal getPeerPrincipal() throws SSLPeerUnverifiedException { return null; }
        @Override public Principal getLocalPrincipal() { return null; }
    }

    static final class TrackingInputStream extends java.io.InputStream {
        java.io.InputStream delegate = new ByteArrayInputStream(new byte[0]);
        boolean closed;
        @Override public int read() throws IOException { return delegate.read(); }
        @Override public int read(byte[] b, int off, int len) throws IOException { return delegate.read(b, off, len); }
        @Override public void close() throws IOException { closed = true; delegate.close(); }
    }

    static final class BlockingUntilClosedInputStream extends InputStream {
        private final long maximumWaitMillis;
        private boolean closed;

        BlockingUntilClosedInputStream(long maximumWaitMillis) {
            this.maximumWaitMillis = maximumWaitMillis;
        }

        @Override
        public int read() throws IOException {
            byte[] single = new byte[1];
            int read = read(single, 0, 1);
            return read == -1 ? -1 : single[0] & 0xff;
        }

        @Override
        public synchronized int read(byte[] buffer, int offset, int length) throws IOException {
            long deadline = System.nanoTime() + maximumWaitMillis * 1_000_000L;
            try {
                while (!closed) {
                    long remainingNanos = deadline - System.nanoTime();
                    if (remainingNanos <= 0L) {
                        throw new IOException("Connection was not cancelled at the body deadline");
                    }
                    long waitMillis = Math.max(1L, remainingNanos / 1_000_000L);
                    wait(waitMillis);
                }
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new IOException("Interrupted", interrupted);
            }
            throw new IOException("Connection closed");
        }

        @Override
        public synchronized void close() {
            closed = true;
            notifyAll();
        }
    }
}
