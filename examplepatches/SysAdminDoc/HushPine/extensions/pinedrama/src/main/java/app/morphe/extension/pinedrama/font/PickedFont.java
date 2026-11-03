/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.font;

import android.os.Process;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

/**
 * The font picked in a Galaxy's Settings > Display > Font size and style (issue #7).
 *
 * <p>One UI hands a picked font to every app through its own Typeface code, so PineDrama's native
 * text follows it, but WebView finds {@code sans-serif} in the system font list and keeps
 * Roboto, so {@link WebFont} carries the file into the page itself. One UI keeps the pick in
 * {@code /data/app_fonts/<user>/sans.loc} as {@code <folder>#<name>}, with the regular face in
 * that folder as {@code DroidSans.ttf}, and every app can read both (seen with One UI's Gothic
 * Bold, 2026-10-21). Other phones have no such folder.
 */
final class PickedFont {
    static final String ROOT = "/data/app_fonts";
    static final String POINTER = "sans.loc";
    static final String REGULAR = "DroidSans.ttf";
    /** Android's uid range per user; the pick is kept per user. */
    private static final int PER_USER_RANGE = 100000;
    /** The pointer is one short path; anything longer isn't one. */
    private static final int POINTER_LIMIT = 4096;

    private PickedFont() {}

    /** The picked font's regular face, or null on other phones and with the stock font. */
    static File file() {
        return file(new File(ROOT, String.valueOf(Process.myUid() / PER_USER_RANGE)));
    }

    static File file(File userFolder) {
        try {
            File pointer = new File(userFolder, POINTER);
            long length = pointer.length();
            if (!pointer.isFile() || length <= 0 || length > POINTER_LIMIT) return null;
            String target = read(pointer, (int) length).trim();
            int mark = target.indexOf('#');
            File folder = new File(mark < 0 ? target : target.substring(0, mark));
            // The stock font is "default#default", a name rather than a folder.
            if (!folder.isAbsolute()) return null;
            File face = new File(folder, REGULAR);
            return face.isFile() ? face : null;
        } catch (IOException | SecurityException unreadable) {
            return null;
        }
    }

    private static String read(File file, int length) throws IOException {
        byte[] bytes = new byte[length];
        int offset = 0;
        try (InputStream input = new FileInputStream(file)) {
            while (offset < length) {
                int count = input.read(bytes, offset, length - offset);
                if (count < 0) break;
                offset += count;
            }
        }
        return new String(bytes, 0, offset, StandardCharsets.UTF_8);
    }
}
