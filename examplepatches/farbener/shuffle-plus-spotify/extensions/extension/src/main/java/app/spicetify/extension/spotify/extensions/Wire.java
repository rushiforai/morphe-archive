package app.spicetify.extension.spotify.extensions;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

/**
 * A minimal protobuf wire codec. {@link Writer} encodes fields by number; {@link Reader} iterates
 * a message's fields back in order and skips the ones it does not recognize. Neither knows the
 * shape of any particular message; {@link Esperanto} builds and reads the esperanto messages on
 * top of this.
 */
final class Wire {
    private static final int WIRETYPE_VARINT = 0;
    private static final int WIRETYPE_FIXED64 = 1;
    private static final int WIRETYPE_LENGTH_DELIMITED = 2;
    private static final int WIRETYPE_FIXED32 = 5;

    private Wire() {}

    /** Builds a protobuf message one field at a time. */
    static final class Writer {
        private final ByteArrayOutputStream out = new ByteArrayOutputStream();

        void varint(int field, long v) {
            tag(field, WIRETYPE_VARINT);
            writeVarint(v);
        }

        void bool(int field, boolean v) {
            varint(field, v ? 1 : 0);
        }

        void string(int field, String v) {
            bytes(field, v.getBytes(StandardCharsets.UTF_8));
        }

        void bytes(int field, byte[] v) {
            tag(field, WIRETYPE_LENGTH_DELIMITED);
            writeVarint(v.length);
            out.write(v, 0, v.length);
        }

        void message(int field, Writer nested) {
            bytes(field, nested.toByteArray());
        }

        /** Appends a raw varint with no field tag, for a packed repeated field's payload. */
        void rawVarint(long v) {
            writeVarint(v);
        }

        byte[] toByteArray() {
            return out.toByteArray();
        }

        private void tag(int field, int wireType) {
            writeVarint(((long) field << 3) | wireType);
        }

        private void writeVarint(long value) {
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

    /** Iterates a protobuf message's fields in wire order. */
    static final class Reader {
        private final byte[] data;
        private int pos;
        private int field;
        private int type;

        Reader(byte[] data) {
            this.data = data;
        }

        /** Advances to the next field; false once the message is exhausted. */
        boolean next() throws IOException {
            if (pos >= data.length) {
                return false;
            }
            long tag = readVarint();
            field = (int) (tag >>> 3);
            type = (int) (tag & 0x7);
            return true;
        }

        int field() {
            return field;
        }

        int type() {
            return type;
        }

        long varint() throws IOException {
            return readVarint();
        }

        String string() throws IOException {
            return new String(bytes(), StandardCharsets.UTF_8);
        }

        byte[] bytes() throws IOException {
            int length = (int) readVarint();
            require(length);
            byte[] value = new byte[length];
            System.arraycopy(data, pos, value, 0, length);
            pos += length;
            return value;
        }

        Reader message() throws IOException {
            return new Reader(bytes());
        }

        /** Consumes the current field's value without decoding it. */
        void skip() throws IOException {
            switch (type) {
                case WIRETYPE_VARINT:
                    readVarint();
                    return;
                case WIRETYPE_FIXED64:
                    require(8);
                    pos += 8;
                    return;
                case WIRETYPE_LENGTH_DELIMITED:
                    bytes();
                    return;
                case WIRETYPE_FIXED32:
                    require(4);
                    pos += 4;
                    return;
                default:
                    throw new IOException("Unsupported wire type " + type);
            }
        }

        private long readVarint() throws IOException {
            long result = 0;
            int shift = 0;
            while (true) {
                require(1);
                int b = data[pos++] & 0xFF;
                result |= (long) (b & 0x7F) << shift;
                if ((b & 0x80) == 0) {
                    return result;
                }
                shift += 7;
                if (shift >= 64) {
                    throw new IOException("Malformed varint");
                }
            }
        }

        /** {@code length} more bytes must be there; a long sum, so a length near the int limit can't wrap. */
        private void require(int length) throws IOException {
            if (length < 0 || (long) pos + length > data.length) {
                throw new IOException("Truncated message");
            }
        }
    }
}
