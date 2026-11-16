package app.morphed.extension.twitch.vpn;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;

import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLEngine;
import javax.net.ssl.SSLEngineResult;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLParameters;

/**
 * TLS over a plain byte stream (a TCP connection through the tunnel), with the server's certificate checked
 * against the host name, the way the system's own HTTPS does.
 */
final class TlsStream {
    private final SSLEngine engine;
    private final InputStream rawIn;
    private final OutputStream rawOut;
    private ByteBuffer netIn, appIn;
    private final ByteBuffer netOut;
    private boolean closed;

    TlsStream(String host, int port, InputStream rawIn, OutputStream rawOut) throws IOException {
        try {
            engine = SSLContext.getDefault().createSSLEngine(host, port);
        } catch (java.security.NoSuchAlgorithmException e) {
            throw new IOException("TLS isn't available", e);
        }
        engine.setUseClientMode(true);
        SSLParameters parameters = engine.getSSLParameters();
        parameters.setEndpointIdentificationAlgorithm("HTTPS");
        engine.setSSLParameters(parameters);
        this.rawIn = rawIn;
        this.rawOut = rawOut;
        int packet = engine.getSession().getPacketBufferSize();
        netIn = ByteBuffer.allocate(packet);
        netIn.flip();
        netOut = ByteBuffer.allocate(packet);
        appIn = ByteBuffer.allocate(engine.getSession().getApplicationBufferSize());
        appIn.flip();
        engine.beginHandshake();
        handshake();
    }

    private void handshake() throws IOException {
        while (true) {
            SSLEngineResult.HandshakeStatus status = engine.getHandshakeStatus();
            switch (status) {
                case NEED_WRAP:
                    wrap(ByteBuffer.allocate(0));
                    break;
                case NEED_UNWRAP:
                    if (!unwrapOnce()) throw new EOFException("The server closed the connection during TLS");
                    break;
                case NEED_TASK:
                    Runnable task;
                    while ((task = engine.getDelegatedTask()) != null) task.run();
                    break;
                default:
                    return;
            }
        }
    }

    private void wrap(ByteBuffer source) throws IOException {
        do {
            netOut.clear();
            SSLEngineResult result = engine.wrap(source, netOut);
            if (result.getStatus() == SSLEngineResult.Status.CLOSED) throw new SSLException("TLS closed");
            netOut.flip();
            rawOut.write(netOut.array(), 0, netOut.limit());
        } while (source.hasRemaining());
    }

    /** Reads network bytes until one unwrap made progress; false at the end of the stream. */
    private boolean unwrapOnce() throws IOException {
        while (true) {
            appIn.compact();
            SSLEngineResult result;
            try {
                result = engine.unwrap(netIn, appIn);
            } finally {
                appIn.flip();
            }
            switch (result.getStatus()) {
                case OK:
                    if (result.bytesConsumed() > 0 || result.bytesProduced() > 0
                            || result.getHandshakeStatus() != SSLEngineResult.HandshakeStatus.NEED_UNWRAP) return true;
                    break;
                case BUFFER_UNDERFLOW:
                    if (netIn.limit() == netIn.capacity() && netIn.position() == 0) {
                        ByteBuffer bigger = ByteBuffer.allocate(netIn.capacity() * 2);
                        bigger.put(netIn);
                        bigger.flip();
                        netIn = bigger;
                    }
                    if (!fill()) return false;
                    break;
                case BUFFER_OVERFLOW:
                    ByteBuffer bigger = ByteBuffer.allocate(appIn.capacity() * 2);
                    bigger.put(appIn);
                    bigger.flip();
                    appIn = bigger;
                    break;
                case CLOSED:
                    closed = true;
                    return false;
                default:
                    return false;
            }
        }
    }

    private boolean fill() throws IOException {
        netIn.compact();
        try {
            int read = rawIn.read(netIn.array(), netIn.position(), netIn.remaining());
            if (read < 0) return false;
            netIn.position(netIn.position() + read);
            return true;
        } finally {
            netIn.flip();
        }
    }

    final InputStream input = new InputStream() {
        @Override
        public int read() throws IOException {
            byte[] one = new byte[1];
            int n = read(one, 0, 1);
            return n < 0 ? -1 : one[0] & 0xff;
        }

        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            if (len == 0) return 0;
            while (!appIn.hasRemaining()) {
                if (closed || !unwrapOnce()) return -1;
                if (engine.getHandshakeStatus() != SSLEngineResult.HandshakeStatus.NOT_HANDSHAKING
                        && engine.getHandshakeStatus() != SSLEngineResult.HandshakeStatus.FINISHED) handshake();
            }
            int take = Math.min(len, appIn.remaining());
            appIn.get(b, off, take);
            return take;
        }
    };

    final OutputStream output = new OutputStream() {
        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
        }

        @Override
        public void write(byte[] b, int off, int len) throws IOException {
            wrap(ByteBuffer.wrap(b, off, len));
        }
    };
}
