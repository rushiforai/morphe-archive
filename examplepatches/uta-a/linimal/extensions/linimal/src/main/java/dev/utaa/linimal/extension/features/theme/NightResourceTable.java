package dev.utaa.linimal.extension.features.theme;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 * 夜間設定（{@code -night}）の値だけを持つ最小の resources.arsc を組み立てます。
 *
 * <p>{@code ResourcesLoader} に渡すと、LINE 本体と同じ resource ID の夜間の値だけを上書きします。
 * 値は色か、{@code AssetsProvider} が返すファイルのパスです。昼間の設定には entry を持たないため、
 * 端末がライトモードのときは LINE の元の値が使われます。Android の AssetManager2 は、設定の一致度が
 * 同じ場合に loader の値を優先します。</p>
 *
 * <p>Android に依存しない純粋な encoder にし、local JVM test で構造を検証します。</p>
 */
public final class NightResourceTable {
    private static final short RES_STRING_POOL_TYPE = 0x0001;
    private static final short RES_TABLE_TYPE = 0x0002;
    private static final short RES_TABLE_PACKAGE_TYPE = 0x0200;
    private static final short RES_TABLE_TYPE_TYPE = 0x0201;
    private static final short RES_TABLE_TYPE_SPEC_TYPE = 0x0202;

    private static final int STRING_POOL_HEADER_SIZE = 28;
    private static final int UTF8_FLAG = 1 << 8;
    private static final int TABLE_HEADER_SIZE = 12;
    private static final int PACKAGE_HEADER_SIZE = 288;
    private static final int PACKAGE_NAME_CHARS = 128;
    private static final int TYPE_SPEC_HEADER_SIZE = 16;
    static final int CONFIG_SIZE = 64;
    private static final int TYPE_HEADER_SIZE = 20 + CONFIG_SIZE;
    /** ResTable_config 内の density と uiMode の位置。 */
    static final int CONFIG_DENSITY_OFFSET = 14;
    static final int CONFIG_UI_MODE_OFFSET = 29;
    static final int UI_MODE_NIGHT_YES = 0x20;
    /** ResTable_typeSpec の flag。uiMode と density によって値が変わる entry であることを示します。 */
    static final int SPEC_CONFIG_UI_MODE = 0x1000;
    static final int SPEC_CONFIG_DENSITY = 0x0100;
    static final int NO_ENTRY = 0xFFFFFFFF;
    private static final int ENTRY_SIZE = 8;
    private static final int VALUE_SIZE = 8;
    static final int TYPE_STRING = 0x03;
    static final int TYPE_INT_COLOR_ARGB8 = 0x1c;

    private NightResourceTable() {
    }

    /** entry 名と値。値は色か、global string pool に入れるファイルのパスです。 */
    public static final class Entry {
        final String name;
        final int argb;
        final String path;

        private Entry(String name, int argb, String path) {
            if (name == null || name.isEmpty()) {
                throw new IllegalArgumentException("name");
            }
            this.name = name;
            this.argb = argb;
            this.path = path;
        }

        public static Entry color(String name, int argb) {
            return new Entry(name, argb, null);
        }

        public static Entry file(String name, String path) {
            if (path == null || path.isEmpty()) {
                throw new IllegalArgumentException("path");
            }
            return new Entry(name, 0, path);
        }
    }

    /** 同じ type・同じ density の entry の集まり。1 つの ResTable_type chunk になります。 */
    public static final class Chunk {
        final int typeId;
        final int density;
        final SortedMap<Integer, Entry> entries = new TreeMap<>();

        /** @param density ResTable_config の density。0 は density を問わない設定です。 */
        public Chunk(int typeId, int density) {
            if (typeId < 1 || typeId > 0xff || density < 0 || density > 0xffff) {
                throw new IllegalArgumentException("chunk");
            }
            this.typeId = typeId;
            this.density = density;
        }

        /** @param index resource ID の下位 16 bit */
        public Chunk put(int index, Entry entry) {
            if (index < 0 || index > 0xffff || entry == null) {
                throw new IllegalArgumentException("entry");
            }
            entries.put(index, entry);
            return this;
        }
    }

