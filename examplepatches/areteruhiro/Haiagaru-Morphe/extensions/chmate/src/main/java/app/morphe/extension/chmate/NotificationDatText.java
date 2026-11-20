package app.morphe.extension.chmate;

import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;

/** Prefer intact UTF-8 DATs; retain board-specific legacy decoding otherwise. */
final class NotificationDatText {
    static String decode(byte[] bytes, String fallback) {
        try {
            return StandardCharsets.UTF_8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT)
                    .decode(ByteBuffer.wrap(bytes)).toString();
        } catch (CharacterCodingException legacy) {
            return new String(bytes, Charset.forName(fallback));
        }
    }
    static java.io.Reader reader(java.io.File file, String fallback) throws java.io.IOException {
        Charset selected = StandardCharsets.UTF_8;
        try (java.io.Reader probe = new java.io.InputStreamReader(new java.io.FileInputStream(file),
                StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                        .onUnmappableCharacter(CodingErrorAction.REPORT))) {
            char[] buffer = new char[8192];
            while (probe.read(buffer) != -1) { }
        } catch (CharacterCodingException legacy) {
            selected = Charset.forName(fallback);
        }
        return new java.io.InputStreamReader(new java.io.FileInputStream(file), selected);
    }
    private NotificationDatText() { }
}
