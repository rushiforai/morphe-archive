package app.danielthemaniel.patches.instagram.extension;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;

/**
 * Rewrites only the {@code cmap} table of an emoji font so it behaves correctly
 * as the FIRST family
 * in an Android fallback chain.
 *
 * <ul>
 * <li>Removes the plain characters that are also emoji bases
 * ({@code 0-9 # * (c) (r) (tm)}) from the
 * normal character map. Otherwise the emoji font would claim ordinary digits
 * and punctuation.</li>
 * <li>Adds a format 14 (variation sequence) subtable mapping those characters +
 * U+FE0F to their
 * emoji glyphs, so keycaps and emoji-presentation sequences still resolve to
 * this font.</li>
 * <li>Drops the legacy format 4 subtable (a full-repertoire format 12 subtable
 * remains).</li>
 * </ul>
 *
 * Every other table is copied byte-for-byte; only the table directory entry for
 * {@code cmap} changes
 * and the new table is appended to the end of the file. Pure Java, no Android
 * dependencies.
 */
public final class FontPrep {
    private static final int TAG_CMAP = 0x636D6170; // 'cmap'
    private static final int VS16 = 0xFE0F;

    /** Characters removed from the plain cmap (sorted ascending). */
    private static final int[] STRIP = {
            0x23, 0x2A,
            0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39,
            0xA9, 0xAE, 0x2122
    };

    /**
     * Characters removed from the plain cmap with no variation entry. U+0020 must
     * go: the font maps it to
     * a full-em-wide glyph, which as first fallback family would widen every word
     * gap.
     */
    private static final int[] DROP = { 0x20 };

    /** STRIP and DROP merged, ascending. */
    private static final int[] REMOVE = merge(STRIP, DROP);

    private static int[] merge(int[] a, int[] b) {
        int[] r = new int[a.length + b.length];
        System.arraycopy(a, 0, r, 0, a.length);
        System.arraycopy(b, 0, r, a.length, b.length);
        java.util.Arrays.sort(r);
        return r;
    }

