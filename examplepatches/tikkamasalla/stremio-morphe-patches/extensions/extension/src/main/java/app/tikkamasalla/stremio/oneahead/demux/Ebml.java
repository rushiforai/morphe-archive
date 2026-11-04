package app.tikkamasalla.stremio.oneahead.demux;

import java.nio.charset.StandardCharsets;

/** Cursor over the sibling elements of an in-memory EBML master element. */
final class Ebml {
    final byte[] b;
    private int p;
    private final int end;
    int id;
    long size;
    int body;

    Ebml(byte[] b, int from, int to) {
        this.b = b;
        this.p = from;
        this.end = to;
    }

    /** Moves to the next child. False at the end, at damage, or at a child the master cannot hold. */
    boolean next() {
        if (p >= end) return false;
        int il = idLen(b[p]);
        if (il == 0 || p + il >= end) return false;
        int sl = sizeLen(b[p + il]);
        if (sl == 0 || p + il + sl > end) return false;
        id = id(b, p, il);
        size = vint(b, p + il, sl);
        body = p + il + sl;
        if (size < 0 || size > end - body) return false;
        p = body + (int) size;
        return true;
    }

    long uint() {
        return uint(b, body, (int) size);
    }

    double floating() {
        return size == 4 ? Float.intBitsToFloat((int) uint()) : size == 8 ? Double.longBitsToDouble(uint()) : -1;
    }

    String string() {
        return new String(b, body, (int) size, StandardCharsets.UTF_8).replace("\u0000", "").trim();
    }

    Ebml children() {
        return new Ebml(b, body, body + (int) size);
    }

    static int idLen(byte first) {
        int v = first & 0xFF;
        return v >= 0x80 ? 1 : v >= 0x40 ? 2 : v >= 0x20 ? 3 : v >= 0x10 ? 4 : 0;
    }

    static int sizeLen(byte first) {
        int v = first & 0xFF;
        for (int i = 0; i < 8; i++) {
            if ((v & (0x80 >> i)) != 0) return i + 1;
        }
        return 0;
    }

    static int id(byte[] b, int p, int len) {
        int value = 0;
        for (int i = 0; i < len; i++) value = (value << 8) | (b[p + i] & 0xFF);
        return value;
    }

    /** Value of a size field; -1 when all value bits are set, which means unknown size. */
    static long vint(byte[] b, int p, int len) {
        long value = (b[p] & 0xFF) & (0xFF >> len);
        boolean allOnes = value == (0xFF >> len);
        for (int i = 1; i < len; i++) {
            value = (value << 8) | (b[p + i] & 0xFF);
            allOnes &= (b[p + i] & 0xFF) == 0xFF;
        }
        return allOnes ? -1 : value;
    }

    /** The value bits as they are, for EBML lace deltas where all ones is a legal number. */
    static long rawVint(byte[] b, int p, int len) {
        long value = (b[p] & 0xFF) & (0xFF >> len);
        for (int i = 1; i < len; i++) value = (value << 8) | (b[p + i] & 0xFF);
        return value;
    }

    static long uint(byte[] b, int p, int len) {
        long value = 0;
        for (int i = 0; i < len; i++) value = (value << 8) | (b[p + i] & 0xFF);
        return value;
    }
}
