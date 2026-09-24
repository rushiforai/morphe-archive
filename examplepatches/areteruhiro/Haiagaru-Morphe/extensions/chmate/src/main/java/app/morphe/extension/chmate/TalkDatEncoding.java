package app.morphe.extension.chmate;

import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;

final class TalkDatEncoding {
    private static final Charset MS932 = Charset.forName("MS932");

    private TalkDatEncoding() {
    }

    static byte[] encode(String value) {
        CharsetEncoder encoder = MS932.newEncoder();
        if (encoder.canEncode(value)) return value.getBytes(MS932);

        StringBuilder escaped = new StringBuilder(value.length() + 32);
        for (int offset = 0; offset < value.length();) {
            int codePoint = value.codePointAt(offset);
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
