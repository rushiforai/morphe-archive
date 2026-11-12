/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import com.google.protobuf.CodedInputStream;
import com.google.protobuf.WireFormat;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * Whole top-level fields of an encoded player response, copied byte for byte (known fields and unknown ones alike),
 * so the replay can give a video copy the shape of the response the app got online without naming a field of it.
 */
final class ResponseFields {
    private ResponseFields() {}

    /** {@code message} without the top-level fields numbered in {@code removed}. */
    static byte[] without(byte[] message, Set<Integer> removed) throws IOException {
        ProtoWriter result = new ProtoWriter();
        CodedInputStream input = CodedInputStream.newInstance(message);
        while (true) {
            int start = input.getTotalBytesRead();
            int tag = input.readTag();
            if (tag == 0) break;
            if (!input.skipField(tag)) break;
            if (removed.contains(WireFormat.getTagFieldNumber(tag))) continue;

            result.raw(message, start, input.getTotalBytesRead() - start);
        }
        return result.toByteArray();
    }

    /**
     * {@code base} (an online response of the app, or the app-generic part of one) with the fields numbered in
     * {@code ownFields} taken from the response stored with the copy ({@code stored}) instead: the streaming data
     * and the details of the copy. A field the base lacks and the stored response has is kept.
     */
    static byte[] baseWithOwn(byte[] base, byte[] stored, Set<Integer> ownFields) throws IOException {
        Set<Integer> storedNumbers = numbers(stored);
        Set<Integer> baseNumbers = numbers(base);

        Set<Integer> ownOfStored = new HashSet<>(storedNumbers);
        ownOfStored.retainAll(ownFields);
        Set<Integer> baseHasToo = new HashSet<>(storedNumbers);
        baseHasToo.retainAll(baseNumbers);
        baseHasToo.removeAll(ownFields);

        byte[] fromBase = without(base, ownOfStored);
        byte[] fromStored = without(stored, baseHasToo);
        return new ProtoWriter().raw(fromBase, 0, fromBase.length).raw(fromStored, 0, fromStored.length)
                .toByteArray();
    }

    private static Set<Integer> numbers(byte[] message) throws IOException {
        Set<Integer> numbers = new HashSet<>();
        CodedInputStream input = CodedInputStream.newInstance(message);
        while (true) {
            int tag = input.readTag();
            if (tag == 0) break;
            if (!input.skipField(tag)) break;

            numbers.add(WireFormat.getTagFieldNumber(tag));
        }
        return numbers;
    }
}
