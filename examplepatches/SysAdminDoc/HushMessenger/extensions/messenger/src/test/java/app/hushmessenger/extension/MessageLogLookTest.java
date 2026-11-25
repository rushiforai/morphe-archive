package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** #200: the message log in Messenger's own chat colors, readable in every theme, with Messenger's blank faces. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageLogLookTest {
    private static final double READABLE = 4.5;

    @Test public void withMaterialYouOffItsMessengersOwnGreysAndBlue() {
        MessageLogLook dark = new MessageLogLook(false, null, true, true, true);
        assertEquals(0xFF1C1C1D, dark.ground);
        assertEquals(0xFF333334, dark.raised);
        assertEquals(0xFF0866FF, dark.fill);
        MessageLogLook light = new MessageLogLook(true, null, true, true, true);
        assertEquals(0xFFFFFFFF, light.ground);
        assertEquals(0xFFF0F0F0, light.raised);
        assertEquals(0xFF0866FF, light.fill);
    }

    @Test public void pureBlackOnlyWithMaterialYousSwitchInDarkMode() {
        TonePalette palette = TonePalette.fallback();
        assertEquals(0xFF000000, new MessageLogLook(false, palette, true, false, false).ground);
        assertNotEquals(0xFF000000, new MessageLogLook(false, palette, false, false, false).ground);
        assertNotEquals(0xFF000000, new MessageLogLook(false, null, true, false, false).ground);
        assertEquals("light mode stays light", 0xFFFFFFFF, new MessageLogLook(true, palette, true, false, false).ground);
    }

    @Test public void materialYouRecolorsLightModeOnlyWithItsLightSwitches() {
        TonePalette palette = TonePalette.fromAccent(0xFF2E7D32);
        MessageLogLook plain = new MessageLogLook(true, palette, false, false, false);
        MessageLogLook stock = new MessageLogLook(true, null, false, false, false);
        assertEquals(stock.raised, plain.raised);
        assertEquals(stock.fill, plain.fill);
        assertEquals(stock.link, plain.link);
        MessageLogLook greys = new MessageLogLook(true, palette, false, false, true);
        assertEquals(palette.sameLightness(TonePalette.NEUTRAL, 0xFFF0F0F0), greys.raised);
        assertEquals(stock.fill, greys.fill);
        MessageLogLook blues = new MessageLogLook(true, palette, false, true, false);
        assertNotEquals(stock.fill, blues.fill);
        assertEquals(stock.raised, blues.raised);
        // Dark mode always takes the palette, as Material You recolors Messenger's dark mode.
        assertEquals(palette.sameLightness(TonePalette.NEUTRAL, 0xFF333334), new MessageLogLook(false, palette, false, false, false).raised);
    }

    @Test public void everyWordReadsOnWhatItSitsOnInEveryTheme() {
        List<TonePalette> palettes = new ArrayList<>();
        palettes.add(null);
        palettes.add(TonePalette.fallback());
        for (int seed : new int[] {0xFFFFEB3B, 0xFFE91E63, 0xFF00BCD4, 0xFF4CAF50, 0xFF9E9E9E, 0xFF3F51B5})
            palettes.add(TonePalette.fromAccent(seed));
        List<String> bad = new ArrayList<>();
        for (TonePalette palette : palettes) for (boolean light : new boolean[] {false, true}) for (int switches = 0; switches < 8; switches++) {
            MessageLogLook look = new MessageLogLook(light, palette, (switches & 1) != 0, (switches & 2) != 0, (switches & 4) != 0);
            String which = (palette == null ? "stock" : Integer.toHexString(palette.sameLightness(TonePalette.ACCENT, 0xFF0866FF))) +
                (light ? " light " : " dark ") + switches;
            check(bad, which + " text on ground", look.text, look.ground);
            check(bad, which + " text in a bubble", look.text, look.raised);
            check(bad, which + " text on a picked chip", look.text, look.picked);
            check(bad, which + " muted on ground", look.muted, look.ground);
            check(bad, which + " muted in a chip", look.muted, look.raised);
            check(bad, which + " link on ground", look.link, look.ground);
            check(bad, which + " link in a chip", look.link, look.raised);
            check(bad, which + " picked chip's words", look.pickedText, look.picked);
            check(bad, which + " white on the blue", look.onFill, look.fill);
            check(bad, which + " error on ground", look.error, look.ground);
            check(bad, which + " error in a button", look.error, look.raised);
        }
        assertTrue(String.join("\n", bad), bad.isEmpty());
    }

    private static void check(List<String> bad, String what, int color, int ground) {
        double contrast = MessageLogLook.contrast(color, ground);
        if (contrast < READABLE) bad.add(what + ": " + String.format(java.util.Locale.ROOT, "%.2f", contrast));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aBlankFaceIsMessengersHeadAndShouldersInACircle() {
        Bitmap face = draw(new MessageLogFace(0xFF4E4F50, 0xFF8A8D91, 0xFF1C1C1D, false));
        assertColor(0xFF8A8D91, face, 50, 39);
        assertColor("the shoulders", 0xFF8A8D91, face, 50, 92);
        assertColor("the circle over the head", 0xFF4E4F50, face, 50, 8);
        assertColor("the gap at the neck", 0xFF4E4F50, face, 50, 60);
        assertEquals("round: the corners are clear", 0, Color.alpha(face.getPixel(3, 3)));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aGroupWithoutAPictureGetsTwoBlankFacesOneInFront() {
        Bitmap group = draw(new MessageLogFace(0xFF4E4F50, 0xFF8A8D91, 0xFF112233, true));
        // The one behind, up at the end, and the one in front, down at the start: each with its head.
        assertColor(0xFF8A8D91, group, 66, 27);
        assertColor(0xFF8A8D91, group, 34, 59);
        // The front face's ring parts it from the one behind.
        assertColor("the ring", 0xFF112233, group, 59, 41);
        assertEquals(0, Color.alpha(group.getPixel(95, 95)));
        assertEquals(0, Color.alpha(group.getPixel(5, 5)));
    }

    @Test @Config(sdk = 36) @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aKeptPictureFillsTheCircleInsteadOfTheBlankFace() {
        MessageLogFace face = new MessageLogFace(0xFF4E4F50, 0xFF8A8D91, 0xFF1C1C1D, true);
        Bitmap wide = Bitmap.createBitmap(64, 32, Bitmap.Config.ARGB_8888);
        wide.eraseColor(Color.RED);
        face.setPicture(wide);
        assertTrue(face.hasPicture());
        Bitmap shown = draw(face);
        assertColor(Color.RED, shown, 50, 50);
        assertColor("cut to the middle, filling the circle", Color.RED, shown, 50, 3);
        assertEquals(0, Color.alpha(shown.getPixel(3, 3)));
        face.setPicture(null);
        assertFalse(face.hasPicture());
    }

    private static Bitmap draw(MessageLogFace face) {
        Bitmap bitmap = Bitmap.createBitmap(100, 100, Bitmap.Config.ARGB_8888);
        face.setBounds(0, 0, 100, 100);
        face.draw(new Canvas(bitmap));
        return bitmap;
    }

    private static void assertColor(int expected, Bitmap bitmap, int x, int y) {
        assertColor("at " + x + "," + y, expected, bitmap, x, y);
    }

    private static void assertColor(String what, int expected, Bitmap bitmap, int x, int y) {
        int seen = bitmap.getPixel(x, y);
        String message = what + ": " + Integer.toHexString(seen);
        assertEquals(message, 255, Color.alpha(seen));
        assertTrue(message, Math.abs(Color.red(seen) - Color.red(expected)) < 12);
        assertTrue(message, Math.abs(Color.green(seen) - Color.green(expected)) < 12);
        assertTrue(message, Math.abs(Color.blue(seen) - Color.blue(expected)) < 12);
    }
}
