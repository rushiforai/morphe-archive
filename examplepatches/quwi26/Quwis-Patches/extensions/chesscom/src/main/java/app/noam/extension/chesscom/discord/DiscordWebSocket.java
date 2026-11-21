package app.noam.extension.chesscom.discord;

import android.os.Build;
import android.util.Base64;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Locale;

import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

/**
 * The share of RFC 6455 the Discord gateway needs: a TLS handshake, text frames with the client
 * mask, ping and pong, and close. Written here rather than borrowed from the app, so a chess.com
 * update cannot take it away.
 */
final class DiscordWebSocket implements Closeable {
    static final String HOST = "gateway.discord.gg";

    private static final String PATH = "/?v=9&encoding=json";
    private static final String GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    private static final int READ_TIMEOUT = 15_000;
    private static final int MAX_FRAME = 1 << 20;
    private static final SecureRandom RANDOM = new SecureRandom();

    private final SSLSocket socket;
    private final InputStream input;
    private final OutputStream output;

    private DiscordWebSocket(SSLSocket socket, InputStream input, OutputStream output) {
        this.socket = socket;
        this.input = input;
        this.output = output;
    }

    static DiscordWebSocket open() throws IOException {
        SSLSocket socket = (SSLSocket) SSLSocketFactory.getDefault().createSocket();
        try {
            socket.connect(new InetSocketAddress(HOST, 443), 15_000);
            socket.setSoTimeout(15_000);
            if (Build.VERSION.SDK_INT >= 24) {
                SSLParameters parameters = socket.getSSLParameters();
                parameters.setEndpointIdentificationAlgorithm("HTTPS");
                socket.setSSLParameters(parameters);
            }
            socket.startHandshake();
            if (Build.VERSION.SDK_INT < 24
                && !javax.net.ssl.HttpsURLConnection.getDefaultHostnameVerifier()
                    .verify(HOST, socket.getSession())) {
                throw new IOException("The Discord gateway's certificate does not match its name");
            }

            OutputStream output = socket.getOutputStream();
            String key = Base64.encodeToString(random(16), Base64.NO_WRAP);
            output.write((
                "GET " + PATH + " HTTP/1.1\r\n"
                    + "Host: " + HOST + "\r\n"
                    + "Upgrade: websocket\r\n"
                    + "Connection: Upgrade\r\n"
                    + "Sec-WebSocket-Key: " + key + "\r\n"
                    + "Sec-WebSocket-Version: 13\r\n"
                    + "User-Agent: " + DiscordApp.USER_AGENT + "\r\n"
                    + "\r\n").getBytes("UTF-8"));
            output.flush();

            InputStream input = socket.getInputStream();
            String status = readLine(input);
            if (!status.contains(" 101")) {
                throw new IOException("The Discord gateway answered: " + status);
            }
            String accept = null;
            String line;
            while (!(line = readLine(input)).isEmpty()) {
                int colon = line.indexOf(':');
                if (colon > 0 && line.substring(0, colon).trim().equalsIgnoreCase("Sec-WebSocket-Accept")) {
                    accept = line.substring(colon + 1).trim();
                }
            }
            if (accept != null && !accept.equals(accept(key))) {
                throw new IOException("The Discord gateway answered with the wrong key");
            }
            return new DiscordWebSocket(socket, input, output);
        } catch (IOException failure) {
            closeQuietly(socket);
            throw failure;
        } catch (Throwable failure) {
            closeQuietly(socket);
            throw new IOException("Could not reach the Discord gateway", failure);
        }
    }

    /**
     * One whole message, or null when nothing arrived within {@code timeoutMs}. The timeout only
     * covers the wait for its first byte, so a message is never cut in half.
     */
    String readText(int timeoutMs) throws IOException {
        ByteArrayOutputStream message = new ByteArrayOutputStream();
        int messageOpcode = -1;
        int wait = timeoutMs;
        while (true) {
            Frame frame = readFrame(wait);
            if (frame == null) return null;
            wait = READ_TIMEOUT;
            if (frame.opcode >= 0x8) {
                if (frame.opcode == 0x8) {
                    throw new Closed(closeCode(frame.payload), closeReason(frame.payload));
                }
                if (frame.opcode == 0x9) sendFrame(0xA, frame.payload); // ping -> pong
                continue;
            }
            if (frame.opcode != 0x0) {
                message.reset();
                messageOpcode = frame.opcode;
            }
            message.write(frame.payload);
            if (frame.fin) break;
        }
        if (messageOpcode != 0x1) return "";
        return new String(message.toByteArray(), "UTF-8");
    }

