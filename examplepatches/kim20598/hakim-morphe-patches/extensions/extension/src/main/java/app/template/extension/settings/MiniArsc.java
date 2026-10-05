package app.template.extension.settings;

import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.TreeMap;

/**
 * Tiny writer for a runtime resource-overlay table (`resources.arsc`) that overrides a handful of
 * colour resources by id. Used for the custom-hex accent, where the value is only known on the
 * device so a pre-baked overlay is impossible.
 *
 * <p>Only what {@code ResourcesProvider.loadFromTable} needs to override colours by id: one package,
 * one type ({@code color}, id taken from the ids themselves), dense entry table, each entry a
 * {@code TYPE_INT_COLOR_ARGB8} value. Overlay matching is by numeric id, so key/type strings are
 * placeholders.
 */
final class MiniArsc {

    private static final short RES_TABLE_TYPE = 0x0002;
    private static final short RES_STRING_POOL_TYPE = 0x0001;
    private static final short RES_TABLE_PACKAGE_TYPE = 0x0200;
    private static final short RES_TABLE_TYPE_TYPE = 0x0201;
    private static final short RES_TABLE_TYPE_SPEC_TYPE = 0x0202;

    private static final int UTF8_FLAG = 0x00000100;
    private static final byte TYPE_INT_COLOR_ARGB8 = 0x1c;
    private static final int NO_ENTRY = 0xffffffff;

    private MiniArsc() {}

    /**
     * @param packageId  the app package id (0x7f for a normal app)
     * @param idToArgb   resource id -> ARGB int; every id must share the same 0x7f{type} prefix
     */
    static byte[] colorOverlay(String packageName, int packageId, Map<Integer, Integer> idToArgb) {
        if (idToArgb.isEmpty()) throw new IllegalArgumentException("no colours");

        TreeMap<Integer, Integer> byId = new TreeMap<>(idToArgb);
        int typeId = (byId.firstKey() >> 16) & 0xff;
        int maxEntry = -1;
        for (int id : byId.keySet()) {
            if (((id >> 24) & 0xff) != packageId || ((id >> 16) & 0xff) != typeId) {
                throw new IllegalArgumentException("ids span more than one package/type");
            }
            maxEntry = Math.max(maxEntry, id & 0xffff);
        }
        int entryCount = maxEntry + 1;

        byte[] typeStrings = stringPool(typeNames(typeId));
        byte[] keyStrings = stringPool(new String[] { "k" });

        // --- type chunk (RES_TABLE_TYPE_TYPE) ---
        int configSize = 64;
        int typeHeaderSize = 8 + 12 + configSize; // chunk + (id,flags,res,entryCount,entriesStart) + config
        int entriesStart = typeHeaderSize + entryCount * 4;
        int entrySize = 16; // ResTable_entry(8) + Res_value(8)

        // present entry order == ascending id; offset = position * 16
        int[] offsets = new int[entryCount];
        for (int i = 0; i < entryCount; i++) offsets[i] = NO_ENTRY;
        int pos = 0;
        for (int id : byId.keySet()) offsets[id & 0xffff] = pos++ * entrySize;
        int presentCount = byId.size();

        int typeChunkSize = entriesStart + presentCount * entrySize;
        ByteArrayOutputStream type = new ByteArrayOutputStream();
        u16(type, RES_TABLE_TYPE_TYPE);
        u16(type, typeHeaderSize);
        u32(type, typeChunkSize);
        u8(type, typeId);
        u8(type, 0);            // flags: dense, no offset16
        u16(type, 0);           // reserved
        u32(type, entryCount);
        u32(type, entriesStart);
        config(type, configSize);
        for (int off : offsets) u32(type, off);
        for (Map.Entry<Integer, Integer> e : byId.entrySet()) {
            u16(type, 8);                  // ResTable_entry.size
            u16(type, 0);                  // flags
            u32(type, 0);                  // key ref -> keyStrings[0]
            u16(type, 8);                  // Res_value.size
            u8(type, 0);                   // res0
            u8(type, TYPE_INT_COLOR_ARGB8);
            u32(type, e.getValue());       // ARGB
        }

        // --- type spec chunk ---
        int specHeaderSize = 16;
        int specChunkSize = specHeaderSize + entryCount * 4;
        ByteArrayOutputStream spec = new ByteArrayOutputStream();
        u16(spec, RES_TABLE_TYPE_SPEC_TYPE);
        u16(spec, specHeaderSize);
        u32(spec, specChunkSize);
        u8(spec, typeId);
        u8(spec, 0);
        u16(spec, 0);
        u32(spec, entryCount);
        for (int i = 0; i < entryCount; i++) u32(spec, 0);

        // --- package chunk ---
        int pkgHeaderSize = 8 + 4 + 256 + 4 + 4 + 4 + 4 + 4; // = 288
        int typeStringsOff = pkgHeaderSize;
        int keyStringsOff = typeStringsOff + typeStrings.length;
        int pkgBody = keyStrings.length + spec.size() + type.size();
        int pkgChunkSize = pkgHeaderSize + typeStrings.length + pkgBody;

        ByteArrayOutputStream pkg = new ByteArrayOutputStream();
        u16(pkg, RES_TABLE_PACKAGE_TYPE);
        u16(pkg, pkgHeaderSize);
        u32(pkg, pkgChunkSize);
        u32(pkg, packageId);
        char16(pkg, packageName, 128);
        u32(pkg, typeStringsOff);
        u32(pkg, 0);               // lastPublicType
        u32(pkg, keyStringsOff);
        u32(pkg, 0);               // lastPublicKey
        u32(pkg, 0);               // typeIdOffset
        write(pkg, typeStrings);
        write(pkg, keyStrings);
        write(pkg, spec.toByteArray());
        write(pkg, type.toByteArray());

        // --- global (values) string pool: empty ---
        byte[] valuePool = stringPool(new String[0]);

        // --- table header ---
        int tableHeaderSize = 12;
        int tableSize = tableHeaderSize + valuePool.length + pkg.size();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        u16(out, RES_TABLE_TYPE);
        u16(out, tableHeaderSize);
        u32(out, tableSize);
        u32(out, 1);              // packageCount
        write(out, valuePool);
        write(out, pkg.toByteArray());
        return out.toByteArray();
    }

