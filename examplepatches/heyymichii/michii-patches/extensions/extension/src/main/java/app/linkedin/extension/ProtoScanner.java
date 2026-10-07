package app.linkedin.extension;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Minimal protobuf wire format walker for SDUI component payloads.
 *
 * The payload schema is nested and partly opaque (CompactAny), so instead of typed access
 * every length-delimited field is treated as a string when it is printable UTF-8 and
 * otherwise parsed speculatively as a nested message.
 *
 * Images use LinkedIn's digitalmedia render Image layout:
 *   Image { 1: rootUrl, 2: repeated ImageRendition { 1: width, 2: height, 3: suffixUrl } }
 */
final class ProtoScanner {
    private static final int MAX_DEPTH = 48;
    private static final String IMAGE_ROOT_PREFIX = "https://media.licdn.com/dms/image/";

    /** An image with its largest and smallest rendition. */
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

    final List<String> strings = new ArrayList<>();
    final List<ImageRef> images = new ArrayList<>();

    private ProtoScanner() {
    }

    static ProtoScanner scan(byte[] data) {
        ProtoScanner scanner = new ProtoScanner();
        if (data != null) scanner.parseMessage(data, 0, data.length, 0);
        return scanner;
    }

    /** True if any length-delimited string field equals one of the values exactly. */
    static boolean hasExactString(byte[] data, String... values) {
        if (data == null) return false;
        for (String s : scan(data).strings) {
            for (String v : values) if (s.equals(v)) return true;
        }
        return false;
    }

    /** Fast raw byte search, for markers that are unambiguous substrings (such as URNs). */
    static boolean containsAscii(byte[] data, String needle) {
        if (data == null) return false;
        byte[] n = needle.getBytes(StandardCharsets.US_ASCII);
        outer:
        for (int i = 0; i <= data.length - n.length; i++) {
            for (int j = 0; j < n.length; j++) {
                if (data[i + j] != n[j]) continue outer;
            }
            return true;
        }
        return false;
    }

    /** Collected fields of one message, used to recognize the Image layout. */
    private static final class Message {
        String field1String;
        long field1Varint = -1;
        String field3String;
        final List<Message> field2Messages = new ArrayList<>();
    }

    /** Returns the parsed message, or null if the bytes are not a well formed message. */
    private Message parseMessage(byte[] b, int start, int end, int depth) {
        if (depth > MAX_DEPTH) return null;
        Message message = new Message();
        List<String> foundStrings = new ArrayList<>();
        List<ImageRef> foundImages = new ArrayList<>();
        int p = start;
        while (p < end) {
            long[] tag = readVarint(b, p, end);
            if (tag == null) return null;
            p = (int) tag[1];
            int field = (int) (tag[0] >>> 3);
            int wireType = (int) (tag[0] & 7);
            if (field <= 0) return null;

            switch (wireType) {
                case 0: {
                    long[] v = readVarint(b, p, end);
                    if (v == null) return null;
                    p = (int) v[1];
                    if (field == 1) message.field1Varint = v[0];
                    break;
                }
                case 1:
                    p += 8;
                    break;
                case 5:
                    p += 4;
                    break;
                case 2: {
                    long[] len = readVarint(b, p, end);
                    if (len == null) return null;
                    p = (int) len[1];
                    if (len[0] < 0 || len[0] > end - p) return null;
                    int subEnd = p + (int) len[0];
                    String s = printableUtf8(b, p, subEnd);
                    if (s != null) {
                        foundStrings.add(s);
                        if (field == 1) message.field1String = s;
                        if (field == 3) message.field3String = s;
                    } else {
                        ProtoScanner child = new ProtoScanner();
                        Message sub = child.parseMessage(b, p, subEnd, depth + 1);
                        // LinkedIn prefixes some embedded messages with a single 0x00 byte.
                        if (sub == null && subEnd > p + 1 && b[p] == 0) {
                            child = new ProtoScanner();
                            sub = child.parseMessage(b, p + 1, subEnd, depth + 1);
                        }
                        if (sub != null) {
                            foundStrings.addAll(child.strings);
                            foundImages.addAll(child.images);
                            if (field == 2) message.field2Messages.add(sub);
                        } else {
                            salvageStrings(b, p, subEnd, foundStrings);
                        }
                    }
                    p = subEnd;
                    break;
                }
                default:
                    // Groups (3, 4) are not used by these payloads; anything else is not a message.
                    return null;
            }
            if (p > end) return null;
        }

        strings.addAll(foundStrings);
        images.addAll(foundImages);
        ImageRef image = asImage(message);
        if (image != null) images.add(image);
        return message;
    }

    /**
     * For regions that are not a well formed message (LinkedIn wraps some data in its own
     * framing): find every embedded length-delimited field holding printable UTF-8 of exactly
     * its declared length. The length prefix gives exact string boundaries.
     */
    private static void salvageStrings(byte[] b, int start, int end, List<String> out) {
        int i = start;
        while (i < end - 2) {
            int tag = b[i] & 0xff;
            if ((tag & 7) == 2 && (tag >>> 3) > 0) {
                long[] len = readVarint(b, i + 1, end);
                if (len != null && len[0] >= 8 && len[0] <= end - len[1]) {
                    int strStart = (int) len[1];
                    int strEnd = strStart + (int) len[0];
                    String s = printableUtf8(b, strStart, strEnd);
                    if (s != null) {
                        out.add(s);
                        i = strEnd;
                        continue;
                    }
                }
            }
            i++;
        }
    }

    private static ImageRef asImage(Message m) {
        if (m.field1String == null || !m.field1String.startsWith(IMAGE_ROOT_PREFIX)) return null;
        String largest = null;
        String smallest = null;
        long largestWidth = -1;
        long smallestWidth = Long.MAX_VALUE;
        for (Message r : m.field2Messages) {
            if (r.field3String == null || r.field1Varint <= 0) continue;
            if (r.field1Varint > largestWidth) {
                largestWidth = r.field1Varint;
                largest = r.field3String;
            }
            if (r.field1Varint < smallestWidth) {
                smallestWidth = r.field1Varint;
                smallest = r.field3String;
            }
        }
        if (largest == null) return null;
        return new ImageRef(m.field1String, m.field1String + largest, (int) largestWidth, m.field1String + smallest);
    }

    /** Returns {value, nextPosition} or null when truncated. */
    private static long[] readVarint(byte[] b, int p, int end) {
        long result = 0;
        for (int shift = 0; shift < 64; shift += 7) {
            if (p >= end) return null;
            byte cur = b[p++];
            result |= (long) (cur & 0x7f) << shift;
            if ((cur & 0x80) == 0) return new long[]{result, p};
        }
        return null;
    }

    private static String printableUtf8(byte[] b, int start, int end) {
        if (end <= start) return null;
        // No control characters at all: a nested message starting with tag 0x0A ('\n') would
        // otherwise be mistaken for a string. Only URLs and short labels are needed here.
        for (int i = start; i < end; i++) {
            int c = b[i] & 0xff;
            if (c < 0x20 || c == 0x7f) return null;
        }
        CharsetDecoder decoder = StandardCharsets.UTF_8.newDecoder()
                .onMalformedInput(CodingErrorAction.REPORT)
                .onUnmappableCharacter(CodingErrorAction.REPORT);
        try {
            return decoder.decode(ByteBuffer.wrap(b, start, end - start)).toString();
        } catch (CharacterCodingException e) {
            return null;
        }
    }
}
