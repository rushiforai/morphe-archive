package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import java.util.Map;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class ThemePresetsTest {
    private final Context context = RuntimeEnvironment.getApplication();

    @Test
    public void oledIsBlackWithDerivedSurfaces() {
        Map<String, Integer> roles = ThemePresets.colors(context, ThemePresets.OLED);
        assertEquals(Integer.valueOf(0xFF000000), roles.get("main"));
        assertEquals(Integer.valueOf(0xFF0F0F0F), roles.get("main-elevated"));
        assertEquals(Integer.valueOf(0xFF1A1A1A), roles.get("highlight-elevated"));
        // Cards and the accent keep Spotify's colors.
        assertFalse(roles.containsKey("card"));
        assertFalse(roles.containsKey("button"));
    }

    @Test
    public void namedThemesBecomeTheBackgroundCardAndAccentRoles() {
        Map<String, Integer> roles = ThemePresets.colors(context, "midnight");
        assertEquals(Integer.valueOf(0xFF0B1026), roles.get("main"));
        assertEquals(Integer.valueOf(0xFF1C2340), roles.get("card"));
        assertEquals(Integer.valueOf(0xFF509BF5), roles.get("button"));
        assertEquals(Integer.valueOf(ArgbColors.mix(0xFF509BF5, 0xFF000000, 0.125)), roles.get("button-active"));
        assertEquals(Integer.valueOf(ArgbColors.mix(0xFF0B1026, 0xFFFFFFFF, 0.06)), roles.get("main-elevated"));
        for (ThemePresets.Preset preset : ThemePresets.ALL) {
            if (preset.colors.length == 3) assertEquals(preset.name, 8, ThemePresets.colors(context, preset.kind).size());
        }
    }

    @Test
    public void spotifyAndUnknownKindsKeepSpotifysColors() {
        assertTrue(ThemePresets.colors(context, ThemePresets.STOCK).isEmpty());
        assertTrue(ThemePresets.colors(context, "a theme from a newer version").isEmpty());
    }

    @Test
    public void materialYouFillsTheOpaqueRoles() {
        assertEquals(13, ThemePresets.colors(context, ThemePresets.MATERIAL_YOU).size());
        Map<String, Integer> black = ThemePresets.colors(context, ThemePresets.MATERIAL_YOU_BLACK);
        assertEquals(13, black.size());
        assertEquals(Integer.valueOf(0xFF000000), black.get("main"));
    }
}
