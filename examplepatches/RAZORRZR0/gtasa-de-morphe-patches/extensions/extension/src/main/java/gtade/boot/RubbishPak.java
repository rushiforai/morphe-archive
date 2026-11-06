package gtade.boot;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.zip.CRC32;
import java.util.zip.Inflater;

/**
 * Builds Rubbish-DE's model pak on the device from the game's own data, so the patches ship no game files: reads
 * GTASA_ModelData from pakchunk0 (APK assets/main.obb.png, a stored zip holding the stored pak), points 15 unused model
 * ids at DE's clutter meshes (slots.json, from the PC Rubbish-DE builder by H4V3NART) and writes an uncompressed UE 4.26
 * (V11) pak. Port of mods/rubbish/pak/build_pak.py; its output is byte-identical to that script's (repak) for 1.87.0.
 */
final class RubbishPak {
    private static final String OBB = "assets/main.obb.png";
    private static final String PAK = "Gameface/Content/Paks/pakchunk0-Android_ASTC.pak";
    private static final String GD = "Gameface/Content/SanAndreas/GameData/GTASA_ModelData";
    private static final String MESH = "/Game/SanAndreas/Environment/Clutter/Meshes/%1$s.%1$s";
    private static final int PAK_MAGIC = 0x5A6F12E1, PAK_V11 = 11, FOOTER = 221, ENTRY_HEADER = 53;

    private RubbishPak() {}

    /** The pak bytes, from whichever of the game's APK files (base plus splits) holds main.obb.png. */
    static byte[] build(List<String> apks, String slotsJson) throws Exception {
        for (String apk : apks) {
            try (RandomAccessFile f = new RandomAccessFile(apk, "r")) {
                long[] obb = findStored(f, 0, f.length(), OBB);
                if (obb == null) continue;
                long[] pak = findStored(f, obb[0], obb[1], PAK);
                if (pak == null) throw new IOException(PAK + " not in " + OBB);
                byte[][] edited = patch(readEntry(f, pak[0], pak[1], GD + ".uasset"),
                        readEntry(f, pak[0], pak[1], GD + ".uexp"), new JSONArray(slotsJson));
                TreeMap<String, byte[]> files = new TreeMap<>();
                files.put(GD + ".uasset", edited[0]);
                files.put(GD + ".uexp", edited[1]);
                return writePak(files);
            }
        }
        throw new IOException(OBB + " not found in the game's APK files");
    }

    static void writeFile(File dst, byte[] data) throws IOException {
        File tmp = new File(dst.getPath() + ".tmp");
        try (FileOutputStream out = new FileOutputStream(tmp)) { out.write(data); }
        if (!tmp.renameTo(dst)) throw new IOException("cannot write " + dst);
    }

    // ---------------------------------------------------------------- zip (stored entries only)
    private static ByteBuffer read(RandomAccessFile f, long at, int n) throws IOException {
        byte[] b = new byte[n];
        f.seek(at);
        f.readFully(b);
        return ByteBuffer.wrap(b).order(ByteOrder.LITTLE_ENDIAN);
    }

    /** {data offset, size} of a stored entry of the zip at [start, start + length), or null when absent. */
    private static long[] findStored(RandomAccessFile f, long start, long length, String name) throws IOException {
        int tail = (int) Math.min(length, 22 + 65535);
        ByteBuffer t = read(f, start + length - tail, tail);
        int eocd = -1;
        for (int i = tail - 22; i >= 0; --i) if (t.getInt(i) == 0x06054b50) { eocd = i; break; }
        if (eocd < 0) throw new IOException("no zip directory");
        int count = t.getShort(eocd + 10) & 0xffff;
        long cdSize = t.getInt(eocd + 12) & 0xffffffffL, cdOff = t.getInt(eocd + 16) & 0xffffffffL;
        ByteBuffer cd = read(f, start + cdOff, (int) cdSize);
        byte[] want = name.getBytes(StandardCharsets.UTF_8);
        for (int i = 0, o = 0; i < count; ++i) {
            int method = cd.getShort(o + 10) & 0xffff;
            long size = cd.getInt(o + 24) & 0xffffffffL;
            int nl = cd.getShort(o + 28) & 0xffff, xl = cd.getShort(o + 30) & 0xffff, cl = cd.getShort(o + 32) & 0xffff;
            long local = cd.getInt(o + 42) & 0xffffffffL;
            if (nl == want.length && regionEquals(cd, o + 46, want)) {
                if (method != 0) throw new IOException(name + " is compressed in its zip");
                ByteBuffer h = read(f, start + local, 30);
                return new long[] { start + local + 30 + (h.getShort(26) & 0xffff) + (h.getShort(28) & 0xffff), size };
            }
            o += 46 + nl + xl + cl;
        }
        return null;
    }