    /**
     * Characters that Unicode lets take an emoji-style U+FE0F (emoji-variation-sequences.txt).
     * Each gets an explicit FE0F entry pointing at its own glyph. Android only lets the Apple font
     * (first in the chain) draw "character + FE0F" if the font declares that pair; otherwise the
     * system emoji font takes that one character and sequences such as runner + right arrow split.
     */
    private static final int[] EMOJI_STYLE_BASES = {
            0xA9, 0xAE, 0x203C, 0x2049, 0x2122, 0x2139, 0x2194, 0x2195, 0x2196, 0x2197,
            0x2198, 0x2199, 0x21A9, 0x21AA, 0x231A, 0x231B, 0x2328, 0x23CF, 0x23E9, 0x23EA,
            0x23EB, 0x23EC, 0x23ED, 0x23EE, 0x23EF, 0x23F0, 0x23F1, 0x23F2, 0x23F3, 0x23F8,
            0x23F9, 0x23FA, 0x24C2, 0x25AA, 0x25AB, 0x25B6, 0x25C0, 0x25FB, 0x25FC, 0x25FD,
            0x25FE, 0x2600, 0x2601, 0x2602, 0x2603, 0x2604, 0x260E, 0x2611, 0x2614, 0x2615,
            0x2618, 0x261D, 0x2620, 0x2622, 0x2623, 0x2626, 0x262A, 0x262E, 0x262F, 0x2638,
            0x2639, 0x263A, 0x2640, 0x2642, 0x2648, 0x2649, 0x264A, 0x264B, 0x264C, 0x264D,
            0x264E, 0x264F, 0x2650, 0x2651, 0x2652, 0x2653, 0x265F, 0x2660, 0x2663, 0x2665,
            0x2666, 0x2668, 0x267B, 0x267E, 0x267F, 0x2692, 0x2693, 0x2694, 0x2695, 0x2696,
            0x2697, 0x2699, 0x269B, 0x269C, 0x26A0, 0x26A1, 0x26A7, 0x26AA, 0x26AB, 0x26B0,
            0x26B1, 0x26BD, 0x26BE, 0x26C4, 0x26C5, 0x26C8, 0x26CE, 0x26CF, 0x26D1, 0x26D3,
            0x26D4, 0x26E9, 0x26EA, 0x26F0, 0x26F1, 0x26F2, 0x26F3, 0x26F4, 0x26F5, 0x26F7,
            0x26F8, 0x26F9, 0x26FA, 0x26FD, 0x2702, 0x2705, 0x2708, 0x2709, 0x270A, 0x270B,
            0x270C, 0x270D, 0x270F, 0x2712, 0x2714, 0x2716, 0x271D, 0x2721, 0x2728, 0x2733,
            0x2734, 0x2744, 0x2747, 0x274C, 0x274E, 0x2753, 0x2754, 0x2755, 0x2757, 0x2763,
            0x2764, 0x2795, 0x2796, 0x2797, 0x27A1, 0x27B0, 0x27BF, 0x2934, 0x2935, 0x2B05,
            0x2B06, 0x2B07, 0x2B1B, 0x2B1C, 0x2B50, 0x2B55, 0x3030, 0x303D, 0x3297, 0x3299,
            0x1F004, 0x1F170, 0x1F171, 0x1F17E, 0x1F17F, 0x1F202, 0x1F21A, 0x1F22F, 0x1F237, 0x1F30D,
            0x1F30E, 0x1F30F, 0x1F315, 0x1F31C, 0x1F321, 0x1F324, 0x1F325, 0x1F326, 0x1F327, 0x1F328,
            0x1F329, 0x1F32A, 0x1F32B, 0x1F32C, 0x1F336, 0x1F378, 0x1F37D, 0x1F393, 0x1F396, 0x1F397,
            0x1F399, 0x1F39A, 0x1F39B, 0x1F39E, 0x1F39F, 0x1F3A7, 0x1F3AC, 0x1F3AD, 0x1F3AE, 0x1F3C2,
            0x1F3C4, 0x1F3C6, 0x1F3CA, 0x1F3CB, 0x1F3CC, 0x1F3CD, 0x1F3CE, 0x1F3D4, 0x1F3D5, 0x1F3D6,
            0x1F3D7, 0x1F3D8, 0x1F3D9, 0x1F3DA, 0x1F3DB, 0x1F3DC, 0x1F3DD, 0x1F3DE, 0x1F3DF, 0x1F3E0,
            0x1F3ED, 0x1F3F3, 0x1F3F5, 0x1F3F7, 0x1F408, 0x1F415, 0x1F41F, 0x1F426, 0x1F43F, 0x1F441,
            0x1F442, 0x1F446, 0x1F447, 0x1F448, 0x1F449, 0x1F44D, 0x1F44E, 0x1F453, 0x1F46A, 0x1F47D,
            0x1F4A3, 0x1F4B0, 0x1F4B3, 0x1F4BB, 0x1F4BF, 0x1F4CB, 0x1F4DA, 0x1F4DF, 0x1F4E4, 0x1F4E5,
            0x1F4E6, 0x1F4EA, 0x1F4EB, 0x1F4EC, 0x1F4ED, 0x1F4F7, 0x1F4F9, 0x1F4FA, 0x1F4FB, 0x1F4FD,
            0x1F508, 0x1F50D, 0x1F512, 0x1F513, 0x1F549, 0x1F54A, 0x1F550, 0x1F551, 0x1F552, 0x1F553,
            0x1F554, 0x1F555, 0x1F556, 0x1F557, 0x1F558, 0x1F559, 0x1F55A, 0x1F55B, 0x1F55C, 0x1F55D,
            0x1F55E, 0x1F55F, 0x1F560, 0x1F561, 0x1F562, 0x1F563, 0x1F564, 0x1F565, 0x1F566, 0x1F567,
            0x1F56F, 0x1F570, 0x1F573, 0x1F574, 0x1F575, 0x1F576, 0x1F577, 0x1F578, 0x1F579, 0x1F587,
            0x1F58A, 0x1F58B, 0x1F58C, 0x1F58D, 0x1F590, 0x1F5A5, 0x1F5A8, 0x1F5B1, 0x1F5B2, 0x1F5BC,
            0x1F5C2, 0x1F5C3, 0x1F5C4, 0x1F5D1, 0x1F5D2, 0x1F5D3, 0x1F5DC, 0x1F5DD, 0x1F5DE, 0x1F5E1,
            0x1F5E3, 0x1F5E8, 0x1F5EF, 0x1F5F3, 0x1F5FA, 0x1F610, 0x1F687, 0x1F68D, 0x1F691, 0x1F694,
            0x1F698, 0x1F6AD, 0x1F6B2, 0x1F6B9, 0x1F6BA, 0x1F6BC, 0x1F6CB, 0x1F6CD, 0x1F6CE, 0x1F6CF,
            0x1F6E0, 0x1F6E1, 0x1F6E2, 0x1F6E3, 0x1F6E4, 0x1F6E5, 0x1F6E9, 0x1F6F0, 0x1F6F3,
    };

