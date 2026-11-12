package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertEquals;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import org.junit.Test;

public class ThemeRoleMapTest {
    private static final String TABLE = "main:gray_7,gray_10|selected-row:dark_base_background_tinted_base@1A,opacity_white_10@1A";

    @Test
    public void parsesTheInjectedTable() {
        Map<String, List<ThemeRoleMap.Target>> roles = ThemeRoleMap.parse(TABLE);
        assertEquals(2, roles.get("main").size());
        assertEquals("gray_10", roles.get("main").get(1).name);
        assertEquals(0xFF, roles.get("main").get(1).alpha);
        assertEquals(0x1A, roles.get("selected-row").get(0).alpha);
        assertEquals(0, ThemeRoleMap.parse("").size());
    }

    @Test
    public void overlayValuesKeepTheStockAlpha() {
        Map<String, Integer> values = ThemeRoleMap.overlayValues(ThemeRoleMap.parse(TABLE),
                Collections.singletonMap("selected-row", 0xFFCBA6F7));
        assertEquals(Integer.valueOf(0x1ACBA6F7), values.get("dark_base_background_tinted_base"));
        assertEquals(2, values.size());
    }
}
