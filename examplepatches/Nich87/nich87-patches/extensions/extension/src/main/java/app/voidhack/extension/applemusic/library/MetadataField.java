package app.voidhack.extension.applemusic.library;

import java.io.IOException;
import java.nio.ByteBuffer;

enum MetadataField {
    TITLE("minm", "title"), ARTIST("asar", "artist"), ALBUM("asal", "album"),
    ALBUM_ARTIST("asaa", "album_artist"), COMPOSER("ascp", "composer"), GENRE("asgn", "genre"),
    SORT_TITLE("assn", "sort_title"), SORT_ARTIST("assa", "sort_artist"),
    SORT_ALBUM("assu", "sort_album"), SORT_ALBUM_ARTIST("assl", "sort_album_artist"),
    SORT_COMPOSER("assc", "sort_composer"), WORK("awrk", "work"), MOVEMENT("amvm", "movement"),
    GROUPING("agrp", "grouping"), COMMENT("ascm", "comment"),
    YEAR("asyr", "year", true), TRACK_NUMBER("astn", "track_number", true),
    TRACK_COUNT("astc", "track_count", true), DISC_NUMBER("asdn", "disc_number", true),
    DISC_COUNT("asdc", "disc_count", true), BPM("asbt", "bpm", true),
    MOVEMENT_NUMBER("amvn", "movement_number", true), MOVEMENT_COUNT("amvc", "movement_count", true);

    final String tag, label;
    final boolean integer;

    MetadataField(String tag, String label) { this(tag, label, false); }
    MetadataField(String tag, String label, boolean integer) { this.tag = tag; this.label = label; this.integer = integer; }

    static MetadataField forTag(String tag) throws IOException {
        for (MetadataField field : values()) if (field.tag.equals(tag)) return field;
        throw new IOException("Unsupported song metadata field");
    }

    byte[] encode(String value) throws IOException {
        if (value == null || value.isEmpty() || value.indexOf('\0') >= 0) throw new IOException("Missing song metadata");
        if (!integer) {
            byte[] bytes = DaapCodec.utf8(value);
            if (bytes.length > 16384) throw new IOException("Song metadata is too long");
            return bytes;
        }
        try {
            int number = Integer.parseInt(value);
            if (number <= 0 || number > 65535) throw new NumberFormatException();
            return ByteBuffer.allocate(2).putShort((short) number).array();
        } catch (NumberFormatException exception) { throw new IOException("Invalid numeric song metadata"); }
    }
}