    private FontPrep() {
    }

    public static void prepare(File src, File dst) throws IOException {
        File tmp = new File(dst.getPath() + ".tmp");
        try (RandomAccessFile in = new RandomAccessFile(src, "r")) {
            long fileLen = in.length();
            int sfnt = in.readInt();
            if (sfnt != 0x00010000 && sfnt != 0x74727565 /* 'true' */) {
                throw new IOException("Unsupported font container: 0x" + Integer.toHexString(sfnt));
            }
            int numTables = in.readUnsignedShort();
            in.skipBytes(6);
            byte[] dir = new byte[numTables * 16];
            in.readFully(dir);

            int cmapRec = -1;
            ByteBuffer d = ByteBuffer.wrap(dir);
            for (int i = 0; i < numTables; i++) {
                if (d.getInt(i * 16) == TAG_CMAP) {
                    cmapRec = i;
                    break;
                }
            }
            if (cmapRec < 0)
                throw new IOException("Font has no cmap table");

            long cmapOff = d.getInt(cmapRec * 16 + 8) & 0xFFFFFFFFL;
            int cmapLen = d.getInt(cmapRec * 16 + 12);
            byte[] cmap = new byte[cmapLen];
            in.seek(cmapOff);
            in.readFully(cmap);

            byte[] newCmap = rewriteCmap(cmap);

            long pad = (4 - (fileLen % 4)) % 4;
            long newOff = fileLen + pad;
            d.putInt(cmapRec * 16 + 4, checksum(newCmap));
            d.putInt(cmapRec * 16 + 8, (int) newOff);
            d.putInt(cmapRec * 16 + 12, newCmap.length);

            try (OutputStream out = new BufferedOutputStream(new FileOutputStream(tmp), 1 << 20)) {
                // Offset table (12 bytes) is unchanged except we re-write it verbatim.
                in.seek(0);
                byte[] head = new byte[12];
                in.readFully(head);
                out.write(head);
                out.write(dir);

                in.seek(12L + dir.length);
                byte[] buf = new byte[1 << 20];
                long remaining = fileLen - (12L + dir.length);
                while (remaining > 0) {
                    int n = in.read(buf, 0, (int) Math.min(buf.length, remaining));
                    if (n < 0)
                        throw new IOException("Unexpected end of font file");
                    out.write(buf, 0, n);
                    remaining -= n;
                }
                for (long i = 0; i < pad; i++)
                    out.write(0);
                out.write(newCmap);
                int tail = (4 - (newCmap.length % 4)) % 4;
                for (int i = 0; i < tail; i++)
                    out.write(0);
            }
        }
        if (dst.exists() && !dst.delete())
            throw new IOException("Cannot replace " + dst);
        if (!tmp.renameTo(dst))
            throw new IOException("Cannot move prepared font into place");
    }