    void sendText(String text) throws IOException {
        sendFrame(0x1, text.getBytes("UTF-8"));
    }

    @Override
    public void close() {
        try {
            sendFrame(0x8, new byte[] {0x03, (byte) 0xE8}); // 1000: normal closure
        } catch (Throwable ignored) {
            // Already gone.
        }
        closeQuietly(socket);
    }

    private void sendFrame(int opcode, byte[] payload) throws IOException {
        ByteArrayOutputStream frame = new ByteArrayOutputStream(payload.length + 14);
        frame.write(0x80 | opcode);
        int length = payload.length;
        if (length < 126) {
            frame.write(0x80 | length);
        } else if (length < 65_536) {
            frame.write(0x80 | 126);
            frame.write((length >> 8) & 0xFF);
            frame.write(length & 0xFF);
        } else {
            frame.write(0x80 | 127);
            for (int shift = 56; shift >= 0; shift -= 8) frame.write((int) (((long) length >> shift) & 0xFF));
        }
        byte[] mask = random(4);
        frame.write(mask, 0, mask.length);
        for (int i = 0; i < length; i++) frame.write(payload[i] ^ mask[i & 3]);
        synchronized (output) {
            output.write(frame.toByteArray());
            output.flush();
        }
    }

    private Frame readFrame(int timeoutMs) throws IOException {
        socket.setSoTimeout(Math.max(1, timeoutMs));
        int first;
        try {
            first = input.read();
        } catch (SocketTimeoutException timeout) {
            return null;
        }
        if (first < 0) throw new IOException("Discord closed the connection");
        socket.setSoTimeout(READ_TIMEOUT);

        int second = byteAt();
        boolean masked = (second & 0x80) != 0;
        long length = second & 0x7F;
        if (length == 126) {
            length = (byteAt() << 8) | byteAt();
        } else if (length == 127) {
            length = 0;
            for (int i = 0; i < 8; i++) length = (length << 8) | byteAt();
        }
        if (length < 0 || length > MAX_FRAME) throw new IOException("Discord sent a frame of " + length + " bytes");

        byte[] mask = masked ? bytes(4) : null;
        byte[] payload = bytes((int) length);
        if (mask != null) {
            for (int i = 0; i < payload.length; i++) payload[i] ^= mask[i & 3];
        }
        return new Frame((first & 0x80) != 0, first & 0x0F, payload);
    }

    private int byteAt() throws IOException {
        int value = input.read();
        if (value < 0) throw new IOException("Discord closed the connection");
        return value;
    }

    private byte[] bytes(int count) throws IOException {
        byte[] value = new byte[count];
        int offset = 0;
        while (offset < count) {
            int read = input.read(value, offset, count - offset);
            if (read < 0) throw new IOException("Discord closed the connection");
            offset += read;
        }
        return value;
    }

    private static String readLine(InputStream input) throws IOException {
        ByteArrayOutputStream line = new ByteArrayOutputStream();
        int value;
        while ((value = input.read()) != -1) {
            if (value == '\n') return new String(line.toByteArray(), "UTF-8");
            if (value != '\r') line.write(value);
        }
        throw new IOException("The Discord gateway closed the connection");
    }

    private static int closeCode(byte[] payload) {
        return payload.length >= 2 ? ((payload[0] & 0xFF) << 8) | (payload[1] & 0xFF) : 1005;
    }

    private static String closeReason(byte[] payload) {
        if (payload.length <= 2) return "";
        try {
            return new String(payload, 2, payload.length - 2, "UTF-8");
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String accept(String key) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            byte[] hash = digest.digest((key + GUID).getBytes("US-ASCII"));
            return Base64.encodeToString(hash, Base64.NO_WRAP);
        } catch (Throwable impossible) {
            throw new IllegalStateException("SHA-1 is not on this phone", impossible);
        }
    }

    private static byte[] random(int bytes) {
        byte[] value = new byte[bytes];
        RANDOM.nextBytes(value);
        return value;
    }

    private static void closeQuietly(Socket socket) {
        try {
            socket.close();
        } catch (Throwable ignored) {
            // Nothing to do.
        }
    }

    /** Discord closed the session on purpose; the code says whether another try makes sense. */
    static final class Closed extends IOException {
        final int code;

        Closed(int code, String reason) {
            super(String.format(Locale.ROOT, "Discord closed the connection: %d %s", code, reason).trim());
            this.code = code;
        }
    }

    private static final class Frame {
        final boolean fin;
        final int opcode;
        final byte[] payload;

        Frame(boolean fin, int opcode, byte[] payload) {
            this.fin = fin;
            this.opcode = opcode;
            this.payload = payload;
        }
    }
}
