/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CyclicBarrier;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * The Material You theme's rules: what it recolours, that a colour keeps its lightness, and that
 * everything else, light mode included, is left as Facebook sent it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MaterialYouThemeTest {
    /**
     * Stands in for Facebook's FDS token enum: only the constant names matter. The light values in
     * {@link #LIGHT} are the ones Facebook 580's light theme gives these tokens.
     */
    enum Token {
        WASH, SURFACE_BACKGROUND, CARD_BACKGROUND, PRIMARY_TEXT, SECONDARY_TEXT, DIVIDER, BLUE_LINK,
        PRIMARY_ICON, TOGGLE_ACTIVE_BACKGROUND, REACTION_LIKE, ACCENT
    }

    /** Dark values from Facebook 580's dark FDS style, one per token above. */
    private static final int[] DARK = {0xFF101011, 0xFF252728, 0xFF333334, 0xFFF2F4F7, 0xFFB0B3B8,
            0xFF65686C, 0xFF5AA7FF, 0xFFF2F4F7, 0xFF1D85FC, 0xFF3E93F8, 0xFF0866FF};

    /** Light values from Facebook 580's light FDS style, one per token above. */
    private static final int[] LIGHT = {0xFFC9CCD1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFF080809, 0xFF65686C,
            0xFFD0D3D7, 0xFF0064D1, 0xFF080809, 0xFFEBF5FF, 0xFF0866FF, 0xFF0866FF};

    private TonePalette palette;

    @Before
    public void usePalette() {
        palette = TonePalette.fallback();
        MaterialYouTheme.use(palette, false);
    }

    @After
    public void restore() {
        DarkMode.answer(true);
        MaterialYouTheme.use(TonePalette.fallback(), false);
    }

    @Test
    public void aTokensDarkColourTakesThePaletteAtTheSameLightness() {
        for (Token token : new Token[]{Token.WASH, Token.SURFACE_BACKGROUND, Token.CARD_BACKGROUND,
                Token.PRIMARY_TEXT, Token.SECONDARY_TEXT, Token.DIVIDER, Token.PRIMARY_ICON}) {
            int dark = DARK[token.ordinal()];
            int drawn = MaterialYouTheme.fds(dark, token);
            assertNotEquals(token + " kept Facebook's grey", dark, drawn);
            assertSameLightness(token.name(), dark, drawn);
            assertEquals(token + " is the palette's neutral", palette.sameLightness(TonePalette.NEUTRAL, dark), drawn);
        }
        for (Token token : new Token[]{Token.BLUE_LINK, Token.TOGGLE_ACTIVE_BACKGROUND}) {
            int dark = DARK[token.ordinal()];
            int drawn = MaterialYouTheme.fds(dark, token);
            assertEquals(token + " is the palette's accent", palette.sameLightness(TonePalette.ACCENT, dark), drawn);
            assertSameLightness(token.name(), dark, drawn);
        }
    }

    /** Light mode: every token keeps the colour Facebook's light theme gives it. */
    @Test
    public void lightModeKeepsFacebooksColours() {
        for (Token token : Token.values()) {
            int light = LIGHT[token.ordinal()];
            assertEquals(token + " changed in light mode", light, MaterialYouTheme.fds(light, token));
        }
    }

    /** The mutation controls: what isn't a token's own dark colour is left alone. */
    @Test
    public void anythingItDoesntKnowFailsOpen() {
        assertEquals("a token that isn't listed (a reaction)", 0xFF3E93F8, MaterialYouTheme.fds(0xFF3E93F8, Token.REACTION_LIKE));
        assertEquals("the same blue in both themes can't say which one is on", 0xFF0866FF,
                MaterialYouTheme.fds(0xFF0866FF, Token.ACCENT));
        assertEquals("another token's dark colour", 0xFF101011, MaterialYouTheme.fds(0xFF101011, Token.SURFACE_BACKGROUND));
        assertEquals("no enum to name the token", 0xFF252728, MaterialYouTheme.fds(0xFF252728, "SURFACE_BACKGROUND"));
        assertEquals("a translucent colour", 0x80252728, MaterialYouTheme.fds(0x80252728, Token.SURFACE_BACKGROUND));
        assertEquals("a colour a server picked for this token", 0xFF123456, MaterialYouTheme.fds(0xFF123456, Token.WASH));
    }

    /** The Mig dark scheme only answers dark mode, so its greys and blues follow the palette. */
    @Test
    public void theMigDarkSchemeRecoloursGreysAndBlues() {
        int grey = 0xFF3A3B3C;
        assertEquals(palette.sameLightness(TonePalette.NEUTRAL, grey), MaterialYouTheme.mig(grey, null));
        assertSameLightness("a Mig grey", grey, MaterialYouTheme.mig(grey, null));
        int blue = 0xFF2D88FF;
        assertEquals(palette.sameLightness(TonePalette.ACCENT, blue), MaterialYouTheme.mig(blue, null));
        assertEquals("red keeps its colour", 0xFFF02849, MaterialYouTheme.mig(0xFFF02849, null));
        assertEquals("green keeps its colour", 0xFF45BD62, MaterialYouTheme.mig(0xFF45BD62, null));
        assertEquals("a scrim keeps its colour", 0x66000000, MaterialYouTheme.mig(0x66000000, null));
        assertEquals("white stays white", 0xFFFFFFFF, MaterialYouTheme.mig(0xFFFFFFFF, null));
        assertEquals("black stays black", 0xFF000000, MaterialYouTheme.mig(0xFF000000, null));
    }

    /**
     * The status bar on Android 15 and newer. Facebook's dark chrome greys take the palette at the
     * same lightness, whichever token they came from, and only when Facebook's own check says the
     * theme is dark: light mode asks the Video tab's token for the same #333334.
     */
    @Test
    public void theStatusBarTakesThePaletteInTheDarkThemeOnly() {
        for (int grey : new int[]{0xFF252728, 0xFF333334, 0xFF3A3B3C, 0xFF18191A}) {
            int painted = MaterialYouTheme.statusBar(grey, true, false);
            assertNotEquals(Integer.toHexString(grey) + " kept Facebook's grey", grey, painted);
            assertEquals(Integer.toHexString(grey), palette.sameLightness(TonePalette.NEUTRAL, grey), painted);
            assertSameLightness(Integer.toHexString(grey), grey, painted);
            assertEquals(Integer.toHexString(grey) + " changed in light mode", grey, MaterialYouTheme.statusBar(grey, false, false));
        }
        assertEquals("black stays black", 0xFF000000, MaterialYouTheme.statusBar(0xFF000000, true, false));
    }

    /** The controls: what isn't one of Facebook's dark chrome greys keeps its colour in the dark theme too. */
    @Test
    public void aStatusBarColourItDoesntKnowFailsOpen() {
        assertEquals("edge to edge", 0x00000000, MaterialYouTheme.statusBar(0x00000000, true, false));
        assertEquals("a translucent scrim", 0x80333334, MaterialYouTheme.statusBar(0x80333334, true, false));
        assertEquals("above the bar threshold", 0xFF4B4C4F, MaterialYouTheme.statusBar(0xFF4B4C4F, true, false));
        assertEquals("a dark colour with a hue", 0xFF1A2A10, MaterialYouTheme.statusBar(0xFF1A2A10, true, false));
        assertEquals("a blue bar", 0xFF0866FF, MaterialYouTheme.statusBar(0xFF0866FF, true, false));
        assertEquals("a white bar", 0xFFFFFFFF, MaterialYouTheme.statusBar(0xFFFFFFFF, true, false));
    }

    /** With AMOLED in the build its rule goes first, and its black is no grey the palette takes. */
    @Test
    public void withAmoledTheStatusBarKeepsAmoledsBlack() {
        assertEquals("the Video tab's bar", 0xFF000000, MaterialYouTheme.statusBar(0xFF333334, true, true));
        assertEquals("the home bar", 0xFF000000, MaterialYouTheme.statusBar(0xFF252728, true, true));
        assertEquals("light mode", 0xFF333334, MaterialYouTheme.statusBar(0xFF333334, false, true));
        assertEquals("unpatched, the hook runs as without AMOLED", MaterialYouTheme.statusBar(0xFF333334, true, false),
                MaterialYouTheme.statusBar(0xFF333334, true));
    }

    /**
     * The Video tab writes #252728 for its bars in both themes, and route three leaves it for the bar
     * hooks: light mode keeps Facebook's colour, the dark theme takes the palette's.
     */
    @Test
    public void theVideoTabsWrittenBarColourKeepsFacebooksColourInLightMode() {
        assertEquals("status bar", 0xFF252728, MaterialYouTheme.statusBar(0xFF252728, false, false));
        assertEquals("navigation bar", 0xFF252728, MaterialYouTheme.navigationBar(0xFF252728, false, false));
        assertEquals("with AMOLED", 0xFF252728, MaterialYouTheme.navigationBar(0xFF252728, false, true));
        assertEquals("navigation bar, dark", palette.sameLightness(TonePalette.NEUTRAL, 0xFF252728),
                MaterialYouTheme.navigationBar(0xFF252728, true, false));
    }

    /** The navigation bar keeps route three's band: a sheet's lighter grey and anything else keep theirs. */
    @Test
    public void aNavigationBarColourOutsideTheBandFailsOpen() {
        assertEquals("a sheet's grey", 0xFF333334, MaterialYouTheme.navigationBar(0xFF333334, true, false));
        assertEquals("translucent", 0x26C9CCD1, MaterialYouTheme.navigationBar(0x26C9CCD1, true, false));
        assertEquals("a dark colour with a hue", 0xFF1A2A10, MaterialYouTheme.navigationBar(0xFF1A2A10, true, false));
        assertEquals("a white bar", 0xFFFFFFFF, MaterialYouTheme.navigationBar(0xFFFFFFFF, true, false));
        assertEquals("black stays black", 0xFF000000, MaterialYouTheme.navigationBar(0xFF000000, true, false));
        assertEquals("with AMOLED, its black", 0xFF000000, MaterialYouTheme.navigationBar(0xFF252728, true, true));
    }

    @Test
    public void aServerColourIsRecolouredOnlyWhenItIsAKnownDarkSurface() {
        assertEquals(palette.sameLightness(TonePalette.NEUTRAL, 0xFF252728), MaterialYouTheme.parseColor("#FF252728"));
        assertEquals(palette.sameLightness(TonePalette.NEUTRAL, 0xFF242526), MaterialYouTheme.parseColor("#242526"));
        assertEquals("an unknown colour", 0xFF123456, MaterialYouTheme.parseColor("#123456"));
        assertEquals("a grey that is also a light-mode colour", 0xFF333334, MaterialYouTheme.parseColor("#333334"));
        assertEquals("white", 0xFFFFFFFF, MaterialYouTheme.parseColor("#FFFFFF"));
        assertEquals("a translucent surface", 0x80252728, MaterialYouTheme.parseColor("#80252728"));
    }

    @Test(expected = IllegalArgumentException.class)
    public void aServerStringThatIsNoColourThrowsAsBefore() {
        MaterialYouTheme.parseColor("not a colour");
    }

    /** Route three reads these fields where Facebook wrote the colours, so they hold the palette's. */
    @Test
    public void theLiteralFieldsHoldThePalettesSurfaces() {
        int[] written = {0xFF101011, 0xFF18191A, 0xFF1C1C1D, 0xFF242526, 0xFF252728, 0xFF3E4042};
        int[] read = {MaterialYouTheme.DARK_101011, MaterialYouTheme.DARK_18191A, MaterialYouTheme.DARK_1C1C1D,
                MaterialYouTheme.DARK_242526, MaterialYouTheme.DARK_252728, MaterialYouTheme.DARK_3E4042};
        for (int i = 0; i < written.length; i++) {
            assertEquals(palette.sameLightness(TonePalette.NEUTRAL, written[i]), read[i]);
            assertSameLightness(Integer.toHexString(written[i]), written[i], read[i]);
            assertTrue(MaterialYouTheme.isSurface(written[i]));
        }
        String[] listed = MaterialYouTheme.SURFACES.split(" ");
        assertEquals("a surface without a field, or a field without a surface", written.length, listed.length);

        TonePalette other = new TonePalette(new int[][]{shifted(0), shifted(1), shifted(2)}, true);
        MaterialYouTheme.use(other, false);
        assertEquals("the fields follow a new palette", other.sameLightness(TonePalette.NEUTRAL, 0xFF252728),
                MaterialYouTheme.DARK_252728);
    }

    /**
     * Facebook answers whether dark mode is on from whatever thread asks, a feed request or an app
     * job as well as the UI, and the answer's thread writes route three's fields that the UI thread
     * reads. So each field is volatile.
     */
    @Test
    public void routeThreesFieldsAreSafeToReadFromAnyThread() throws Exception {
        for (String field : MaterialYouTheme.SURFACES.split(" ")) {
            int modifiers = MaterialYouTheme.class.getField("DARK_" + field).getModifiers();
            assertTrue("DARK_" + field + " isn't volatile", Modifier.isVolatile(modifiers));
        }
    }

    /**
     * Answers that change dark mode at the same moment, from several threads: once they're done, all
     * six fields hold the colours of the answer that stands, none of them left from the other mode.
     */
    @Test
    public void routeThreesFieldsFollowTheAnswerThatStandsWhenAnswersRace() throws Exception {
        int threads = 4;
        ExecutorService pool = Executors.newFixedThreadPool(threads);
        try {
            for (int round = 0; round < 10000; round++) {
                CyclicBarrier start = new CyclicBarrier(threads);
                List<Future<?>> answers = new ArrayList<>();
                for (int t = 0; t < threads; t++) {
                    boolean first = t % 2 == 0;
                    answers.add(pool.submit(() -> {
                        start.await();
                        for (int i = 0; i < 200; i++) DarkMode.answer(first == (i % 2 == 0));
                        return null;
                    }));
                }
                for (Future<?> answer : answers) answer.get();

                boolean dark = DarkMode.on();
                int[] read = {MaterialYouTheme.DARK_101011, MaterialYouTheme.DARK_18191A, MaterialYouTheme.DARK_1C1C1D,
                        MaterialYouTheme.DARK_242526, MaterialYouTheme.DARK_252728, MaterialYouTheme.DARK_3E4042};
                String[] surfaces = MaterialYouTheme.SURFACES.split(" ");
                for (int i = 0; i < read.length; i++) {
                    int facebook = 0xFF000000 | Integer.parseInt(surfaces[i], 16);
                    assertEquals("round " + round + ", " + (dark ? "dark" : "light") + " mode, #" + surfaces[i],
                            dark ? palette.sameLightness(TonePalette.NEUTRAL, facebook) : facebook, read[i]);
                }
            }
        } finally {
            pool.shutdownNow();
        }
    }

    /**
     * Light mode on the Video tab. The tab stays dark there: its themed context asks FDS's dark style,
     * whose surface is the #252728 of dark mode, its bottom bar reads that colour's resource, and its
     * top bar writes it into code. With Facebook's own dark mode off, a colour from the forced-dark
     * Video context keeps its value on every route.
     */
    @Test
    public void lightModeKeepsAColourFromTheForcedDarkVideoContext() {
        DarkMode.answer(false);
        Context context = ColourResources.context(Collections.singletonMap(ColourResources.VIDEO_BAR, 0xFF252728));

        assertEquals("a resolver's colour", 0xFF252728, MaterialYouTheme.fds(0xFF252728, Token.SURFACE_BACKGROUND));
        assertEquals("the Mig dark scheme", 0xFF3A3B3C, MaterialYouTheme.mig(0xFF3A3B3C, null));
        assertEquals("the bottom bar, Context.getColor", 0xFF252728,
                MaterialYouTheme.getColor(context, ColourResources.VIDEO_BAR, false));
        assertEquals("Resources.getColor", 0xFF252728,
                MaterialYouTheme.getColor(context.getResources(), ColourResources.VIDEO_BAR, false));
        assertEquals("a server colour", 0xFF252728, MaterialYouTheme.parseColor("#FF252728"));
        assertEquals("a colour written in code", 0xFF252728, MaterialYouTheme.DARK_252728);
        assertEquals("another written in code", 0xFF101011, MaterialYouTheme.DARK_101011);
    }

    /**
     * Dark mode on the Video tab: the bottom bar Facebook reads straight from its #252728 resource
     * takes the palette, as Home's bar does through a token. With AMOLED in the build its black stays.
     */
    @Test
    public void darkModeTintsTheVideoTabsBottomBar() {
        DarkMode.answer(false);
        DarkMode.answer(true);
        Context context = ColourResources.context(Collections.singletonMap(ColourResources.VIDEO_BAR, 0xFF252728));
        int tinted = palette.sameLightness(TonePalette.NEUTRAL, 0xFF252728);

        assertEquals("the bottom bar", tinted, MaterialYouTheme.getColor(context, ColourResources.VIDEO_BAR, false));
        assertEquals("Resources.getColor with a theme", tinted,
                MaterialYouTheme.getColor(context.getResources(), ColourResources.VIDEO_BAR, context.getTheme(), false));
        assertEquals("the fields hold the palette's again", tinted, MaterialYouTheme.DARK_252728);
        assertEquals("a colour that is no dark surface", 0xFFFFFFFF,
                MaterialYouTheme.getColor(context, android.R.color.white, false));

        Context amoled = ColourResources.context(Collections.singletonMap(ColourResources.VIDEO_BAR, 0xFF000000));
        assertEquals("AMOLED's black", 0xFF000000, MaterialYouTheme.getColor(amoled, ColourResources.VIDEO_BAR, true));
    }

    /** The tokens of the bars at the bottom of the screen. */
    enum Bar { TAB_BAR_BACKGROUND, NAV_BAR_BACKGROUND }

    /**
     * The navigation area on Android 15 and newer. In dark mode the tab bar sets the window's
     * navigation bar colour for every tab from the Video tab's #252728 resource, and with three-button
     * navigation the system draws that colour at 80% over Facebook's own navigation bar view. Both
     * layers take the palette colour the tab bar above them takes, so the strip is the tab bar's
     * colour. Light mode keeps Facebook's, and with AMOLED the black stays.
     */
    @Test
    public void theNavigationAreaTakesTheTabBarsColourInDarkMode() {
        Context context = ColourResources.context(Collections.singletonMap(ColourResources.VIDEO_BAR, 0xFF252728));
        int tabBar = MaterialYouTheme.fds(0xFF252728, Bar.TAB_BAR_BACKGROUND);
        int view = MaterialYouTheme.fds(0xFF252728, Bar.NAV_BAR_BACKGROUND);
        int window = MaterialYouTheme.getColor(context, ColourResources.VIDEO_BAR, false);

        assertNotEquals("the tab bar kept Facebook's grey", 0xFF252728, tabBar);
        assertEquals("Facebook's navigation bar view", tabBar, view);
        assertEquals("the window's navigation bar colour", tabBar, window);
        assertEquals("the strip", tabBar, overAt80(window, view));
        // The S22's reading with the read left alone, the tab bar at (37,38,44): (37,39,41).
        assertEquals(0xFF252729, overAt80(0xFF252728, 0xFF25262C));

        DarkMode.answer(false);
        assertEquals("light mode", 0xFF252728, MaterialYouTheme.getColor(context, ColourResources.VIDEO_BAR, false));
        DarkMode.answer(true);
        Context amoled = ColourResources.context(Collections.singletonMap(ColourResources.VIDEO_BAR, 0xFF000000));
        assertEquals("AMOLED's black", 0xFF000000, MaterialYouTheme.getColor(amoled, ColourResources.VIDEO_BAR, true));
    }

    /** DecorView's navigation bar scrim on Android 15 and newer: the bar's colour at alpha 0xCC over {@code below}. */
    private static int overAt80(int bar, int below) {
        int out = 0xFF000000;
        for (int shift = 0; shift <= 16; shift += 8) {
            int mixed = (((bar >> shift) & 0xFF) * 0xCC + ((below >> shift) & 0xFF) * (0xFF - 0xCC) + 127) / 0xFF;
            out |= mixed << shift;
        }
        return out;
    }

    @Test
    public void facebooksBluesAreBluesAndItsGreysGreys() {
        for (int blue : new int[]{0xFF0866FF, 0xFF1D85FC, 0xFF5AA7FF, 0xFF75B6FF, 0xFFADD5FF, 0xFF3E93F8, 0xFF0064D1, 0xFF00488C, 0xFF1877F2}) {
            assertTrue(Integer.toHexString(blue), MaterialYouTheme.isFacebookBlue(blue));
            assertFalse(Integer.toHexString(blue), MaterialYouTheme.isNeutral(blue));
        }
        for (int other : new int[]{0xFFF02849, 0xFF45BD62, 0xFF7D74FF, 0xFF14B898, 0xFF252728, 0xFFB0B3B8, 0xFF1C2B33}) {
            assertFalse(Integer.toHexString(other), MaterialYouTheme.isFacebookBlue(other));
        }
        for (int grey : new int[]{0xFF101011, 0xFF252728, 0xFF65686C, 0xFFB0B3B8, 0xFFF2F4F7, 0xFF46484B}) {
            assertTrue(Integer.toHexString(grey), MaterialYouTheme.isNeutral(grey));
        }
    }

    /** Android 11 has no wallpaper palette, so the fixed one is what it gets. */
    @Test
    public void android11GetsTheFixedPalette() {
        Context context = RuntimeEnvironment.getApplication();
        TonePalette phone = TonePalette.of(context);
        assertFalse(phone.dynamic);
        TonePalette fixed = TonePalette.fallback();
        for (int family = 0; family < 3; family++) {
            for (int tone : TonePalette.TONES) assertEquals(fixed.tone(family, tone), phone.tone(family, tone));
        }
        // Tones of Facebook's blue, as Material's colour utilities build them.
        assertEquals(0xFF1A1B21, fixed.tone(TonePalette.NEUTRAL, 10));
        assertEquals(0xFFE3E2E9, fixed.tone(TonePalette.NEUTRAL, 90));
        assertEquals(0xFFB3C5FF, fixed.tone(TonePalette.ACCENT, 80));
        assertEquals(0xFF4A5C92, fixed.tone(TonePalette.ACCENT, 40));
    }

    /** Android 12 and newer: the wallpaper palette, read from the framework's system colours. */
    @Test
    @Config(sdk = 34)
    public void android12AndNewerReadTheWallpaperPalette() {
        Context context = RuntimeEnvironment.getApplication();
        TonePalette phone = TonePalette.of(context);
        assertTrue(phone.dynamic);
        assertEquals(context.getColor(android.R.color.system_neutral1_900), phone.tone(TonePalette.NEUTRAL, 10));
        assertEquals(context.getColor(android.R.color.system_neutral2_200), phone.tone(TonePalette.NEUTRAL_VARIANT, 80));
        assertEquals(context.getColor(android.R.color.system_accent1_600), phone.tone(TonePalette.ACCENT, 40));
        assertEquals(context.getColor(android.R.color.system_accent1_0), phone.tone(TonePalette.ACCENT, 100));

        MaterialYouTheme.use(phone, false);
        int drawn = MaterialYouTheme.fds(0xFF252728, Token.SURFACE_BACKGROUND);
        assertEquals(phone.sameLightness(TonePalette.NEUTRAL, 0xFF252728), drawn);
        assertSameLightness("a surface in the wallpaper palette", 0xFF252728, drawn);
    }

    /** Lightness is what keeps contrast, so it holds for every colour the theme maps, in any palette. */
    @Test
    public void everyMappedColourKeepsItsLightness() {
        for (TonePalette each : new TonePalette[]{TonePalette.fallback(),
                new TonePalette(new int[][]{shifted(0), shifted(1), shifted(2)}, true)}) {
            for (String entry : MaterialYouTheme.FDS_DARK.split(";")) {
                for (String hex : entry.substring(entry.indexOf('=') + 1).split(",")) {
                    int dark = 0xFF000000 | Integer.parseInt(hex, 16);
                    assertSameLightness(entry, dark, MaterialYouTheme.recolour(each, dark));
                }
            }
        }
    }

    private static void assertSameLightness(String what, int before, int after) {
        double difference = Math.abs(TonePalette.lstar(before) - TonePalette.lstar(after));
        assertTrue(what + ": L* moved by " + difference, difference <= 0.6);
    }

    /**
     * A palette of another hue, standing in for a phone's: the tonal spot palette of #B3261E (a red
     * seed, hue 26), as Material's colour utilities build it.
     */
    private static int[] shifted(int family) {
        return PalettesForTests.RED[family];
    }
}
