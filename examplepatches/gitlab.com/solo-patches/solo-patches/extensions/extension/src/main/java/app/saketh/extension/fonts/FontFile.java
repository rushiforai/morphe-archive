package app.saketh.extension.fonts;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

final class FontFile {
    static final int MAX_BYTES = 16 * 1024 * 1024;

    private FontFile() {}

    // The Android font parser validates the remaining structure before the copy is committed.
    static void copy(InputStream input, OutputStream output) throws IOException {
        byte[] header = new byte[12];
        int count = 0;
        while (count < header.length) {
            int value = input.read();
            if (value < 0) throw new IOException("Font file is incomplete.");
            header[count++] = (byte) value;
        }
        boolean trueType = header[0] == 0 && header[1] == 1 && header[2] == 0 && header[3] == 0;
        boolean openType = header[0] == 'O' && header[1] == 'T' && header[2] == 'T' && header[3] == 'O';
        if ((!trueType && !openType) || (header[4] == 0 && header[5] == 0)) {
            throw new IOException("Choose a TrueType (.ttf) or OpenType (.otf) font.");
        }
        output.write(header);
        byte[] buffer = new byte[8192];
        int read;
        while ((read = input.read(buffer)) != -1) {
            if (read > MAX_BYTES - count) throw new IOException("Font exceeds the 16 MiB limit.");
            output.write(buffer, 0, read);
            count += read;
        }
    }
}
