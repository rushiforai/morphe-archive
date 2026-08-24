package app.noam.extension.spotify.localserver;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

final class ProtoWriter {
    private ProtoWriter() {}

    private static final int FILES_FIELD = 1;
    private static final int PATH_FIELD = 1;
    private static final int METADATA_FIELD = 2;
    private static final int TITLE_FIELD = 1;
    private static final int ALBUM_FIELD = 2;
    private static final int ARTIST_FIELD = 3;
    private static final int DURATION_FIELD = 4;

    static byte[] encodeFileEntry(String path, String title, String album, String artist, int durationSeconds)
            throws IOException {
        ByteArrayOutputStream metadata = new ByteArrayOutputStream();
        writeString(metadata, TITLE_FIELD, title);
        writeString(metadata, ALBUM_FIELD, album);
        writeString(metadata, ARTIST_FIELD, artist);
        writeVarintField(metadata, DURATION_FIELD, durationSeconds);

        ByteArrayOutputStream file = new ByteArrayOutputStream();
        writeString(file, PATH_FIELD, path);
        writeBytes(file, METADATA_FIELD, metadata.toByteArray());

        ByteArrayOutputStream entry = new ByteArrayOutputStream();
        writeBytes(entry, FILES_FIELD, file.toByteArray());
        return entry.toByteArray();
    }

    private static void writeString(ByteArrayOutputStream out, int field, String value) throws IOException {
        writeBytes(out, field, (value == null ? "" : value).getBytes(StandardCharsets.UTF_8));
    }

    private static void writeBytes(ByteArrayOutputStream out, int field, byte[] value) throws IOException {
        writeVarint(out, ((long) field << 3) | 2);
        writeVarint(out, value.length);
        out.write(value);
    }

    private static void writeVarintField(ByteArrayOutputStream out, int field, long value) {
        writeVarint(out, (long) field << 3);
        writeVarint(out, value);
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        while (true) {
            if ((value & ~0x7FL) == 0) {
                out.write((int) value);
                return;
            }
            out.write((int) ((value & 0x7F) | 0x80));
            value >>>= 7;
        }
    }
}
