package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class LinksTest {
    @Test
    public void bareHostsBecomeDomains() {
        assertEquals("example.com", Links.normalizeRule("example.com"));
        assertEquals("example.com", Links.normalizeRule("  WWW.Example.COM. "));
        assertEquals("www.www.example.com", Links.normalizeRule("www.www.example.com"));
        assertEquals("xn--bcher-kva.de", Links.normalizeRule("b\u00fccher.de"));
    }

    @Test
    public void pathsAndSchemesBecomeExactUrls() {
        assertEquals("https://example.com/channel", Links.normalizeRule("example.com/channel"));
        assertEquals("https://example.com/Path?q=1#f", Links.normalizeRule("https://Example.com/Path?q=1#f"));
        assertEquals("http://example.com/", Links.normalizeRule("HTTP://example.com"));
        assertEquals("https://example.com/?q", Links.normalizeRule("https://example.com?q"));
        assertEquals("https://example.com/a", Links.normalizeRule("https://example.com:443/a"));
        assertEquals("https://example.com:8443/a", Links.normalizeRule("https://example.com:8443/a"));
        assertEquals("https://example.com/caf%C3%A9", Links.normalizeRule("https://example.com/caf\u00e9"));
    }

    @Test
    public void incompleteOrForeignLinksAreRejected() {
        for (String input : Arrays.asList("", "localhost", "1.2.3.4", "user@example.com", "ftp://example.com",
                "mailto:a@example.com", "example.com:8080", "https://user:pw@example.com/", "exa mple.com",
                "-example.com", "example..com", "https://", "javascript:alert(1)")) {
            assertEquals(input, "", Links.normalizeRule(input));
        }
    }

    @Test
    public void domainRulesCoverSubdomainsOnly() {
        Set<String> domains = new HashSet<>(Collections.singletonList("example.com"));
        Set<String> none = Collections.emptySet();
        assertEquals("example.com", Links.match("https://shop.example.com/x", domains, none));
        assertEquals("example.com", Links.match("https://www.example.com", domains, none));
        assertNull(Links.match("https://notexample.com/", domains, none));
        assertNull(Links.match("https://example.com.evil.net/", domains, none));
    }

    @Test
    public void exactRulesMatchOnlyThatDestination() {
        Set<String> urls = new HashSet<>(Collections.singletonList(Links.normalizeRule("example.com/channel")));
        Set<String> none = Collections.emptySet();
        assertEquals("https://example.com/channel", Links.match("https://EXAMPLE.com/channel", none, urls));
        assertNull(Links.match("https://example.com/channel/other", none, urls));
        assertNull(Links.match("https://example.com/Channel", none, urls));
    }

    @Test
    public void shortLinksAreNeverEvidence() {
        Set<String> domains = new HashSet<>(Collections.singletonList("t.co"));
        assertNull(Links.match("https://t.co/abc", domains, Collections.emptySet()));
    }

    @Test
    public void linksInFreeTextMustStandAlone() {
        assertEquals(Collections.singletonList("example.com"), Links.inText("Berlin \u00b7 example.com"));
        assertEquals(Collections.singletonList("example.com"), Links.inText("Visit (example.com)!"));
        assertEquals(Collections.singletonList("https://example.com/x"), Links.inText("see https://example.com/x"));
        assertEquals(Collections.emptyList(), Links.inText("mail me: me@example.com"));
        assertEquals(Collections.emptyList(), Links.inText("Planet Earth"));
    }
}