    private static boolean regionEquals(ByteBuffer b, int at, byte[] want) {
        for (int i = 0; i < want.length; ++i) if (b.get(at + i) != want[i]) return false;
        return true;
    }

    // ---------------------------------------------------------------- pak V11 reader
    private static String fstring(ByteBuffer b) {
        int n = b.getInt();
        if (n == 0) return "";
        boolean wide = n < 0;
        byte[] s = new byte[wide ? -n * 2 : n];
        b.get(s);
        return new String(s, 0, s.length - (wide ? 2 : 1), wide ? StandardCharsets.UTF_16LE : StandardCharsets.ISO_8859_1);
    }

    private static String trimSlashes(String s) {
        int a = 0, b = s.length();
        while (a < b && s.charAt(a) == '/') ++a;
        while (b > a && s.charAt(b - 1) == '/') --b;
        return s.substring(a, b);
    }

    private static byte[] readEntry(RandomAccessFile f, long base, long size, String path) throws Exception {
        ByteBuffer ft = read(f, base + size - FOOTER, FOOTER);
        if (ft.get(16) != 0 || ft.getInt(17) != PAK_MAGIC || ft.getInt(21) != PAK_V11)
            throw new IOException("pakchunk0 is not an unencrypted V11 pak");
        long indexOff = ft.getLong(25), indexSize = ft.getLong(33);
        String[] methods = new String[5];
        for (int i = 0; i < 5; ++i) {
            int at = 61 + 32 * i, len = 0;
            while (len < 32 && ft.get(at + len) != 0) ++len;
            methods[i] = new String(ft.array(), at, len, StandardCharsets.ISO_8859_1);
        }
        ByteBuffer ix = read(f, base + indexOff, (int) indexSize);
        fstring(ix);  // mount point
        ix.getInt();  // entry count
        ix.getLong(); // path hash seed
        if (ix.getInt() != 0) ix.position(ix.position() + 36);  // path hash index
        if (ix.getInt() == 0) throw new IOException("pakchunk0 has no full directory index");
        long fdiOff = ix.getLong(), fdiSize = ix.getLong();
        ix.position(ix.position() + 20);
        int encSize = ix.getInt();
        ByteBuffer enc = ByteBuffer.wrap(ix.array(), ix.position(), encSize).slice().order(ByteOrder.LITTLE_ENDIAN);

        int slash = path.lastIndexOf('/');
        String dir = path.substring(0, slash), file = path.substring(slash + 1);
        ByteBuffer fdi = read(f, base + fdiOff, (int) fdiSize);
        int at = -1;
        for (int d = fdi.getInt(); d > 0; --d) {
            String dname = fstring(fdi);
            for (int n = fdi.getInt(); n > 0; --n) {
                String fname = fstring(fdi);
                int off = fdi.getInt();
                if (fname.equals(file) && trimSlashes(dname).equals(dir)) at = off;
            }
        }
        if (at < 0) throw new IOException(path + " not in pakchunk0");

        enc.position(at);
        int bits = enc.getInt();
        int comp = (bits >>> 23) & 0x3f, blocks = (bits >>> 6) & 0xffff;
        if ((bits & (1 << 22)) != 0) throw new IOException(path + " is encrypted");
        if ((bits & 0x3f) == 0x3f) enc.getInt();  // block size, not needed to read
        long offset = (bits & (1 << 31)) != 0 ? enc.getInt() & 0xffffffffL : enc.getLong();
        long uncompressed = (bits & (1 << 30)) != 0 ? enc.getInt() & 0xffffffffL : enc.getLong();
        if (comp == 0) return read(f, base + offset + ENTRY_HEADER, (int) uncompressed).array();
        long compressed = (bits & (1 << 29)) != 0 ? enc.getInt() & 0xffffffffL : enc.getLong();
        if (!"Zlib".equals(methods[comp - 1])) throw new IOException(path + " uses " + methods[comp - 1]);
        long[] sizes = new long[blocks];
        if (blocks == 1) sizes[0] = compressed;
        else for (int i = 0; i < blocks; ++i) sizes[i] = enc.getInt() & 0xffffffffL;
        byte[] out = new byte[(int) uncompressed];
        int done = 0;
        long pos = base + offset + ENTRY_HEADER + 4 + 16L * blocks;  // block offsets are relative to the entry
        Inflater inf = new Inflater();
        try {
            for (long bs : sizes) {
                inf.reset();
                inf.setInput(read(f, pos, (int) bs).array());
                while (!inf.finished()) {
                    int n = inf.inflate(out, done, out.length - done);
                    if (n == 0 && (inf.needsInput() || inf.needsDictionary() || done == out.length))
                        throw new IOException("bad zlib block in " + path);
                    done += n;
                }
                pos += bs;
            }
        } finally {
            inf.end();
        }
        if (done != out.length) throw new IOException(path + ": " + done + " of " + out.length + " bytes");
        return out;
    }

