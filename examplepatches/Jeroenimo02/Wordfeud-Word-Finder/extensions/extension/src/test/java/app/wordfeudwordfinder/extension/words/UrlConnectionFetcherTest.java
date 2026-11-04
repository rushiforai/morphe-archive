package app.wordfeudwordfinder.extension.words;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.net.URL;
import org.junit.Test;

public class UrlConnectionFetcherTest {

    private static URL u(String s) throws Exception {
        return new URL(s);
    }

    @Test
    public void followsHttpsRedirectOnSameHost() throws Exception {
        URL start = u("https://raw.example.org/a/list.txt");
        assertEquals(u("https://raw.example.org/b/list.txt"),
                UrlConnectionFetcher.redirectTarget(start, start, "https://raw.example.org/b/list.txt"));
        assertEquals(u("https://raw.example.org/a/other.txt"),
                UrlConnectionFetcher.redirectTarget(start, start, "other.txt"));
        assertEquals(u("https://RAW.example.org/c"),
                UrlConnectionFetcher.redirectTarget(start, start, "https://RAW.example.org/c"));
    }

    @Test
    public void refusesOtherHostsSchemesPortsAndBadLocations() throws Exception {
        URL start = u("https://raw.example.org/a/list.txt");
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, "https://evil.example.com/list.txt"));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, "https://sub.raw.example.org/list.txt"));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, "http://raw.example.org/list.txt"));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, "https://raw.example.org:8443/list.txt"));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, "//evil.example.com/x"));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, null));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, ""));
        assertNull(UrlConnectionFetcher.redirectTarget(start, start, "foo://x"));
    }
}
