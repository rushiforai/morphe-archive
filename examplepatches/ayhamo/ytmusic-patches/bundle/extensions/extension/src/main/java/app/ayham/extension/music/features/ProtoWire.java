package app.ayham.extension.music.features;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * A minimal protobuf wire-format reader and writer that keeps unknown
 * fields, so a message can be edited without its schema.
 */
final class ProtoWire {
    static final class Field {
        final int number;
        final int wireType;
        long varint;
        byte[] data;

        Field(int number, int wireType, long varint, byte[] data) {
            this.number = number;
            this.wireType = wireType;
            this.varint = varint;
            this.data = data;
        }
    }

    final List<Field> fields = new ArrayList<>();

    ProtoWire() {
    }

    ProtoWire(byte[] bytes) {
        int[] pos = {0};
        while (pos[0] < bytes.length) {
            long key = readVarint(bytes, pos);
            int number = (int) (key >>> 3);
            int wireType = (int) (key & 7);
            switch (wireType) {
                case 0:
                    fields.add(new Field(number, 0, readVarint(bytes, pos), null));
                    break;
                case 1:
                    fields.add(new Field(number, 1, 0, slice(bytes, pos, 8)));
                    break;
                case 2: {
                    // the length checked as a long: a huge varint must not wrap into a small int
                    long length = readVarint(bytes, pos);
                    if (length < 0 || length > bytes.length - pos[0]) throw new IllegalArgumentException("bad length");
                    fields.add(new Field(number, 2, 0, slice(bytes, pos, (int) length)));
                    break;
                }
                case 5:
                    fields.add(new Field(number, 5, 0, slice(bytes, pos, 4)));
                    break;
                default:
                    throw new IllegalArgumentException("wire type " + wireType + " at " + pos[0]);
            }
        }
    }

    Field first(int number) {
        for (Field f : fields) if (f.number == number) return f;
        return null;
    }

    List<Field> all(int number) {
        List<Field> out = new ArrayList<>();
        for (Field f : fields) if (f.number == number) out.add(f);
        return out;
    }

    ProtoWire message(int number) {
        Field f = first(number);
        return f == null || f.data == null ? new ProtoWire() : new ProtoWire(f.data);
    }

    String string(int number) {
        Field f = first(number);
        return f == null || f.data == null ? "" : new String(f.data, StandardCharsets.UTF_8);
    }

    long varint(int number, long fallback) {
        Field f = first(number);
        return f == null || f.wireType != 0 ? fallback : f.varint;
    }

    boolean has(int number) {
        return first(number) != null;
    }

    ProtoWire remove(int number) {
        fields.removeIf(f -> f.number == number);
        return this;
    }

    ProtoWire setVarint(int number, long value) {
        Field f = first(number);
        if (f != null && f.wireType == 0) f.varint = value;
        else {
            remove(number);
            fields.add(new Field(number, 0, value, null));
        }
        return this;
    }

    ProtoWire setBytes(int number, byte[] value) {
        Field f = first(number);
        if (f != null && f.wireType == 2) f.data = value;
        else {
            remove(number);
            fields.add(new Field(number, 2, 0, value));
        }
        return this;
    }

    ProtoWire setString(int number, String value) {
        return setBytes(number, value.getBytes(StandardCharsets.UTF_8));
    }

    ProtoWire setMessage(int number, ProtoWire value) {
        return setBytes(number, value.toBytes());
    }

    ProtoWire addMessage(int number, ProtoWire value) {
        fields.add(new Field(number, 2, 0, value.toBytes()));
        return this;
    }

    byte[] toBytes() {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (Field f : fields) {
            writeVarint(out, ((long) f.number << 3) | f.wireType);
            switch (f.wireType) {
                case 0:
                    writeVarint(out, f.varint);
                    break;
                case 2:
                    writeVarint(out, f.data.length);
                    out.write(f.data, 0, f.data.length);
                    break;
                default:
                    out.write(f.data, 0, f.data.length);
            }
        }
        return out.toByteArray();
    }

    private static long readVarint(byte[] b, int[] pos) {
        long result = 0;
        int shift = 0;
        while (true) {
            // truncated or over-long input is malformed, not an index error
            if (pos[0] >= b.length || shift >= 64) throw new IllegalArgumentException("bad varint");
            byte x = b[pos[0]++];
            result |= (long) (x & 0x7f) << shift;
            if ((x & 0x80) == 0) return result;
            shift += 7;
        }
    }

    private static byte[] slice(byte[] b, int[] pos, int length) {
        if (length < 0 || length > b.length - pos[0]) throw new IllegalArgumentException("bad length");
        byte[] out = new byte[length];
        System.arraycopy(b, pos[0], out, 0, length);
        pos[0] += length;
        return out;
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        while ((value & ~0x7FL) != 0) {
            out.write((int) ((value & 0x7f) | 0x80));
            value >>>= 7;
        }
        out.write((int) value);
    }
}
