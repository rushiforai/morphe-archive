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
