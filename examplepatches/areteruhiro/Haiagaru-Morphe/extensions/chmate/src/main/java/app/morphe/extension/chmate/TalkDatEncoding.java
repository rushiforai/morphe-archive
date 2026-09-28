package app.morphe.extension.chmate;

import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;

final class TalkDatEncoding {
    private static final Charset MS932 = Charset.forName("MS932");

    private TalkDatEncoding() {
    }

    static byte[] encode(String value) {
        CharsetEncoder encoder = MS932.newEncoder();
        // Android canEncode() may still map these format characters to a
        // visible middle dot, even when the entire input looks encodable.
        if (value.indexOf('\uFE0F') < 0 && value.indexOf('\u200D') < 0
                && encoder.canEncode(value)) return value.getBytes(MS932);

        StringBuilder escaped = new StringBuilder(value.length() + 32);
        for (int offset = 0; offset < value.length();) {
            int codePoint = value.codePointAt(offset);
            // Android's MS932 encoder reports these as encodable, but maps
            // them to a visible middle dot.  Preserve the actual code points
            // as HTML entities before the charset encoder can replace them.
            if (codePoint == 0xFE0F || codePoint == 0x200D) {
                escaped.append("&#").append(codePoint).append(';');
                offset += Character.charCount(codePoint);
                continue;
            }
            String character = new String(Character.toChars(codePoint));
            if (encoder.canEncode(character)) {
                escaped.append(character);
            } else {
                escaped.append("&#").append(codePoint).append(';');
            }
            offset += Character.charCount(codePoint);
        }
        return escaped.toString().getBytes(MS932);
    }
}
