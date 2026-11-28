package com.waze.gw;

import android.content.Context;
import android.util.Base64;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Locale;

/** Experimental private-LAN WebSocket transport. Android is client; the HUD is server. */
final class WebSocketHudTransport implements HudTransport {
    private static final int CONNECT_TIMEOUT_MS = 5000;
    private static final int MAX_HTTP_HEADER_BYTES = 8192;
    private static final SecureRandom RANDOM = new SecureRandom();

    private final HudDeviceRepository devices;
    private final Object writeLock = new Object();
    private volatile Socket socket;
    private volatile OutputStream output;
    private volatile boolean connected;
    private volatile boolean stopping;
    private volatile HudTransportListener listener;
    private Thread reader;

    WebSocketHudTransport(Context context, HudDeviceRepository devices) {
        if (context == null) throw new NullPointerException("context");
        if (devices == null) throw new NullPointerException("devices");
        this.devices = devices;
    }

    @Override public synchronized void setListener(HudTransportListener value) { listener = value; }

    @Override public void connect() throws Exception {
        if (stopping) throw new IOException("local shutdown");
        final String host = validateHost(devices.webSocketHost());
        final int port = devices.webSocketPort();
        final String path = validatePath(devices.webSocketPath());
        if (stopping) throw new IOException("local shutdown");
        InetAddress address = resolvePrivateAddress(host);
        final Socket candidate;
        synchronized (this) {
            if (stopping) throw new IOException("local shutdown");
            candidate = new Socket();
            socket = candidate; // Publish atomically with the cancellation check.
        }
        try {
            candidate.connect(new InetSocketAddress(address, port), CONNECT_TIMEOUT_MS);
            candidate.setKeepAlive(true);
            candidate.setTcpNoDelay(true);
            InputStream input = candidate.getInputStream();
            OutputStream target = candidate.getOutputStream();
            performUpgrade(candidate, input, target, host, port, path);
            candidate.setSoTimeout(0); // One-way HUD sessions may stay idle indefinitely.
            synchronized (this) {
                if (stopping) throw new IOException("local shutdown");
                output = target;
                connected = true;
                startReader(input);
                HudTransportListener current = listener;
                if (current != null) current.onTransportConnected();
            }
        } catch (Exception error) {
            try { candidate.close(); } catch (IOException ignored) { }
            closeSocket();
            throw error;
        }
    }