    private static String[] typeNames(int typeId) {
        String[] names = new String[typeId];
        for (int i = 0; i < typeId - 1; i++) names[i] = "t" + (i + 1);
        names[typeId - 1] = "color";
        return names;
    }

    /** UTF-8 ResStringPool. */
    private static byte[] stringPool(String[] strings) {
        int count = strings.length;
        int headerSize = 28;
        int offsetsSize = count * 4;

        ByteArrayOutputStream data = new ByteArrayOutputStream();
        int[] offsets = new int[count];
        for (int i = 0; i < count; i++) {
            offsets[i] = data.size();
            byte[] utf8 = strings[i].getBytes(StandardCharsets.UTF_8);
            // UTF-8 entries: u8 char-len, u8 byte-len, bytes, NUL  (short-form, <128 chars)
            data.write(utf8.length & 0x7f);
            data.write(utf8.length & 0x7f);
            data.write(utf8, 0, utf8.length);
            data.write(0);
        }
        byte[] strBytes = data.toByteArray();
        int pad = (4 - (strBytes.length % 4)) % 4;

        int stringsStart = (count == 0) ? 0 : headerSize + offsetsSize;
        int chunkSize = headerSize + offsetsSize + strBytes.length + pad;
        if (count == 0) chunkSize = headerSize;

        ByteArrayOutputStream pool = new ByteArrayOutputStream();
        u16(pool, RES_STRING_POOL_TYPE);
        u16(pool, headerSize);
        u32(pool, chunkSize);
        u32(pool, count);
        u32(pool, 0);                 // styleCount
        u32(pool, UTF8_FLAG);
        u32(pool, stringsStart);
        u32(pool, 0);                 // stylesStart
        for (int off : offsets) u32(pool, off);
        if (count > 0) {
            write(pool, strBytes);
            for (int i = 0; i < pad; i++) pool.write(0);
        }
        return pool.toByteArray();
    }

    private static void config(ByteArrayOutputStream o, int size) {
        u32(o, size);
        for (int i = 4; i < size; i++) o.write(0);
    }

    private static void char16(ByteArrayOutputStream o, String s, int chars) {
        for (int i = 0; i < chars; i++) {
            char c = i < s.length() ? s.charAt(i) : 0;
            o.write(c & 0xff);
            o.write((c >> 8) & 0xff);
        }
    }

    private static void u8(ByteArrayOutputStream o, int v) {
        o.write(v & 0xff);
    }

    private static void u16(ByteArrayOutputStream o, int v) {
        o.write(v & 0xff);
        o.write((v >> 8) & 0xff);
    }

    private static void u32(ByteArrayOutputStream o, int v) {
        o.write(v & 0xff);
        o.write((v >> 8) & 0xff);
        o.write((v >> 16) & 0xff);
        o.write((v >> 24) & 0xff);
    }

    private static void write(ByteArrayOutputStream o, byte[] b) {
        o.write(b, 0, b.length);
    }
}
