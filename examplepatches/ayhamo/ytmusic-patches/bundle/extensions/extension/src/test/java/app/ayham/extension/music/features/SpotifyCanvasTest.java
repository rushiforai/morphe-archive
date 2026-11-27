package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class SpotifyCanvasTest {
    @Test
    public void totpIsSixDigitsPerThirtySeconds() throws Exception {
        long t = 1_763_400_000_000L;
        String a = SpotifyCanvas.totp(t);
        assertTrue(a, a.matches("[0-9]{6}"));
        assertEquals(a, SpotifyCanvas.totp(t - t % 30_000 + 29_999));
        assertFalse(a.equals(SpotifyCanvas.totp(t + 30_000)) && a.equals(SpotifyCanvas.totp(t + 60_000)));
    }

    @Test
    public void matchesLikeMetrolist() {
        assertTrue(SpotifyCanvas.matches("Poker Face", "Lady Gaga", null, 0, "Poker Face", "Lady Gaga", null, 0, "Lady Gaga", "Lady Gaga"));
        // the primary artist is enough when the others differ
        assertTrue(SpotifyCanvas.matches("Midnight Sun", "Zara Larsson & Muni Long", null, 0, "Midnight Sun", "Zara Larsson, Muni Long",
                null, 0, "Zara Larsson", "Zara Larsson"));
        // another artist's song of the same name
        assertFalse(SpotifyCanvas.matches("Midnight Sun", "Zara Larsson", null, 0, "Midnight Sun", "Nils Frahm", null, 0, "Zara Larsson", "Nils Frahm"));
        // title words under 75%
        assertFalse(SpotifyCanvas.matches("Poker Face", "Lady Gaga", null, 0, "Poker Face - Live at the Arena", "Lady Gaga", null, 0, "Lady Gaga", "Lady Gaga"));
        // lengths more than 10 s apart
        assertFalse(SpotifyCanvas.matches("Poker Face", "Lady Gaga", null, 237_000, "Poker Face", "Lady Gaga", null, 260_000, "Lady Gaga", "Lady Gaga"));
        // "official video" words are left out
        assertTrue(SpotifyCanvas.matches("Poker Face (Official Video)", "Lady Gaga", null, 0, "Poker Face", "Lady Gaga", null, 0, null, null));
    }

    @Test
    public void onlySpotifyMediaOverHttps() {
        assertTrue(SpotifyCanvas.trusted("https://canvaz.scdn.co/upload/artist/x/video/y.cnvs.mp4"));
        assertFalse(SpotifyCanvas.trusted("http://canvaz.scdn.co/a.mp4"));
        assertFalse(SpotifyCanvas.trusted("https://scdn.co.evil.com/a.mp4"));
        assertFalse(SpotifyCanvas.trusted("https://user@canvaz.scdn.co/a.mp4"));
        assertFalse(SpotifyCanvas.trusted("https://canvaz.scdn.co:8443/a.mp4"));
        assertFalse(SpotifyCanvas.trusted(null));
    }

    private static int[] frame(int w, int h, int bar) {
        int[] px = new int[w * h];
        for (int y = 0; y < h; y++)
            for (int x = 0; x < w; x++)
                px[y * w + x] = y < bar || y >= h - bar ? 0xFF000000 : 0xFF808080 + ((x * 7 + y * 3) & 0x3F);
        return px;
    }

    @Test
    public void letterboxZoomTakesBarsOff() {
        // a 16:9 sample (48x27) with a 2.4:1 picture inside: bars of 3 rows each
        assertEquals(27f / 21f, AnimatedCover.letterboxZoom(frame(48, 27, 3), 48, 27), 0.001f);
        assertEquals(1f, AnimatedCover.letterboxZoom(frame(48, 27, 0), 48, 27), 0f);
        // bars too tall (over a third) are not a letterbox: no zoom past 1.6
        assertEquals(1f, AnimatedCover.letterboxZoom(frame(48, 27, 10), 48, 27), 0f);
        // all black (a fade): the middle row is black, no zoom
        assertEquals(1f, AnimatedCover.letterboxZoom(new int[48 * 27], 48, 27), 0f);
    }
}