    private void performUpgrade(Socket candidate, InputStream input, OutputStream target, String host, int port,
                                String path) throws Exception {
        byte[] nonce = new byte[16];
        RANDOM.nextBytes(nonce);
        String key = Base64.encodeToString(nonce, Base64.NO_WRAP);
        String request = "GET " + path + " HTTP/1.1\r\n"
                + "Host: " + host + ":" + port + "\r\n"
                + "Upgrade: websocket\r\n"
                + "Connection: Upgrade\r\n"
                + "Sec-WebSocket-Key: " + key + "\r\n"
                + "Sec-WebSocket-Version: 13\r\n"
                + "Sec-WebSocket-Protocol: hlp.v1\r\n\r\n";
        target.write(request.getBytes(StandardCharsets.US_ASCII));
        target.flush();
        String response = readHttpHeader(candidate, input);
        String lower = response.toLowerCase(Locale.US);
        int firstEnd = response.indexOf("\r\n");
        String status = firstEnd < 0 ? response : response.substring(0, firstEnd);
        if (!status.matches("HTTP/1\\.[01] 101(?: .*)?"))
            throw new IOException("WebSocket upgrade rejected: " + status);
        if (!containsHeaderToken(lower, "upgrade", "websocket")
                || !containsHeaderToken(lower, "connection", "upgrade"))
            throw new IOException("invalid WebSocket upgrade response");
        String expected = Base64.encodeToString(MessageDigest.getInstance("SHA-1")
                .digest((key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11")
                        .getBytes(StandardCharsets.US_ASCII)), Base64.NO_WRAP);
        String actual = headerValue(response, "Sec-WebSocket-Accept");
        if (!expected.equals(actual)) throw new IOException("invalid WebSocket accept key");
        String protocol = headerValue(response, "Sec-WebSocket-Protocol");
        if (protocol.length() > 0 && !"hlp.v1".equalsIgnoreCase(protocol))
            throw new IOException("unsupported WebSocket subprotocol");
    }

    private void startReader(final InputStream input) {
        reader = new Thread(new Runnable() {
            @Override public void run() {
                try {
                    while (!stopping) {
                        byte[] message = WebSocketFrameCodec.readTextMessage(input,
                                new WebSocketFrameCodec.ControlSink() {
                                    @Override public void send(int opcode, byte[] payload)
                                            throws IOException { writeWebSocket(opcode, payload); }
                                });
                        if (message == null) {
                            if (!stopping) notifyDisconnected("WebSocket peer closed");
                            return;
                        }
                        byte[] hlp;
                        if (message.length == 0 || message[message.length - 1] != '\n') {
                            hlp = new byte[message.length + 1];
                            System.arraycopy(message, 0, hlp, 0, message.length);
                            hlp[hlp.length - 1] = '\n';
                        } else hlp = message;
                        HudTransportListener current = listener;
                        if (current != null) current.onTransportBytes(hlp, hlp.length);
                    }
                } catch (IOException error) {
                    if (!stopping) notifyDisconnected(error.getMessage());
                } finally {
                    connected = false;
                    closeSocket();
                }
            }
        }, "hud-ws-rx");
        reader.setDaemon(true);
        reader.start();
    }

    @Override public void sendFrame(byte[] frame) throws IOException {
        if (frame == null) throw new IOException("null frame");
        if (frame.length > WebSocketFrameCodec.MAX_MESSAGE_BYTES)
            throw new IOException("HLP frame exceeds WebSocket limit");
        writeWebSocket(WebSocketFrameCodec.OPCODE_TEXT, frame);
    }

    private void writeWebSocket(int opcode, byte[] payload) throws IOException {
        synchronized (writeLock) {
            OutputStream target = output;
            if (!connected || target == null) throw new IOException("WebSocket disconnected");
            byte[] mask = new byte[4];
            RANDOM.nextBytes(mask);
            byte[] encoded = WebSocketFrameCodec.encodeClientFrame(opcode, payload, mask);
            try {
                target.write(encoded);
                target.flush();
            } catch (IOException error) {
                connected = false;
                throw error;
            }
        }
    }

    @Override public boolean isConnected() { return connected; }
    @Override public String transportName() { return "ws"; }

    @Override public synchronized void disconnect() {
        stopping = true;
        // ponytail: Teardown closes TCP without a WebSocket close frame; send one on an I/O
        // thread only if a HUD needs the handshake. Service shutdown runs on the main thread.
        connected = false;
        closeSocket();
        Thread current = reader;
        if (current != null) current.interrupt();
    }

    private synchronized void closeSocket() {
        Socket current = socket;
        socket = null;
        output = null;
        if (current != null) try { current.close(); } catch (IOException ignored) { }
    }

    private void notifyDisconnected(String reason) {
        HudTransportListener current = listener;
        if (current != null) current.onTransportDisconnected(
                reason == null || reason.length() == 0 ? "WebSocket disconnected" : reason);
    }

    private static String validateHost(String value) throws IOException {
        String host = value == null ? "" : value.trim();
        if (host.length() == 0 || host.length() > 253 || host.indexOf('/') >= 0
                || host.indexOf(':') >= 0 || host.indexOf('\r') >= 0 || host.indexOf('\n') >= 0)
            throw new IOException("invalid WebSocket host");
        return host;
    }

    private static String validatePath(String value) throws IOException {
        String path = value == null ? "/hlp" : value.trim();
        if (path.length() == 0) path = "/hlp";
        if (path.charAt(0) != '/' || path.length() > 64 || path.indexOf(' ') >= 0
                || path.indexOf('\r') >= 0 || path.indexOf('\n') >= 0)
            throw new IOException("invalid WebSocket path");
        return path;
    }

    private static InetAddress resolvePrivateAddress(String host) throws IOException {
        InetAddress[] addresses = InetAddress.getAllByName(host);
        for (InetAddress address : addresses) {
            if (address.isSiteLocalAddress() || address.isLinkLocalAddress()
                    || address.isLoopbackAddress()) return address;
        }
        throw new IOException("WebSocket HUD must use a private LAN address");
    }

    private static String readHttpHeader(Socket candidate, InputStream input) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream(512);
        long deadline = System.nanoTime() + CONNECT_TIMEOUT_MS * 1000000L;
        int matched = 0;
        while (bytes.size() < MAX_HTTP_HEADER_BYTES) {
            long remaining = deadline - System.nanoTime();
            if (remaining <= 0) throw new SocketTimeoutException("WebSocket upgrade timed out");
            candidate.setSoTimeout((int) ((remaining + 999999L) / 1000000L));
            int value = input.read();
            if (value < 0) throw new IOException("EOF during WebSocket upgrade");
            bytes.write(value);
            if ((matched == 0 || matched == 2) && value == '\r') matched++;
            else if ((matched == 1 || matched == 3) && value == '\n') matched++;
            else matched = value == '\r' ? 1 : 0;
            if (matched == 4) return new String(bytes.toByteArray(), StandardCharsets.ISO_8859_1);
        }
        throw new IOException("WebSocket response header too large");
    }

    private static boolean containsHeaderToken(String lowerResponse, String name, String token) {
        String value = headerValue(lowerResponse, name.toLowerCase(Locale.US));
        if (value.length() == 0) return false;
        for (String part : value.split(",")) if (token.equals(part.trim())) return true;
        return false;
    }

    private static String headerValue(String response, String name) {
        String[] lines = response.split("\\r\\n");
        for (String line : lines) {
            int colon = line.indexOf(':');
            if (colon > 0 && name.equalsIgnoreCase(line.substring(0, colon).trim()))
                return line.substring(colon + 1).trim();
        }
        return "";
    }
}
