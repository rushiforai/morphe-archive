package app.morphe.extension.playbooks.fonts;

import java.io.IOException;
import java.io.InputStream;

/** Font format detection by file signature. */
public final class FontFiles {
    private FontFiles() {
    }

    /**
     * MIME type of a font by its first 4 bytes, or null if it is not a font the reader WebView
     * can load (TrueType, OpenType/CFF, TrueType collections, WOFF and WOFF2).
     */
    public static String detectMimeType(byte[] header) {
        if (header == null || header.length < 4) return null;
        String magic = new String(header, 0, 4, java.nio.charset.Charset.forName("ISO-8859-1"));
        if (header[0] == 0x00 && header[1] == 0x01 && header[2] == 0x00 && header[3] == 0x00) return "font/ttf";
        if ("true".equals(magic)) return "font/ttf";
        if ("OTTO".equals(magic)) return "font/otf";
        if ("ttcf".equals(magic)) return "font/collection";
        if ("wOFF".equals(magic)) return "font/woff";
        if ("wOF2".equals(magic)) return "font/woff2";
        return null;
    }

    /** Reads up to 4 bytes. The stream must support mark/reset to be reused afterwards. */
    public static byte[] peekHeader(InputStream input) throws IOException {
        byte[] header = new byte[4];
        input.mark(8);
        int total = 0;
        while (total < header.length) {
            int read = input.read(header, total, header.length - total);
            if (read < 0) break;
            total += read;
        }
        input.reset();
        if (total < header.length) return null;
        return header;
    }
}
