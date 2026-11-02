package app.spicetify.extension.spotify.privacy;

import org.junit.Test;
import static org.junit.Assert.*;

public class SharingLinksTest {
    @Test public void removesTrackingInAnyPositionAndPreservesPlaybackParameters() {
        assertEquals("https://open.spotify.com/episode/abc?t=42&context=playlist%3Axyz#player",
                SharingLinks.sanitizeUrl("https://open.spotify.com/episode/abc?si=secret&t=42&pi=secret&context=playlist%3Axyz&utm_source=copy#player"));
    }
    @Test public void handlesEachShareTypeAndRepeatedTracking() {
        for (String type : new String[]{"track", "album", "playlist", "episode", "artist"}) {
            String url = "https://open.spotify.com/" + type + "/abc";
            assertEquals(url, SharingLinks.sanitizeUrl(url + "?si=one&si=two&pi=three"));
        }
    }
    @Test public void preservesUnknownParametersAndEncoding() {
        assertEquals("https://open.spotify.com/track/abc?foo=a%2Bb&bar=a+b",
                SharingLinks.sanitizeUrl("https://open.spotify.com/track/abc?foo=a%2Bb&si=x&bar=a+b"));
    }
    @Test public void leavesOtherHostsMalformedInputsAndCleanLinksAlone() {
        for (String url : new String[]{"https://spotify.link/abc?si=x", "https://example.com/?si=x",
                "https://open.spotify.com.evil.test/?si=x", "spotify:track:abc", "not a URL?si=x",
                "https://open.spotify.com/track/abc", "https://open.spotify.com/track/abc?t=5"}) {
            assertEquals(url, SharingLinks.sanitizeUrl(url));
        }
        assertNull(SharingLinks.sanitizeUrl(null));
    }
    @Test public void preservesFragmentWhenAllTrackingIsRemoved() {
        assertEquals("https://open.spotify.com/track/abc#player",
                SharingLinks.sanitizeUrl("https://open.spotify.com/track/abc?si=x#player"));
    }
}