    /**
     * Re-reads the cmap of a prepared font and checks, without involving the text
     * engine, that the
     * stripped characters are gone from the plain character map and present in the
     * variation table.
     */
    public static void verify(File font) throws IOException {
        byte[] cmap;
        try (RandomAccessFile in = new RandomAccessFile(font, "r")) {
            in.skipBytes(4);
            int numTables = in.readUnsignedShort();
            in.skipBytes(6);
            byte[] dir = new byte[numTables * 16];
            in.readFully(dir);
            ByteBuffer d = ByteBuffer.wrap(dir);
            int rec = -1;
            for (int i = 0; i < numTables; i++)
                if (d.getInt(i * 16) == TAG_CMAP) {
                    rec = i;
                    break;
                }
            if (rec < 0)
                throw new IOException("Prepared font has no cmap table");
            long off = d.getInt(rec * 16 + 8) & 0xFFFFFFFFL;
            cmap = new byte[d.getInt(rec * 16 + 12)];
            in.seek(off);
            in.readFully(cmap);
        }
        ByteBuffer b = ByteBuffer.wrap(cmap);
        int n = b.getShort(2) & 0xFFFF;
        int plain = -1, variation = -1;
        for (int i = 0; i < n; i++) {
            int off = b.getInt(8 + 8 * i);
            int fmt = b.getShort(off) & 0xFFFF;
            if (fmt == 12 && plain < 0)
                plain = off;
            if (fmt == 14 && variation < 0)
                variation = off;
        }
        if (plain < 0)
            throw new IOException("Prepared font has no format 12 cmap subtable");
        if (variation < 0)
            throw new IOException("Prepared font has no variation sequence table");

        int groups = b.getInt(plain + 12);
        for (int cp : REMOVE) {
            for (int g = 0; g < groups; g++) {
                int base = plain + 16 + 12 * g;
                if (cp >= b.getInt(base) && cp <= b.getInt(base + 4)) {
                    throw new IOException("Prepared font still maps U+" + Integer.toHexString(cp).toUpperCase());
                }
            }
        }
        if (b.getInt(variation + 6) != 1 || (b.getInt(variation + 10) & 0xFFFFFF00) != 0x00FE0F00)
            throw new IOException("Variation table does not cover U+FE0F");
        int mappings = b.getInt(variation + b.getInt(variation + 17));
        if (mappings < STRIP.length + EMOJI_STYLE_BASES.length / 2) {
            throw new IOException("Variation table has only " + mappings + " entries");
        }
    }

