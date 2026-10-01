package app.spicetify.extension.spotify.theme;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class EncorePaletteTest {
    @Test public void keepsStockColorsWithoutATheme() {
        assertNull(EncorePalette.map(EncorePalette.BASE, null, null, null));
        assertNull(EncorePalette.map(EncorePalette.ACCENT, null, null, null));
    }

    @Test public void derivesSurfacesFromTheBackground() {
        int navy = 0xFF0B1026;
        assertEquals(Integer.valueOf(navy), EncorePalette.map(EncorePalette.BASE, navy, null, null));
        int surface = EncorePalette.lighten(navy, 22);
        assertEquals(Integer.valueOf(surface), EncorePalette.map(EncorePalette.SURFACE, navy, null, null));
        assertEquals(Integer.valueOf(EncorePalette.mix(navy, surface, 0.5f)), EncorePalette.map(EncorePalette.ELEVATED, navy, null, null));
        assertEquals(Integer.valueOf(EncorePalette.lighten(surface, 2)), EncorePalette.map(EncorePalette.HIGHLIGHT, navy, null, null));
        assertNull(EncorePalette.map(EncorePalette.ACCENT, navy, null, null));
    }

    @Test public void derivesAccentShadesAndLeavesOtherColorsAlone() {
        int orange = 0xFFFF6437;
        assertEquals(Integer.valueOf(orange), EncorePalette.map(EncorePalette.ACCENT, null, null, orange));
        assertEquals(Integer.valueOf(EncorePalette.pressed(orange)), EncorePalette.map(EncorePalette.ACCENT_PRESS, null, null, orange));
        assertNull(EncorePalette.map(0xFF000000, 0xFF0B1026, null, orange));
        assertNull(EncorePalette.map(0xFFFFFFFF, 0xFF0B1026, null, orange));
    }

    @Test public void derivesPressAndAccentHighlight() {
        assertEquals(Integer.valueOf(EncorePalette.mix(0xFF0B1026, EncorePalette.lighten(0xFF0B1026, 22), 0.25f)),
                EncorePalette.map(EncorePalette.PRESS, 0xFF0B1026, null, null));
        assertEquals(Integer.valueOf(EncorePalette.mix(0xFFFF6437, 0xFFFFFFFF, 0.12f)),
                EncorePalette.map(EncorePalette.ACCENT_HIGHLIGHT, null, null, 0xFFFF6437));
    }

    @Test public void longWrapperKeepsTheLowThirtyTwoBitFormat() {
        var application = org.robolectric.RuntimeEnvironment.getApplication();
        application.deleteSharedPreferences("spicetify_patch_settings");
        app.spicetify.extension.spotify.settings.PatchSettings.initialize(application);
        assertEquals(0xFF121212L, EncorePalette.map(0xFF121212L));
        app.spicetify.extension.spotify.settings.PatchSettings.setTheme("custom", 0xFF0B1026, null, null);
        assertEquals(0xFF0B1026L, EncorePalette.map(0xFF121212L));
        app.spicetify.extension.spotify.settings.PatchSettings.setTheme(null, null, null, null);
    }

    @Test public void usesAChosenSurfaceForHeaders() {
        assertEquals(Integer.valueOf(0xFF121212), EncorePalette.map(EncorePalette.SURFACE, 0xFF000000, 0xFF121212, null));
        assertEquals(Integer.valueOf(0xFF000000), EncorePalette.map(EncorePalette.BASE, 0xFF000000, 0xFF121212, null));
    }

    @Test public void clampsLightBackgrounds() {
        assertEquals(0xFFFFFFFF, EncorePalette.lighten(0xFFF8F8F8, 24));
    }
}
