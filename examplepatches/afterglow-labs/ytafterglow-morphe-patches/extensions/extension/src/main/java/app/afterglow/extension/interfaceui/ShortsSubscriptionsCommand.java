package app.afterglow.extension.interfaceui;

/**
 * Semantic discriminator for a serialized native Command (Lbdso), never an arbitrary element buffer.
 * A caller must first prove ownership of its own primary command.
 */
public final class ShortsSubscriptionsCommand {
    public enum Source { PAUSED_SUBSCRIPTIONS, OTHER_REEL, NO_REEL, INVALID }
    // 21.43.523: Lblie.b extends Lbdso; Lblie.M is proto field 26.
    // Lathz.apply -> Lazkf.aM maps wire 32 to PAUSED_STATE_SUBSCRIPTIONS.
    static final int REEL_WATCH_ENDPOINT = 139608561;
    // Lbglu.a embeds the native YouTube Command directly in an Elements Command.
    static final int NATIVE_COMMAND = 169495254;
    private static final int MAX_BYTES = 65536, MAX_FIELDS = 512;
    private ShortsSubscriptionsCommand() {}

    public static Source classify(byte[] command) {
        if (command == null || command.length > MAX_BYTES) return Source.INVALID;
        try {
            return nativeCommand(new Cursor(command, 0, command.length, new int[]{0}), false);
        } catch (Malformed ignored) { return Source.INVALID; }
    }

    /** Lwbv.s() -> Lwbq.f(), the serialized primary Elements click command only. */
    public static Source classifyElements(byte[] command) {
        if (command == null || command.length > MAX_BYTES) return Source.INVALID;
        try {
            Cursor root = new Cursor(command, 0, command.length, new int[]{0});
            Source result = Source.NO_REEL;
            boolean found = false, otherAction = false;
            while (root.hasNext()) {
                long tag = root.tag();
                if ((tag >>> 3) == NATIVE_COMMAND) {
                    if (found || (tag & 7) != 2) return Source.INVALID;
                    found = true;
                    Cursor nativeCommand = root.message();
                    result = nativeCommand(nativeCommand, true);
                    if (result == Source.INVALID) return result;
                } else {
                    if ((tag >>> 3) >= 1000) otherAction = true;
                    root.skip((int) (tag & 7));
                }
            }
            return found && otherAction ? Source.INVALID : result;
        } catch (Malformed ignored) { return Source.INVALID; }
    }

    private static Source nativeCommand(Cursor root, boolean exclusive) throws Malformed {
        Source result = Source.NO_REEL;
        boolean found = false, otherAction = false;
        while (root.hasNext()) {
            long tag = root.tag();
            if ((tag >>> 3) == REEL_WATCH_ENDPOINT) {
                if (found || (tag & 7) != 2) return Source.INVALID;
                found = true;
                result = endpoint(root.message());
                if (result == Source.INVALID) return result;
            } else {
                if ((tag >>> 3) >= 1000) otherAction = true;
                root.skip((int) (tag & 7));
            }
        }
        return exclusive && found && otherAction ? Source.INVALID : result;
    }

    private static Source endpoint(Cursor message) throws Malformed {
        boolean found = false;
        long source = -1;
        while (message.hasNext()) {
            long tag = message.tag();
            if ((tag >>> 3) == 26) {
                if (found || (tag & 7) != 0) return Source.INVALID;
                found = true;
                source = message.varint();
            } else message.skip((int) (tag & 7));
        }
        return found && source == 32 ? Source.PAUSED_SUBSCRIPTIONS : Source.OTHER_REEL;
    }

    private static final class Cursor {
        final byte[] bytes;
        final int end;
        final int[] fields;
        int position;
        Cursor(byte[] bytes, int start, int end, int[] fields) {
            this.bytes = bytes; position = start; this.end = end; this.fields = fields;
        }
        boolean hasNext() { return position < end; }
        long tag() throws Malformed {
            if (++fields[0] > MAX_FIELDS) throw BAD;
            long tag = varint();
            if (tag < 8 || tag > 0xffffffffL) throw BAD;
            return tag;
        }
        long varint() throws Malformed {
            long value = 0;
            for (int i = 0; i < 10; i++) {
                if (position == end) throw BAD;
                int b = bytes[position++] & 255;
                if (i == 9 && b > 1) throw BAD;
                value |= (long) (b & 127) << (i * 7);
                if ((b & 128) == 0) {
                    if (i > 0 && b == 0) throw BAD; // Native serialization is canonical.
                    return value;
                }
            }
            throw BAD;
        }
        Cursor message() throws Malformed {
            long length = varint();
            if (length < 0 || length > end - position) throw BAD;
            int start = position;
            position += (int) length;
            return new Cursor(bytes, start, position, fields);
        }
        void skip(int wire) throws Malformed {
            if (wire == 0) { varint(); return; }
            if (wire == 2) { message(); return; }
            int length = wire == 1 ? 8 : wire == 5 ? 4 : -1;
            if (length < 0 || length > end - position) throw BAD;
            position += length;
        }
    }
    private static final class Malformed extends Exception {
        Malformed() { super(null, null, false, false); }
    }
    private static final Malformed BAD = new Malformed();
}
