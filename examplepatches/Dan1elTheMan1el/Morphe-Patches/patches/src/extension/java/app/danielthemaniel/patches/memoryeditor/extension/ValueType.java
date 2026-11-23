package app.danielthemaniel.patches.memoryeditor.extension;

import java.nio.ByteBuffer;

/**
 * Scalar types the editor understands. Values travel around as raw "bits" in a long:
 * integers sign-extended, floats as their IEEE bit pattern. Buffers are little-endian.
 */
enum ValueType {
    BYTE("Byte", 1, false),
    WORD("Word (2)", 2, false),
    DWORD("Dword (4)", 4, false),
    QWORD("Qword (8)", 8, false),
    FLOAT("Float", 4, true),
    DOUBLE("Double", 8, true);

    final String label;
    final int size;
    final boolean fp;

    ValueType(String label, int size, boolean fp) {
        this.label = label;
        this.size = size;
        this.fp = fp;
    }

    static String[] labels() {
        ValueType[] v = values();
        String[] out = new String[v.length];
        for (int i = 0; i < v.length; i++) out[i] = v[i].label;
        return out;
    }

    long get(ByteBuffer b, int off) {
        switch (size) {
            case 1: return b.get(off);
            case 2: return b.getShort(off);
            case 4: return b.getInt(off);
            default: return b.getLong(off);
        }
    }

    void put(ByteBuffer b, int off, long bits) {
        switch (size) {
            case 1: b.put(off, (byte) bits); break;
            case 2: b.putShort(off, (short) bits); break;
            case 4: b.putInt(off, (int) bits); break;
            default: b.putLong(off, bits); break;
        }
    }

    double num(long bits) {
        if (!fp) return bits;
        return size == 4 ? Float.intBitsToFloat((int) bits) : Double.longBitsToDouble(bits);
    }

    /** Parses user input into bits. Integers accept decimal or 0x-hex. */
    long parse(String s) {
        s = s.trim();
        if (s.isEmpty()) throw new NumberFormatException("empty");
        if (fp) {
            double d = Double.parseDouble(s);
            return size == 4 ? (long) Float.floatToRawIntBits((float) d) : Double.doubleToRawLongBits(d);
        }
        long v;
        if (s.startsWith("0x") || s.startsWith("0X")) v = Long.parseUnsignedLong(s.substring(2), 16);
        else if (s.startsWith("-0x") || s.startsWith("-0X")) v = -Long.parseUnsignedLong(s.substring(3), 16);
        else v = Long.parseLong(s);
        switch (size) {
            case 1: return (byte) v;
            case 2: return (short) v;
            case 4: return (int) v;
            default: return v;
        }
    }

    String format(long bits) {
        if (!fp) return Long.toString(bits);
        return size == 4 ? Float.toString(Float.intBitsToFloat((int) bits))
                : Double.toString(Double.longBitsToDouble(bits));
    }

    int cmp(long a, long b) {
        return fp ? Double.compare(num(a), num(b)) : Long.compare(a, b);
    }

    /** Equality for searches. Floats match approximately, since games rarely show exact values. */
    boolean eq(long cur, long target) {
        if (!fp) return cur == target;
        double c = num(cur), t = num(target);
        return Math.abs(c - t) <= Math.max(1e-4, Math.abs(t) * 1e-5);
    }
}
