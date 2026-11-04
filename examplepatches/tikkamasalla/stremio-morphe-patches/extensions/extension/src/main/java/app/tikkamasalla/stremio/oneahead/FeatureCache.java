package app.tikkamasalla.stremio.oneahead;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.CRC32;
import java.util.zip.CheckedInputStream;
import java.util.zip.CheckedOutputStream;

/**
 * Compact on-flash features of one episode: prepped 4 kHz head and tail windows at int8 or int16, the 20 ms level track,
 * and the file identity. Layout (big-endian): magic "OAFC", u2 version, u1 bits, u1 flags, i8 fileSize, i8 headHash,
 * f8 duration, f8 audioEnd, UTF id, UTF language, then for head and tail: f8 offset, i4 n, f4 step, i4 envLen, env bytes,
 * samples; finally u4 CRC-32 of everything before it. A wrong magic, version or CRC throws, and the caller re-derives.
 */
public final class FeatureCache {
    private static final int MAGIC = 0x4F414643;
    /** 2: duration is the file's own (1 could hold the show's meta runtime). */
    public static final int VERSION = 2;
    private static final int FLAG_FINALE = 1;

    private FeatureCache() {
    }

    public static void write(EpisodeFeatures e, OutputStream raw) throws IOException {
        int bits = e.head.bits();
        if (bits == 32 || e.tail.bits() != bits) throw new IOException("only int8 or int16 tracks are cached");
        CRC32 crc = new CRC32();
        CheckedOutputStream cos = new CheckedOutputStream(new BufferedOutputStream(raw, 65536), crc);
        DataOutputStream o = new DataOutputStream(cos);
        o.writeInt(MAGIC);
        o.writeShort(VERSION);
        o.writeByte(bits);
        o.writeByte(e.finale ? FLAG_FINALE : 0);
        o.writeLong(e.fileSize);
        o.writeLong(e.headHash);
        o.writeDouble(e.duration);
        o.writeDouble(e.audioEnd);
        o.writeUTF(e.id == null ? "" : e.id);
        o.writeUTF(e.language == null ? "" : e.language);
        writeTrack(o, e.head);
        writeTrack(o, e.tail);
        o.flush();
        long v = crc.getValue();
        new DataOutputStream(cos).writeInt((int) v);
        cos.flush();
    }

    private static void writeTrack(DataOutputStream o, Track t) throws IOException {
        o.writeDouble(t.offset);
        o.writeInt(t.n);
        o.writeFloat(t.step);
        o.writeInt(t.env.length);
        o.write(t.env);
        if (t.q8 != null) {
            o.write(t.q8);
            return;
        }
        byte[] buf = new byte[32768];
        for (int i = 0, b = 0; i < t.n; i++) {
            short s = t.q16[i];
            buf[b++] = (byte) (s >> 8);
            buf[b++] = (byte) s;
            if (b == buf.length || i == t.n - 1) {
                o.write(buf, 0, b);
                b = 0;
            }
        }
    }

    /** True when the stream starts as a feature file of this version: a cheap look before trusting a key. */
    public static boolean isCurrent(InputStream raw) {
        try {
            DataInputStream in = new DataInputStream(raw);
            return in.readInt() == MAGIC && in.readUnsignedShort() == VERSION;
        } catch (IOException bad) {
            return false;
        }
    }

    public static EpisodeFeatures read(InputStream raw) throws IOException {
        CRC32 crc = new CRC32();
        CheckedInputStream cis = new CheckedInputStream(new BufferedInputStream(raw, 65536), crc);
        DataInputStream in = new DataInputStream(cis);
        if (in.readInt() != MAGIC) throw new IOException("not a feature cache");
        int version = in.readUnsignedShort();
        if (version != VERSION) throw new IOException("feature cache version " + version);
        int bits = in.readUnsignedByte();
        if (bits != 8 && bits != 16) throw new IOException("bits " + bits);
        int flags = in.readUnsignedByte();
        long size = in.readLong(), hash = in.readLong();
        double duration = in.readDouble(), audioEnd = in.readDouble();
        String id = in.readUTF(), lang = in.readUTF();
        Track head = readTrack(in, bits), tail = readTrack(in, bits);
        long want = crc.getValue() & 0xFFFFFFFFL;
        long got = in.readInt() & 0xFFFFFFFFL;
        if (want != got) throw new IOException("feature cache CRC mismatch");
        return new EpisodeFeatures(id, size, hash, lang.isEmpty() ? null : lang, duration, audioEnd,
                (flags & FLAG_FINALE) != 0, head, tail);
    }

    private static Track readTrack(DataInputStream in, int bits) throws IOException {
        double offset = in.readDouble();
        int n = in.readInt();
        float step = in.readFloat();
        int envLen = in.readInt();
        if (n < 0 || n > 8000000 || envLen < 0 || envLen > 200000) throw new IOException("bad lengths");
        byte[] env = new byte[envLen];
        in.readFully(env);
        if (bits == 8) {
            byte[] q = new byte[n];
            in.readFully(q);
            return new Track(offset, n, q, null, null, step, env);
        }
        short[] q = new short[n];
        byte[] buf = new byte[32768];
        for (int i = 0; i < n; ) {
            int want = Math.min(buf.length, 2 * (n - i));
            in.readFully(buf, 0, want);
            for (int b = 0; b < want; b += 2) q[i++] = (short) ((buf[b] << 8) | (buf[b + 1] & 0xFF));
        }
        return new Track(offset, n, null, q, null, step, env);
    }
}
