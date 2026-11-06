package app.morphe.extension.youtube.bilibilidanmaku;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/** Minimal bounded protobuf reader for Bilibili's danmaku segment wire format. */
final class BilibiliProtoInput {
    private final byte[] bytes;
    private int position;
    private BilibiliProtoInput(byte[] bytes) { this.bytes = bytes; }
    static BilibiliProtoInput newInstance(byte[] bytes) { return new BilibiliProtoInput(bytes); }
    boolean isAtEnd() { return position == bytes.length; }
    int readTag() throws IOException {
        if (isAtEnd()) return 0;
        long tag = readVarint();
        if (tag == 0 || tag > 0xffffffffL) throw new IOException("Invalid protobuf tag");
        return (int) tag;
    }
    long readInt64() throws IOException { return readVarint(); }
    int readInt32() throws IOException { return (int) readVarint(); }
    byte[] readByteArray() throws IOException {
        long length = readVarint();
        if (length < 0 || length > bytes.length - position) throw new IOException("Invalid protobuf length");
        int end = position + (int) length;
        byte[] result = Arrays.copyOfRange(bytes, position, end);
        position = end;
        return result;
    }
    String readStringRequireUtf8() throws IOException {
        try {
            return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(readByteArray())).toString();
        } catch (CharacterCodingException ex) { throw new IOException("Invalid UTF-8", ex); }
    }
    boolean skipField(int tag) throws IOException {
        switch (tag & 7) {
            case 0: readVarint(); return true;
            case 1: skip(8); return true;
            case 2:
                long length = readVarint();
                if (length < 0 || length > Integer.MAX_VALUE) throw new IOException("Invalid protobuf length");
                skip((int) length); return true;
            case 5: skip(4); return true;
            default: throw new IOException("Unsupported protobuf wire type");
        }
    }
    private void skip(int size) throws IOException {
        if (size < 0 || size > bytes.length - position) throw new IOException("Truncated protobuf");
        position += size;
    }
    private long readVarint() throws IOException {
        long value = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            if (position >= bytes.length) throw new IOException("Truncated protobuf varint");
            int next = bytes[position++] & 255;
            if (shift == 63 && (next & 0xfe) != 0) throw new IOException("Invalid protobuf varint");
            value |= (long) (next & 0x7f) << shift;
            if ((next & 0x80) == 0) return value;
        }
        throw new IOException("Invalid protobuf varint");
    }
}
