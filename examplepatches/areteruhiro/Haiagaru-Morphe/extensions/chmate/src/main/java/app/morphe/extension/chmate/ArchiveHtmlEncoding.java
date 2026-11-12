package app.morphe.extension.chmate;

import java.nio.ByteBuffer;
import java.nio.charset.*;

/** Archive routes return either legacy HTML or modern UTF-8; do not discard Unicode first. */
final class ArchiveHtmlEncoding {
    static String decode(byte[] bytes) {
        try {
            return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(bytes)).toString();
        } catch (CharacterCodingException legacy) {
            return new String(bytes, Charset.forName("MS932"));
        }
    }
    private ArchiveHtmlEncoding() {}
}
