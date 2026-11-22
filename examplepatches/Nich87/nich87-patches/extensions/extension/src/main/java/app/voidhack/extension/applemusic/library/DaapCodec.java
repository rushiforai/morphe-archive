package app.voidhack.extension.applemusic.library;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.CodingErrorAction;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

final class DaapCodec {
    static final int MAX_BODY = 16 * 1024 * 1024;
    private static final int MAX_DEPTH = 16;
    private static final int MAX_NODES = 200000;
    private static final List<String> CONTAINERS = Arrays.asList(
            "mlog", "avdb", "mlcl", "mlit", "adbs", "apso", "msrv", "mupd", "mebp");

    private DaapCodec() {}

    static final class FormatException extends IOException {
        FormatException(String message) { super(message); }
        FormatException(String message, Throwable cause) { super(message, cause); }
    }

    static Node root(byte[] body, String expected) throws IOException {
        if (body.length > MAX_BODY) throw new FormatException("DAAP response is too large (bytes=" + body.length + ")");
        List<Node> nodes = parse(body, 0, body.length, 0, new int[]{0}, "adbs".equals(expected));
        if (nodes.size() != 1 || !nodes.get(0).code.equals(expected)) {
            throw new FormatException("Unexpected DAAP response type (expected=" + expected + ", count=" + nodes.size() + ")");
        }
        return nodes.get(0);
    }

    private static List<Node> parse(byte[] body, int start, int end, int depth, int[] count,
                                    boolean trackListPath) throws IOException {
        if (depth > MAX_DEPTH) throw new FormatException("DAAP nesting is too deep");
        List<Node> nodes = new ArrayList<>();
        for (int offset = start; offset < end;) {
            if (end - offset < 8) throw new FormatException("Truncated DAAP header (remaining=" + (end - offset) + ", bytes=" + body.length + ")");
            if (++count[0] > MAX_NODES) throw new FormatException("Too many DAAP fields (limit=" + MAX_NODES + ", bytes=" + body.length + ")");
            for (int i = 0; i < 4; i++) {
                if (body[offset + i] < 32 || body[offset + i] > 126) {
                    throw new FormatException("Invalid DAAP field code (offset=" + offset + ", bytes=" + body.length + ")");
                }
            }
            String code = new String(body, offset, 4, StandardCharsets.US_ASCII);
            int length = ByteBuffer.wrap(body, offset + 4, 4).getInt();
            if (length < 0 || length > end - offset - 8) {
                throw new FormatException("Invalid DAAP field length (offset=" + offset + ", length=" + length
                        + ", remaining=" + (end - offset - 8) + ")");
            }
            int next = offset + 8 + length;
            List<Node> children = Collections.emptyList();
            if (trackListPath && depth == 2 && "mlit".equals(code)) {
                // Decode each track's fields separately so a large library does not keep all fields in memory.
                children = null;
            } else if (CONTAINERS.contains(code)) {
                boolean trackContainer = (depth == 0 && "adbs".equals(code)) || (depth == 1 && "mlcl".equals(code));
                children = parse(body, offset + 8, next, depth + 1, count, trackListPath && trackContainer);
            }
            nodes.add(new Node(code, body, offset + 8, length, children));
            offset = next;
        }
        return Collections.unmodifiableList(nodes);
    }

    static byte[] edit(long cloudId, long revision, long time, Map<String, byte[]> fields) throws IOException {
        if (cloudId == 0 || fields.isEmpty()) throw new IOException("Empty metadata update");
        ByteArrayOutputStream item = new ByteArrayOutputStream();
        item.write(tag("miid", uint32(cloudId)));
        for (Map.Entry<String, byte[]> field : fields.entrySet()) item.write(tag(field.getKey(), field.getValue()));
        return tag("mebs", join(tag("mikd", new byte[]{2}), tag("musr", uint32(revision)),
                tag("mstc", uint32(time)), tag("mlcl", tag("mlit", item.toByteArray()))));
    }

    static byte[] utf8(String value) throws IOException {
        try {
            ByteBuffer encoded = StandardCharsets.UTF_8.newEncoder()
                    .onMalformedInput(CodingErrorAction.REPORT).onUnmappableCharacter(CodingErrorAction.REPORT)
                    .encode(java.nio.CharBuffer.wrap(value));
            byte[] bytes = new byte[encoded.remaining()];
            encoded.get(bytes);
            return bytes;
        } catch (CharacterCodingException exception) { throw new IOException("Invalid metadata text", exception); }
    }

    static byte[] uint32(long value) throws IOException {
        if (value < 0 || value > 0xffffffffL) throw new IOException("DAAP integer is out of range");
        return ByteBuffer.allocate(4).putInt((int) value).array();
    }

    private static byte[] tag(String code, byte[] value) throws IOException {
        if (code.length() != 4) throw new IOException("Invalid DAAP field code");
        return join(code.getBytes(StandardCharsets.US_ASCII), uint32(value.length), value);
    }

    private static byte[] join(byte[]... arrays) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        for (byte[] array : arrays) {
            if (array.length > MAX_BODY - output.size()) throw new IOException("DAAP request is too large");
            output.write(array);
        }
        return output.toByteArray();
    }

    static final class Node {
        final String code;
        private final List<Node> children;
        private final byte[] body;
        private final int offset, length;

        private Node(String code, byte[] body, int offset, int length, List<Node> children) {
            this.code = code;
            this.body = body;
            this.offset = offset;
            this.length = length;
            this.children = children;
        }

        Node readTrackFields() throws IOException {
            if (children != null) return this;
            return new Node(code, body, offset, length, parse(body, offset, offset + length, 3, new int[]{0}, false));
        }

        List<Node> children() throws IOException { return readTrackFields().children; }

        Node child(String name) throws IOException {
            Node result = null;
            for (Node node : children()) if (node.code.equals(name)) {
                if (result != null) throw new FormatException("Duplicate DAAP field (code=" + name + ")");
                result = node;
            }
            return result;
        }

        Node required(String name) throws IOException {
            Node result = child(name);
            if (result == null) throw new FormatException("Missing DAAP field (code=" + name + ", parent=" + code + ")");
            return result;
        }

        long number() throws IOException {
            if (length != 1 && length != 2 && length != 4 && length != 8) {
                throw new FormatException("Invalid DAAP integer width (code=" + code + ", length=" + length + ")");
            }
            long value = 0;
            for (int i = offset; i < offset + length; i++) value = value << 8 | (body[i] & 255);
            return value;
        }

        long unsigned32() throws IOException {
            if (length != 4) throw new FormatException("Invalid DAAP identifier width (code=" + code + ", length=" + length + ")");
            return number();
        }

        String text() throws IOException {
            try {
                return StandardCharsets.UTF_8.newDecoder().onMalformedInput(CodingErrorAction.REPORT)
                        .onUnmappableCharacter(CodingErrorAction.REPORT).decode(ByteBuffer.wrap(body, offset, length)).toString();
            } catch (CharacterCodingException exception) {
                throw new FormatException("Invalid DAAP text (code=" + code + ", length=" + length + ")", exception);
            }
        }

        byte[] bytes() { return Arrays.copyOfRange(body, offset, offset + length); }
    }
}