    // ---------------------------------------------------------------- GTASA_ModelData edit (build_pak.py patch)
    private static ByteBuffer le(byte[] b) { return ByteBuffer.wrap(b).order(ByteOrder.LITTLE_ENDIAN); }

    private static List<String> names(byte[] ua) {
        List<String> out = new ArrayList<>();
        int o = le(ua).getInt(0x2d);
        for (int i = le(ua).getInt(0x29); i > 0; --i) {
            int n = le(ua).getInt(o);
            out.add(new String(ua, o + 4, n - 1, StandardCharsets.ISO_8859_1));
            o += 4 + n + 4;
        }
        if (o != le(ua).getInt(0x45)) throw new IllegalStateException("name map does not end at the import table");
        return out;
    }

    private static int indexOf(byte[] hay, byte[] needle, int from) {
        outer:
        for (int i = Math.max(from, 0); i <= hay.length - needle.length; ++i) {
            for (int j = 0; j < needle.length; ++j) if (hay[i + j] != needle[j]) continue outer;
            return i;
        }
        return -1;
    }

    private static byte[][] patch(byte[] ua, byte[] ue, JSONArray slots) throws Exception {
        ue = ue.clone();
        ByteBuffer e = le(ue);
        List<String> nm = names(ua), low = new ArrayList<>(), add = new ArrayList<>();
        for (String n : nm) low.add(n.toLowerCase(Locale.ROOT));
        byte[] ueLow = new String(ue, StandardCharsets.ISO_8859_1).toLowerCase(Locale.ROOT).getBytes(StandardCharsets.ISO_8859_1);
        for (int s = 0; s < slots.length(); ++s) {
            JSONObject slot = slots.getJSONObject(s);
            byte[] want = (slot.getString("ide").toLowerCase(Locale.ROOT) + "\0").getBytes(StandardCharsets.ISO_8859_1);
            int hit = -1, hits = 0;
            for (int i = indexOf(ueLow, want, 0); i >= 0; i = indexOf(ueLow, want, i + 1)) {
                if (i >= 5 && i + want.length + 4 <= ue.length && e.getInt(i - 4) == want.length && ue[i - 5] == 5
                        && e.getInt(i + want.length) == slot.getInt("id")) {
                    hit = i + want.length + 4;
                    ++hits;
                }
            }
            if (hits != 1) throw new IllegalStateException(slot.getString("ide") + ": " + hits + " matches");
            int idx = e.getInt(hit), num = e.getInt(hit + 4);
            String was = nm.get(idx) + (num != 0 ? "_" + (num - 1) : "");
            if (!was.equalsIgnoreCase(slot.getString("vanilla"))) throw new IllegalStateException(slot.getString("ide") + " is " + was);
            String mesh = String.format(Locale.ROOT, MESH, slot.getString("mesh"));
            int k = low.indexOf(mesh.toLowerCase(Locale.ROOT));
            if (k < 0) {  // as build_pak.py: a new name per slot (the 15 meshes differ)
                k = nm.size() + add.size();
                add.add(mesh);
            }
            e.putInt(hit, k).putInt(hit + 4, 0);
        }
        ByteArrayOutputStream blob = new ByteArrayOutputStream();
        for (String n : add) {
            byte[] s = n.getBytes(StandardCharsets.ISO_8859_1);
            blob.write(le32(s.length + 1));
            blob.write(s);
            blob.write(0);
            blob.write(nameHashes(n));
        }
        byte[] h = ua.clone();
        ByteBuffer hb = le(h);
        int d = blob.size(), end = hb.getInt(0x45), exp = hb.getInt(0x3d);
        for (int o : new int[] { 0x18, 0x3d, 0x45, 0x49, 0xa5, 0xbd }) hb.putInt(o, hb.getInt(o) + d);
        for (int o : new int[] { 0x29, 0x75 }) hb.putInt(o, hb.getInt(o) + add.size());
        hb.putLong(0xa9, hb.getLong(0xa9) + d);
        hb.putLong(exp + 36, hb.getLong(exp + 36) + d);  // export 0 SerialOffset
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        out.write(h, 0, end);
        out.write(blob.toByteArray());
        out.write(h, end, h.length - end);
        return new byte[][] { out.toByteArray(), ue };
    }

