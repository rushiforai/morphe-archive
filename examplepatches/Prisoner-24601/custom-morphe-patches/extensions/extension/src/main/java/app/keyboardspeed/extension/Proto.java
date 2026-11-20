package app.keyboardspeed.extension;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Minimal reading and writing of serialized protobuf messages, without their message types.
 */
final class Proto {
    private static final int WIRE_VARINT = 0;
    private static final int WIRE_FIXED64 = 1;
    private static final int WIRE_LENGTH_DELIMITED = 2;
    private static final int WIRE_FIXED32 = 5;

    private Proto() {
    }

    /**
     * A field of a message. Varint fields have their value, the other fields their bytes.
     */
    static final class Field {
        final int number;
        final int wireType;
        long varint;
        byte[] bytes;

        Field(int number, int wireType) {
            this.number = number;
            this.wireType = wireType;
        }

        /**
         * @return The text of a length delimited field, or null if it's not a length delimited field.
         */
        String text() {
            return wireType == WIRE_LENGTH_DELIMITED ? new String(bytes, StandardCharsets.UTF_8) : null;
        }
    }

    /**
     * @return The fields of the message, or null if the bytes are not a message.
     */
    static List<Field> parse(byte[] data) {
        if (data == null) {
            return null;
        }
        List<Field> fields = new ArrayList<>();
        int[] position = {0};
        try {
            while (position[0] < data.length) {
                final long tag = readVarint(data, position);
                final int number = (int) (tag >>> 3);
                final int wireType = (int) (tag & 7);
                if (number <= 0) {
                    return null;
                }
                Field field = new Field(number, wireType);
                switch (wireType) {
                    case WIRE_VARINT -> field.varint = readVarint(data, position);
                    case WIRE_FIXED64 -> field.bytes = readBytes(data, position, 8);
                    case WIRE_LENGTH_DELIMITED -> {
                        final long length = readVarint(data, position);
                        if (length < 0 || length > data.length - position[0]) {
                            return null;
                        }
                        field.bytes = readBytes(data, position, (int) length);
                    }
                    case WIRE_FIXED32 -> field.bytes = readBytes(data, position, 4);
                    default -> {
                        return null;
                    }
                }
                fields.add(field);
            }
        } catch (IndexOutOfBoundsException ex) {
            return null;
        }
        return fields;
    }

    /**
     * @return The first length delimited field with the number, or null.
     */
    static Field find(List<Field> fields, int number) {
        if (fields == null) {
            return null;
        }
        for (Field field : fields) {
            if (field.number == number && field.wireType == WIRE_LENGTH_DELIMITED) {
                return field;
            }
        }
        return null;
    }

    static byte[] write(List<Field> fields) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (Field field : fields) {
            writeVarint(out, ((long) field.number << 3) | field.wireType);
            switch (field.wireType) {
                case WIRE_VARINT -> writeVarint(out, field.varint);
                case WIRE_LENGTH_DELIMITED -> {
                    writeVarint(out, field.bytes.length);
                    out.write(field.bytes);
                }
                default -> out.write(field.bytes);
            }
        }
        return out.toByteArray();
    }

    static void writeVarintField(ByteArrayOutputStream out, int number, long value) {
        writeVarint(out, ((long) number << 3) | WIRE_VARINT);
        writeVarint(out, value);
    }

    static void writeBytesField(ByteArrayOutputStream out, int number, byte[] bytes) throws IOException {
        writeVarint(out, ((long) number << 3) | WIRE_LENGTH_DELIMITED);
        writeVarint(out, bytes.length);
        out.write(bytes);
    }

    static byte[] utf8(String text) {
        return text.getBytes(StandardCharsets.UTF_8);
    }

    private static long readVarint(byte[] data, int[] position) {
        long result = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            final byte b = data[position[0]++];
            result |= (long) (b & 0x7F) << shift;
            if ((b & 0x80) == 0) {
                return result;
            }
        }
        throw new IndexOutOfBoundsException("Malformed varint");
    }

    private static byte[] readBytes(byte[] data, int[] position, int length) {
        if (length > data.length - position[0]) {
            throw new IndexOutOfBoundsException("Field past the end of the message");
        }
        byte[] bytes = new byte[length];
        System.arraycopy(data, position[0], bytes, 0, length);
        position[0] += length;
        return bytes;
    }

    private static void writeVarint(ByteArrayOutputStream out, long value) {
        while ((value & ~0x7FL) != 0) {
            out.write((int) ((value & 0x7F) | 0x80));
            value >>>= 7;
        }
        out.write((int) value);
    }
}
