package app.extendedplaylists.extension;

import android.util.Base64;

import androidx.annotation.Nullable;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.UnaryOperator;
import java.util.regex.Pattern;

/**
 * Protobuf wire format without a schema: a message is a list of fields, and a round trip
 * keeps every byte. A message opened from a field remembers it, so an edit deep inside can
 * be written back up to the root.
 */
final class Proto {
    static final class Field {
        final int number, wire;
        long value;
        byte[] bytes;

        Field(int number, int wire) {
            this.number = number;
            this.wire = wire;
        }

        Field(int number, byte[] bytes) {
            this(number, 2);
            this.bytes = bytes;
        }
    }

    private static final Pattern BASE64 = Pattern.compile("[A-Za-z0-9+/_-]{8,}(=|%3D){0,2}");

    final List<Field> fields = new ArrayList<>();
    @Nullable private Proto parent;
    @Nullable private Field slot;

    /** Returns null when the bytes are not one clean message. */
    @Nullable static Proto parse(@Nullable byte[] b) {
        if (b == null) return null;
        Proto p = new Proto();
        int[] i = {0};
        try {
            while (i[0] < b.length) {
                long key = varint(b, i);
                int number = (int) (key >>> 3), wire = (int) (key & 7);
                if (number <= 0) return null;
                Field f = new Field(number, wire);
                switch (wire) {
                    case 0: f.value = varint(b, i); break;
                    case 1: f.bytes = slice(b, i, 8); break;
                    case 2: f.bytes = slice(b, i, (int) varint(b, i)); break;
                    case 5: f.bytes = slice(b, i, 4); break;
                    default: return null;
                }
                p.fields.add(f);
            }
        } catch (IndexOutOfBoundsException e) {
            return null;
        }
        return p;
    }

    byte[] toBytes() {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (Field f : fields) {
            writeVarint(out, ((long) f.number << 3) | f.wire);
            if (f.wire == 0) {
                writeVarint(out, f.value);
                continue;
            }
            if (f.wire == 2) writeVarint(out, f.bytes.length);
            out.write(f.bytes, 0, f.bytes.length);
        }
        return out.toByteArray();
    }

    /**
     * A new message from number and value pairs: a Number is a varint, a String UTF-8, a byte[] a
     * message or bytes; a null value is left out. Numbers may repeat.
     */
    static byte[] message(Object... pairs) {
        Proto p = new Proto();
        for (int i = 0; i < pairs.length; i += 2) {
            int n = (Integer) pairs[i];
            Object v = pairs[i + 1];
            if (v instanceof Number) {
                Field f = new Field(n, 0);
                f.value = ((Number) v).longValue();
                p.fields.add(f);
            } else if (v != null) {
                p.fields.add(new Field(n, v instanceof String ? ((String) v).getBytes(StandardCharsets.UTF_8) : (byte[]) v));
            }
        }
        return p.toBytes();
    }

    /** The first varint field with this number. */
    @Nullable Field flag(int number) {
        for (Field f : fields) if (f.number == number && f.wire == 0) return f;
        return null;
    }

    /** All length-delimited fields with this number. */
    List<Field> all(int number) {
        List<Field> out = new ArrayList<>();
        for (Field f : fields) if (f.number == number && f.wire == 2) out.add(f);
        return out;
    }

    @Nullable Field first(int number) {
        for (Field f : fields) if (f.number == number && f.wire == 2) return f;
        return null;
    }

    /** Opens a field of this message for editing; null when it is not a message. */
    @Nullable Proto open(@Nullable Field f) {
        Proto p = f == null ? null : parse(f.bytes);
        if (p != null) {
            p.parent = this;
            p.slot = f;
        }
        return p;
    }

    /** Opens the first field of each number in turn. */
    @Nullable Proto open(int... path) {
        Proto p = this;
        for (int n : path) if (p == null || (p = p.open(p.first(n))) == null) return null;
        return p;
    }

    /** The string at a path of first fields, or null. */
    @Nullable String text(int... path) {
        Proto p = open(Arrays.copyOf(path, path.length - 1));
        Field f = p == null ? null : p.first(path[path.length - 1]);
        return f == null ? null : new String(f.bytes, StandardCharsets.UTF_8);
    }

