package app.fakh.extension.linkedin;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Minimal protobuf wire format editor: splits a message into fields, and writes them back with
 * recomputed lengths, so a nested message can be copied or changed without the generated classes.
 */
final class ProtoEdit {
    /** One field of a message: its key and, for length-delimited fields, its payload. */
    static final class Field {
        final int number;
        final int wireType;
        /** Raw bytes of a fixed or varint value, or the payload of a length-delimited field. */
        byte[] data;

        Field(int number, int wireType, byte[] data) {
            this.number = number;
            this.wireType = wireType;
            this.data = data;
        }

        Field copy() {
            return new Field(number, wireType, data.clone());
        }
    }

    private ProtoEdit() {
    }

    /** The fields of a message, or null if the bytes are not a valid message. */
    static List<Field> parse(byte[] data) {
        List<Field> fields = new ArrayList<>();
        int[] pos = {0};
        try {
            while (pos[0] < data.length) {
                long key = varint(data, pos);
                int number = (int) (key >>> 3);
                int wireType = (int) (key & 7);
                if (number == 0) return null;
                int start = pos[0];
                switch (wireType) {
                    case 0:
                        varint(data, pos);
                        break;
                    case 1:
                        pos[0] += 8;
                        break;
                    case 5:
                        pos[0] += 4;
                        break;
                    case 2:
                        long length = varint(data, pos);
                        if (length < 0 || pos[0] + length > data.length) return null;
                        start = pos[0];
                        pos[0] += (int) length;
                        break;
                    default:
                        return null;
                }
                if (pos[0] > data.length) return null;
                fields.add(new Field(number, wireType, java.util.Arrays.copyOfRange(data, start, pos[0])));
            }
            return fields;
        } catch (ArrayIndexOutOfBoundsException e) {
            return null;
        }
    }

    static byte[] write(List<Field> fields) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (Field field : fields) {
            writeVarint(out, ((long) field.number << 3) | field.wireType);
            if (field.wireType == 2) writeVarint(out, field.data.length);
            out.write(field.data, 0, field.data.length);
        }
        return out.toByteArray();
    }

    static Field string(int number, String value) {
        return new Field(number, 2, value.getBytes(StandardCharsets.UTF_8));
    }

    static Field message(int number, Field... fields) {
        List<Field> list = new ArrayList<>();
        java.util.Collections.addAll(list, fields);
        return new Field(number, 2, write(list));
    }

    static Field varintField(int number, long value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        writeVarint(out, value);
        return new Field(number, 0, out.toByteArray());
    }

    /** True if the bytes contain the ASCII text anywhere, at any depth. */
    static boolean contains(byte[] data, String text) {
        return ProtoScanner.containsAscii(data, text);
    }

    /** Replaces every length-delimited field that is exactly {@code from} with {@code to}, at any depth. */
    static byte[] replaceString(byte[] data, String from, String to) {
        if (!contains(data, from)) return data;
        List<Field> fields = parse(data);
        if (fields == null) return data;
        byte[] fromBytes = from.getBytes(StandardCharsets.UTF_8);
        for (Field field : fields) {
            if (field.wireType != 2) continue;
            if (java.util.Arrays.equals(field.data, fromBytes)) {
                field.data = to.getBytes(StandardCharsets.UTF_8);
            } else if (contains(field.data, from)) {
                field.data = replaceString(field.data, from, to);
            }
        }
        return write(fields);
    }

    /** Replaces every length-delimited field that starts with {@code prefix} with {@code to}, at any depth. */
    static byte[] replaceStringsStartingWith(byte[] data, String prefix, String to) {
        if (!contains(data, prefix)) return data;
        List<Field> fields = parse(data);
        if (fields == null) return data;
        byte[] prefixBytes = prefix.getBytes(StandardCharsets.UTF_8);
        for (Field field : fields) {
            if (field.wireType != 2) continue;
            if (startsWith(field.data, prefixBytes)) {
                field.data = to.getBytes(StandardCharsets.UTF_8);
            } else if (contains(field.data, prefix)) {
                field.data = replaceStringsStartingWith(field.data, prefix, to);
            }
        }
        return write(fields);
    }

    private static boolean startsWith(byte[] data, byte[] prefix) {
        if (data.length < prefix.length) return false;
        for (int i = 0; i < prefix.length; i++) if (data[i] != prefix[i]) return false;
        return true;
    }

    /** Replaces varint field {@code number} holding {@code from} with {@code to}, at any depth. */
    static byte[] replaceVarint(byte[] data, int number, long from, long to) {
        List<Field> fields = parse(data);
        if (fields == null) return data;
        boolean changed = false;
        for (Field field : fields) {
            if (field.wireType == 0 && field.number == number && varint(field.data, new int[]{0}) == from) {
                field.data = varintField(number, to).data;
                changed = true;
            } else if (field.wireType == 2) {
                byte[] inner = replaceVarint(field.data, number, from, to);
                if (inner != field.data) {
                    field.data = inner;
                    changed = true;
                }
            }
        }
        return changed ? write(fields) : data;
    }

    private static long varint(byte[] data, int[] pos) {
        long value = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            byte b = data[pos[0]++];
            value |= (long) (b & 0x7F) << shift;
            if (b >= 0) return value;
        }
        throw new ArrayIndexOutOfBoundsException();
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        while ((value & ~0x7FL) != 0) {
            out.write((int) ((value & 0x7F) | 0x80));
            value >>>= 7;
        }
        out.write((int) value);
    }
}
