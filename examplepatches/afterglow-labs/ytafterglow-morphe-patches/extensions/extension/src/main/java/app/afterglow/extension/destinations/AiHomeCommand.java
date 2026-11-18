package app.afterglow.extension.destinations;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** The native custom-feed command boundary; preserves every unrelated protobuf byte. */
public final class AiHomeCommand {
    public static final int BROWSE = 48687626, RELOAD = 120837120, SEARCH = 48687757;
    private static final int LIMIT = 65536;
    private AiHomeCommand() {}

    public static boolean nativeEntry(byte[] command) {
        try {
            List<Field> fields = parse(command);
            if (count(fields, SEARCH) != 0) return false;
            return count(fields, BROWSE) + count(fields, RELOAD) == 1
                    && (message(fields, BROWSE) != null || message(fields, RELOAD) != null);
        } catch (IllegalArgumentException invalid) { return false; }
    }
    public static boolean supportsPrompt(byte[] command) {
        try {
            List<Field> fields = parse(command);
            if (count(fields, SEARCH) != 0 || count(fields, RELOAD) != 0 || count(fields, BROWSE) != 1) return false;
            byte[] browse = message(fields, BROWSE);
            if (browse == null) return false;
            List<Field> endpoint = parse(browse);
            byte[] id = message(endpoint, 2);
            return count(endpoint, 2) == 1 && id != null && id.length > 0 && id.length <= 512
                    && (count(endpoint, 5) == 0 || (count(endpoint, 5) == 1 && message(endpoint, 5) != null));
        } catch (IllegalArgumentException invalid) { return false; }
    }
    public static byte[] withPrompt(byte[] command, String prompt) {
        if (!supportsPrompt(command)) throw new IllegalArgumentException("This native custom-feed command cannot accept a prompt.");
        byte[] text = AiHomeLibrary.normalize(prompt).getBytes(StandardCharsets.UTF_8);
        List<Field> fields = parse(command);
        byte[] browse = message(fields, BROWSE);
        return replace(fields, BROWSE, replace(parse(browse), 5, text));
    }
    /** Same BrowseEndpoint browse ID used by YouTube's native default-Home factory. */
    public static byte[] normalHome() { return field(BROWSE, field(2, "FEwhat_to_watch".getBytes(StandardCharsets.UTF_8))); }
    private static int count(List<Field> fields, int id) { int count = 0; for (Field field : fields) if (field.number == id) count++; return count; }
    private static byte[] message(List<Field> fields, int id) {
        for (Field field : fields) if (field.number == id && field.wire == 2) return field.payload;
        return null;
    }
    private static byte[] replace(List<Field> fields, int id, byte[] payload) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(); boolean replaced = false;
        for (Field value : fields) {
            byte[] bytes;
            if (value.number == id) { if (replaced) continue; bytes = field(id, payload); replaced = true; }
            else bytes = value.raw;
            out.write(bytes, 0, bytes.length);
        }
        if (!replaced) { byte[] bytes = field(id, payload); out.write(bytes, 0, bytes.length); }
        if (out.size() > LIMIT) throw new IllegalArgumentException("The native command is too large.");
        return out.toByteArray();
    }
    private static byte[] field(int id, byte[] payload) {
        ByteArrayOutputStream out = new ByteArrayOutputStream(); varint(out, ((long) id << 3) | 2); varint(out, payload.length);
        out.write(payload, 0, payload.length); return out.toByteArray();
    }
    private static void varint(ByteArrayOutputStream out, long value) {
        while ((value & ~127L) != 0) { out.write(((int) value & 127) | 128); value >>>= 7; } out.write((int) value);
    }
    private static long varint(byte[] input, int[] offset) {
        long value = 0;
        for (int shift = 0; shift < 70; shift += 7) {
            if (offset[0] >= input.length) throw new IllegalArgumentException("Truncated native command.");
            int next = input[offset[0]++] & 255;
            if (shift == 63 && (next & 254) != 0) throw new IllegalArgumentException("Invalid native integer.");
            value |= (long) (next & 127) << shift;
            if ((next & 128) == 0) return value;
        }
        throw new IllegalArgumentException("Invalid native integer.");
    }
    private static List<Field> parse(byte[] input) {
        if (input == null || input.length == 0 || input.length > LIMIT) throw new IllegalArgumentException("Invalid native command.");
        List<Field> result = new ArrayList<>(); int[] offset = {0};
        while (offset[0] < input.length) {
            if (result.size() >= 512) throw new IllegalArgumentException("Too many native command fields.");
            int start = offset[0]; long tag = varint(input, offset);
            long number = tag >>> 3; int wire = (int) (tag & 7); byte[] payload = null;
            if (number == 0 || number > 0x1fffffff) throw new IllegalArgumentException("Invalid native field.");
            if (wire == 0) varint(input, offset);
            else if (wire == 1 || wire == 5) {
                int size = wire == 1 ? 8 : 4;
                if (offset[0] > input.length - size) throw new IllegalArgumentException("Truncated native field.");
                offset[0] += size;
            } else if (wire == 2) {
                long length = varint(input, offset);
                if (length < 0 || length > input.length - offset[0]) throw new IllegalArgumentException("Invalid native message length.");
                payload = Arrays.copyOfRange(input, offset[0], offset[0] + (int) length); offset[0] += (int) length;
            } else throw new IllegalArgumentException("Unsupported native wire type.");
            result.add(new Field((int) number, wire, payload, Arrays.copyOfRange(input, start, offset[0])));
        }
        return result;
    }
    private static final class Field {
        final int number, wire; final byte[] payload, raw;
        Field(int number, int wire, byte[] payload, byte[] raw) { this.number = number; this.wire = wire; this.payload = payload; this.raw = raw; }
    }
}
