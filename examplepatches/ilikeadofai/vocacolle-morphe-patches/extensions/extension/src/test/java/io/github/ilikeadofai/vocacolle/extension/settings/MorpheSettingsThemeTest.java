package io.github.ilikeadofai.vocacolle.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.res.Configuration;

import org.junit.Test;

public class MorpheSettingsThemeTest {
    @Test
    public void detectsSystemNightModeFromConfigurationMask() {
        assertTrue(MorpheSettingsTheme.isNightMode(Configuration.UI_MODE_NIGHT_YES));
        assertFalse(MorpheSettingsTheme.isNightMode(Configuration.UI_MODE_NIGHT_NO));
        assertFalse(MorpheSettingsTheme.isNightMode(Configuration.UI_MODE_NIGHT_UNDEFINED));
    }

    @Test
    public void createsReadableLightAndDarkPalettesWhilePreservingAccent() {
        int accent = 0xff00897b;
        MorpheSettingsTheme.Palette light = MorpheSettingsTheme.createPalette(false, accent);
        MorpheSettingsTheme.Palette dark = MorpheSettingsTheme.createPalette(true, accent);

        assertEquals(0xfffafafa, light.background);
        assertEquals(0xff202124, light.primaryText);
        assertEquals(0xff121212, dark.background);
        assertEquals(0xfff5f5f5, dark.primaryText);
        assertEquals(accent, light.accent);
        assertEquals(accent, dark.accent);
    }
}