    /**
     * @param packageName 上書きする package の名前
     * @param packageId   上書きする package の ID（アプリなら 0x7f）
     * @param typeNames   type ID 1 から順の type 名。上書きする type の ID まで並べます
     * @param chunks      type と density ごとの entry
     */
    public static byte[] encode(String packageName, int packageId, List<String> typeNames, List<Chunk> chunks) {
        if (packageName == null || packageName.length() >= PACKAGE_NAME_CHARS) {
            throw new IllegalArgumentException("packageName");
        }
        if (packageId < 1 || packageId > 0xff) {
            throw new IllegalArgumentException("packageId");
        }
        if (typeNames == null || typeNames.isEmpty() || typeNames.size() > 0xff) {
            throw new IllegalArgumentException("typeNames");
        }
        if (chunks == null || chunks.isEmpty()) {
            throw new IllegalArgumentException("chunks");
        }
        // type ごとにまとめ、typeSpec の後にその type の chunk を並べます。
        SortedMap<Integer, List<Chunk>> byType = new TreeMap<>();
        for (Chunk chunk : chunks) {
            if (chunk == null || chunk.entries.isEmpty() || chunk.typeId > typeNames.size()) {
                throw new IllegalArgumentException("chunks");
            }
            List<Chunk> list = byType.get(chunk.typeId);
            if (list == null) {
                list = new ArrayList<>();
                byType.put(chunk.typeId, list);
            }
            for (Chunk other : list) {
                if (other.density == chunk.density) {
                    throw new IllegalArgumentException("duplicate chunk");
                }
            }
            list.add(chunk);
        }

        List<String> keys = new ArrayList<>();
        List<String> paths = new ArrayList<>();
        ByteArrayOutputStream types = new ByteArrayOutputStream();
        for (Map.Entry<Integer, List<Chunk>> type : byType.entrySet()) {
            int entryCount = 0;
            for (Chunk chunk : type.getValue()) {
                entryCount = Math.max(entryCount, chunk.entries.lastKey() + 1);
            }
            write(types, typeSpec(type.getKey(), entryCount, type.getValue()));
            for (Chunk chunk : type.getValue()) {
                write(types, type(chunk, entryCount, keys, paths));
            }
        }

        byte[] typeStrings = stringPool(typeNames);
        byte[] keyStrings = stringPool(keys);
        byte[] typeChunks = types.toByteArray();

        int packageSize = PACKAGE_HEADER_SIZE + typeStrings.length + keyStrings.length + typeChunks.length;
        ByteBuffer pkg = buffer(packageSize);
        pkg.putShort(RES_TABLE_PACKAGE_TYPE).putShort((short) PACKAGE_HEADER_SIZE).putInt(packageSize);
        pkg.putInt(packageId);
        for (int index = 0; index < PACKAGE_NAME_CHARS; index++) {
            pkg.putChar(index < packageName.length() ? packageName.charAt(index) : '\0');
        }
        pkg.putInt(PACKAGE_HEADER_SIZE);
        pkg.putInt(typeNames.size());
        pkg.putInt(PACKAGE_HEADER_SIZE + typeStrings.length);
        pkg.putInt(keys.size());
        pkg.putInt(0);
        pkg.put(typeStrings).put(keyStrings).put(typeChunks);

        byte[] globalStrings = stringPool(paths);
        int tableSize = TABLE_HEADER_SIZE + globalStrings.length + packageSize;
        ByteBuffer table = buffer(tableSize);
        table.putShort(RES_TABLE_TYPE).putShort((short) TABLE_HEADER_SIZE).putInt(tableSize);
        table.putInt(1);
        table.put(globalStrings).put(pkg.array());
        return table.array();
    }

    private static byte[] typeSpec(int typeId, int entryCount, List<Chunk> chunks) {
        int size = TYPE_SPEC_HEADER_SIZE + 4 * entryCount;
        ByteBuffer spec = buffer(size);
        spec.putShort(RES_TABLE_TYPE_SPEC_TYPE).putShort((short) TYPE_SPEC_HEADER_SIZE).putInt(size);
        spec.put((byte) typeId).put((byte) 0).putShort((short) chunks.size());
        spec.putInt(entryCount);
        for (int index = 0; index < entryCount; index++) {
            int flags = 0;
            for (Chunk chunk : chunks) {
                if (chunk.entries.containsKey(index)) {
                    flags |= SPEC_CONFIG_UI_MODE | (chunk.density != 0 ? SPEC_CONFIG_DENSITY : 0);
                }
            }
            spec.putInt(flags);
        }
        return spec.array();
    }

