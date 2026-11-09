package app.hushmessenger.extension;

import static org.junit.Assert.*;

import android.content.SharedPreferences;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;

@RunWith(RobolectricTestRunner.class)
// Checked AtomicFile writes need Android's POSIX replacement primitive on the Windows host.
@Config(sdk = {28, 36})
public class MaterialYouThemeTest {

    @Before public void setup() {
        CrashGuard.resetForTests();
        Settings.initialize(RuntimeEnvironment.getApplication());
        SharedPreferences prefs = Settings.preferences;
        prefs.edit().putBoolean(MaterialYouTheme.KEY, true).putBoolean("paused", false).apply();
        Settings.installed = Set.of(MaterialYouTheme.KEY);
        MaterialYouTheme.use(TonePalette.fallback());
        MaterialYouTheme.darkModeAnswer(true);
    }

    @After public void restore() {
        MaterialYouTheme.darkModeAnswer(true);
        CrashGuard.resetForTests();
    }

    @Test public void chatBarsFollowMessengersThemeOnceItAnswers() {
        org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "answered", false);
        Settings.preferences.edit().putBoolean("light", true).commit();
        assertTrue("before an answer, Hush's Light theme decides", MaterialYouTheme.chatIsLight());
        MaterialYouTheme.darkModeAnswer(false);
        Settings.preferences.edit().putBoolean("light", false).commit();
        assertTrue("Messenger in light mode, Hush's Light theme off", MaterialYouTheme.chatIsLight());
        Settings.preferences.edit().putBoolean("light", true).commit();
        MaterialYouTheme.darkModeAnswer(true);
        assertFalse("Messenger in dark mode, Hush's Light theme on", MaterialYouTheme.chatIsLight());
        Settings.preferences.edit().remove("light").commit();
    }

    @Test public void pauseAndResumeRepublishSurfacesWithoutChangingDarkMode() {
        // Robolectric recreates the Application/preferences between tests but retains this class's static cache.
        org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", false);
        MaterialYouTheme.bind();
        int tinted = MaterialYouTheme.DARK_333334;
        assertNotEquals(0xFF333334, tinted);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertEquals(0xFF080809, MaterialYouTheme.DARK_080809);
        assertEquals(0xFF1C1C1D, MaterialYouTheme.DARK_1C1C1D);
        assertEquals(0xFF252728, MaterialYouTheme.DARK_252728);
        assertEquals(0xFF333334, MaterialYouTheme.DARK_333334);
        assertEquals(0xFF323339, MaterialYouTheme.DARK_323339);
        Settings.preferences.edit().putBoolean("paused", false).commit();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertEquals(tinted, MaterialYouTheme.DARK_333334);
        Settings.preferences.edit().putBoolean(MaterialYouTheme.KEY, false).commit();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertEquals(0xFF333334, MaterialYouTheme.DARK_333334);
    }

    @Test public void clearingSafeModeRestoresTheSavedThemeImmediately() {
        org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", false);
        Settings.preferences.edit().putBoolean("safe_mode", true).commit();
        HostScreens.start(RuntimeEnvironment.getApplication());
        MaterialYouTheme.bind();
        assertTrue(CrashGuard.isSafeMode());
        assertEquals(0xFF333334, MaterialYouTheme.DARK_333334);
        CrashGuard.clearSafeMode();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertFalse(CrashGuard.isSafeMode());
        assertNotEquals(0xFF333334, MaterialYouTheme.DARK_333334);
    }

    // --- Colour classification ---

    @Test public void pureGreyIsNeutral() {
        assertTrue(MaterialYouTheme.isNeutral(0xFF808080));
        assertTrue(MaterialYouTheme.isNeutral(0xFF000000));
        assertTrue(MaterialYouTheme.isNeutral(0xFFFFFFFF));
        assertTrue(MaterialYouTheme.isNeutral(0xFF252728)); // Messenger surface grey
    }

    @Test public void aColouredPixelIsNotNeutral() {
        assertFalse(MaterialYouTheme.isNeutral(0xFF0866FF)); // Messenger blue
        assertFalse(MaterialYouTheme.isNeutral(0xFFFF0000)); // Red
    }

    @Test public void messengerBlueIsBlue() {
        assertTrue(MaterialYouTheme.isMessengerBlue(0xFF0866FF)); // Primary blue
        assertTrue(MaterialYouTheme.isMessengerBlue(0xFF1D85FC)); // Accent blue
        assertTrue(MaterialYouTheme.isMessengerBlue(0xFF5AA7FF)); // Blue link
    }

    @Test public void redIsNotBlue() {
        assertFalse(MaterialYouTheme.isMessengerBlue(0xFFFF0000));
        assertFalse(MaterialYouTheme.isMessengerBlue(0xFF00FF00));
    }

    @Test public void darkGreyIsNotBlue() {
        assertFalse(MaterialYouTheme.isMessengerBlue(0xFF333334));
        assertFalse(MaterialYouTheme.isMessengerBlue(0xFF080809));
    }

    // --- Recolouring ---

    @Test public void aGreyIsRecolouredToTheNeutralFamily() {
        TonePalette p = TonePalette.fallback();
        int grey = 0xFF404040;
        int result = MaterialYouTheme.recolour(p, grey);
        // The result should have a different hue (neutral tint) but similar lightness
        double inputL = TonePalette.lstar(grey);
        double outputL = TonePalette.lstar(result);
        assertNotEquals("grey is recoloured", grey, result);
        assertEquals("lightness preserved", inputL, outputL, 1.0);
    }

    @Test public void aBlueIsRecolouredToTheAccentFamily() {
        TonePalette p = TonePalette.fallback();
        int blue = 0xFF0866FF;
        int result = MaterialYouTheme.recolour(p, blue);
        double inputL = TonePalette.lstar(blue);
        double outputL = TonePalette.lstar(result);
        assertNotEquals("blue is recoloured", blue, result);
        assertEquals("lightness preserved", inputL, outputL, 1.5);
    }

    @Test public void anUnrecognisedColourPassesThrough() {
        TonePalette p = TonePalette.fallback();
        int red = 0xFFFF0000;
        assertEquals("red unchanged", red, MaterialYouTheme.recolour(p, red));
    }

    // --- Mig hook ---

    @Test public void migRecoloursAGreyInDarkMode() {
        int grey = 0xFF404040;
        int result = MaterialYouTheme.mig(grey);
        assertNotEquals("grey recoloured", grey, result);
    }

    @Test public void pureBlackSwitchMakesTheDarkestBackgroundsBlackInDarkModeOnly() {
        int background = 0xFF080809;
        assertNotEquals(0xFF000000, MaterialYouTheme.mig(background));
        Settings.preferences.edit().putBoolean(MaterialYouTheme.BLACK_KEY, true).commit();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        MaterialYouTheme.use(TonePalette.fallback());
        assertEquals(0xFF000000, MaterialYouTheme.mig(background));
        assertEquals(0xFF000000, MaterialYouTheme.fds(background));
        assertEquals(0xFF000000, MaterialYouTheme.DARK_080809);
        assertNotEquals(0xFF000000, MaterialYouTheme.mig(0xFF404040));
        assertNotEquals(0xFF1C1C1D, MaterialYouTheme.DARK_1C1C1D);
        MaterialYouTheme.darkModeAnswer(false);
        assertEquals(background, MaterialYouTheme.mig(background));
        assertEquals(0xFF080809, MaterialYouTheme.DARK_080809);
        MaterialYouTheme.darkModeAnswer(true);
        Settings.preferences.edit().putBoolean(MaterialYouTheme.BLACK_KEY, false).commit();
        MaterialYouTheme.use(TonePalette.fallback());
        assertNotEquals(0xFF000000, MaterialYouTheme.DARK_080809);
    }

    @Test public void migLeavesColoursAloneInLightMode() {
        MaterialYouTheme.darkModeAnswer(false);
        int grey = 0xFF404040;
        assertEquals("light mode passthrough", grey, MaterialYouTheme.mig(grey));
    }

    @Test public void migLeavesTranslucentAlone() {
        int translucent = 0x80404040;
        assertEquals("translucent passthrough", translucent, MaterialYouTheme.mig(translucent));
    }

    // --- FDS hook ---

    @Test public void fdsRecoloursInDarkMode() {
        int grey = 0xFF333334;
        int result = MaterialYouTheme.fds(grey);
        assertNotEquals("grey recoloured via FDS", grey, result);
    }

    @Test public void fdsLeavesLightModeAlone() {
        MaterialYouTheme.darkModeAnswer(false);
        int grey = 0xFF333334;
        assertEquals("light mode passthrough", grey, MaterialYouTheme.fds(grey));
    }

    @Test public void theLightSwitchGivesLightModesBluesTheAccentAndNothingElse() {
        org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", true);
        try {
            TonePalette pink = TonePalette.fromAccent(0xFFE1306C);
            MaterialYouTheme.use(pink);
            MaterialYouTheme.darkModeAnswer(false);
            int blue = 0xFF0866FF, grey = 0xFF333334, white = 0xFFFFFFFF, translucent = 0x800866FF;
            // Off by default: light mode keeps Messenger's colors on both routes.
            for (int color : new int[] {blue, grey, white}) {
                assertEquals(color, MaterialYouTheme.fds(color));
                assertEquals(color, MaterialYouTheme.migLight(color));
            }

            Settings.preferences.edit().putBoolean(MaterialYouTheme.LIGHT_KEY, true).commit();
            int accent = pink.sameLightness(TonePalette.ACCENT, blue);
            assertNotEquals(blue, accent);
            assertEquals(accent, MaterialYouTheme.fds(blue));
            assertEquals(accent, MaterialYouTheme.migLight(blue));
            for (int color : new int[] {grey, white, translucent, 0xFFE53935}) {
                assertEquals(Integer.toHexString(color), color, MaterialYouTheme.fds(color));
                assertEquals(Integer.toHexString(color), color, MaterialYouTheme.migLight(color));
            }
            // Dark mode is unchanged by the light switch: greys still take the neutral.
            MaterialYouTheme.darkModeAnswer(true);
            assertEquals(pink.sameLightness(TonePalette.NEUTRAL, grey), MaterialYouTheme.fds(grey));
            MaterialYouTheme.darkModeAnswer(false);

            Settings.preferences.edit().putBoolean("paused", true).commit();
            assertEquals(blue, MaterialYouTheme.fds(blue));
            assertEquals(blue, MaterialYouTheme.migLight(blue));
            Settings.preferences.edit().putBoolean("paused", false).putBoolean(MaterialYouTheme.KEY, false).commit();
            assertEquals(blue, MaterialYouTheme.fds(blue));
            assertEquals(blue, MaterialYouTheme.migLight(blue));
        } finally {
            org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", false);
        }
    }

    /** #155: light mode's greys take the neutral only with their own switch on, and white and black stay. */
    @Test public void theLightGraysSwitchGivesLightModesGraysTheNeutral() {
        org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", true);
        try {
            TonePalette pink = TonePalette.fromAccent(0xFFE1306C);
            MaterialYouTheme.use(pink);
            MaterialYouTheme.darkModeAnswer(false);
            int surface = 0xFFF0F2F5, secondary = 0xFF65676B, white = 0xFFFFFFFF, black = 0xFF000000, blue = 0xFF0866FF;
            for (int color : new int[] {surface, secondary, white, black, blue}) {
                assertEquals(color, MaterialYouTheme.fds(color));
                assertEquals(color, MaterialYouTheme.migLight(color));
            }

            Settings.preferences.edit().putBoolean(MaterialYouTheme.LIGHT_GRAYS_KEY, true).commit();
            for (int grey : new int[] {surface, secondary}) {
                int tinted = pink.sameLightness(TonePalette.NEUTRAL, grey);
                assertNotEquals(grey, tinted);
                assertEquals(TonePalette.lstar(grey), TonePalette.lstar(tinted), 0.5);
                assertEquals(tinted, MaterialYouTheme.fds(grey));
                assertEquals(tinted, MaterialYouTheme.migLight(grey));
            }
            // White, black, translucent greys and the blues (with the light mode switch off) keep Messenger's colors.
            for (int color : new int[] {white, black, 0x80F0F2F5, blue}) {
                assertEquals(Integer.toHexString(color), color, MaterialYouTheme.fds(color));
                assertEquals(Integer.toHexString(color), color, MaterialYouTheme.migLight(color));
            }
            Settings.preferences.edit().putBoolean(MaterialYouTheme.LIGHT_KEY, true).commit();
            assertEquals(pink.sameLightness(TonePalette.ACCENT, blue), MaterialYouTheme.migLight(blue));

            Settings.preferences.edit().putBoolean("paused", true).commit();
            assertEquals(surface, MaterialYouTheme.fds(surface));
            assertEquals(surface, MaterialYouTheme.migLight(surface));
        } finally {
            Settings.preferences.edit().remove(MaterialYouTheme.LIGHT_GRAYS_KEY).remove(MaterialYouTheme.LIGHT_KEY).putBoolean("paused", false).commit();
            org.robolectric.util.ReflectionHelpers.setStaticField(MaterialYouTheme.class, "bound", false);
        }
    }

    // --- Palette styles (#155) ---

    private static double chroma(int color) {
        double[] lab = TonePalette.lab(color);
        return Math.hypot(lab[1], lab[2]);
    }

    /** The Lab hue in degrees, from 0 up to 360. */
    private static double hue(int color) {
        double[] lab = TonePalette.lab(color);
        double degrees = Math.toDegrees(Math.atan2(lab[2], lab[1]));
        return degrees < 0 ? degrees + 360 : degrees;
    }

    /** How far the hue turned from one colour to the other, from -180 up to 180 degrees. */
    private static double turn(int from, int to) {
        double degrees = hue(to) - hue(from);
        return degrees > 180 ? degrees - 360 : degrees <= -180 ? degrees + 360 : degrees;
    }

    @Test public void defaultAndUnknownStylesKeepThePalette() {
        TonePalette p = TonePalette.fallback();
        assertSame(p, p.styled(null));
        assertSame(p, p.styled("default"));
        assertSame("a style from a later version", p, p.styled("content"));
    }

    @Test public void everyStyleKeepsEachTonesLightness() {
        TonePalette p = TonePalette.fallback();
        for (String style : TonePalette.STYLES) {
            TonePalette styled = p.styled(style);
            for (int family = 0; family < 3; family++)
                for (int tone : TonePalette.TONES)
                    assertEquals(style + " family " + family + " tone " + tone, tone, TonePalette.lstar(styled.tone(family, tone)), 0.5);
            assertEquals(0xFF000000, styled.tone(TonePalette.ACCENT, 0));
            assertEquals(0xFFFFFFFF, styled.tone(TonePalette.NEUTRAL, 100));
        }
    }

    @Test public void eachStyleSetsHowColorfulTheFamiliesAreAndWhereTheirHuesTurn() {
        TonePalette p = TonePalette.fallback();
        int seed = p.tone(TonePalette.ACCENT, 40);
        TonePalette tonal = p.styled("tonal_spot"), neutral = p.styled("neutral"), vibrant = p.styled("vibrant"),
            expressive = p.styled("expressive"), rainbow = p.styled("rainbow"), salad = p.styled("fruit_salad"), mono = p.styled("monochrome");
        assertEquals(36, chroma(tonal.tone(TonePalette.ACCENT, 50)), 1.5);
        assertEquals(6, chroma(tonal.tone(TonePalette.NEUTRAL, 50)), 1.5);
        assertEquals(0, turn(seed, tonal.tone(TonePalette.ACCENT, 50)), 3);
        assertEquals(12, chroma(neutral.tone(TonePalette.ACCENT, 50)), 1.5);
        assertTrue(chroma(neutral.tone(TonePalette.NEUTRAL, 50)) < 3);
        assertTrue("vibrant takes all the color sRGB holds", chroma(vibrant.tone(TonePalette.ACCENT, 50)) > 60);
        assertEquals(10, chroma(vibrant.tone(TonePalette.NEUTRAL, 50)), 1.5);
        assertEquals(-120, turn(seed, expressive.tone(TonePalette.ACCENT, 50)), 3);
        assertEquals(15, turn(seed, expressive.tone(TonePalette.NEUTRAL, 50)), 5);
        assertEquals(48, chroma(rainbow.tone(TonePalette.ACCENT, 50)), 1.5);
        assertTrue(chroma(rainbow.tone(TonePalette.NEUTRAL, 50)) < 1);
        assertEquals(-50, turn(seed, salad.tone(TonePalette.ACCENT, 50)), 3);
        for (int family = 0; family < 3; family++)
            for (int tone : TonePalette.TONES) assertTrue("monochrome is grey", chroma(mono.tone(family, tone)) < 1);
    }

    @Test public void aGreyAccentTakesMessengersBlueHueInAStyle() {
        TonePalette grey = TonePalette.fromSeeds(0xFF808080, 0xFF808080);
        int accent = grey.styled("vibrant").tone(TonePalette.ACCENT, 50);
        assertTrue(chroma(accent) > 60);
        assertEquals(0, turn(ThemeFile.MESSENGER_BLUE, accent), 1);
    }

    // --- Dark surface detection ---

    @Test public void knownSurfacesAreDetected() {
        assertTrue(MaterialYouTheme.isSurface(0xFF080809));
        assertTrue(MaterialYouTheme.isSurface(0xFF1C1C1D));
        assertTrue(MaterialYouTheme.isSurface(0xFF252728));
        assertTrue(MaterialYouTheme.isSurface(0xFF333334));
        assertTrue(MaterialYouTheme.isSurface(0xFF323339));
    }

    @Test public void unknownColoursAreNotSurfaces() {
        assertFalse(MaterialYouTheme.isSurface(0xFFFF0000));
        assertFalse(MaterialYouTheme.isSurface(0xFF000000));
    }

    // --- Route 3 fields ---

    @Test public void route3FieldsArePaletteColoursInDarkMode() {
        MaterialYouTheme.darkModeAnswer(true);
        MaterialYouTheme.use(TonePalette.fallback());
        // Each field should be the palette's neutral at the original's lightness
        TonePalette p = TonePalette.fallback();
        assertEquals(p.sameLightness(TonePalette.NEUTRAL, 0xFF080809), MaterialYouTheme.DARK_080809);
        assertEquals(p.sameLightness(TonePalette.NEUTRAL, 0xFF252728), MaterialYouTheme.DARK_252728);
        assertEquals(p.sameLightness(TonePalette.NEUTRAL, 0xFF323339), MaterialYouTheme.DARK_323339);
    }

    @Test public void route3FieldsAreOriginalColoursInLightMode() {
        MaterialYouTheme.darkModeAnswer(false);
        MaterialYouTheme.use(TonePalette.fallback());
        assertEquals(0xFF080809, MaterialYouTheme.DARK_080809);
        assertEquals(0xFF1C1C1D, MaterialYouTheme.DARK_1C1C1D);
        assertEquals(0xFF252728, MaterialYouTheme.DARK_252728);
        assertEquals(0xFF333334, MaterialYouTheme.DARK_333334);
        assertEquals(0xFF323339, MaterialYouTheme.DARK_323339);
    }

    @Test public void route3FieldsAreOriginalColoursWhenSwitchIsOff() {
        Settings.preferences.edit().putBoolean(MaterialYouTheme.KEY, false).apply();
        MaterialYouTheme.use(TonePalette.fallback());
        assertEquals(0xFF080809, MaterialYouTheme.DARK_080809);
        assertEquals(0xFF1C1C1D, MaterialYouTheme.DARK_1C1C1D);
        assertEquals(0xFF252728, MaterialYouTheme.DARK_252728);
        assertEquals(0xFF333334, MaterialYouTheme.DARK_333334);
        assertEquals(0xFF323339, MaterialYouTheme.DARK_323339);
    }

    // --- Dark mode answer ---

    @Test public void darkModeAnswerReturnsWhatItIsGiven() {
        assertTrue(MaterialYouTheme.darkModeAnswer(true));
        assertFalse(MaterialYouTheme.darkModeAnswer(false));
    }

    @Test public void darkModeDefaultsToTrue() {
        // Fresh state defaults to dark
        assertTrue(MaterialYouTheme.isDarkMode());
    }

    // --- Thread safety ---

    @Test public void route3FieldsAreConsistentUnderConcurrentAccess() throws InterruptedException {
        int threads = 4;
        int rounds = 1000;
        CountDownLatch start = new CountDownLatch(1);
        AtomicInteger errors = new AtomicInteger();

        Thread[] workers = new Thread[threads];
        for (int t = 0; t < threads; t++) {
            final int id = t;
            workers[t] = new Thread(() -> {
                try {
                    start.await();
                    for (int r = 0; r < rounds; r++) {
                        // Half the threads toggle dark mode
                        if (id % 2 == 0) {
                            MaterialYouTheme.darkModeAnswer(r % 2 == 0);
                        } else {
                            // The other half read the fields
                            int d080809 = MaterialYouTheme.DARK_080809;
                            int d252728 = MaterialYouTheme.DARK_252728;
                            // Both should be opaque
                            if ((d080809 >>> 24) != 0xFF || (d252728 >>> 24) != 0xFF) {
                                errors.incrementAndGet();
                            }
                        }
                    }
                } catch (InterruptedException ignored) {}
            });
            workers[t].start();
        }

        start.countDown();
        for (Thread w : workers) w.join(5000);
        assertEquals("no transparency errors under concurrent access", 0, errors.get());
    }

    // --- Switch off ---

    @Test public void migPassesThroughWhenSwitchIsOff() {
        Settings.preferences.edit().putBoolean(MaterialYouTheme.KEY, false).apply();
        int grey = 0xFF404040;
        assertEquals("switch off passthrough", grey, MaterialYouTheme.mig(grey));
    }

}
