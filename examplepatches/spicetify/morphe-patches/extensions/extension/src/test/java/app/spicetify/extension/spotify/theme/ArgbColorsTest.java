package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class ArgbColorsTest {
    @Test
    public void parsesHexDigits() {
        assertEquals(Integer.valueOf(0xFFFF5555), ArgbColors.parseHex("f55", false));
        assertEquals(Integer.valueOf(0xFF1DB954), ArgbColors.parseHex("1db954", false));
        assertEquals(Integer.valueOf(0x801DB954), ArgbColors.parseHex("801DB954", false));
        assertEquals(Integer.valueOf(0x801DB954), ArgbColors.parseHex("1DB95480", true));
        assertNull(ArgbColors.parseHex("12345", false));
        assertNull(ArgbColors.parseHex("GG0000", false));
        assertNull(ArgbColors.parseHex("", false));
    }

    @Test
    public void mixingReproducesSpotifysStockSurfaces() {
        assertEquals(0xFF202020, ArgbColors.mix(0xFF121212, 0xFFFFFFFF, 0.06));
        assertEquals(0xFF1B1B1B, ArgbColors.mix(0xFF121212, 0xFFFFFFFF, 0.04));
        assertEquals(0xFF2A2A2A, ArgbColors.mix(0xFF121212, 0xFFFFFFFF, 0.10));
        assertEquals(0xFF1ABC54, ArgbColors.mix(0xFF1ED760, 0xFF000000, 0.125));
        assertEquals(0x1A808080, ArgbColors.mix(0x1AFFFFFF, 0xFF000000, 0.5));
    }

    @Test
    public void lighteningStopsAtWhiteAndKeepsAlpha() {
        assertEquals(0xFF21263C, ArgbColors.lighten(0xFF0B1026, 22));
        assertEquals(0x80FFFFFF, ArgbColors.lighten(0x80F8F8F8, 24));
    }

    @Test
    public void contrastFollowsWcag() {
        assertEquals(21.0, ArgbColors.contrast(0xFF000000, 0xFFFFFFFF), 0.01);
        assertEquals(1.0, ArgbColors.contrast(0xFFFFFFFF, 0xFFFFFFFF), 0.0001);
    }
}
