package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Application;
import android.content.SharedPreferences;
import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ThemeStateTest {
    private Application context;

    @Before
    public void clear() {
        context = RuntimeEnvironment.getApplication();
        context.deleteSharedPreferences("spicetify_theme");
        context.deleteSharedPreferences("spicetify_patch_settings");
    }

    @Test
    public void startsWithSpotifysOwnColors() {
        ThemeState.Selection selection = ThemeState.load(context);
        assertEquals(ThemePresets.STOCK, selection.kind);
        assertEquals("Spotify", selection.label);
        assertTrue(selection.colors.isEmpty());
    }

    @Test
    public void savesCustomColorsWithTheTheme() {
        Map<String, Integer> colors = new LinkedHashMap<>();
        colors.put("main", 0xFF1E1E2E);
        colors.put("button", 0x80CBA6F7);
        ThemeState.save(context, new ThemeState.Selection(ThemeState.CUSTOM, "Custom", colors));

        ThemeState.Selection loaded = ThemeState.load(context);
        assertEquals(ThemeState.CUSTOM, loaded.kind);
        assertEquals("Custom", loaded.label);
        assertEquals(colors, loaded.colors);
    }

    @Test
    public void aNamedThemeFromThePreviousEngineKeepsItsName() {
        previous().putString("theme_preset", "rose-pine").putInt("theme_background", 0xFF191724)
                .putInt("theme_surface", 0xFF26233A).putInt("theme_accent", 0xFFEBBCBA).commit();
        ThemeState.migrate(context);
        ThemeState.Selection migrated = ThemeState.load(context);
        assertEquals("rose-pine", migrated.kind);
        assertEquals("Rosé Pine", migrated.label);
        assertTrue(migrated.colors.isEmpty());
        assertNoPreviousTheme();

        previous().putString("theme_preset", "oled").putInt("theme_background", 0xFF000000).commit();
        context.deleteSharedPreferences("spicetify_theme");
        ThemeState.migrate(context);
        assertEquals(ThemePresets.OLED, ThemeState.load(context).kind);
    }

    @Test
    public void colorsPickedInThePreviousEngineBecomeCustomColors() {
        previous().putString("theme_preset", "custom").putInt("theme_background", 0xFF0B1026)
                .putInt("theme_surface", 0xFF121212).putInt("theme_accent", 0xFFFF6437).commit();
        ThemeState.migrate(context);
        ThemeState.Selection migrated = ThemeState.load(context);
        assertEquals(ThemeState.CUSTOM, migrated.kind);
        assertEquals(Integer.valueOf(0xFF0B1026), migrated.colors.get("main"));
        assertEquals(Integer.valueOf(0xFF121212), migrated.colors.get("card"));
        assertEquals(Integer.valueOf(0xFFFF6437), migrated.colors.get("button"));
        assertNoPreviousTheme();

        // A theme this version doesn't know keeps its colors as custom colors.
        context.deleteSharedPreferences("spicetify_theme");
        previous().putString("theme_preset", "neon").putInt("theme_background", 0xFF101010)
                .putInt("theme_surface", 0xFF202020).putInt("theme_accent", 0xFF39FF14).commit();
        ThemeState.migrate(context);
        migrated = ThemeState.load(context);
        assertEquals(ThemeState.CUSTOM, migrated.kind);
        assertEquals(Integer.valueOf(0xFF101010), migrated.colors.get("main"));
        assertEquals(Integer.valueOf(0xFF202020), migrated.colors.get("card"));
        assertEquals(Integer.valueOf(0xFF39FF14), migrated.colors.get("button"));

        // Before named themes, a background was saved alone, and the surface followed from it.
        context.deleteSharedPreferences("spicetify_theme");
        previous().putInt("theme_background", 0xFF0B1026).commit();
        ThemeState.migrate(context);
        migrated = ThemeState.load(context);
        assertEquals(ThemeState.CUSTOM, migrated.kind);
        assertEquals(Integer.valueOf(0xFF0B1026), migrated.colors.get("main"));
        assertEquals(Integer.valueOf(0xFF21263C), migrated.colors.get("card"));
        assertEquals(2, migrated.colors.size());
    }

    @Test
    public void anUnreadableThemeGoesOnceAndLeavesSpotifysColors() {
        previous().putString("theme_preset", "custom").putString("theme_background", "black").commit();
        ThemeState.migrate(context);
        assertEquals(ThemePresets.STOCK, ThemeState.load(context).kind);
        assertNoPreviousTheme();
    }

    @Test
    public void theTablesVersion10WroteAreDeleted() throws IOException {
        File directory = new File(context.getNoBackupFilesDir(), "spicetify-theme");
        assertTrue(directory.mkdirs());
        File table = new File(directory, "colors-1a2b3c4d.arsc");
        assertTrue(table.createNewFile());
        ThemeState.migrate(context);
        assertFalse(table.exists());
        assertFalse(directory.exists());
    }

    @Test
    public void aThemeChosenHereIsKeptAndOtherSettingsStay() {
        ThemeState.save(context, ThemeState.Selection.preset(ThemePresets.MATERIAL_YOU, "Material You"));
        previous().putBoolean("clean_sharing", false).putString("theme_preset", "nord").commit();
        ThemeState.migrate(context);
        assertEquals(ThemePresets.MATERIAL_YOU, ThemeState.load(context).kind);
        assertNoPreviousTheme();
        assertFalse(context.getSharedPreferences("spicetify_patch_settings", 0).getBoolean("clean_sharing", true));
    }

    private SharedPreferences.Editor previous() {
        return context.getSharedPreferences("spicetify_patch_settings", 0).edit();
    }

    private void assertNoPreviousTheme() {
        SharedPreferences previous = context.getSharedPreferences("spicetify_patch_settings", 0);
        for (String key : new String[] {"theme_preset", "theme_background", "theme_surface", "theme_accent"}) {
            assertFalse(key, previous.contains(key));
        }
    }
}
