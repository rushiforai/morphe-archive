/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.res.Resources;
import android.util.TypedValue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * When Dark background color puts its style over a theme. The test app has neither the patch's
 * style nor Tumblr's palette, so a framework dark overlay stands in for the style, and a light
 * framework theme shows whether it went on.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class DarkBackgroundTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before
    public void everyPatchIsIn() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        DarkBackground.ids = null;
        DarkBackground.designColors = null;
        HookStatus.clear();
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        DarkBackground.styleForTests = null;
        DarkBackground.darkForTests = null;
        DarkBackground.ids = null;
        DarkBackground.designColors = null;
        Settings.DARK_BACKGROUND.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theSwitchPaintsADarkModeTheme() {
        Settings.DARK_BACKGROUND.save(true);
        Resources.Theme theme = lightTheme();
        int before = background(theme);
        standIn(true);

        assertTrue(DarkBackground.paint(theme, app().getResources(), app().getPackageName()));
        assertNotEquals("the style went over the theme", before, background(theme));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("dark theme painted 1"));
    }

    @Test
    public void theSwitchStartsOffSoTheThemeStaysTumblrs() {
        Resources.Theme theme = lightTheme();
        int before = background(theme);
        standIn(true);

        assertFalse(DarkBackground.paint(theme, app().getResources(), app().getPackageName()));
        assertEquals(before, background(theme));
    }

    @Test
    public void anotherPaletteIsLeftAlone() {
        Settings.DARK_BACKGROUND.save(true);
        Resources.Theme theme = lightTheme();
        int before = background(theme);
        standIn(false);

        assertFalse(DarkBackground.paint(theme, app().getResources(), app().getPackageName()));
        assertEquals(before, background(theme));
        // Tumblr draws some Compose pieces with its default palette in Dark Mode too. The report
        // says so, so a run that painted nothing isn't taken for a hook that failed.
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("invoked 1"));
        assertTrue(report, report.contains("other palette left alone 1"));
        assertFalse(report, report.contains("painted"));
    }

    /**
     * The Dark palette's design colors read one gray for the page and a lighter one for bars, rows
     * and dialogs. With the switch on they come back as the style's color and a step up from it, and
     * the eight reads Tumblr makes count as one run.
     */
    @Test
    public void theDesignColorsTakeTheStylesColorAndAStepUp() {
        Settings.DARK_BACKGROUND.save(true);
        int color = standInStyle();

        assertEquals(DarkBackground.packed(color), DarkBackground.designPage(PAGE_GRAY));
        assertEquals(DarkBackground.packed(DarkBackground.raised(color)), DarkBackground.designPanel(PANEL_GRAY));
        for (int read = 0; read < 3; read++) {
            assertEquals(DarkBackground.packed(color), DarkBackground.designPage(PAGE_GRAY));
            assertEquals(DarkBackground.packed(DarkBackground.raised(color)), DarkBackground.designPanel(PANEL_GRAY));
        }
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("invoked 1"));
        assertTrue(report, report.contains("design colors painted 1"));
    }

    /**
     * The footer under a post paints itself with the panel gray, so it sat a step lighter than the
     * card above it. It takes the card's color once the set is painted, and nothing else moves.
     */
    @Test
    public void thePostFooterTakesTheCardsColorNotTheRaisedPanel() {
        Settings.DARK_BACKGROUND.save(true);
        int color = standInStyle();
        long raised = DarkBackground.packed(DarkBackground.raised(color));
        assertEquals("before the set is built it's Tumblr's", raised, DarkBackground.designFooter(raised));

        assertEquals(raised, DarkBackground.designPanel(PANEL_GRAY));
        assertEquals(DarkBackground.packed(color), DarkBackground.designFooter(raised));
        assertEquals("another palette's panel", PANEL_GRAY, DarkBackground.designFooter(PANEL_GRAY));
        long blue = DarkBackground.packed(0xFF1F3A5F);
        assertEquals(blue, DarkBackground.designFooter(blue));
    }

    /** The footer reads its own switch, so a set built while it was on doesn't outlast it. */
    @Test
    public void thePostFooterAnswersToTheSwitchItself() {
        Settings.DARK_BACKGROUND.save(true);
        long raised = DarkBackground.packed(DarkBackground.raised(standInStyle()));
        assertEquals(raised, DarkBackground.designPanel(PANEL_GRAY));
        Settings.DARK_BACKGROUND.save(false);

        assertEquals(raised, DarkBackground.designFooter(raised));
    }

    @Test
    public void withTheSwitchOffThePostFooterStaysTumblrs() {
        standInStyle();
        assertEquals(PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));

        assertEquals(PANEL_GRAY, DarkBackground.designFooter(PANEL_GRAY));
    }

    @Test
    public void theSwitchStartsOffSoTheDesignColorsStayTumblrs() {
        standInStyle();

        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
        assertEquals(PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));
        assertFalse(String.join("\n", HookStatus.report()).contains("painted"));
    }

    /** Tumblr builds the set once and keeps it, so a switch flipped later can't leave it half painted. */
    @Test
    public void oneAnswerCoversEveryDesignColorUntilTumblrRestarts() {
        standInStyle();
        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));

        Settings.DARK_BACKGROUND.save(true);
        assertEquals("decided with the first gray", PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));

        DarkBackground.designColors = null;
        assertNotEquals("a restart decides again", PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));
    }

    @Test
    public void aBuildWithoutTheHookLeavesTheDesignColorsAlone() {
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();

        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
        assertEquals(PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));
    }

    @Test
    public void withoutThePatchStyleTheDesignColorsStayTumblrsAndTheReportSaysWhy() {
        Settings.DARK_BACKGROUND.save(true);

        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
        assertEquals(PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkBackground.STYLE));
        assertFalse(report, report.contains("painted"));
    }

    /** Read before HushTumblr may read a switch, the whole set stays Tumblr's and the report says it was early. */
    @Test
    public void designColorsReadBeforeTheSettingsAreReadyStayTumblrs() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();

        SettingsContextRule.beforeThePauseIsDecided(() -> assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY)));
        assertEquals("the set was built with that answer", PANEL_GRAY, DarkBackground.designPanel(PANEL_GRAY));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("design colors read early 1"));
        assertFalse(report, report.contains("painted"));
    }

    /** Only a solid color packed the plain way is a gray to swap: anything else goes back as it came. */
    @Test
    public void aValueThatIsNotASolidColorGoesBackAsItCame() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();
        long seeThrough = DarkBackground.packed(0x800D0D0D);
        long anotherColorSpace = PAGE_GRAY | 1L;

        assertEquals(seeThrough, DarkBackground.designPage(seeThrough));
        assertEquals(anotherColorSpace, DarkBackground.designPanel(anotherColorSpace));
        assertEquals(0L, DarkBackground.designPage(0L));
        assertNotEquals("a solid gray is still swapped", PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
    }

    @Test
    public void aColorIsPackedTheWayComposeKeepsItAndRaisedAsFarAsWhite() {
        assertEquals(0xFF0D0D0D00000000L, DarkBackground.packed(0xFF0D0D0D));
        assertTrue(DarkBackground.isSolidColor(DarkBackground.packed(0xFF000000)));
        assertFalse(DarkBackground.isSolidColor(DarkBackground.packed(0x00000000)));
        assertEquals(0xFF0D0D0D, DarkBackground.raised(0xFF000000));
        assertEquals(0xFF1F1F1F, DarkBackground.raised(0xFF121212));
        assertEquals("a channel stops at white", 0xFFFFFF0D, DarkBackground.raised(0xFFF8FF00));
    }

    @Test
    public void aStylesColorIsReadOnlyWhenItIsOne() {
        Resources resources = app().getResources();
        assertEquals(Integer.valueOf(standInStyle()),
                DarkBackground.styleColor(resources, android.R.style.Theme_Material, android.R.attr.colorBackground));
        assertNull("no style", DarkBackground.styleColor(resources, 0, android.R.attr.colorBackground));
        assertNull("no attribute", DarkBackground.styleColor(resources, android.R.style.Theme_Material, 0));
        assertNull("a size isn't a color", DarkBackground.styleColor(resources, android.R.style.Theme_Material,
                android.R.attr.actionBarSize));
    }

    @Test
    public void aBuildWithoutTheHookLeavesTheThemeAlone() {
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        Settings.DARK_BACKGROUND.save(true);
        Resources.Theme theme = lightTheme();
        standIn(true);

        assertFalse(DarkBackground.paint(theme, app().getResources(), app().getPackageName()));
    }

    @Test
    public void withoutThePatchStyleNothingIsPaintedAndTheReportSaysWhy() {
        Settings.DARK_BACKGROUND.save(true);
        Resources.Theme theme = lightTheme();
        int before = background(theme);

        assertFalse(DarkBackground.paint(theme, app().getResources(), app().getPackageName()));
        assertEquals(before, background(theme));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkBackground.STYLE));
    }

    /** Dark Mode is told apart by the color resource its screen attribute points at. */
    @Test
    public void aThemeIsDarkWhenItsScreenColorIsTheDarkPalettes() {
        Resources.Theme theme = app().getResources().newTheme();
        theme.applyStyle(android.R.style.Theme_Material, true);
        TypedValue value = new TypedValue();
        assertTrue(theme.resolveAttribute(android.R.attr.colorBackground, value, true));
        int color = value.resourceId;
        assertNotEquals("the framework's dark background is a color resource", 0, color);

        assertTrue(DarkBackground.isDark(theme, android.R.attr.colorBackground, color));
        assertFalse("another color is another palette", DarkBackground.isDark(theme, android.R.attr.colorBackground, color + 1));
        assertFalse("a missing attribute is never dark", DarkBackground.isDark(theme, 0, color));
        assertFalse("a missing color is never dark", DarkBackground.isDark(theme, android.R.attr.colorBackground, 0));
    }

    @Test
    public void theHooksTakeNothingQuietly() {
        Settings.DARK_BACKGROUND.save(true);
        DarkBackground.onActivityTheme(null);
        DarkBackground.onComposeTheme(null);
        assertFalse(String.join("\n", HookStatus.report()).contains("painted"));
    }

    private static Context app() {
        return RuntimeEnvironment.getApplication();
    }

    private static Resources.Theme lightTheme() {
        Resources.Theme theme = app().getResources().newTheme();
        theme.applyStyle(android.R.style.Theme_Material_Light, true);
        return theme;
    }

    private static int background(Resources.Theme theme) {
        TypedValue value = new TypedValue();
        theme.resolveAttribute(android.R.attr.colorBackground, value, true);
        return value.data;
    }

    private static void standIn(boolean dark) {
        DarkBackground.styleForTests = android.R.style.ThemeOverlay_Material_Dark;
        DarkBackground.darkForTests = ignored -> dark;
    }

    /** The Dark palette's two surface grays, #0d0d0d and #1a1a1a, as Tumblr's design colors hand them over. */
    private static final long PAGE_GRAY = 0xFF0D0D0D00000000L;
    private static final long PANEL_GRAY = 0xFF1A1A1A00000000L;

    /**
     * Stands a framework dark theme in for the patch's style and its background attribute for the
     * screen color, and answers the color the design colors should take from it.
     */
    private static int standInStyle() {
        DarkBackground.ids = new int[] {android.R.style.Theme_Material, android.R.attr.colorBackground, 0};
        Resources.Theme theme = app().getResources().newTheme();
        theme.applyStyle(android.R.style.Theme_Material, true);
        int color = background(theme) | 0xFF000000;
        assertNotEquals("the stand-in color isn't Tumblr's gray", 0xFF0D0D0D, color);
        return color;
    }
}
