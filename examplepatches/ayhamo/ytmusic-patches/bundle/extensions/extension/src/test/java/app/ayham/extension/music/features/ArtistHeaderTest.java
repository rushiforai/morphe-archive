package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ArtistHeaderTest {
    @Test
    public void theNameComesFromTheSubscribeButton() {
        assertEquals("Lady Gaga", ArtistHeader.nameFrom("Subscribe to Lady Gaga. 30.9 million"));
        assertEquals("Lady Gaga", ArtistHeader.nameFrom("Unsubscribe from Lady Gaga. 30.9 million"));
        assertEquals("Mr. Probz", ArtistHeader.nameFrom("Subscribe to Mr. Probz. 1.2 million"));
        assertNull(ArtistHeader.nameFrom("Shuffle"));
        assertNull(ArtistHeader.nameFrom(null));
    }

    @Test
    public void profileNamesMatchLikeMetrolist() {
        assertEquals("guns n' roses", ArtistHeader.profileName("  Guns N’  Roses "));
    }

    @Test
    public void videosFollowImagesUntilSet() {
        assertTrue(ArtistHeader.videos(true, null));
        assertFalse(ArtistHeader.videos(false, "follow"));
        assertTrue(ArtistHeader.videos(false, "on"));
        assertFalse(ArtistHeader.videos(true, "off"));
    }

    @Test
    public void theKeyHoldsStorefrontLanguageNameSwitchesAndQuality() {
        assertEquals("us|en|lady gaga|true|false|720", ArtistHeader.key("us", "en", "Lady  Gaga", true, false, null));
        assertEquals("de|de|lady gaga|true|true|orig", ArtistHeader.key("de", "de", "Lady Gaga", true, true, "orig"));
    }

    @Test
    public void onlyApplesHostsAreTrusted() {
        assertTrue(ArtistHeader.trusted("https://mvod.itunes.apple.com/itunes-assets/x/P.m3u8", ".m3u8"));
        assertTrue(ArtistHeader.trusted("https://is1-ssl.mzstatic.com/image/thumb/a/1000x1000bb.jpg", null));
        assertFalse(ArtistHeader.trusted("http://is1-ssl.mzstatic.com/a.jpg", null));
        assertFalse(ArtistHeader.trusted("https://evilapple.com/a.m3u8", ".m3u8"));
        assertFalse(ArtistHeader.trusted("https://mvod.itunes.apple.com/a.mp4", ".m3u8"));
    }
}
