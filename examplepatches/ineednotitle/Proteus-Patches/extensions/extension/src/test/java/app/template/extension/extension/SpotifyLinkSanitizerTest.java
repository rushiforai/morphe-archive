package app.template.extension.extension;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

public class SpotifyLinkSanitizerTest {

    @Test
    public void removesSiAndUtmSource() {
        assertEquals("https://open.spotify.com/track/abc",
                SpotifyLinkSanitizer.sanitizeUrl("https://open.spotify.com/track/abc?si=xyz&utm_source=share"));
    }

    @Test
    public void keepsOtherParametersOrderAndFragment() {
        assertEquals("https://open.spotify.com/track/abc?b=2&a=3#t=30",
                SpotifyLinkSanitizer.sanitizeUrl("https://open.spotify.com/track/abc?si=1&b=2&utm_source=x&a=3#t=30"));
    }

    @Test
    public void matchesParameterNamesCaseInsensitively() {
        assertEquals("https://open.spotify.com/track/abc",
                SpotifyLinkSanitizer.sanitizeUrl("https://open.spotify.com/track/abc?SI=xyz&UTM_SOURCE=share"));
    }

    @Test
    public void removesRepeatedTrackingParameters() {
        assertEquals("https://open.spotify.com/track/abc?a=1",
                SpotifyLinkSanitizer.sanitizeUrl("https://open.spotify.com/track/abc?si=1&a=1&si=2"));
    }

    @Test
    public void keepsTheOriginalInstanceWhenNothingIsRemoved() {
        String url = "https://open.spotify.com/track/abc?b=2&a=3#t=30";
        assertSame(url, SpotifyLinkSanitizer.sanitizeUrl(url));

        String noQuery = "https://open.spotify.com/track/abc";
        assertSame(noQuery, SpotifyLinkSanitizer.sanitizeUrl(noQuery));
    }

    @Test
    public void passesNullThrough() {
        assertNull(SpotifyLinkSanitizer.sanitizeUrl(null));
        assertNull(SpotifyLinkSanitizer.sanitizeText((String) null));
        assertNull(SpotifyLinkSanitizer.sanitizeText((CharSequence) null));
    }

    @Test
    public void sanitizesEveryUrlInAShareMessage() {
        String text = "Listen to https://open.spotify.com/track/abc?si=1 " +
                "and https://open.spotify.com/album/def?utm_source=copy together";
        assertEquals("Listen to https://open.spotify.com/track/abc " +
                "and https://open.spotify.com/album/def together",
                SpotifyLinkSanitizer.sanitizeText(text));
    }

    @Test
    public void keepsNonUrlTextUntouched() {
        String text = "no links here";
        assertSame(text, SpotifyLinkSanitizer.sanitizeText(text));
    }

    @Test
    public void keepsTheOriginalCharSequenceWhenNothingIsRemoved() {
        CharSequence text = new StringBuilder("plain https://open.spotify.com/track/abc?b=2 message");
        assertSame(text, SpotifyLinkSanitizer.sanitizeText(text));
    }

    @Test
    public void supportsPrefixPatternsAndKeepsRemainingQuery() {
        SpotifyLinkSanitizer sanitizer = new SpotifyLinkSanitizer("utm_*", "si");

        assertEquals("https://example.org/page?id=1&keep=yes#frag",
                sanitizer.stripTracking("https://example.org/page?utm_medium=x&id=1&keep=yes&utm_campaign=y#frag"));
    }

    @Test
    public void doesNotTreatParameterNamesWithSharedPrefixesAsTracking() {
        SpotifyLinkSanitizer sanitizer = new SpotifyLinkSanitizer("utm_*");

        // "utmish" does not start with "utm_", so it must survive.
        assertEquals("https://example.org/page?utmish=1",
                sanitizer.stripTracking("https://example.org/page?utmish=1&utm_medium=x"));
    }
}
