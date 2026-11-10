/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.extension;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Schema-less reader for the protobuf blobs inside SDUI components.
 *
 * <p>We never have the .proto files, and part of each payload is an opaque CompactAny, so the reader
 * guesses: a length-delimited value that decodes as clean UTF-8 text is a string, anything else is
 * tried as an embedded message. Callers only need the strings (labels, URNs, URLs) and the images.
 *
 * <p>An image is recognised by the shape of LinkedIn's digitalmedia Image message: field 1 is the
 * root URL and every field 2 is a rendition carrying its width in field 1 and the URL suffix in 3.
 */
final class ProtoScanner {
    /** Deeper nesting than this is treated as garbage rather than risking the stack. */
    private static final int DEPTH_LIMIT = 48;
    private static final String DMS_IMAGE_ROOT = "https://media.licdn.com/dms/image/";
    /** Varints are at most ten bytes long. */
    private static final int VARINT_MAX_BYTES = 10;
    /** Shortest framed string the fallback scan accepts; shorter hits are mostly noise. */
    private static final int SALVAGE_MIN_LENGTH = 8;

    /** One image: its root plus the full URLs of the widest and narrowest renditions. */
    static final class ImageRef {
        final String root;
        final String largestUrl;
        final int largestWidth;
        final String smallestUrl;

        ImageRef(String root, String largestUrl, int largestWidth, String smallestUrl) {
            this.root = root;
            this.largestUrl = largestUrl;
            this.largestWidth = largestWidth;
            this.smallestUrl = smallestUrl;
        }
    }

    /** Every string found, in document order. */
    final List<String> strings = new ArrayList<>();
    /** Every image found; inner images come before the message that contains them. */
    final List<ImageRef> images = new ArrayList<>();

    private ProtoScanner() {
    }

    static ProtoScanner scan(byte[] data) {
        ProtoScanner out = new ProtoScanner();
        if (data == null) return out;
        Node root = readMessage(data, 0, data.length, 0);
        if (root != null) {
            out.strings.addAll(root.texts);
            out.images.addAll(root.pictures);
        }
        return out;
    }

    /** Whether one of the decoded strings is exactly one of {@code values}. */
    static boolean hasExactString(byte[] data, String... values) {
        if (data == null) return false;
        List<String> found = scan(data).strings;
        if (found.isEmpty()) return false;
        for (String wanted : values) {
            if (found.contains(wanted)) return true;
        }
        return false;
    }

    /**
     * Plain byte search without decoding. Good enough for markers that cannot occur by accident,
     * such as URNs, and much cheaper than a full scan.
     */
    static boolean containsAscii(byte[] data, String needle) {
        if (data == null) return false;
        byte[] pattern = needle.getBytes(StandardCharsets.US_ASCII);
        int lastStart = data.length - pattern.length;
        for (int from = 0; from <= lastStart; from++) {
            int k = 0;
            while (k < pattern.length && data[from + k] == pattern[k]) k++;
            if (k == pattern.length) return true;
        }
        return false;
    }

    /**
     * What one successfully decoded message contributed, plus the few fields needed to tell
     * whether it is an Image (or one of an Image's renditions).
     */
    private static final class Node {
        final List<String> texts = new ArrayList<>();
        final List<ImageRef> pictures = new ArrayList<>();
        final List<Node> repeatedTwo = new ArrayList<>();
        String textOne;
        String textThree;
        long numberOne = -1;
    }

    /**
     * Decodes b[from, to) as a message. Returns null as soon as anything does not fit the wire
     * format, so a wrong guess costs nothing but the attempt.
     */
    private static Node readMessage(byte[] b, int from, int to, int depth) {
        if (depth > DEPTH_LIMIT) return null;
        Node node = new Node();
        int[] cursor = {from};
        while (cursor[0] < to) {
            long key = readVarint(b, cursor, to);
            if (cursor[0] < 0) return null;
            int number = (int) (key >>> 3);
            if (number <= 0) return null;
            int wireType = (int) key & 7;
            if (wireType == 0) {
                long value = readVarint(b, cursor, to);
                if (cursor[0] < 0) return null;
                if (number == 1) node.numberOne = value;
            } else if (wireType == 1) {
                cursor[0] += 8;
            } else if (wireType == 5) {
                cursor[0] += 4;
            } else if (wireType == 2) {
                long size = readVarint(b, cursor, to);
                if (cursor[0] < 0) return null;
                int start = cursor[0];
                if (size < 0 || size > to - start) return null;
                int stop = start + (int) size;
                readValue(b, start, stop, depth, number, node);
                cursor[0] = stop;
            } else {
                // Groups (3/4) never show up in these payloads, and 6/7 are not valid at all.
                return null;
            }
            if (cursor[0] > to) return null;
        }
        ImageRef image = imageOf(node);
        if (image != null) node.pictures.add(image);
        return node;
    }

