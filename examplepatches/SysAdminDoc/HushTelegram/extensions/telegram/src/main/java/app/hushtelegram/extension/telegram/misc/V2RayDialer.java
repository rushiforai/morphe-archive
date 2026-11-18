/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.os.Build;
import androidx.annotation.Nullable;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.cert.X509Certificate;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;
import javax.net.ssl.SNIHostName;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * Opens the connection to a server from a V2Ray-style link: TCP, then TLS when the link asks for
 * it, then a WebSocket when the link asks for that. TLS sends the link's sni and checks the
 * certificate against it with the phone's own trusted authorities, unless the link turned the check
 * off. Only {@link V2RayServer} and the timing in {@link V2RayProxies} call this, for servers the
 * person listed.
 */
final class V2RayDialer {
    static final int CONNECT_MS = 8000;
    /** How long a read waits while a connection is set up. Once it carries data, reads wait as long as it takes. */
    static final int SETUP_MS = 15_000;
    /** The largest WebSocket frame read, well past what a server sends. */
    static final int MAX_FRAME = 1 << 20;
    private static final int MAX_RESPONSE = 8192;
    private static final String WS_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    private static final Pattern IPV4 = Pattern.compile("[0-9]{1,3}(?:\\.[0-9]{1,3}){3}");

    /** The authorities TLS trusts. Null is the phone's own; a test sets its own certificate's. */
    @Nullable
    static volatile TrustManager[] trusted;

    private V2RayDialer() {
    }

    /** A connection to [server], set up as its link says, with reads waiting at most {@link #SETUP_MS}. */
    static V2RayTunnels.Wire dial(V2RayLinks.Server server) throws IOException {
        Socket raw = new Socket();
        boolean done = false;
        try {
            raw.connect(new InetSocketAddress(server.host, server.port), CONNECT_MS);
            raw.setSoTimeout(SETUP_MS);
            raw.setTcpNoDelay(true);
            Socket open = raw;
            if (server.tls) open = tls(raw, server);
            Socket held = open;
            V2RayTunnels.Wire.Ends ends = new V2RayTunnels.Wire.Ends() {
                @Override
                public void timeout(int ms) throws IOException {
                    held.setSoTimeout(ms);
                }

                @Override
                public void close() throws IOException {
                    try {
                        held.close();
                    } finally {
                        raw.close();
                    }
                }
            };
            V2RayTunnels.Wire wire;
            if (server.ws) {
                wire = webSocket(server, open.getInputStream(), open.getOutputStream(), ends);
            } else {
                wire = new V2RayTunnels.Wire(open.getInputStream(), open.getOutputStream(), ends);
            }
            done = true;
            return wire;
        } finally {
            if (!done) raw.close();
        }
    }

    // ---- TLS ----------------------------------------------------------------------------------------

    private static SSLSocket tls(Socket raw, V2RayLinks.Server server) throws IOException {
        String name = server.serverName();
        SSLSocket tls;
        try {
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(null, server.insecure ? new TrustManager[]{new TrustAll()} : trusted, null);
            tls = (SSLSocket) context.getSocketFactory().createSocket(raw, name, server.port, true);
        } catch (GeneralSecurityException failure) {
            throw new IOException("TLS isn't available", failure);
        }
        SSLParameters parameters = tls.getSSLParameters();
        if (!literal(name)) parameters.setServerNames(Collections.singletonList(new SNIHostName(name)));
        // The certificate has to name the server, unless the link turned the check off.
        if (!server.insecure) parameters.setEndpointIdentificationAlgorithm("HTTPS");
        List<String> alpn = alpn(server);
        if (!alpn.isEmpty() && Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            parameters.setApplicationProtocols(alpn.toArray(new String[0]));
        }
        tls.setSSLParameters(parameters);
        tls.startHandshake();
        return tls;
    }

    /** What TLS offers for ALPN: only HTTP/1.1 under a WebSocket, which speaks nothing else, or what the link says. */
    static List<String> alpn(V2RayLinks.Server server) {
        return server.ws ? Collections.singletonList("http/1.1") : server.alpn;
    }

    /** Whether [name] is an IP address, which TLS doesn't send as a server name. */
    static boolean literal(String name) {
        return name.indexOf(':') >= 0 || IPV4.matcher(name).matches();
    }

    /** For a link with allowInsecure: any certificate passes, as the person asked. */
    private static final class TrustAll implements X509TrustManager {
        @Override
        public void checkClientTrusted(X509Certificate[] chain, String authType) {
        }

        @Override
        public void checkServerTrusted(X509Certificate[] chain, String authType) {
        }

        @Override
        public X509Certificate[] getAcceptedIssuers() {
            return new X509Certificate[0];
        }
    }

    // ---- WebSocket ----------------------------------------------------------------------------------

    /** The Host header: the link's, else the TLS name, else the server, with the port when it isn't the usual one. */
    static String hostHeader(V2RayLinks.Server server) {
        if (!server.hostHeader.isEmpty()) return server.hostHeader;
        String name = server.tls && !server.sni.isEmpty() ? server.sni : server.host;
        if (name.indexOf(':') >= 0) name = "[" + name + "]";
        boolean usual = server.port == (server.tls ? 443 : 80);
        return usual ? name : name + ":" + server.port;
    }

