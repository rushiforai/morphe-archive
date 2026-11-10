package dev.utaa.linimal.extension.features.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;

import org.junit.Test;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class NightResourceTableTest {
    private static final List<String> TYPES = Arrays.asList(
            "anim", "animator", "array", "attr", "bool", "color", "dimen", "drawable");
    private static final String PATH = "res/drawable-night/linimal_amoled_navi_bottom_bg_dark.png";

    private static NightResourceTable.Chunk colors() {
        return new NightResourceTable.Chunk(6, 0)
                .put(0x200, NightResourceTable.Entry.color("primaryBackground", 0xFF000000))
                .put(0x1e, NightResourceTable.Entry.color("chatBackground", 0xFF000000));
    }

    private static NightResourceTable.Chunk drawables() {
        return new NightResourceTable.Chunk(8, 480)
                .put(0x1217, NightResourceTable.Entry.file("navi_bottom_bg_dark", PATH));
    }

    @Test
    public void encodesOnePackageWithNightOnlyColorsAndFiles() {
        ByteBuffer table = wrap(NightResourceTable.encode(
                "jp.naver.line.android", 0x7f, TYPES, Arrays.asList(drawables(), colors())));

        // ResTable_header
        assertEquals(0x0002, table.getShort(0));
        assertEquals(12, table.getShort(2));
        assertEquals(table.capacity(), table.getInt(4));
        assertEquals(1, table.getInt(8));

        // global string pool はファイルのパスだけを持ちます。
        int pool = 12;
        assertEquals(0x0001, table.getShort(pool));
        assertEquals(1, table.getInt(pool + 8));
        assertEquals(PATH, utf8At(table, pool, 0));

        // ResTable_package
        int pkg = pool + table.getInt(pool + 4);
        assertEquals(0x0200, table.getShort(pkg));
        assertEquals(288, table.getShort(pkg + 2));
        assertEquals(table.capacity() - pkg, table.getInt(pkg + 4));
        assertEquals(0x7f, table.getInt(pkg + 8));
        assertEquals("jp.naver.line.android", utf16(table, pkg + 12, 128));
        int typeStrings = pkg + table.getInt(pkg + 12 + 256);
        assertEquals(TYPES.size(), table.getInt(pkg + 12 + 260));
        assertEquals(TYPES.size(), table.getInt(typeStrings + 8));

        // key は type ID 順に通し番号になります。
        int keyStrings = pkg + table.getInt(pkg + 12 + 264);
        assertEquals(3, table.getInt(keyStrings + 8));
        assertEquals("chatBackground", utf8At(table, keyStrings, 0));
        assertEquals("primaryBackground", utf8At(table, keyStrings, 1));
        assertEquals("navi_bottom_bg_dark", utf8At(table, keyStrings, 2));

        // color の typeSpec と type（density を問わない夜間設定）
        int colorSpec = keyStrings + table.getInt(keyStrings + 4);
        assertEquals(0x0202, table.getShort(colorSpec));
        assertEquals(6, table.get(colorSpec + 8));
        assertEquals(1, table.getShort(colorSpec + 10));
        assertEquals(0x201, table.getInt(colorSpec + 12));
        assertEquals(NightResourceTable.SPEC_CONFIG_UI_MODE, table.getInt(colorSpec + 16 + 4 * 0x1e));
        assertEquals(0, table.getInt(colorSpec + 16 + 4 * 0x1f));
        int colorType = colorSpec + table.getInt(colorSpec + 4);
        assertType(table, colorType, 6, 0x201, 0);
        int colorOffsets = colorType + 20 + NightResourceTable.CONFIG_SIZE;
        int colorEntries = colorType + table.getInt(colorType + 16);
        assertEquals(colorOffsets + 4 * 0x201, colorEntries);
        assertEquals(NightResourceTable.NO_ENTRY, table.getInt(colorOffsets));
        assertEntry(table, colorEntries + table.getInt(colorOffsets + 4 * 0x1e), 0,
                NightResourceTable.TYPE_INT_COLOR_ARGB8, 0xFF000000);
        assertEntry(table, colorEntries + table.getInt(colorOffsets + 4 * 0x200), 1,
                NightResourceTable.TYPE_INT_COLOR_ARGB8, 0xFF000000);

        // drawable の typeSpec と type（夜間かつ元の画像と同じ density）
        int drawableSpec = colorType + table.getInt(colorType + 4);
        assertEquals(0x0202, table.getShort(drawableSpec));
        assertEquals(8, table.get(drawableSpec + 8));
        assertEquals(NightResourceTable.SPEC_CONFIG_UI_MODE | NightResourceTable.SPEC_CONFIG_DENSITY,
                table.getInt(drawableSpec + 16 + 4 * 0x1217));
        int drawableType = drawableSpec + table.getInt(drawableSpec + 4);
        assertType(table, drawableType, 8, 0x1218, 480);
        assertEquals(table.capacity(), drawableType + table.getInt(drawableType + 4));
        int drawableOffsets = drawableType + 20 + NightResourceTable.CONFIG_SIZE;
        int drawableEntries = drawableType + table.getInt(drawableType + 16);
        assertEntry(table, drawableEntries + table.getInt(drawableOffsets + 4 * 0x1217), 2,
                NightResourceTable.TYPE_STRING, 0);
    }

    /** 同じ type の density 違いは 1 つの typeSpec の後に並び、entry 数は大きいほうにそろえます。 */
    @Test
    public void encodesDensityVariantsUnderOneTypeSpec() {
        NightResourceTable.Chunk xhdpi = new NightResourceTable.Chunk(8, 320)
                .put(0x10, NightResourceTable.Entry.file("a", "res/a.png"));
        ByteBuffer table = wrap(NightResourceTable.encode(
                "p", 0x7f, TYPES, Arrays.asList(drawables(), xhdpi)));
        int pool = 12;
        assertEquals(2, table.getInt(pool + 8));
        int pkg = pool + table.getInt(pool + 4);
        int keyStrings = pkg + table.getInt(pkg + 12 + 264);
        int spec = keyStrings + table.getInt(keyStrings + 4);
        assertEquals(2, table.getShort(spec + 10));
        assertEquals(0x1218, table.getInt(spec + 12));
        int first = spec + table.getInt(spec + 4);
        assertType(table, first, 8, 0x1218, 480);
        int second = first + table.getInt(first + 4);
        assertType(table, second, 8, 0x1218, 320);
        assertEquals(table.capacity(), second + table.getInt(second + 4));
    }

    @Test
    public void encodesLongUtf8StringLengthsInTwoBytes() {
        String name = String.join("", Collections.nCopies(200, "a"));
        ByteBuffer pool = wrap(NightResourceTable.stringPool(Collections.singletonList(name)));
        int start = pool.getInt(20);
        assertEquals(0x80, pool.get(start) & 0xff);
        assertEquals(200, pool.get(start + 1) & 0xff);
        assertEquals(0x80, pool.get(start + 2) & 0xff);
        assertEquals(200, pool.get(start + 3) & 0xff);
        assertEquals(0, pool.capacity() % 4);
    }

    @Test
    public void rejectsInvalidInput() {
        List<NightResourceTable.Chunk> valid = Collections.singletonList(colors());
        assertThrows(IllegalArgumentException.class,
                () -> NightResourceTable.encode("p", 0x7f, TYPES, Collections.<NightResourceTable.Chunk>emptyList()));
        assertThrows(IllegalArgumentException.class,
                () -> NightResourceTable.encode("p", 0x7f, TYPES,
                        Collections.singletonList(new NightResourceTable.Chunk(6, 0))));
        assertThrows(IllegalArgumentException.class,
                () -> NightResourceTable.encode("p", 0x7f, TYPES.subList(0, 7), Collections.singletonList(drawables())));
        assertThrows(IllegalArgumentException.class,
                () -> NightResourceTable.encode("p", 0x7f, TYPES, Arrays.asList(colors(), colors())));
        assertThrows(IllegalArgumentException.class, () -> NightResourceTable.encode("p", 0, TYPES, valid));
        assertThrows(IllegalArgumentException.class, () -> NightResourceTable.encode(null, 0x7f, TYPES, valid));
        assertThrows(IllegalArgumentException.class,
                () -> NightResourceTable.encode("p", 0x7f, Collections.<String>emptyList(), valid));
        assertThrows(IllegalArgumentException.class, () -> new NightResourceTable.Chunk(0, 0));
        assertThrows(IllegalArgumentException.class, () -> new NightResourceTable.Chunk(8, 0x10000));
        assertThrows(IllegalArgumentException.class, () -> NightResourceTable.Entry.file("a", ""));
        assertThrows(IllegalArgumentException.class, () -> NightResourceTable.Entry.color("", 0));
    }

    private static void assertType(ByteBuffer table, int type, int typeId, int entryCount, int density) {
        assertEquals(0x0201, table.getShort(type));
        assertEquals(20 + NightResourceTable.CONFIG_SIZE, table.getShort(type + 2));
        assertEquals(typeId, table.get(type + 8));
        assertEquals(entryCount, table.getInt(type + 12));
        int config = type + 20;
        assertEquals(NightResourceTable.CONFIG_SIZE, table.getInt(config));
        assertEquals(density, table.getShort(config + NightResourceTable.CONFIG_DENSITY_OFFSET) & 0xffff);
        for (int index = 4; index < NightResourceTable.CONFIG_SIZE; index++) {
            if (index == NightResourceTable.CONFIG_DENSITY_OFFSET
                    || index == NightResourceTable.CONFIG_DENSITY_OFFSET + 1) {
                continue;
            }
            int expected = index == NightResourceTable.CONFIG_UI_MODE_OFFSET
                    ? NightResourceTable.UI_MODE_NIGHT_YES : 0;
            assertEquals("config byte " + index, expected, table.get(config + index) & 0xff);
        }
    }

    private static void assertEntry(ByteBuffer table, int entry, int key, int dataType, int data) {
        assertEquals(8, table.getShort(entry));
        assertEquals(0, table.getShort(entry + 2));
        assertEquals(key, table.getInt(entry + 4));
        assertEquals(8, table.getShort(entry + 8));
        assertEquals(dataType, table.get(entry + 11));
        assertEquals(data, table.getInt(entry + 12));
    }

    private static String utf8At(ByteBuffer table, int pool, int index) {
        int stringsStart = table.getInt(pool + 20);
        int offset = table.getInt(pool + 28 + 4 * index);
        int position = pool + stringsStart + offset;
        int length = table.get(position + 1) & 0xff;
        byte[] bytes = new byte[length];
        for (int i = 0; i < length; i++) {
            bytes[i] = table.get(position + 2 + i);
        }
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static String utf16(ByteBuffer table, int offset, int maxChars) {
        StringBuilder builder = new StringBuilder();
        for (int index = 0; index < maxChars; index++) {
            char c = table.getChar(offset + 2 * index);
            if (c == 0) {
                break;
            }
            builder.append(c);
        }
        return builder.toString();
    }

    private static ByteBuffer wrap(byte[] bytes) {
        return ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
    }
}
