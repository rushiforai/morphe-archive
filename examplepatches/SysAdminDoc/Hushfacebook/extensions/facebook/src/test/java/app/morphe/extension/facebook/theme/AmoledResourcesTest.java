/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.loader.ResourcesLoader;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;

/**
 * The Background color row (issue #214): the table of resources route two wrote over, read as
 * AmoledResources loads, the colours its loader gives them, and the page colour route three reads.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AmoledResourcesTest {
    private static final int NAVY = 0xFF0D1117;
    private static final int PAGE_ID = 0x7f060020;
    private static final AmoledResources.LoaderMaker MAKER = AmoledResources.maker;

    @Rule
    public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void forget() {
        AmoledResources.useTable(null);
        AmoledResources.useLightSurfaces(null);
        AmoledTheme.forgetPageColourForTests();
        AmoledResources.maker = MAKER;
        AmoledTheme.useBackground(0xFF000000);
        Settings.AMOLED_BACKGROUND.resetToDefault();
        AmoledTheme.useLight(0);
        Settings.AMOLED_LIGHT_BACKGROUND.resetToDefault();
        DarkMode.answer(true);
    }

    /**
     * Issue #214: the Light background color row is read with the Background color row as Facebook
     * starts, and a colour its rule refuses, kept from before or written by hand, leaves Facebook's
     * white.
     */
    @Test
    public void theLightRowIsReadAsFacebookStartsAndARefusedColourLeavesWhite() {
        DarkMode.answer(false);
        Settings.AMOLED_LIGHT_BACKGROUND.save("#000000");
        AmoledTheme.load();
        assertEquals("black is refused", 0xFFFFFFFF, AmoledTheme.apply(0xFFFFFFFF, AmoledThemeTest.Token.CARD_BACKGROUND));

        Settings.AMOLED_LIGHT_BACKGROUND.save("#A5A5A5");
        AmoledTheme.load();
        assertEquals("one step under the darkest grey is refused", 0xFFFFFFFF,
                AmoledTheme.apply(0xFFFFFFFF, AmoledThemeTest.Token.CARD_BACKGROUND));

        Settings.AMOLED_LIGHT_BACKGROUND.save("#FFF8E7");
        AmoledTheme.load();
        assertEquals(0xFFFFF8E7, AmoledTheme.apply(0xFFFFFFFF, AmoledThemeTest.Token.CARD_BACKGROUND));
    }

    /**
     * Facebook builds Home's feed as it starts, on the application's resources, before its first
     * activity. A loader given to each activity as it was created came too late for the feed, and
     * its page, its composer and the Reels row kept the patch's colour on a phone, so the row's
     * colour reaches the application's assets as the row is read.
     */
    @Test
    public void theApplicationsResourcesTakeTheRowsColourAsFacebookStarts() throws Exception {
        AmoledResources.useTable("7f060002=ff242526/p;7f060010=p");
        ResourcesLoader made = new ResourcesLoader();
        AmoledResources.maker = table -> made;
        Resources application = RuntimeEnvironment.getApplication().getResources();

        AmoledTheme.load();
        assertFalse("a blank row keeps the patch's colour", loaders(application).contains(made));

        Settings.AMOLED_BACKGROUND.save("#0D1117");
        AmoledTheme.load();
        assertEquals(NAVY, AmoledTheme.background());
        assertTrue(loaders(application).contains(made));
    }

    /** The loaders on {@code resources}' assets: hidden in the SDK, public in the framework Robolectric runs. */
    @SuppressWarnings("unchecked")
    private static List<ResourcesLoader> loaders(Resources resources) throws ReflectiveOperationException {
        return (List<ResourcesLoader>) Resources.class.getMethod("getLoaders").invoke(resources);
    }

    @Test
    public void theTableIsReadSortedAndAnUnreadableEntryIsLeftOut() {
        AmoledResources.Table table = AmoledResources.parse(
                "7f060010=p;7f060002=ff242526/p;zz=p;7f060005=p/x;7f060003=p/p;7f060004=p/p/p;7f060010=ff000000");
        assertArrayEquals(new int[] {0x7f060002, 0x7f060003, 0x7f060010}, table.ids);
        assertArrayEquals(new boolean[] {false, true, true}, table.defaultWritten);
        assertArrayEquals(new boolean[] {true, true, false}, table.hasNight);
        assertEquals(0xFF242526, table.defaults[0]);
        assertEquals(0, AmoledResources.parse(null).ids.length);
        assertEquals(0, AmoledResources.parse("").ids.length);
    }

    @Test
    public void theLoaderGivesTheRowsColourWhereRouteTwoWroteAndThePagesResourceToo() {
        AmoledResources.Table table = AmoledResources.parse("7f060002=ff242526/p;7f060010=p");
        int[][] given = AmoledResources.colours(table, NAVY, PAGE_ID);
        assertArrayEquals(new int[] {0x7f060002, 0x7f060010, PAGE_ID}, given[0]);
        assertArrayEquals("Facebook's default stays where route two left it", new int[] {0xFF242526, NAVY, NAVY}, given[1]);
        assertArrayEquals(new int[] {NAVY, 0, 0}, given[2]);
        assertArrayEquals(new int[] {1, 0, 0}, given[3]);

        assertEquals("a build without the page's resource", 2, AmoledResources.colours(table, NAVY, 0)[0].length);
        assertEquals("one the table lists already", 2, AmoledResources.colours(table, NAVY, 0x7f060010)[0].length);
    }

    @Test
    public void wroteAnswersForTheTablesIdsOnly() {
        AmoledResources.useTable("7f060002=ff242526/p;7f060010=p");
        assertTrue(AmoledResources.wrote(0x7f060010));
        assertFalse(AmoledResources.wrote(0x7f060011));
    }

    enum Token { WASH }

    /**
     * Patched black, the row navy: Facebook's own black stays black on route one, as routes two and
     * three leave it, while a grey and a patched colour that isn't black take the row's.
     */
    @Test
    public void facebooksBlackStaysBlackUnderTheRowsColour() {
        DarkMode.answer(true);
        AmoledTheme.useBackground(0xFF000000);
        AmoledTheme.use(NAVY, AmoledBackground.lightestStep(NAVY));
        assertEquals(0xFF000000, AmoledTheme.apply(0xFF000000, Token.WASH));
        assertEquals(NAVY, AmoledTheme.apply(0xFF101011, Token.WASH));

        int sand = 0xFF5B513F;
        AmoledTheme.useBackground(sand, AmoledBackground.lightestStep(sand));
        AmoledTheme.use(NAVY, AmoledBackground.lightestStep(NAVY));
        assertEquals("a resource still holding the patched colour", NAVY, AmoledTheme.apply(sand, Token.WASH));
        assertEquals(0xFF000000, AmoledTheme.apply(0xFF000000, Token.WASH));
    }

    /** Route three reads PAGE and PAGE_WIDE, and a long holds the colour as const-wide/32 sign-extends it. */
    @Test
    public void theRowsColourGoesWhereRouteThreeReadsIt() {
        AmoledTheme.useBackground(0xFF000000);
        AmoledTheme.use(NAVY, AmoledBackground.lightestStep(NAVY));
        assertEquals(NAVY, AmoledTheme.PAGE);
        assertEquals((long) NAVY, AmoledTheme.PAGE_WIDE);
        assertEquals(NAVY, AmoledTheme.background());
        assertEquals("the patch's colour stays what the row stands in for", 0xFF000000, AmoledTheme.written());
    }

    /** Issue #214's cream, which the Light background color row takes. */
    private static final int CREAM = 0xFFFFF8E7;
    private static final int WHITE_SURFACE = 0x7f060300;
    private static final int GREY_SURFACE = 0x7f060301;

    /** A context whose build has the light surfaces' resources the patch adds for white and #F0F2F5. */
    private static Context withLightSurfaces() {
        Map<String, Integer> named = new HashMap<>();
        named.put(AmoledResources.LIGHT_SURFACE + "ffffff", WHITE_SURFACE);
        named.put(AmoledResources.LIGHT_SURFACE + "f0f2f5", GREY_SURFACE);
        return ColourResources.context(Collections.emptyMap(), named);
    }

    /**
     * Issue #214's light screens: the patch lists Facebook's colours for the light surfaces, and with
     * the Light background color row set the table gives each surface's own resource the row's fill
     * of it, in the default configuration only, so Facebook's dark style never reads one.
     */
    @Test
    public void theLightRowGivesTheLightSurfacesResourcesItsFills() {
        AmoledResources.useLightSurfaces("f0f2f5;ffffff");
        byte[][] made = new byte[1][];
        ResourcesLoader loader = new ResourcesLoader();
        AmoledResources.maker = table -> {
            made[0] = table;
            return loader;
        };
        Context context = withLightSurfaces();

        AmoledTheme.useLight(CREAM);
        assertTrue(AmoledResources.inUse());
        AmoledResources.recolour(context);
        assertArrayEquals(ColourTable.write(context.getPackageName(), new int[] {GREY_SURFACE, WHITE_SURFACE},
                new int[] {0xFFF0EBDD, CREAM}, new int[2], new boolean[2]), made[0]);
    }

    /** The negative controls: a blank row, or a build without light surfaces, makes no table. */
    @Test
    public void aBlankLightRowOrABuildWithoutLightSurfacesMakesNoTable() {
        byte[][] made = new byte[1][];
        AmoledResources.maker = table -> {
            made[0] = table;
            return new ResourcesLoader();
        };
        Context context = withLightSurfaces();

        AmoledResources.useLightSurfaces("f0f2f5;ffffff");
        assertFalse("a blank row", AmoledResources.inUse());
        AmoledResources.recolour(context);
        assertEquals(null, made[0]);

        AmoledTheme.useLight(CREAM);
        AmoledResources.useLightSurfaces(null);
        assertFalse("no light surfaces", AmoledResources.inUse());
        AmoledResources.recolour(context);
        assertEquals(null, made[0]);

        AmoledResources.useLightSurfaces("eeeeee");
        AmoledResources.recolour(context);
        assertEquals("a surface whose resource the build doesn't have", null, made[0]);
    }

    /**
     * Both rows at once: route two's entries come first and keep theirs, and the light surfaces join
     * them. With the Light background color row blank, the table is route two's alone, as before.
     */
    @Test
    public void bothRowsShareOneTableAndTheDarkRowsAloneIsAsBefore() {
        AmoledResources.useTable("7f060002=ff242526/p;7f060010=p");
        AmoledResources.useLightSurfaces("f0f2f5;ffffff");
        byte[][] made = new byte[1][];
        AmoledResources.maker = table -> {
            made[0] = table;
            return new ResourcesLoader();
        };
        Context context = withLightSurfaces();
        AmoledTheme.forgetPageColourForTests();
        AmoledTheme.use(NAVY, AmoledBackground.lightestStep(NAVY));

        AmoledResources.recolour(context);
        int[][] dark = AmoledResources.colours(AmoledResources.parse("7f060002=ff242526/p;7f060010=p"), NAVY, -1);
        boolean[] darkNights = {true, false};
        assertArrayEquals("the Background color row alone", ColourTable.write(context.getPackageName(), dark[0], dark[1],
                dark[2], darkNights), made[0]);

        AmoledTheme.useLight(CREAM);
        AmoledResources.useLightSurfaces("f0f2f5;ffffff");
        AmoledResources.recolour(context);
        assertArrayEquals("both rows", ColourTable.write(context.getPackageName(),
                new int[] {0x7f060002, 0x7f060010, GREY_SURFACE, WHITE_SURFACE},
                new int[] {0xFF242526, NAVY, 0xFFF0EBDD, CREAM},
                new int[] {NAVY, 0, 0, 0},
                new boolean[] {true, false, false, false}), made[0]);
    }

    @Test
    public void theLightEntriesSkipAMissingResourceAndAColourThatIsntALightGrey() {
        int[][] light = AmoledResources.lightEntries(new int[] {WHITE_SURFACE, 0, GREY_SURFACE, 0x7f060302},
                new int[] {0xFFFFFFFF, 0xFFF0F2F5, 0xFFF0F2F5, 0xFFE7F3FF}, CREAM);
        assertArrayEquals(new int[] {WHITE_SURFACE, GREY_SURFACE}, light[0]);
        assertArrayEquals(new int[] {CREAM, 0xFFF0EBDD}, light[1]);

        int[][] given = AmoledResources.colours(AmoledResources.parse("7f060010=p"), NAVY, 0);
        int[][] joined = AmoledResources.joined(given, new int[][] {{0x7f060010, WHITE_SURFACE}, {CREAM, CREAM}});
        assertArrayEquals("one route two lists keeps its entry", new int[] {0x7f060010, WHITE_SURFACE}, joined[0]);
        assertArrayEquals(new int[] {NAVY, CREAM}, joined[1]);
        assertArrayEquals(new int[] {0, 0}, joined[2]);
        assertArrayEquals(new int[] {0, 0}, joined[3]);
    }

    @Test
    public void theLightSurfacesListIsReadAndAnUnreadableEntryIsLeftOut() {
        assertArrayEquals(new int[] {0xFFFFFFFF, 0xFFF0F2F5},
                AmoledResources.parseLight("ffffff;f0f2f5;zzzzzz;fff;ffffffff"));
        assertEquals(0, AmoledResources.parseLight(null).length);
        assertEquals(0, AmoledResources.parseLight("").length);
    }

    /**
     * A surface that already reads the row's fill from its resource keeps it on route one, so a
     * neutral grey row isn't filled twice; without the list, route one fills it as before.
     */
    @Test
    public void routeOneLeavesASurfaceItsResourceAlreadyFilled() {
        int grey = 0xFFD8D8D8;
        DarkMode.answer(false);
        AmoledTheme.useLight(grey);
        AmoledResources.useLightSurfaces("ffffff");
        assertTrue(AmoledResources.givesLight(grey, grey));
        assertEquals(grey, AmoledTheme.apply(grey, AmoledThemeTest.Token.CARD_BACKGROUND));

        AmoledResources.useLightSurfaces(null);
        assertFalse(AmoledResources.givesLight(grey, grey));
        assertEquals(AmoledLightBackground.fill(grey, grey), AmoledTheme.apply(grey, AmoledThemeTest.Token.CARD_BACKGROUND));
    }
}
