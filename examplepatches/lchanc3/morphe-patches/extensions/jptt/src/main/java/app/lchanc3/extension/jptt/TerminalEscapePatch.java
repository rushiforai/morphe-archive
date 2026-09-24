package app.lchanc3.extension.jptt;

import android.util.Log;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Drops the ANSI escape sequences JPTT's terminal emulator cannot parse, before
 * they reach it.
 *
 * <p>{@code JSocketSimple.startConnection()} decodes CSI sequences by switching
 * on the character it is holding: {@code A B C D H J K m} are acted on and end
 * the sequence, and <em>everything else</em> — including every final byte it has
 * no case for — is appended to a 32 character buffer. Since the sequence never
 * ends, the buffer keeps eating the screen content that follows it and only
 * gives up once it overflows, by which point a couple of lines of the terminal
 * are wrong and fragments of the escape sequence have been printed as visible
 * text.
 *
 * <p>PTT started bracketing its screen repaints with the synchronized output
 * pair {@code ESC[?2026h} / {@code ESC[?2026l}, whose final bytes are {@code h}
 * and {@code l}. So every repaint corrupted the screen, the column offsets JPTT
 * reads everything by no longer lined up, and entering a board never got past
 * {@code getToBoard()}'s wait for 請按任意鍵繼續 — the article list just said
 * 載入中 until it gave up.
 *
 * <p>3.8.5 fixed that one sequence: a {@code ?} sets a private-mode flag and an
 * {@code h} or {@code l} then ends the sequence. It did not implement the rest
 * of ECMA-48, which is what PTT asked third party clients for in PttCurrent, so
 * a final byte outside {@code ABCDHJKm} still runs away with the screen. The
 * Cursor Position Report {@code ESC[6n} that PTT's login program sends to detect
 * the terminal's encoding is exactly that, and no {@code ?} precedes it.
 *
 * <p>This wraps the reader the emulator reads from and drops every sequence the
 * emulator has no case for, which is PTT's own advice for a client that is not
 * going to implement one: read the whole CSI sequence, then ignore it. Nothing
 * is lost — synchronized output and mouse tracking are hints to a real terminal,
 * and a report JPTT cannot answer is better unanswered than half read — and the
 * sequences JPTT does implement are passed through untouched.
 */
@SuppressWarnings("unused")
public final class TerminalEscapePatch {

    /** Called from each patched assignment to {@code JSocketSimple.in}. */
    public static InputStreamReader sanitize(InputStreamReader reader) {
        if (reader == null || reader instanceof SanitizingReader) {
            return reader;
        }
        try {
            return new SanitizingReader(reader);
        } catch (Throwable ex) {
            // Better an app that scrolls badly than one that cannot connect.
            Log.e(JpttContext.LOG_TAG, "Could not wrap the terminal reader", ex);
            return reader;
        }
    }

    private static final class SanitizingReader extends InputStreamReader {

        private static final int ESC = 0x1b;

        /** CSI final bytes, the range that ends a sequence per ECMA-48. */
        private static final int FINAL_MIN = 0x40;
        private static final int FINAL_MAX = 0x7e;

        /** The final bytes JSocketSimple.startConnection() has a case for. */
        private static final String HANDLED_FINALS = "ABCDHJKm";

        /**
         * Longest sequence to buffer. PTT's are far shorter; anything past this
         * is not a CSI sequence at all, so it is handed over unchanged.
         */
        private static final int MAX_SEQUENCE = 64;

        private final InputStreamReader source;

        /** Characters read ahead of the emulator, returned before reading more. */
        private final char[] pending = new char[MAX_SEQUENCE + 1];

        private int pendingCount;
        private int pendingIndex;

        SanitizingReader(InputStreamReader source) {
            // InputStreamReader is the declared type of the field being wrapped,
            // so this has to be one. The stream handed to the superclass is never
            // read, because every read is overridden below.
            super(new ByteArrayInputStream(new byte[0]));
            this.source = source;
        }

        @Override
        public int read() throws IOException {
            while (true) {
                if (pendingIndex < pendingCount) {
                    return pending[pendingIndex++];
                }
                pendingIndex = 0;
                pendingCount = 0;

                int first = source.read();
                if (first != ESC) {
                    return first;
                }

                int second = source.read();
                if (second != '[') {
                    // Not a CSI sequence. The emulator handles ESC followed by
                    // one character itself, so hand both over.
                    if (second >= 0) {
                        pending[pendingCount++] = (char) second;
                    }
                    return ESC;
                }

                pending[pendingCount++] = '[';
                int finalByte = -1;
                while (pendingCount < pending.length) {
                    int c = source.read();
                    if (c < 0) {
                        break;
                    }
                    pending[pendingCount++] = (char) c;
                    if (c >= FINAL_MIN && c <= FINAL_MAX) {
                        finalByte = c;
                        break;
                    }
                }

                if (finalByte < 0 || isHandled(finalByte)) {
                    // Ended early, ran too long, or a sequence the emulator
                    // implements: give it exactly what arrived.
                    return ESC;
                }

                // One the emulator has no case for. Drop it and read on.
                pendingCount = 0;
            }
        }

        private boolean isHandled(int finalByte) {
            if (HANDLED_FINALS.indexOf(finalByte) < 0) {
                return false;
            }
            // `J` only ends the sequence for the emulator when its parameter is
            // exactly "2"; every other form falls through still accumulating,
            // so it is no better than an unknown final byte. pending holds
            // '[' + the parameters + 'J'.
            return finalByte != 'J' || (pendingCount == 3 && pending[1] == '2');
        }

        @Override
        public int read(char[] buffer, int offset, int length) throws IOException {
            if (length == 0) {
                return 0;
            }
            int c = read();
            if (c < 0) {
                return -1;
            }
            // One character at a time: reading further here could block inside a
            // sequence that is still arriving. JPTT's emulator reads one anyway.
            buffer[offset] = (char) c;
            return 1;
        }

        @Override
        public boolean ready() throws IOException {
            return pendingIndex < pendingCount || source.ready();
        }

        @Override
        public void close() throws IOException {
            source.close();
        }
    }

    private TerminalEscapePatch() {
    }
}
