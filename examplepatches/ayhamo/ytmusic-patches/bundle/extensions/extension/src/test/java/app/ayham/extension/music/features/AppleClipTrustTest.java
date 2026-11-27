package app.ayham.extension.music.features;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** A fresh Apple motion-clip link passes the same trust check as everything else (canvas.md §4 rule 6's idea). */
public class AppleClipTrustTest {
    // the host Apple's catalog gives for motion art (editorialVideo)
    static final String REAL = "https://mvod.itunes.apple.com/itunes-assets/HLSMusic/v4/x/P.m3u8";

    @Test
    public void aRealAppleClipPasses() {
        assertTrue(ArtistHeader.trusted(REAL, null));
        assertTrue(ArtistHeader.trusted("https://mvod.itunes.apple.com:443/a/P.m3u8", null));
        assertArrayEquals(new String[]{REAL, null}, AppleCanvas.trustedPair(REAL, null));
    }

    @Test
    public void httpAForeignHostAPortOrUserInfoAreRefused() {
        assertFalse(ArtistHeader.trusted("http://mvod.itunes.apple.com/a/P.m3u8", null));
        assertFalse(ArtistHeader.trusted("https://evil.example/a/P.m3u8", null));
        assertFalse(ArtistHeader.trusted("https://evilapple.com/a/P.m3u8", null));
        assertFalse(ArtistHeader.trusted("https://mvod.itunes.apple.com:8443/a/P.m3u8", null));
        assertFalse(ArtistHeader.trusted("https://user@mvod.itunes.apple.com/a/P.m3u8", null));
    }

    @Test
    public void anUntrustedPreferredClipGivesWayToATrustedAlternate() {
        assertArrayEquals(new String[]{REAL, null}, AppleCanvas.trustedPair("http://mvod.itunes.apple.com/a.m3u8", REAL));
        assertNull(AppleCanvas.trustedPair("https://evil.example/a.m3u8", "http://x.apple.com/a.m3u8"));
    }
}
