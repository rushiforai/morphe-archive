package app.spicetify.extension.spotify.theme;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/** Writes a minimal compiled resource table (resources.arsc) holding ARGB colour values for existing resource IDs. */
final class ColorTable {
    private static final int RES_STRING_POOL_TYPE = 0x0001;
    private static final int RES_TABLE_TYPE = 0x0002;
    private static final int RES_TABLE_PACKAGE_TYPE = 0x0200;
    private static final int RES_TABLE_TYPE_TYPE = 0x0201;
    private static final int RES_TABLE_TYPE_SPEC_TYPE = 0x0202;
    private static final int UTF8_FLAG = 0x100;
    private static final int TYPE_INT_COLOR_ARGB8 = 0x1c;
    private static final int NO_ENTRY = 0xFFFFFFFF;
    private static final int CONFIG_SIZE = 64;

    private ColorTable() {}

    /**
     * @param packageName the target package, whose ID must be 0x7f
     * @param typeNames names of types 1..n in the target package; the colour type's name must sit at its ID - 1
     * @param colors resource ID to ARGB value; every ID must share one package and type
     */
    static byte[] build(String packageName, List<String> typeNames, Map<Integer, Integer> colors) {
        if (colors.isEmpty()) throw new IllegalArgumentException("No colours to write.");
        TreeMap<Integer, Integer> sorted = new TreeMap<>(colors);
        int first = sorted.firstKey();
        int packageId = first >>> 24;
        int typeId = (first >>> 16) & 0xFF;
        for (int id : sorted.keySet()) {
            if (id >>> 24 != packageId || ((id >>> 16) & 0xFF) != typeId) {
                throw new IllegalArgumentException("Colours must share one package and type.");
            }
        }
        if (packageId != 0x7f || typeId < 1 || typeId > typeNames.size()) {
            throw new IllegalArgumentException("Unsupported resource ID " + Integer.toHexString(first));
        }
        int entryCount = (sorted.lastKey() & 0xFFFF) + 1;
        String[] keys = new String[sorted.size()];
        for (int i = 0; i < keys.length; i++) keys[i] = "c" + i;

        byte[] typeStrings = stringPool(typeNames.toArray(new String[0]));
        byte[] keyStrings = stringPool(keys);
        byte[] spec = typeSpec(typeId, entryCount);
        byte[] type = type(typeId, entryCount, sorted);
        int packageHeader = 288;
        int packageSize = packageHeader + typeStrings.length + keyStrings.length + spec.length + type.length;
        ByteBuffer pkg = buffer(packageSize);
        pkg.putShort((short) RES_TABLE_PACKAGE_TYPE).putShort((short) packageHeader).putInt(packageSize);
        pkg.putInt(packageId);
        char[] name = new char[128];
        packageName.getChars(0, Math.min(packageName.length(), 127), name, 0);
        for (char c : name) pkg.putChar(c);
        pkg.putInt(packageHeader);
        pkg.putInt(typeNames.size());
        pkg.putInt(packageHeader + typeStrings.length);
        pkg.putInt(keys.length);
        pkg.putInt(0);
        pkg.put(typeStrings).put(keyStrings).put(spec).put(type);

        byte[] values = stringPool(new String[0]);
        int tableSize = 12 + values.length + packageSize;
        ByteBuffer table = buffer(tableSize);
        table.putShort((short) RES_TABLE_TYPE).putShort((short) 12).putInt(tableSize).putInt(1);
        table.put(values).put(pkg.array());
        return table.array();
    }

    private static byte[] typeSpec(int typeId, int entryCount) {
        int size = 16 + 4 * entryCount;
        ByteBuffer spec = buffer(size);
        spec.putShort((short) RES_TABLE_TYPE_SPEC_TYPE).putShort((short) 16).putInt(size);
        spec.put((byte) typeId).put((byte) 0).putShort((short) 0).putInt(entryCount);
        for (int i = 0; i < entryCount; i++) spec.putInt(0);
        return spec.array();
    }

    private static byte[] type(int typeId, int entryCount, TreeMap<Integer, Integer> colors) {
        int header = 20 + CONFIG_SIZE;
        int entriesStart = header + 4 * entryCount;
        int size = entriesStart + 16 * colors.size();
        ByteBuffer type = buffer(size);
        type.putShort((short) RES_TABLE_TYPE_TYPE).putShort((short) header).putInt(size);
        type.put((byte) typeId).put((byte) 0).putShort((short) 0).putInt(entryCount).putInt(entriesStart);
        type.putInt(CONFIG_SIZE);
        for (int i = 4; i < CONFIG_SIZE; i++) type.put((byte) 0);
        int[] offsets = new int[entryCount];
        java.util.Arrays.fill(offsets, NO_ENTRY);
        int index = 0;
        for (int id : colors.keySet()) offsets[id & 0xFFFF] = 16 * index++;
        for (int offset : offsets) type.putInt(offset);
        int key = 0;
        for (int value : colors.values()) {
            type.putShort((short) 8).putShort((short) 0).putInt(key++);
            type.putShort((short) 8).put((byte) 0).put((byte) TYPE_INT_COLOR_ARGB8).putInt(value);
        }
        return type.array();
    }

    private static byte[] stringPool(String[] strings) {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        int[] offsets = new int[strings.length];
        for (int i = 0; i < strings.length; i++) {
            offsets[i] = data.size();
            byte[] utf8 = strings[i].getBytes(StandardCharsets.UTF_8);
            if (strings[i].length() > 0x7F || utf8.length > 0x7F) throw new IllegalArgumentException("String too long.");
            data.write(strings[i].length());
            data.write(utf8.length);
            data.write(utf8, 0, utf8.length);
            data.write(0);
        }
        while (data.size() % 4 != 0) data.write(0);
        int header = 28;
        int stringsStart = strings.length == 0 ? 0 : header + 4 * strings.length;
        int size = header + 4 * strings.length + data.size();
        ByteBuffer pool = buffer(size);
        pool.putShort((short) RES_STRING_POOL_TYPE).putShort((short) header).putInt(size);
        pool.putInt(strings.length).putInt(0).putInt(UTF8_FLAG).putInt(stringsStart).putInt(0);
        for (int offset : offsets) pool.putInt(offset);
        pool.put(data.toByteArray());
        return pool.array();
    }

    private static ByteBuffer buffer(int size) {
        return ByteBuffer.allocate(size).order(ByteOrder.LITTLE_ENDIAN);
    }
}