    /** Handles one length-delimited value b[start, stop) of field {@code number} of {@code node}. */
    private static void readValue(byte[] b, int start, int stop, int depth, int number, Node node) {
        String text = cleanText(b, start, stop);
        if (text != null) {
            node.texts.add(text);
            if (number == 1) node.textOne = text;
            else if (number == 3) node.textThree = text;
            return;
        }
        Node inner = readMessage(b, start, stop, depth + 1);
        // Some embedded messages carry one leading 0x00 byte; retry without it.
        if (inner == null && stop - start >= 2 && b[start] == 0) {
            inner = readMessage(b, start + 1, stop, depth + 1);
        }
        if (inner == null) {
            salvage(b, start, stop, node.texts);
            return;
        }
        node.texts.addAll(inner.texts);
        node.pictures.addAll(inner.pictures);
        if (number == 2) node.repeatedTwo.add(inner);
    }

    /**
     * Fallback for bytes that are not a clean message (LinkedIn frames some values its own way).
     * Looks for single-byte length-delimited tags followed by a length whose bytes are exactly a
     * printable string; the length prefix gives the exact string boundaries.
     */
    private static void salvage(byte[] b, int from, int to, List<String> sink) {
        int at = from;
        int[] cursor = new int[1];
        while (at < to - 2) {
            int lead = b[at] & 0xff;
            String hit = null;
            int next = at + 1;
            if (lead >= 8 && (lead & 7) == 2) {
                cursor[0] = at + 1;
                long size = readVarint(b, cursor, to);
                if (cursor[0] >= 0 && size >= SALVAGE_MIN_LENGTH && size <= to - (long) cursor[0]) {
                    int textEnd = cursor[0] + (int) size;
                    hit = cleanText(b, cursor[0], textEnd);
                    next = textEnd;
                }
            }
            if (hit != null) {
                sink.add(hit);
                at = next;
            } else {
                at++;
            }
        }
    }

    /** The Image this node describes, or null when its shape does not match. */
    private static ImageRef imageOf(Node node) {
        String root = node.textOne;
        if (root == null || !root.startsWith(DMS_IMAGE_ROOT)) return null;
        Node widest = null;
        Node narrowest = null;
        long widestWidth = -1;
        long narrowestWidth = Long.MAX_VALUE;
        for (Node rendition : node.repeatedTwo) {
            long width = rendition.numberOne;
            if (width <= 0 || rendition.textThree == null) continue;
            if (width > widestWidth) {
                widestWidth = width;
                widest = rendition;
            }
            if (width < narrowestWidth) {
                narrowestWidth = width;
                narrowest = rendition;
            }
        }
        if (widest == null) return null;
        String smallSuffix = narrowest == null ? null : narrowest.textThree;
        return new ImageRef(root, root + widest.textThree, (int) widestWidth, root + smallSuffix);
    }

    /**
     * Reads a varint at cursor[0]. On success cursor[0] moves past it; when the bytes run out
     * first, or the varint is longer than ten bytes, cursor[0] becomes -1.
     */
    private static long readVarint(byte[] b, int[] cursor, int limit) {
        int at = cursor[0];
        long value = 0;
        for (int i = 0; i < VARINT_MAX_BYTES; i++) {
            if (at >= limit) break;
            int octet = b[at++];
            value |= (long) (octet & 0x7f) << (7 * i);
            if ((octet & 0x80) == 0) {
                cursor[0] = at;
                return value;
            }
        }
        cursor[0] = -1;
        return 0;
    }

    /**
     * b[from, to) as text, or null. Any control byte disqualifies it: a nested message usually
     * starts with tag 0x0A, a newline, and would otherwise pass for text. The values we want are
     * URLs and short labels, so nothing is lost.
     */
    private static String cleanText(byte[] b, int from, int to) {
        if (to <= from) return null;
        for (int i = from; i < to; i++) {
            int unsigned = b[i] & 0xff;
            if (unsigned < 0x20 || unsigned == 0x7f) return null;
        }
        try {
            return strictUtf8().decode(ByteBuffer.wrap(b, from, to - from)).toString();
        } catch (CharacterCodingException notUtf8) {
            return null;
        }
    }

    /** A decoder that fails on malformed input instead of substituting U+FFFD. */
    private static CharsetDecoder strictUtf8() {
        CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder();
        decoder.onMalformedInput(CodingErrorAction.REPORT);
        decoder.onUnmappableCharacter(CodingErrorAction.REPORT);
        return decoder;
    }
}