    private static V2RayTunnels.Wire webSocket(V2RayLinks.Server server, InputStream rawIn, OutputStream rawOut,
                                               V2RayTunnels.Wire.Ends ends) throws IOException {
        byte[] nonce = V2RayCrypto.random(16);
        String key = Base64.getEncoder().encodeToString(nonce);
        String request = "GET " + server.path + " HTTP/1.1\r\n"
                + "Host: " + hostHeader(server) + "\r\n"
                + "User-Agent: Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0 Mobile Safari/537.36\r\n"
                + "Upgrade: websocket\r\n"
                + "Connection: Upgrade\r\n"
                + "Sec-WebSocket-Key: " + key + "\r\n"
                + "Sec-WebSocket-Version: 13\r\n"
                + "\r\n";
        rawOut.write(request.getBytes(StandardCharsets.US_ASCII));
        rawOut.flush();
        InputStream in = new BufferedInputStream(rawIn, 16 * 1024);
        String response = head(in);
        String[] lines = response.split("\r\n");
        if (lines.length == 0 || !lines[0].matches("HTTP/1\\.[01] 101( .*)?")) {
            throw new IOException("the server didn't take the WebSocket");
        }
        String expected = Base64.getEncoder().encodeToString(
                V2RayCrypto.digest("SHA-1", (key + WS_GUID).getBytes(StandardCharsets.US_ASCII)));
        boolean accepted = false;
        for (int i = 1; i < lines.length; i++) {
            int colon = lines[i].indexOf(':');
            if (colon <= 0) continue;
            if (lines[i].substring(0, colon).trim().toLowerCase(Locale.ROOT).equals("sec-websocket-accept")) {
                accepted = lines[i].substring(colon + 1).trim().equals(expected);
            }
        }
        if (!accepted) throw new IOException("the WebSocket answer doesn't match");
        WsOut out = new WsOut(rawOut);
        return new V2RayTunnels.Wire(new WsIn(in, out), out, ends);
    }

    /** The response head up to its blank line. */
    private static String head(InputStream in) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(256);
        int matched = 0;
        while (matched < 4) {
            int b = in.read();
            if (b < 0) throw new IOException("the WebSocket answer was cut short");
            bytes.write(b);
            if (bytes.size() > MAX_RESPONSE) throw new IOException("the WebSocket answer is too long");
            matched = b == (matched % 2 == 0 ? '\r' : '\n') ? matched + 1 : b == '\r' ? 1 : 0;
        }
        return new String(bytes.toByteArray(), StandardCharsets.ISO_8859_1);
    }

    /** Binary frames, masked as a client's must be. Synchronized, since a ping's pong comes from the reading side. */
    static final class WsOut extends OutputStream {
        private final OutputStream wire;

        WsOut(OutputStream wire) {
            this.wire = wire;
        }

        @Override
        public void write(int b) throws IOException {
            write(new byte[]{(byte) b}, 0, 1);
        }

        @Override
        public synchronized void write(byte[] data, int offset, int length) throws IOException {
            if (length == 0) return;
            wire.write(frame(0x2, data, offset, length));
        }

        synchronized void control(int opcode, byte[] payload) throws IOException {
            wire.write(frame(opcode, payload, 0, payload.length));
            wire.flush();
        }

        static byte[] frame(int opcode, byte[] data, int offset, int length) {
            ByteArrayOutputStream frame = new ByteArrayOutputStream(length + 14);
            frame.write(0x80 | opcode);
            if (length < 126) {
                frame.write(0x80 | length);
            } else if (length < 65536) {
                frame.write(0x80 | 126);
                frame.write(length >> 8);
                frame.write(length);
            } else {
                frame.write(0x80 | 127);
                for (int shift = 56; shift >= 0; shift -= 8) frame.write((int) ((long) length >>> shift));
            }
            byte[] mask = V2RayCrypto.random(4);
            frame.write(mask, 0, 4);
            byte[] masked = new byte[length];
            for (int i = 0; i < length; i++) masked[i] = (byte) (data[offset + i] ^ mask[i & 3]);
            frame.write(masked, 0, length);
            return frame.toByteArray();
        }

        @Override
        public synchronized void flush() throws IOException {
            wire.flush();
        }

        @Override
        public void close() throws IOException {
            wire.close();
        }
    }

    /** The data of a server's frames. A close frame ends the stream, and a ping is answered. */
    static final class WsIn extends V2RayTunnels.ChunkIn {
        private static final byte[] NOTHING = new byte[0];
        private final WsOut out;

        WsIn(InputStream wire, WsOut out) {
            super(wire);
            this.out = out;
        }

        @Override
        byte[] next() throws IOException {
            byte[] head = new byte[2];
            if (!V2RayTunnels.readFully(wire, head, true)) return null;
            int opcode = head[0] & 0x0f;
            boolean masked = (head[1] & 0x80) != 0;
            long length = head[1] & 0x7f;
            if (length == 126) {
                byte[] more = new byte[2];
                V2RayTunnels.readFully(wire, more, false);
                length = (more[0] & 0xff) << 8 | (more[1] & 0xff);
            } else if (length == 127) {
                byte[] more = new byte[8];
                V2RayTunnels.readFully(wire, more, false);
                length = 0;
                for (byte b : more) length = length << 8 | (b & 0xff);
            }
            if (length < 0 || length > MAX_FRAME) throw new IOException("a WebSocket frame is too large");
            byte[] mask = new byte[4];
            if (masked) V2RayTunnels.readFully(wire, mask, false);
            byte[] payload = new byte[(int) length];
            V2RayTunnels.readFully(wire, payload, false);
            if (masked) for (int i = 0; i < payload.length; i++) payload[i] ^= mask[i & 3];
            switch (opcode) {
                case 0x0:
                case 0x1:
                case 0x2:
                    return payload;
                case 0x8:
                    return null;
                case 0x9:
                    out.control(0xA, payload);
                    return NOTHING;
                case 0xA:
                    return NOTHING;
                default:
                    throw new IOException("not a WebSocket frame");
            }
        }
    }
}
