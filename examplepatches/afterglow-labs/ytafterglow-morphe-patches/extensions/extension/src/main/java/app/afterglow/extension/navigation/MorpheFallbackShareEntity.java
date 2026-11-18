/*
 * Copyright 2026 Morphe. Modified for Afterglow.
 * Afterglow for Android. Temporary adapter based on the endpoint/entity mapping
 * in Morphe's OpenSystemShareSheetPatch (v2.2.0, GPLv3):
 * https://github.com/MorpheApp/morphe-patches. See NOTICE. Not an official file.
 * Modified for Afterglow: bounded read-only parsing without bundled protobuf,
 * iOS video/playlist/channel/post/clip URLs, and native fallback for unknown data.
 * Portions provided "AS IS" without express or implied warranties, including
 * merchantability and fitness for a particular purpose.
 */
package app.afterglow.extension.navigation;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/** Read-only share-entity decoding; a null result keeps YouTube's own share flow. */
public final class MorpheFallbackShareEntity {
    private static final int MAX_BYTES = 128 * 1024;
    private static final String PREFIX = "https://youtube.com";

    private MorpheFallbackShareEntity() {}

    /** Both supported native endpoints store the serialized entity in protobuf field 1. */
    public static String url(byte[] endpoint) {
        try {
            List<Field> fields = parse(endpoint);
            Field entity = unique(fields, 1);
            return entity == null || entity.wire != 2 ? null : fromSerialized(entity.text());
        } catch (IllegalArgumentException ignored) {
            return null;
        }
    }

    public static String fromSerialized(String serialized) {
        try {
            if (serialized == null || serialized.isEmpty() || serialized.length() > MAX_BYTES) return null;
            StringBuilder base64 = new StringBuilder(serialized.length());
            for (int i = 0; i < serialized.length(); i++) {
                char c = serialized.charAt(i);
                if (c == '%') {
                    if (i + 2 >= serialized.length()) return null;
                    int high = Character.digit(serialized.charAt(++i), 16);
                    int low = Character.digit(serialized.charAt(++i), 16);
                    if (high < 0 || low < 0) return null;
                    c = (char) ((high << 4) | low);
                }
                // Preserve '+' (unlike URLDecoder), and accept both native Base64 alphabets.
                if (c == ' ' || c == '\n' || c == '\r' || c == '\t') continue;
                base64.append(c == '-' ? '+' : c == '_' ? '/' : c);
            }
            List<Field> fields = parse(Base64.getDecoder().decode(base64.toString()));
            for (Field field : fields) {
                switch (field.number) {
                    case 1, 2, 3, 6, 7 -> {
                        if (id(field) == null) return null;
                    }
                    case 8 -> { if (field.wire != 2) return null; }
                    // Upstream identifies these as Shorts/entity metadata, not URL modifiers.
                    case 10, 12, 20 -> { }
                    default -> { return null; }
                }
                unique(fields, field.number); // Reject ambiguous duplicate fields.
            }

            // Preserve the precedence and plain link shape used by YTNativeShare.x.
            Field clip = unique(fields, 8);
            if (clip != null) {
                List<Field> nested = parse(clip.bytes());
                if (nested.size() != 1 || nested.get(0).number != 1) return null;
                String clipId = id(nested.get(0));
                return clipId == null ? null : PREFIX + "/clip/" + clipId;
            }
            String post = id(unique(fields, 6));
            if (post != null) return PREFIX + "/post/" + post;
            String channel = id(unique(fields, 3));
            if (channel != null) return PREFIX + "/channel/" + channel;
            String playlist = id(unique(fields, 2));
            if (playlist != null) {
                return PREFIX + "/playlist?list=" + playlist
                        + (playlist.startsWith("PL") || playlist.startsWith("FL") ? "" : "&playnext=1");
            }
            String video = id(unique(fields, 1));
            return video == null ? null : PREFIX + "/watch?v=" + video;
        } catch (IllegalArgumentException ignored) {
            return null;
        }
    }

    private static String id(Field field) {
        if (field == null || field.wire != 2 || field.end == field.start || field.end - field.start > 512) return null;
        String value = field.text();
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (!(c >= 'A' && c <= 'Z' || c >= 'a' && c <= 'z' || c >= '0' && c <= '9' || c == '_' || c == '-')) return null;
        }
        return value;
    }

    private static Field unique(List<Field> fields, int number) {
        Field result = null;
        for (Field field : fields) {
            if (field.number != number) continue;
            if (result != null) throw new IllegalArgumentException("Duplicate share field");
            result = field;
        }
        return result;
    }

    private static List<Field> parse(byte[] data) {
        if (data == null || data.length == 0 || data.length > MAX_BYTES) throw new IllegalArgumentException("Share message size");
        Cursor cursor = new Cursor(data);
        List<Field> result = new ArrayList<>();
        while (cursor.position < data.length) {
            if (result.size() >= 256) throw new IllegalArgumentException("Share field count");
            long tag = cursor.varint();
            if (tag <= 0 || tag > 0xffffffffL || tag >>> 3 == 0) throw new IllegalArgumentException("Invalid share tag");
            int number = (int) (tag >>> 3);
            int wire = (int) (tag & 7);
            int start = cursor.position;
            switch (wire) {
                case 0 -> cursor.varint();
                case 1 -> cursor.skip(8);
                case 2 -> {
                    long size = cursor.varint();
                    if (size < 0 || size > MAX_BYTES) throw new IllegalArgumentException("Share field size");
                    start = cursor.position;
                    cursor.skip((int) size);
                }
                case 5 -> cursor.skip(4);
                default -> throw new IllegalArgumentException("Unsupported share wire type");
            }
            result.add(new Field(data, number, wire, start, cursor.position));
        }
        return result;
    }

    private static final class Cursor {
        final byte[] data;
        int position;
        Cursor(byte[] data) { this.data = data; }
        void skip(int size) {
            if (size < 0 || size > data.length - position) throw new IllegalArgumentException("Truncated share field");
            position += size;
        }
        long varint() {
            long result = 0;
            for (int i = 0; i < 10; i++) {
                if (position >= data.length) throw new IllegalArgumentException("Truncated share varint");
                int value = data[position++] & 255;
                if (i == 9 && (value & 254) != 0) throw new IllegalArgumentException("Share varint overflow");
                result |= (long) (value & 127) << (i * 7);
                if ((value & 128) == 0) return result;
            }
            throw new IllegalArgumentException("Share varint overflow");
        }
    }

    private static final class Field {
        final byte[] data;
        final int number, wire, start, end;
        Field(byte[] data, int number, int wire, int start, int end) {
            this.data = data; this.number = number; this.wire = wire; this.start = start; this.end = end;
        }
        String text() { return new String(data, start, end - start, StandardCharsets.UTF_8); }
        byte[] bytes() { return java.util.Arrays.copyOfRange(data, start, end); }
    }
}
