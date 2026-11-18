package app.saketh.extension.fonts;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Arrays;

// Run with javac/java as documented in README. No Android runtime is needed.
public final class FontFileCheck {
    public static void main(String[] args) throws Exception {
        byte[] font = new byte[28];
        font[1] = 1;
        font[5] = 1;
        ByteArrayOutputStream result = new ByteArrayOutputStream();
        FontFile.copy(new ByteArrayInputStream(font), result);
        if (!Arrays.equals(font, result.toByteArray())) throw new AssertionError("TrueType bytes changed");
        font[0] = 'O'; font[1] = 'T'; font[2] = 'T'; font[3] = 'O';
        result.reset();
        FontFile.copy(new ByteArrayInputStream(font), result);
        if (!Arrays.equals(font, result.toByteArray())) throw new AssertionError("OpenType bytes changed");
        reject(new byte[0]);
        reject(new byte[11]);
        reject(new byte[28]);
        font[5] = 0;
        reject(font);
        font[5] = 1;
        final byte[] header = font;
        InputStream sized = new InputStream() {
            int position;
            public int read() { return position < header.length ? header[position++] & 255 : -1; }
            public int read(byte[] b, int off, int len) {
                int remaining = FontFile.MAX_BYTES + 1 - position;
                if (remaining == 0) return -1;
                int count = Math.min(len, remaining);
                position += count;
                return count;
            }
        };
        try {
            FontFile.copy(sized, OutputStream.nullOutputStream());
            throw new AssertionError("Oversized file accepted");
        } catch (IOException expected) {
            if (!expected.getMessage().contains("limit")) throw expected;
        }
        System.out.println("PASS: TTF/OTF copy, invalid headers, truncation, and size boundary");
    }

    private static void reject(byte[] bytes) throws Exception {
        try {
            FontFile.copy(new ByteArrayInputStream(bytes), OutputStream.nullOutputStream());
            throw new AssertionError("Invalid font header accepted");
        } catch (IOException expected) {
            // Refused before Android's font parser is reached.
        }
    }
}
