package app.yydarlinker.deepseekcaptions;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

/** Frozen from entry Overlay, before extraction; provenance is in the M4a run evidence. */
final class GlyphTransitionFixture {
    static List<String> lines() throws IOException {
        try (InputStream stream = GlyphTransitionFixture.class.getResourceAsStream("/glyph-transition-v1.tsv")) {
            if (stream == null) throw new IOException("Missing frozen old Overlay fixture");
            return Arrays.asList(new String(stream.readAllBytes(), StandardCharsets.UTF_8).split("\\R"));
        }
    }
}