    /** Writes this message into its parents and returns the bytes of the root. */
    byte[] commit() {
        Proto p = this;
        for (; p.parent != null; p = p.parent) p.slot.bytes = p.toBytes();
        return p.toBytes();
    }

    /** Bytes of a base64 string, URL-safe or standard, padding maybe escaped as %3D; null when it is not. */
    @Nullable static byte[] base64(String s) {
        String raw = s.replace("%3D", "=");
        int flags = raw.indexOf('+') < 0 && raw.indexOf('/') < 0 ? Base64.URL_SAFE : Base64.DEFAULT;
        try {
            return Base64.decode(raw, flags);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    /**
     * Visits every message and string inside a message, also inside base64 strings that hold a
     * message, and returns the new bytes. A message is seen before its fields; a base64 string is
     * opened only when the text hook leaves it as it is, and encoded back only when it changed.
     */
    static byte[] walk(byte[] message, @Nullable Consumer<Proto> onMessage, @Nullable UnaryOperator<String> onText) {
        Proto m = parse(message);
        if (onMessage != null) onMessage.accept(m);
        for (Field f : m.fields) {
            if (f.wire != 2 || f.bytes.length == 0) continue;
            String s = text(f.bytes);
            if (s != null) f.bytes = walkText(s, onMessage, onText).getBytes(StandardCharsets.UTF_8);
            else if (parse(f.bytes) != null) f.bytes = walk(f.bytes, onMessage, onText);
        }
        return m.toBytes();
    }

    private static String walkText(String s, @Nullable Consumer<Proto> onMessage, @Nullable UnaryOperator<String> onText) {
        String t = onText == null ? s : onText.apply(s);
        if (!t.equals(s) || !BASE64.matcher(s).matches()) return t;
        byte[] b = base64(s);
        if (b == null || b.length == 0 || parse(b) == null) return s;
        byte[] out = walk(b, onMessage, onText);
        return Arrays.equals(out, b) ? s : base64(out, s);
    }

    /** The bytes as text when they are strict UTF-8 without control characters, else null. */
    @Nullable private static String text(byte[] b) {
        for (byte c : b) if (c >= 0 && c < 0x20) return null;
        try {
            return StandardCharsets.UTF_8.newDecoder().decode(ByteBuffer.wrap(b)).toString();
        } catch (CharacterCodingException e) {
            return null;
        }
    }

    /** Base64 of the bytes in the same alphabet, padding and %3D escaping as the string they came from. */
    static String base64(byte[] b, String like) {
        String raw = like.replace("%3D", "=");
        int flags = Base64.NO_WRAP | (raw.indexOf('+') < 0 && raw.indexOf('/') < 0 ? Base64.URL_SAFE : 0);
        if (!raw.endsWith("=") && raw.length() % 4 != 0) flags |= Base64.NO_PADDING;
        String out = Base64.encodeToString(b, flags);
        return like.endsWith("%3D") ? out.replace("=", "%3D") : out;
    }

    static boolean contains(byte[] hay, byte[] needle) {
        return indexOf(hay, needle) >= 0;
    }

    static int indexOf(byte[] hay, byte[] needle) {
        outer:
        for (int i = 0; i + needle.length <= hay.length; i++) {
            for (int j = 0; j < needle.length; j++) if (hay[i + j] != needle[j]) continue outer;
            return i;
        }
        return -1;
    }

    private static long varint(byte[] b, int[] i) {
        long v = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            byte c = b[i[0]++];
            v |= (long) (c & 0x7F) << shift;
            if (c >= 0) return v;
        }
        throw new IndexOutOfBoundsException("varint");
    }

    private static byte[] slice(byte[] b, int[] i, int n) {
        if (n < 0 || i[0] + n > b.length) throw new IndexOutOfBoundsException("length");
        byte[] out = Arrays.copyOfRange(b, i[0], i[0] + n);
        i[0] += n;
        return out;
    }

    private static void writeVarint(ByteArrayOutputStream out, long v) {
        while ((v & ~0x7FL) != 0) {
            out.write((int) ((v & 0x7F) | 0x80));
            v >>>= 7;
        }
        out.write((int) v);
    }
}
