/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.downloads;

import com.google.protobuf.CodedOutputStream;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UncheckedIOException;

/**
 * Writes one protobuf message field by field, so the offline replay builds the app's messages without naming any of
 * its obfuscated classes. Writing to memory cannot fail; the checked exception of the coded stream is rethrown
 * unchecked. Fields are written in call order.
 */
final class ProtoWriter {
    private interface Write {
        void run() throws IOException;
    }

    private final ByteArrayOutputStream bytes = new ByteArrayOutputStream();
    private final CodedOutputStream output = CodedOutputStream.newInstance(bytes);

    ProtoWriter string(int field, String value) {
        return write(() -> output.writeString(field, value));
    }

    ProtoWriter int32(int field, int value) {
        return write(() -> output.writeInt32(field, value));
    }

    ProtoWriter int64(int field, long value) {
        return write(() -> output.writeInt64(field, value));
    }

    ProtoWriter fixed32(int field, int value) {
        return write(() -> output.writeFixed32(field, value));
    }

    ProtoWriter fixed64(int field, long value) {
        return write(() -> output.writeFixed64(field, value));
    }

    ProtoWriter bool(int field, boolean value) {
        return write(() -> output.writeBool(field, value));
    }

    /** A length-delimited field holding an encoded message. */
    ProtoWriter message(int field, byte[] encoded) {
        return write(() -> output.writeByteArray(field, encoded));
    }

    /** Encoded fields copied as they are, for example a span of another message. */
    ProtoWriter raw(byte[] encoded, int offset, int length) {
        return write(() -> output.writeRawBytes(encoded, offset, length));
    }

    byte[] toByteArray() {
        write(output::flush);
        return bytes.toByteArray();
    }

    private ProtoWriter write(Write action) {
        try {
            action.run();
        } catch (IOException ex) {
            throw new UncheckedIOException(ex);
        }
        return this;
    }
}
