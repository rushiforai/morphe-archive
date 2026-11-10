package dev.utaa.linimal.extension.features.theme;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.HashMap;
import java.util.Map;

public final class AmoledThemeColorsTest {
    private static final int COLOR_TYPE = 0x06;
    private static final int DRAWABLE_TYPE = 0x08;

    /** LINE と同じ並びの type と、対象 resource の ID を持つ resolver。 */
    private static final class FakeResolver implements AmoledThemeColors.Resolver {
        final Map<String, Integer> ids = new HashMap<>();
        final Map<Integer, String> types = new HashMap<>();
        String packageName = "jp.naver.line.android";
        int density = 480;

        FakeResolver() {
            String[] names = {"anim", "animator", "array", "attr", "bool", "color", "dimen", "drawable"};
            for (int index = 0; index < names.length; index++) {
                types.put(0x7f000000 | ((index + 1) << 16), names[index]);
            }
            int entry = 0x200;
            for (String name : AmoledThemeColors.NAMES) {
                ids.put("color/" + name, 0x7f000000 | (COLOR_TYPE << 16) | entry++);
            }
            entry = 0x1217;
            for (String name : AmoledThemeColors.DRAWABLE_NAMES) {
                ids.put("drawable/" + name, 0x7f000000 | (DRAWABLE_TYPE << 16) | entry++);
            }
        }

        @Override
        public int id(String name, String type) {
            Integer id = ids.get(type + "/" + name);
            return id != null ? id : 0;
        }

        @Override
        public String typeName(int resourceId) {
            return types.get(resourceId & 0xffff0000);
        }

        @Override
        public String packageName(int resourceId) {
            return packageName;
        }

        @Override
        public int imageDensity(int resourceId) {
            return density;
        }
    }

    @Test
    public void buildsATableForEveryResolvedColorAndImage() {
        AmoledThemeColors.Table table = AmoledThemeColors.buildTable(new FakeResolver());
        assertNotNull(table);
        assertEquals(AmoledThemeColors.NAMES.size() + AmoledThemeColors.DRAWABLE_NAMES.size(), keyCount(table.arsc));
        assertEquals(DRAWABLE_TYPE, typeNameCount(table.arsc));
        assertEquals(AmoledThemeColors.DRAWABLE_NAMES.size(), table.files.size());
        assertEquals(Integer.valueOf(0x7f081217),
                table.files.get("res/drawable-night/linimal_amoled_navi_bottom_bg_dark.png"));
    }

    @Test
    public void skipsResourcesThatAreMissing() {
        FakeResolver resolver = new FakeResolver();
        resolver.ids.remove("color/chatBackground");
        AmoledThemeColors.Table table = AmoledThemeColors.buildTable(resolver);
        assertNotNull(table);
        assertEquals(AmoledThemeColors.NAMES.size() + AmoledThemeColors.DRAWABLE_NAMES.size() - 1,
                keyCount(table.arsc));
    }

    /** 画像を用意できないときは、下部タブを元の画像のまま残して色だけを上書きします。 */
    @Test
    public void buildsAColorOnlyTableWhenNoImageIsAvailable() {
        for (int density : new int[] {0, -1, 0x10000}) {
            FakeResolver resolver = new FakeResolver();
            resolver.density = density;
            AmoledThemeColors.Table table = AmoledThemeColors.buildTable(resolver);
            assertNotNull(table);
            assertEquals(AmoledThemeColors.NAMES.size(), keyCount(table.arsc));
            assertEquals(COLOR_TYPE, typeNameCount(table.arsc));
            assertTrue(table.files.isEmpty());
        }
    }

    @Test
    public void fillsTypeNamesThatCannotBeResolved() {
        FakeResolver resolver = new FakeResolver();
        resolver.types.remove(0x7f070000);
        assertNotNull(AmoledThemeColors.buildTable(resolver));
    }

    @Test
    public void keepsOriginalColorsWhenNothingCanBeResolved() {
        FakeResolver resolver = new FakeResolver();
        resolver.ids.clear();
        assertNull(AmoledThemeColors.buildTable(resolver));
    }

    @Test
    public void keepsOriginalColorsWhenIdsDisagreeOnPackageOrType() {
        FakeResolver otherType = new FakeResolver();
        otherType.ids.put("color/chatBackground", 0x7f070001);
        assertNull(AmoledThemeColors.buildTable(otherType));

        FakeResolver otherPackage = new FakeResolver();
        otherPackage.ids.put("drawable/navi_bottom_bg_dark", 0x01080001);
        assertNull(AmoledThemeColors.buildTable(otherPackage));
    }

    @Test
    public void keepsOriginalColorsWhenTheResolvedTypeDoesNotMatch() {
        FakeResolver resolver = new FakeResolver();
        resolver.types.put(0x7f060000, "drawable");
        assertNull(AmoledThemeColors.buildTable(resolver));

        FakeResolver drawable = new FakeResolver();
        drawable.types.put(0x7f080000, "dimen");
        assertNull(AmoledThemeColors.buildTable(drawable));

        FakeResolver noPackage = new FakeResolver();
        noPackage.packageName = null;
        assertNull(AmoledThemeColors.buildTable(noPackage));
    }

    @Test
    public void blackensOnlyOpaquePixels() {
        int[] pixels = {0xFF111111, 0xFFFFFFFF, 0x09C8C8C8, 0x00000000, 0xFE111111};
        AmoledThemeColors.blackenOpaquePixels(pixels);
        assertArrayEquals(new int[] {0xFF000000, 0xFF000000, 0x09C8C8C8, 0x00000000, 0xFE111111}, pixels);
    }

    /** package 内の type string pool の件数。最後の type の ID と同じです。 */
    private static int typeNameCount(byte[] bytes) {
        ByteBuffer table = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        int pkg = 12 + table.getInt(12 + 4);
        int typeStrings = pkg + table.getInt(pkg + 12 + 256);
        return table.getInt(typeStrings + 8);
    }

    /** package 内の key string pool の件数。 */
    private static int keyCount(byte[] bytes) {
        ByteBuffer table = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        int pkg = 12 + table.getInt(12 + 4);
        int keyStrings = pkg + table.getInt(pkg + 12 + 264);
        return table.getInt(keyStrings + 8);
    }
}
