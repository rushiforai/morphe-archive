/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/** Reads encoded messages for the offline proto tests, field by field, with {@link CodedInputStream}. */
final class ProtoFields {
    /** One field of a message: a varint value, or the bytes of a length-delimited field. */
    record Field(int number, int wireType, long varint, byte[] bytes) {}

    private ProtoFields() {}

    static List<Field> parse(byte[] message) throws IOException {
        List<Field> fields = new ArrayList<>();
        CodedInputStream input = CodedInputStream.newInstance(message);
        for (int tag = input.readTag(); tag != 0; tag = input.readTag()) {
            int number = WireFormat.getTagFieldNumber(tag);
            int wireType = WireFormat.getTagWireType(tag);
            switch (wireType) {
                case WireFormat.WIRETYPE_VARINT -> fields.add(new Field(number, wireType, input.readInt64(), null));
                case WireFormat.WIRETYPE_LENGTH_DELIMITED ->
                        fields.add(new Field(number, wireType, 0, input.readByteArray()));
                case WireFormat.WIRETYPE_FIXED32 -> fields.add(new Field(number, wireType, input.readFixed32(), null));
                case WireFormat.WIRETYPE_FIXED64 -> fields.add(new Field(number, wireType, input.readFixed64(), null));
                default -> throw new IOException("unexpected wire type " + wireType);
            }
        }
        return fields;
    }

    /** The field numbers of a message in wire order. */
    static List<Integer> numbers(byte[] message) throws IOException {
        List<Integer> numbers = new ArrayList<>();
        for (Field field : parse(message)) numbers.add(field.number());
        return numbers;
    }

    /** Every length-delimited field {@code number}, in wire order. */
    static List<byte[]> all(byte[] message, int number) throws IOException {
        List<byte[]> found = new ArrayList<>();
        for (Field field : parse(message)) {
            if (field.number() == number) found.add(field.bytes());
        }
        return found;
    }

    /** The only length-delimited field {@code number}; the test fails when there is none or more than one. */
    static byte[] one(byte[] message, int number) throws IOException {
        List<byte[]> found = all(message, number);
        assertEquals("occurrences of field " + number, 1, found.size());
        return found.get(0);
    }

    static boolean has(byte[] message, int number) throws IOException {
        return numbers(message).contains(number);
    }

    static String string(byte[] message, int number) throws IOException {
        return new String(one(message, number), StandardCharsets.UTF_8);
    }

    /** The only varint field {@code number}. */
    static long varint(byte[] message, int number) throws IOException {
        long value = 0;
        int count = 0;
        for (Field field : parse(message)) {
            if (field.number() != number) continue;
            assertEquals("wire type of field " + number, WireFormat.WIRETYPE_VARINT, field.wireType());
            value = field.varint();
            count++;
        }
        assertEquals("occurrences of field " + number, 1, count);
        return value;
    }
}
