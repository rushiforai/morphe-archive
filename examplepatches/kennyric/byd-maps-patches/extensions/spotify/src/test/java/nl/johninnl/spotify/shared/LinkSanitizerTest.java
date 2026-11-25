package nl.johninnl.spotify.shared;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class LinkSanitizerTest {
    private final LinkSanitizer sanitizer = new LinkSanitizer("si", "utm_*");

    @Test
    public void removesExactAndPrefixedTrackingParameters() {
        assertEquals(
                "https://open.spotify.com/track/abc?x=1#frag",
                sanitizer.sanitizeUrl("https://open.spotify.com/track/abc?si=tracking&x=1&utm_source=car#frag")
        );
    }

    @Test
    public void keepsUrlsWithoutTrackingParameters() {
        String url = "https://open.spotify.com/album/abc?highlight=text";
        assertEquals(url, sanitizer.sanitizeUrl(url));
    }

    @Test
    public void removesTrackingParametersFromShareText() {
        assertEquals(
                "Listen: https://open.spotify.com/track/abc?x=1 now",
                sanitizer.sanitizeText("Listen: https://open.spotify.com/track/abc?si=abc&x=1 now")
        );
    }

    @Test
    public void ignoresNonUrlsAndNull() {
        assertNull(sanitizer.sanitizeUrl(null));
        assertEquals("no links here", sanitizer.sanitizeText("no links here"));
        assertNull(sanitizer.sanitizeText((String) null));
    }
}
