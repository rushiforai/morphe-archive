package biz.kushan.ltkey;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Minimal, dependency-free CBOR decoder — enough to walk the OCF SVR-DB `/cred` store, which
 * IoTivity encodes with BOTH definite- and indefinite-length items (arrays/maps/strings
 * terminated by a 0xFF "break"). Produces plain Java objects: Map, List, byte[], String, Long,
 * Boolean, null. Android-free so it unit-tests on a plain JDK and behaves identically on-device.
 *
 * Strict + bounded: malformed/unsupported input throws, which callers treat as "no key".
 */
final class DtCbor {
    private static final Object BREAK = new Object();

    private final byte[] b;
    private int p;

    private DtCbor(byte[] data) { this.b = data; this.p = 0; }

    /** Decode a single top-level CBOR item from {@code data}. Trailing bytes are allowed. */
    static Object decode(byte[] data) {
        if (data == null || data.length == 0) throw new IllegalArgumentException("empty cbor");
        Object v = new DtCbor(data).readItem(0);
        if (v == BREAK) throw new IllegalStateException("unexpected break");
        return v;
    }

    private Object readItem(int depth) {
        if (depth > 64) throw new IllegalStateException("cbor too deep");
        int ib = u8();
        if (ib == 0xff) return BREAK;                       // break code (major 7, minor 31)
        int major = ib >> 5;
        int minor = ib & 0x1f;
        switch (major) {
            case 0: return readUInt(minor);                 // unsigned int
            case 1: return -1L - readUInt(minor);           // negative int
            case 2:                                         // byte string
                return minor == 31 ? readIndefBytes(depth) : readBytes((int) readUInt(minor));
            case 3:                                         // text string
                return minor == 31
                    ? new String(readIndefBytes(depth), StandardCharsets.UTF_8)
                    : new String(readBytes((int) readUInt(minor)), StandardCharsets.UTF_8);
            case 4: {                                       // array
                List<Object> list = new ArrayList<>();
                if (minor == 31) {
                    Object it;
                    while ((it = readItem(depth + 1)) != BREAK) list.add(it);
                } else {
                    long n = readUInt(minor);
                    for (long i = 0; i < n; i++) list.add(readItem(depth + 1));
                }
                return list;
            }
            case 5: {                                       // map
                Map<Object, Object> map = new LinkedHashMap<>();
                if (minor == 31) {
                    Object k;
                    while ((k = readItem(depth + 1)) != BREAK) map.put(k, readItem(depth + 1));
                } else {
                    long n = readUInt(minor);
                    for (long i = 0; i < n; i++) {
                        Object k = readItem(depth + 1);
                        map.put(k, readItem(depth + 1));
                    }
                }
                return map;
            }
            case 6: return readItem(depth + 1);             // tag: skip, return tagged item
            case 7:                                         // simple / float
                switch (minor) {
                    case 20: return Boolean.FALSE;
                    case 21: return Boolean.TRUE;
                    case 22: return null;                   // null
                    case 23: return null;                   // undefined
                    default: throw new IllegalStateException("unsupported simple/float: " + minor);
                }
            default: throw new IllegalStateException("bad major type");
        }
    }

    /** Indefinite-length byte/text string: concatenate definite-length chunks until the break. */
    private byte[] readIndefBytes(int depth) {
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        Object chunk;
        while ((chunk = readItem(depth + 1)) != BREAK) {
            if (chunk instanceof byte[]) bo.write((byte[]) chunk, 0, ((byte[]) chunk).length);
            else if (chunk instanceof String) {
                byte[] s = ((String) chunk).getBytes(StandardCharsets.UTF_8);
                bo.write(s, 0, s.length);
            } else throw new IllegalStateException("bad indefinite chunk");
        }
        return bo.toByteArray();
    }

    private long readUInt(int minor) {
        if (minor < 24) return minor;
        switch (minor) {
            case 24: return u8();
            case 25: return (u8() << 8) | u8();
            case 26: return ((long) u8() << 24) | ((long) u8() << 16) | ((long) u8() << 8) | u8();
            case 27: {
                long v = 0;
                for (int i = 0; i < 8; i++) v = (v << 8) | u8();
                return v;
            }
            default: throw new IllegalStateException("reserved length: " + minor);
        }
    }

    private int u8() {
        if (p >= b.length) throw new IndexOutOfBoundsException("cbor truncated");
        return b[p++] & 0xff;
    }

    private byte[] readBytes(int len) {
        if (len < 0 || p + len > b.length) throw new IndexOutOfBoundsException("cbor bytes overrun");
        byte[] out = new byte[len];
        System.arraycopy(b, p, out, 0, len);
        p += len;
        return out;
    }
}