    static byte[] rewriteCmap(byte[] cmap) throws IOException {
        ByteBuffer b = ByteBuffer.wrap(cmap);
        int n = b.getShort(2) & 0xFFFF;

        int best = -1, bestScore = -1;
        for (int i = 0; i < n; i++) {
            int platform = b.getShort(4 + 8 * i) & 0xFFFF;
            int encoding = b.getShort(6 + 8 * i) & 0xFFFF;
            int off = b.getInt(8 + 8 * i);
            if ((b.getShort(off) & 0xFFFF) != 12)
                continue;
            int score = (platform == 3 && encoding == 10) ? 2 : (platform == 0 ? 1 : 0);
            if (score > bestScore) {
                bestScore = score;
                best = off;
            }
        }
        if (best < 0)
            throw new IOException("Font has no format 12 cmap subtable");

        int groups = b.getInt(best + 12);
        int[] start = new int[groups], end = new int[groups], gid = new int[groups];
        for (int i = 0; i < groups; i++) {
            int base = best + 16 + 12 * i;
            start[i] = b.getInt(base);
            end[i] = b.getInt(base + 4);
            gid[i] = b.getInt(base + 8);
        }

        // Emoji glyph for each stripped character, looked up before removal.
        TreeMap<Integer, Integer> variation = new TreeMap<>();
        for (int cp : STRIP) {
            for (int i = 0; i < groups; i++) {
                if (cp >= start[i] && cp <= end[i]) {
                    variation.put(cp, gid[i] + (cp - start[i]));
                    break;
                }
            }
        }
        // Re-preparing an already prepared font: keep the emoji-style mappings it already has.
        for (int i = 0; i < n; i++) {
            int off = b.getInt(8 + 8 * i);
            if ((b.getShort(off) & 0xFFFF) != 14)
                continue;
            int records = b.getInt(off + 6);
            for (int r = 0; r < records; r++) {
                int rec = off + 10 + 11 * r;
                int selector = ((b.get(rec) & 0xFF) << 16) | ((b.get(rec + 1) & 0xFF) << 8) | (b.get(rec + 2) & 0xFF);
                int nonDefault = b.getInt(rec + 7);
                if (selector != VS16 || nonDefault == 0)
                    continue;
                int count = b.getInt(off + nonDefault);
                for (int k = 0; k < count; k++) {
                    int e = off + nonDefault + 4 + 5 * k;
                    int cp = ((b.get(e) & 0xFF) << 16) | ((b.get(e + 1) & 0xFF) << 8) | (b.get(e + 2) & 0xFF);
                    if (!variation.containsKey(cp))
                        variation.put(cp, b.getShort(e + 3) & 0xFFFF);
                }
            }
        }

        List<int[]> out = new ArrayList<>(groups + STRIP.length);
        for (int i = 0; i < groups; i++) {
            int cur = start[i];
            for (int cp : REMOVE) {
                if (cp < start[i] || cp > end[i])
                    continue;
                if (cp > cur)
                    out.add(new int[] { cur, cp - 1, gid[i] + (cur - start[i]) });
                cur = cp + 1;
            }
            if (cur <= end[i])
                out.add(new int[] { cur, end[i], gid[i] + (cur - start[i]) });
        }

        for (int cp : EMOJI_STYLE_BASES) {
            if (variation.containsKey(cp))
                continue;
            for (int[] g : out) {
                if (cp >= g[0] && cp <= g[1]) {
                    variation.put(cp, g[2] + (cp - g[0]));
                    break;
                }
            }
        }


        int len12 = 16 + 12 * out.size();
        int m = variation.size();
        int len14 = 21 + 4 + 5 * m;
        int off12 = 4 + 8 * 3;
        int off14 = off12 + len12;
        int total = off14 + len14;
        int totalPadded = total + ((4 - (total % 4)) % 4);

        ByteBuffer o = ByteBuffer.allocate(totalPadded);
        // cmap header: version 0, 3 encoding records sorted by (platform, encoding).
        o.putShort((short) 0).putShort((short) 3);
        o.putShort((short) 0).putShort((short) 4).putInt(off12); // Unicode full repertoire
        o.putShort((short) 0).putShort((short) 5).putInt(off14); // Unicode variation sequences
        o.putShort((short) 3).putShort((short) 10).putInt(off12); // Windows full repertoire

        // Format 12 subtable.
        o.putShort((short) 12).putShort((short) 0).putInt(len12).putInt(0).putInt(out.size());
        for (int[] g : out)
            o.putInt(g[0]).putInt(g[1]).putInt(g[2]);

        // Format 14 subtable: a single selector (U+FE0F) with explicit (non-default) entries only:
        // the stripped characters and EMOJI_STYLE_BASES, each mapped to its emoji glyph. (A
        // default-UVS table covering every character stopped Android from using the font.)
        o.putShort((short) 14).putInt(len14).putInt(1);
        o.put((byte) 0).put((byte) 0xFE).put((byte) 0x0F); // varSelector (uint24)
        o.putInt(0); // defaultUVSOffset: none
        o.putInt(21); // nonDefaultUVSOffset (from subtable start)
        o.putInt(m);
        for (java.util.Map.Entry<Integer, Integer> e : variation.entrySet()) {
            int cp = e.getKey();
            o.put((byte) (cp >> 16)).put((byte) (cp >> 8)).put((byte) cp);
            o.putShort((short) (int) e.getValue());
        }
        return o.array();
    }

    private static int checksum(byte[] table) {
        int sum = 0;
        int full = table.length & ~3;
        ByteBuffer b = ByteBuffer.wrap(table);
        for (int i = 0; i < full; i += 4)
            sum += b.getInt(i);
        int rest = table.length - full;
        if (rest > 0) {
            int last = 0;
            for (int i = 0; i < 4; i++)
                last = (last << 8) | (i < rest ? (table[full + i] & 0xFF) : 0);
            sum += last;
        }
        return sum;
    }
}