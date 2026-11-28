package com.waze.gw;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;

/** Bounded, transport-independent HLP line framing. */
final class HlpFrameCodec {
    static final int MAX_FRAME_BYTES = 512; // includes LF
    private final byte[] line = new byte[MAX_FRAME_BYTES - 1];
    private int length;
    private boolean overflow;
    private final boolean usbLogLines;
    private boolean objectStarted;
    private boolean noise;
    /** Inside an ESP-IDF log line that interrupted a frame; dropped up to its own LF. */
    private boolean skipLog;

    HlpFrameCodec() { this(false); }

    HlpFrameCodec(boolean usbLogLines) { this.usbLogLines = usbLogLines; }

    interface Listener {
        void onFrame(String json);
        void onMalformedUtf8();
        void onOversizedFrame();
    }

    static byte[] encode(String json) throws IOException {
        if (json == null) throw new IOException("null HLP frame");
        byte[] body = strictUtf8(json);
        if (body.length + 1 > MAX_FRAME_BYTES) {
            throw new IOException("HLP frame exceeds " + MAX_FRAME_BYTES + " bytes");
        }
        byte[] out = new byte[body.length + 1];
        System.arraycopy(body, 0, out, 0, body.length);
        out[body.length] = '\n';
        return out;
    }

    private static byte[] strictUtf8(String value) throws IOException {
        try {
            CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT);
            ByteBuffer encoded = StandardCharsets.UTF_8.newEncoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .encode(CharBuffer.wrap(value));
            byte[] result = new byte[encoded.remaining()];
            encoded.get(result);
            return result;
        } catch (CharacterCodingException e) {
            throw new IOException("invalid UTF-16/UTF-8 input", e);
        }
    }

    void reset() {
        length = 0;
        overflow = false;
        objectStarted = false;
        noise = false;
        skipLog = false;
    }

    /**
     * Called right after a ' ' was appended to a frame in progress. When the bytes just before it
     * are an ESP-IDF log prefix ("I (3190) tag: ", optionally behind an ANSI colour code), returns
     * the index where that log line began, otherwise -1. The firmware logs to the same UART from
     * another task, so a log line can land in the middle of a frame; the level letter then follows
     * the frame text directly ("...speed_offset_kmhI (3190) HLP: ...").
     */
    private int logPrefixStart() {
        int tagEnd = length - 3;                  // line[length - 2] == ':'
        int i = tagEnd;
        while (i >= 0 && isTagChar(line[i])) i--;
        if (i == tagEnd || tagEnd - i > 32 || i < 1 || line[i] != ' ' || line[i - 1] != ')') return -1;
        int digitsEnd = i - 2;
        int d = digitsEnd;
        while (d >= 0 && line[d] >= '0' && line[d] <= '9') d--;
        if (d == digitsEnd || d < 2 || line[d] != '(' || line[d - 1] != ' ') return -1;
        int level = d - 2;
        if ("EWIDV".indexOf(line[level]) < 0) return -1;
        int start = level;
        if (start > 0 && line[start - 1] == 'm') {      // ESC [ 0;32 m
            int j = start - 2;
            while (j >= 0 && start - j <= 10 && (line[j] == ';' || (line[j] >= '0' && line[j] <= '9'))) j--;
            if (j >= 1 && line[j] == '[' && line[j - 1] == 0x1b) start = j - 1;
        }
        return start;
    }

    private static boolean isTagChar(byte b) {
        return (b >= 'A' && b <= 'Z') || (b >= 'a' && b <= 'z') || (b >= '0' && b <= '9')
                || b == '_' || b == '-' || b == '.';
    }

    /** Feed arbitrary transport chunks. No allocation is based on peer-controlled line length. */
    void accept(byte[] bytes, int count, Listener listener) {
        if (bytes == null || listener == null) return;
        int n = Math.max(0, Math.min(count, bytes.length));
        for (int i = 0; i < n; i++) {
            int b = bytes[i] & 0xff;
            // USB shares its stream with boot/log output. Classify raw bytes before UTF-8
            // decoding; never recover an embedded object from a discarded log line.
            if (usbLogLines) {
                if (skipLog) {
                    // The log line's LF is not the end of the frame it interrupted.
                    if (b == '\n') skipLog = false;
                    continue;
                }
                if (b == '\n' && !objectStarted) {
                    reset();
                    continue;
                }
                if (noise) continue;
                if (!objectStarted && b != ' ' && b != '\t' && b != '\r') {
                    if (b != '{') {
                        noise = true;
                        length = 0;
                        continue;
                    }
                    objectStarted = true;
                }
            }
            if (b == '\n') {
                if (overflow) {
                    listener.onOversizedFrame();
                } else {
                    int end = length;
                    if (end > 0 && line[end - 1] == '\r') end--;
                    try {
                        CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder()
                                .onMalformedInput(CodingErrorAction.REPORT)
                                .onUnmappableCharacter(CodingErrorAction.REPORT);
                        String json = decoder.decode(ByteBuffer.wrap(line, 0, end)).toString();
                        listener.onFrame(json);
                    } catch (CharacterCodingException e) {
                        listener.onMalformedUtf8();
                    }
                }
                reset();
            } else if (!overflow) {
                if (length >= line.length) {
                    overflow = true;
                } else {
                    line[length++] = (byte) b;
                    if (usbLogLines && objectStarted && b == ' ' && length >= 8
                            && line[length - 2] == ':') {
                        int start = logPrefixStart();
                        if (start >= 0) {
                            length = start;
                            skipLog = true;
                        }
                    }
                }
            }
        }
    }
}