    // FCrc::Strihash_DEPRECATED and FCrc::StrCrc32, low 16 bits each, as UE 4.26 serialises names.
    private static final int[] CRC_TABLE = new int[256];
    static {
        for (int i = 0; i < 256; ++i) {
            int c = i << 24;
            for (int k = 0; k < 8; ++k) c = (c & 0x80000000) != 0 ? (c << 1) ^ 0x04C11DB7 : c << 1;
            CRC_TABLE[i] = c;
        }
    }

    private static byte[] nameHashes(String s) {
        int h = 0;
        for (byte ch : s.toUpperCase(Locale.ROOT).getBytes(StandardCharsets.ISO_8859_1))
            h = ((h >>> 8) & 0xFFFFFF) ^ CRC_TABLE[(h ^ ch) & 0xFF];
        CRC32 crc = new CRC32();
        for (byte c : s.getBytes(StandardCharsets.ISO_8859_1)) crc.update(new byte[] { c, 0, 0, 0 });
        long c2 = crc.getValue();
        return new byte[] { (byte) h, (byte) (h >>> 8), (byte) c2, (byte) (c2 >>> 8) };
    }

    // ---------------------------------------------------------------- pak V11 writer (as repak pack, no compression)
    private static byte[] le32(int v) { return ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(v).array(); }

    private static ByteBuffer buf(int n) { return ByteBuffer.allocate(n).order(ByteOrder.LITTLE_ENDIAN); }

    private static void fstring(ByteArrayOutputStream o, String s) throws IOException {
        byte[] b = s.getBytes(StandardCharsets.ISO_8859_1);
        o.write(le32(b.length + 1));
        o.write(b);
        o.write(0);
    }

    private static byte[] sha1(byte[] b) throws Exception { return MessageDigest.getInstance("SHA-1").digest(b); }

    private static long fnv64Path(String path) {
        long h = 0xcbf29ce484222325L;  // path hash seed 0
        for (byte b : path.toLowerCase(Locale.ROOT).getBytes(StandardCharsets.UTF_16LE)) {
            h ^= b & 0xff;
            h *= 0x100000001b3L;
        }
        return h;
    }

