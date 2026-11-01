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

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.util.TypedValue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
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
        DarkBackground.pagePick = null;
        DarkBackground.darkPalette = false;
        DarkBackground.customizing = false;
        HookStatus.clear();
    }

    @After
    public void restore() {
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        DarkBackground.styleForTests = null;
        DarkBackground.darkForTests = null;
        DarkBackground.raisedForTests = null;
        DarkBackground.ids = null;
        DarkBackground.designColors = null;
        DarkBackground.pagePick = null;
        DarkBackground.darkPalette = false;
        DarkBackground.customizing = false;
        Settings.DARK_BACKGROUND.resetToDefault();
        Settings.DARK_BACKGROUND_WALLPAPER.resetToDefault();
        HookStatus.clear();
    }

    /** With the wallpaper switch on, Android 12 and newer ask for the wallpaper's style, and the report names it when it's missing. */
    @Test
    @Config(sdk = 36)
    public void theWallpaperSwitchAsksForTheWallpaperStyle() {
        Settings.DARK_BACKGROUND.save(true);
        Settings.DARK_BACKGROUND_WALLPAPER.save(true);

        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkBackground.WALLPAPER_STYLE));
    }

    /** With it off, the same phone asks for the picked color's style. */
    @Test
    @Config(sdk = 36)
    public void withTheWallpaperSwitchOffThePickedColorsStyleIsAskedFor() {
        Settings.DARK_BACKGROUND.save(true);

        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkBackground.STYLE));
        assertFalse(report, report.contains(DarkBackground.WALLPAPER_STYLE));
    }

    /** Android 11 and older make no colors from a wallpaper, so the switch changes nothing there. */
    @Test
    public void beforeAndroid12TheWallpaperSwitchKeepsThePickedColorsStyle() {
        Settings.DARK_BACKGROUND.save(true);
        Settings.DARK_BACKGROUND_WALLPAPER.save(true);

        assertEquals(PAGE_GRAY, DarkBackground.designPage(PAGE_GRAY));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkBackground.STYLE));
        assertFalse(report, report.contains(DarkBackground.WALLPAPER_STYLE));
    }

    /** The wallpaper has its own lighter tone, so a panel takes that, and the footer still matches the card. */
    @Test
    @Config(sdk = 36)
    public void aWallpaperPanelTakesTheStylesLighterTone() {
        Settings.DARK_BACKGROUND.save(true);
        Settings.DARK_BACKGROUND_WALLPAPER.save(true);
        int page = standInStyle();
        DarkBackground.raisedForTests = android.R.attr.colorBackgroundFloating;
        Integer tone = DarkBackground.styleColor(app().getResources(), android.R.style.Theme_Material,
                android.R.attr.colorBackgroundFloating);
        assertNotEquals("the stand-in tone isn't a step up from the page", DarkBackground.raised(page), (int) tone);

        assertEquals(DarkBackground.packed(page), DarkBackground.designPage(PAGE_GRAY));
        assertEquals(DarkBackground.packed(tone), DarkBackground.designPanel(PANEL_GRAY));
        assertEquals(DarkBackground.packed(page), DarkBackground.designFooter(DarkBackground.packed(tone)));
    }

    /** A wallpaper style with no lighter tone still leaves a panel apart from its page. */
    @Test
    @Config(sdk = 36)
    public void aWallpaperStyleWithoutALighterToneStepsUpFromThePage() {
        Settings.DARK_BACKGROUND.save(true);
        Settings.DARK_BACKGROUND_WALLPAPER.save(true);
        int page = standInStyle();

        assertEquals(DarkBackground.packed(DarkBackground.raised(page)), DarkBackground.designPanel(PANEL_GRAY));
    }

    /** The picked color's panel is always the step up, whatever an older phone's switch says. */
    @Test
    public void beforeAndroid12APanelStepsUpFromThePickedColor() {
        Settings.DARK_BACKGROUND.save(true);
        Settings.DARK_BACKGROUND_WALLPAPER.save(true);
        int page = standInStyle();
        DarkBackground.raisedForTests = android.R.attr.colorBackgroundFloating;

        assertEquals(DarkBackground.packed(DarkBackground.raised(page)), DarkBackground.designPanel(PANEL_GRAY));
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

    /** #8: a blog's and a tag's own color showed through the gaps between posts, whatever color the rest took. */
    @Test
    public void blogAndTagPagesTakeThePickedColorInTheDarkPalette() {
        Settings.DARK_BACKGROUND.save(true);
        int color = standInStyle();
        DarkBackground.darkPalette = true;

        assertEquals(color, DarkBackground.pageColor(CREAM));
        assertEquals(String.format("#%06X", color & 0xFFFFFF), DarkBackground.hubColor("#2DBFA0"));
        assertEquals("a tag page with no color of its own", String.format("#%06X", color & 0xFFFFFF), DarkBackground.hubColor(null));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("blog or tag page painted 3"));
    }

    @Test
    public void aPageKeepsItsOwnColorWithTheSwitchOff() {
        standInStyle();
        DarkBackground.darkPalette = true;

        assertEquals(CREAM, DarkBackground.pageColor(CREAM));
        assertEquals("#2DBFA0", DarkBackground.hubColor("#2DBFA0"));
        assertNull(DarkBackground.hubColor(null));
    }

    /** A light palette keeps blogs' own colors, which is what it always showed. */
    @Test
    public void aPageKeepsItsOwnColorOnAnotherPalette() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();

        assertEquals(CREAM, DarkBackground.pageColor(CREAM));
        assertEquals("#2DBFA0", DarkBackground.hubColor("#2DBFA0"));
    }

    /** Someone editing their own blog's colors has to see the color they're editing. */
    @Test
    public void aPageKeepsItsOwnColorWhileItsColorsAreBeingEdited() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();
        DarkBackground.darkPalette = true;
        DarkBackground.customizing = true;

        assertEquals(CREAM, DarkBackground.pageColor(CREAM));
        assertEquals("#2DBFA0", DarkBackground.hubColor("#2DBFA0"));

        DarkBackground.customizing = false;
        assertNotEquals("back on the blog itself", CREAM, DarkBackground.pageColor(CREAM));
    }

    @Test
    public void aPageKeepsItsOwnColorWithoutTheHookOrTheStyle() {
        Settings.DARK_BACKGROUND.save(true);
        DarkBackground.darkPalette = true;

        assertEquals("no style", CREAM, DarkBackground.pageColor(CREAM));
        assertEquals("no style", "#2DBFA0", DarkBackground.hubColor("#2DBFA0"));

        standInStyle();
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertEquals("no hook", CREAM, DarkBackground.pageColor(CREAM));
        assertEquals("no hook", "#2DBFA0", DarkBackground.hubColor("#2DBFA0"));
    }

    @Test
    public void aPageReadBeforeTheSettingsAreReadyKeepsItsOwnColor() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();
        DarkBackground.darkPalette = true;

        SettingsContextRule.beforeThePauseIsDecided(() -> assertEquals(CREAM, DarkBackground.pageColor(CREAM)));
    }

    /** #8: wilwheaton's navy title and description all but vanished once the page behind them turned black. */
    @Test
    public void aBlogsTextStaysReadableOnThePickedColor() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();
        DarkBackground.darkPalette = true;

        DarkBackground.pagePick = BLACK;
        assertEquals("navy on black", DarkBackground.LIGHT_TEXT, DarkBackground.pageTextColor(NAVY));
        assertEquals("cream already reads on black", CREAM, DarkBackground.pageTextColor(CREAM));

        DarkBackground.pagePick = CREAM;
        assertEquals("a pale picked color takes dark text", DarkBackground.DARK_TEXT, DarkBackground.pageTextColor(DarkBackground.LIGHT_TEXT));
        assertEquals("navy already reads on cream", NAVY, DarkBackground.pageTextColor(NAVY));

        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(DarkBackground.TEXT_CHANGED + " 2"));
        assertFalse("text isn't a page", report.contains(DarkBackground.PAGE_PAINTED));
    }

    /** Everywhere a page keeps its own color, its text keeps its own too, however dark. */
    @Test
    public void aBlogsTextKeepsItsColorWhereThePageKeepsItsOwn() {
        standInStyle();
        DarkBackground.pagePick = BLACK;
        DarkBackground.darkPalette = true;
        assertEquals("switch off", NAVY, DarkBackground.pageTextColor(NAVY));

        Settings.DARK_BACKGROUND.save(true);
        DarkBackground.darkPalette = false;
        assertEquals("another palette", NAVY, DarkBackground.pageTextColor(NAVY));

        DarkBackground.darkPalette = true;
        DarkBackground.customizing = true;
        assertEquals("editing the blog's colors", NAVY, DarkBackground.pageTextColor(NAVY));

        DarkBackground.customizing = false;
        SettingsContextRule.beforeThePauseIsDecided(() -> assertEquals("before the settings are ready", NAVY, DarkBackground.pageTextColor(NAVY)));

        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertEquals("no hook", NAVY, DarkBackground.pageTextColor(NAVY));
    }

    /** The activity's theme decides the palette. A later Compose theme of another palette doesn't. */
    @Test
    public void onlyAnActivitysThemeDecidesThePalette() {
        Settings.DARK_BACKGROUND.save(true);
        int color = standInStyle();
        DarkBackground.styleForTests = android.R.style.ThemeOverlay_Material_Dark;
        DarkBackground.darkForTests = ignored -> true;
        Activity shown = Robolectric.buildActivity(Activity.class).create().get();

        DarkBackground.onActivityTheme(shown);
        assertTrue(DarkBackground.darkPalette);
        assertEquals(color, DarkBackground.pageColor(CREAM));

        DarkBackground.darkForTests = ignored -> false;
        DarkBackground.onComposeTheme(lightTheme());
        assertTrue("Compose's theme isn't the screen's", DarkBackground.darkPalette);

        DarkBackground.onActivityTheme(shown);
        assertFalse("the screen moved to another palette", DarkBackground.darkPalette);
        assertEquals(CREAM, DarkBackground.pageColor(CREAM));
    }

    /** Going back from a customize screen sets no theme, so which screen is in front follows the lifecycle. */
    @Test
    public void aCustomizeScreenStopsCountingOnceAnotherIsInFront() {
        Settings.DARK_BACKGROUND.save(true);
        standInStyle();
        DarkBackground.styleForTests = android.R.style.ThemeOverlay_Material_Dark;
        DarkBackground.darkForTests = ignored -> true;
        ActivityController<CustomizeOpticaStandIn> customize = Robolectric.buildActivity(CustomizeOpticaStandIn.class).create();
        ActivityController<Activity> blog = Robolectric.buildActivity(Activity.class).create();

        DarkBackground.onActivityTheme(customize.get());
        assertTrue(DarkBackground.customizing);
        assertEquals(CREAM, DarkBackground.pageColor(CREAM));

        blog.start().resume();
        assertFalse(DarkBackground.customizing);
        assertNotEquals(CREAM, DarkBackground.pageColor(CREAM));

        customize.start().resume();
        assertTrue(DarkBackground.customizing);
    }

    /** Named for the real screen's name, which is what tells it apart. */
    public static final class CustomizeOpticaStandIn extends Activity {}

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

    /** The cream from the blog page reported in #8. */
    private static final int CREAM = 0xFFF5EBD7;

    /** A title color like the blog's in #8, and the black page it vanished on. */
    private static final int NAVY = 0xFF0B1A3D;
    private static final int BLACK = 0xFF000000;

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
