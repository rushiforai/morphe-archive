package com.waze.gw;

import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;

/** Small RFC 6455 frame codec for the bounded HLP/1 text stream. */
final class WebSocketFrameCodec {
    static final int MAX_MESSAGE_BYTES = 512;
    static final int OPCODE_CONTINUATION = 0x0;
    static final int OPCODE_TEXT = 0x1;
    static final int OPCODE_CLOSE = 0x8;
    static final int OPCODE_PING = 0x9;
    static final int OPCODE_PONG = 0xA;

    interface ControlSink { void send(int opcode, byte[] payload) throws IOException; }

    private WebSocketFrameCodec() { }

    static byte[] encodeClientFrame(int opcode, byte[] payload, byte[] mask) throws IOException {
        byte[] body = payload == null ? new byte[0] : payload;
        if (mask == null || mask.length != 4) throw new IOException("invalid WebSocket mask");
        if (body.length > 65535) throw new IOException("WebSocket payload too large");
        int header = body.length <= 125 ? 2 : 4;
        byte[] frame = new byte[header + 4 + body.length];
        int p = 0;
        frame[p++] = (byte) (0x80 | (opcode & 0x0F));
        if (body.length <= 125) {
            frame[p++] = (byte) (0x80 | body.length);
        } else {
            frame[p++] = (byte) (0x80 | 126);
            frame[p++] = (byte) ((body.length >>> 8) & 0xFF);
            frame[p++] = (byte) (body.length & 0xFF);
        }
        System.arraycopy(mask, 0, frame, p, 4);
        p += 4;
        for (int i = 0; i < body.length; i++) frame[p + i] = (byte) (body[i] ^ mask[i & 3]);
        return frame;
    }

    /** Reads until one complete text message arrives. Returns null after a peer close frame. */
    static byte[] readTextMessage(InputStream input, ControlSink controls) throws IOException {
        ByteArrayOutputStream fragments = null;
        boolean textStarted = false;
        while (true) {
            int first = readRequired(input);
            int second = readRequired(input);
            boolean fin = (first & 0x80) != 0;
            if ((first & 0x70) != 0) throw new ProtocolException("WebSocket RSV bits are set");
            int opcode = first & 0x0F;
            boolean masked = (second & 0x80) != 0;
            if (masked) throw new ProtocolException("server WebSocket frame must not be masked");
            long length = second & 0x7F;
            if (length == 126) {
                length = ((long) readRequired(input) << 8) | readRequired(input);
            } else if (length == 127) {
                length = 0L;
                for (int i = 0; i < 8; i++) length = (length << 8) | readRequired(input);
            }
            boolean control = opcode >= 0x8;
            if (control && (!fin || length > 125))
                throw new ProtocolException("invalid WebSocket control frame");
            if (length < 0L || length > MAX_MESSAGE_BYTES)
                throw new ProtocolException("WebSocket HLP message exceeds 512 bytes");
            byte[] payload = new byte[(int) length];
            readFully(input, payload);

            if (opcode == OPCODE_PING) {
                if (controls != null) controls.send(OPCODE_PONG, payload);
                continue;
            }
            if (opcode == OPCODE_PONG) continue;
            if (opcode == OPCODE_CLOSE) {
                if (controls != null) controls.send(OPCODE_CLOSE, payload);
                return null;
            }
            if (opcode == OPCODE_TEXT) {
                if (textStarted) throw new ProtocolException("nested WebSocket text message");
                textStarted = true;
                fragments = new ByteArrayOutputStream(Math.max(32, payload.length));
                fragments.write(payload);
            } else if (opcode == OPCODE_CONTINUATION) {
                if (!textStarted || fragments == null)
                    throw new ProtocolException("unexpected WebSocket continuation");
                if (fragments.size() + payload.length > MAX_MESSAGE_BYTES)
                    throw new ProtocolException("fragmented HLP message exceeds 512 bytes");
                fragments.write(payload);
            } else {
                throw new ProtocolException("unsupported WebSocket opcode " + opcode);
            }
            if (fin) return fragments.toByteArray();
        }
    }

    private static int readRequired(InputStream input) throws IOException {
        int value = input.read();
        if (value < 0) throw new EOFException("WebSocket EOF");
        return value;
    }

    private static void readFully(InputStream input, byte[] output) throws IOException {
        int offset = 0;
        while (offset < output.length) {
            int count = input.read(output, offset, output.length - offset);
            if (count < 0) throw new EOFException("WebSocket EOF in payload");
            if (count == 0) continue;
            offset += count;
        }
    }
}