    private static byte[] type(Chunk chunk, int entryCount, List<String> keys, List<String> paths) {
        int entriesStart = TYPE_HEADER_SIZE + 4 * entryCount;
        int size = entriesStart + chunk.entries.size() * (ENTRY_SIZE + VALUE_SIZE);
        ByteBuffer type = buffer(size);
        type.putShort(RES_TABLE_TYPE_TYPE).putShort((short) TYPE_HEADER_SIZE).putInt(size);
        type.put((byte) chunk.typeId).put((byte) 0).putShort((short) 0);
        type.putInt(entryCount);
        type.putInt(entriesStart);
        byte[] config = new byte[CONFIG_SIZE];
        ByteBuffer configBuffer = ByteBuffer.wrap(config).order(ByteOrder.LITTLE_ENDIAN);
        configBuffer.putInt(0, CONFIG_SIZE);
        configBuffer.putShort(CONFIG_DENSITY_OFFSET, (short) chunk.density);
        config[CONFIG_UI_MODE_OFFSET] = (byte) UI_MODE_NIGHT_YES;
        type.put(config);

        int offset = 0;
        for (int index = 0; index < entryCount; index++) {
            if (chunk.entries.containsKey(index)) {
                type.putInt(offset);
                offset += ENTRY_SIZE + VALUE_SIZE;
            } else {
                type.putInt(NO_ENTRY);
            }
        }
        for (Entry entry : chunk.entries.values()) {
            type.putShort((short) ENTRY_SIZE).putShort((short) 0).putInt(keys.size());
            keys.add(entry.name);
            if (entry.path == null) {
                type.putShort((short) VALUE_SIZE).put((byte) 0).put((byte) TYPE_INT_COLOR_ARGB8);
                type.putInt(entry.argb);
            } else {
                type.putShort((short) VALUE_SIZE).put((byte) 0).put((byte) TYPE_STRING);
                type.putInt(paths.size());
                paths.add(entry.path);
            }
        }
        return type.array();
    }

    /** UTF-8 の string pool。各文字列は文字数・byte 数・本体・終端 0 の順に並びます。 */
    static byte[] stringPool(List<String> strings) {
        ByteArrayOutputStream data = new ByteArrayOutputStream();
        int[] offsets = new int[strings.size()];
        for (int index = 0; index < strings.size(); index++) {
            offsets[index] = data.size();
            String value = strings.get(index);
            byte[] bytes = value.getBytes(StandardCharsets.UTF_8);
            writeLength(data, value.length());
            writeLength(data, bytes.length);
            data.write(bytes, 0, bytes.length);
            data.write(0);
        }
        while (data.size() % 4 != 0) {
            data.write(0);
        }
        int stringsStart = STRING_POOL_HEADER_SIZE + 4 * strings.size();
        int size = stringsStart + data.size();
        ByteBuffer pool = buffer(size);
        pool.putShort(RES_STRING_POOL_TYPE).putShort((short) STRING_POOL_HEADER_SIZE).putInt(size);
        pool.putInt(strings.size());
        pool.putInt(0);
        pool.putInt(UTF8_FLAG);
        pool.putInt(strings.isEmpty() ? 0 : stringsStart);
        pool.putInt(0);
        for (int offset : offsets) {
            pool.putInt(offset);
        }
        pool.put(data.toByteArray());
        return pool.array();
    }

    private static void writeLength(ByteArrayOutputStream out, int length) {
        if (length > 0x7fff) {
            throw new IllegalArgumentException("string too long");
        }
        if (length > 0x7f) {
            out.write(((length >> 8) & 0x7f) | 0x80);
        }
        out.write(length & 0xff);
    }

    private static void write(ByteArrayOutputStream out, byte[] bytes) {
        out.write(bytes, 0, bytes.length);
    }

    private static ByteBuffer buffer(int size) {
        return ByteBuffer.allocate(size).order(ByteOrder.LITTLE_ENDIAN);
    }
}
