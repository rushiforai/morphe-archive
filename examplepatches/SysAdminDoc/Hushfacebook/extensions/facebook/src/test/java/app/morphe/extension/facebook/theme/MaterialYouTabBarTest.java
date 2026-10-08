/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Material You's selected tab (#65): in Facebook's dark mode the colour Facebook's tab bar asks for
 * the selected tab, near white there, becomes the palette's accent at tone 80, which reads on the
 * bar in every palette and on AMOLED's black. Light mode's colours, and a selected tab Facebook
 * already draws in its blue, pass as they came.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MaterialYouTabBarTest {
    /** What Facebook's dark theme gives TAB_BAR_ACTIVE_ICON and PRIMARY_ICON. */
    private static final int DARK_SELECTED = 0xFFF2F4F7;

    /** Light theme: PRIMARY_ICON and Facebook's blue, the two a light bar can draw the selected tab in. */
    private static final int[] LIGHT_SELECTED = {0xFF080809, 0xFF0866FF};

    /** NAV_BAR_BACKGROUND in Facebook's dark theme, and AMOLED's black. */
    private static final int DARK_BAR = 0xFF252728;
    private static final int BLACK = 0xFF000000;

    @Before
    public void usePalette() {
        MaterialYouTheme.use(TonePalette.fallback(), false);
    }

    @After
    public void restore() {
        DarkMode.answer(true);
        MaterialYouTheme.use(TonePalette.fallback(), false);
    }

    private static double contrast(int first, int second) {
        double a = TonePalette.luminance(first);
        double b = TonePalette.luminance(second);
        return (Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05);
    }

    @Test
    public void inTheDarkThemeTheSelectedTabTakesTheAccent() {
        TonePalette palette = TonePalette.fallback();
        int accent = palette.tone(TonePalette.ACCENT, MaterialYouTheme.SELECTED_TAB_TONE);
        assertEquals(accent, MaterialYouTheme.tabBarSelected(palette, DARK_SELECTED, true));
        // The public hook asks Facebook's own answer.
        DarkMode.answer(true);
        assertEquals(accent, MaterialYouTheme.tabBarSelected(DARK_SELECTED));
        // A translucent selected colour keeps its alpha.
        assertEquals((accent & 0x00FFFFFF) | 0x80000000,
                MaterialYouTheme.tabBarSelected(palette, (DARK_SELECTED & 0x00FFFFFF) | 0x80000000, true));
    }

    @Test
    public void lightModeKeepsFacebooksColoursEvenBeforeFacebookAnswers() {
        TonePalette palette = TonePalette.fallback();
        for (int light : LIGHT_SELECTED) {
            assertEquals(Integer.toHexString(light), light, MaterialYouTheme.tabBarSelected(palette, light, false));
            // Before Facebook's first answer DarkMode still says dark, and a light theme's colour stays.
            assertEquals(Integer.toHexString(light), light, MaterialYouTheme.tabBarSelected(palette, light, true));
        }
        DarkMode.answer(false);
        assertEquals("light mode recoloured the dark theme's near white", DARK_SELECTED,
                MaterialYouTheme.tabBarSelected(DARK_SELECTED));
    }

    @Test
    public void aSelectedTabAlreadyInTheAccentAndATransparentOneStay() {
        TonePalette palette = TonePalette.fallback();
        // ACCENT's dark colour after route one: the palette's accent at its lightness, L* 55.
        int routeOne = palette.sameLightness(TonePalette.ACCENT, 0xFF1D85FC);
        assertEquals(routeOne, MaterialYouTheme.tabBarSelected(palette, routeOne, true));
        assertEquals(0, MaterialYouTheme.tabBarSelected(palette, 0, true));
    }

    @Test
    public void theAccentReadsOnTheBarInEveryPalette() {
        int[][][] phones = {PalettesForTests.RED, PalettesForTests.YELLOW, PalettesForTests.GREEN,
                PalettesForTests.GALAXY_S25, PalettesForTests.NEAR_GREY};
        TonePalette[] palettes = new TonePalette[phones.length + 1];
        for (int i = 0; i < phones.length; i++) palettes[i] = PalettesForTests.palette(phones[i]);
        palettes[phones.length] = TonePalette.fallback();
        for (TonePalette palette : palettes) {
            int selected = MaterialYouTheme.tabBarSelected(palette, DARK_SELECTED, true);
            int bar = palette.sameLightness(TonePalette.NEUTRAL, DARK_BAR);
            assertTrue("the selected tab on the dark bar: " + contrast(selected, bar), contrast(selected, bar) >= 4.5);
            assertTrue("the selected tab on AMOLED's black: " + contrast(selected, BLACK), contrast(selected, BLACK) >= 4.5);
        }
    }
}