    /** {parent with its trailing '/', child}, or null for the root (repak split_path_child). */
    private static String[] splitChild(String path) {
        if (path.equals("/") || path.isEmpty()) return null;
        String p = path.endsWith("/") ? path.substring(0, path.length() - 1) : path;
        int i = p.lastIndexOf('/');
        return i >= 0 ? new String[] { p.substring(0, i + 1), p.substring(i + 1) } : new String[] { "/", p };
    }

    private static byte[] writePak(TreeMap<String, byte[]> files) throws Exception {
        final String mount = "../../../";
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        List<String> paths = new ArrayList<>(files.keySet());
        List<int[]> entries = new ArrayList<>();  // offset, size
        for (String p : paths) {
            byte[] data = files.get(p);
            int off = out.size();
            out.write(buf(28).putLong(0).putLong(data.length).putLong(data.length).putInt(0).array());
            out.write(sha1(data));
            out.write(0);         // flags
            out.write(le32(0));   // compression block size
            out.write(data);
            entries.add(new int[] { off, data.length });
        }
        int indexOff = out.size();
        ByteArrayOutputStream enc = new ByteArrayOutputStream();
        int[] encOff = new int[paths.size()];
        for (int i = 0; i < paths.size(); ++i) {
            encOff[i] = enc.size();
            enc.write(buf(12).putInt((1 << 29) | (1 << 30) | (1 << 31)).putInt(entries.get(i)[0]).putInt(entries.get(i)[1]).array());
        }
        ByteArrayOutputStream phi = new ByteArrayOutputStream();
        phi.write(le32(paths.size()));
        for (int i = 0; i < paths.size(); ++i) phi.write(buf(12).putLong(fnv64Path(paths.get(i))).putInt(encOff[i]).array());
        phi.write(le32(0));
        TreeMap<String, TreeMap<String, Integer>> dirs = new TreeMap<>();
        for (int i = 0; i < paths.size(); ++i) {
            String[] pc;
            for (String q = paths.get(i); (pc = splitChild(q)) != null; q = pc[0])
                if (!dirs.containsKey(pc[0])) dirs.put(pc[0], new TreeMap<>());
            pc = splitChild(paths.get(i));
            dirs.get(pc[0]).put(pc[1], encOff[i]);
        }
        ByteArrayOutputStream fdi = new ByteArrayOutputStream();
        fdi.write(le32(dirs.size()));
        for (Map.Entry<String, TreeMap<String, Integer>> d : dirs.entrySet()) {
            fstring(fdi, d.getKey());
            fdi.write(le32(d.getValue().size()));
            for (Map.Entry<String, Integer> fe : d.getValue().entrySet()) {
                fstring(fdi, fe.getKey());
                fdi.write(le32(fe.getValue()));
            }
        }
        byte[] encB = enc.toByteArray(), phiB = phi.toByteArray(), fdiB = fdi.toByteArray();
        long before = 4 + mount.length() + 1 + 8 + 4 + 4 + 36 + 4 + 36 + 4 + encB.length + 4;
        long phiOff = indexOff + before, fdiOff = phiOff + phiB.length;
        ByteArrayOutputStream ix = new ByteArrayOutputStream();
        fstring(ix, mount);
        ix.write(buf(12).putInt(paths.size()).putLong(0).array());
        ix.write(buf(20).putInt(1).putLong(phiOff).putLong(phiB.length).array());
        ix.write(sha1(phiB));
        ix.write(buf(20).putInt(1).putLong(fdiOff).putLong(fdiB.length).array());
        ix.write(sha1(fdiB));
        ix.write(le32(encB.length));
        ix.write(encB);
        ix.write(le32(0));
        byte[] ixB = ix.toByteArray();
        out.write(ixB);
        out.write(phiB);
        out.write(fdiB);
        out.write(new byte[17]);  // encryption key guid, index not encrypted
        out.write(buf(24).putInt(PAK_MAGIC).putInt(PAK_V11).putLong(indexOff).putLong(ixB.length).array());
        out.write(sha1(ixB));
        out.write(new byte[160]);  // compression method names: none
        return out.toByteArray();
    }
}
