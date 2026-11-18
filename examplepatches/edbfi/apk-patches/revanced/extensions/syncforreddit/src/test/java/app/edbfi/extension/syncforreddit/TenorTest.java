// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.junit.Test;

public class TenorTest {
    private static final String VIEW = "https://tenor.com/view/cat-dance-gif-7523542997650649169";
    private static final String OEMBED = "https://tenor.com/oembed?url=";

    private static Http.Reply reply(int status, String body, String location) {
        Map<String, String> headers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
        if (location != null) headers.put("Location", location);
        return new Http.Reply(status, body.getBytes(StandardCharsets.UTF_8), headers);
    }

    /** Tenor's oEmbed with the given thumbnail, and a share link redirecting to {@link #VIEW}. */
    private static Tenor.Api tenor(String thumbnail, List<String> asked) {
        return (method, url) -> {
            asked.add(method + " " + url);
            if (url.startsWith(OEMBED)) return reply(200, "{\"thumbnail_url\":\"" + thumbnail + "\"}", null);
            if (method.equals("HEAD")) return reply(301, "", VIEW);
            return reply(404, "", null);
        };
    }

    private static void fails(String link, Tenor.Api api) {
        try {
            Tenor.thumbnail(link, api);
        } catch (Exception expected) {
            return;
        }
        fail("Expected a failure for " + link);
    }

    @Test
    public void handlesOnlyTenorLinks() {
        assertTrue(Tenor.handles(VIEW));
        assertTrue(Tenor.handles("https://media1.tenor.com/m/aGj-frNYMFEAAAAC/cat.gif"));
        assertFalse(Tenor.handles("https://example.com/?u=tenor.com"));
        assertFalse(Tenor.handles("https://nottenor.com/view/x"));
        assertFalse(Tenor.handles("not a link"));
        assertFalse(Tenor.handles("ftp://media.tenor.com/x.gif"));
        assertFalse(Tenor.handles("https://user@media.tenor.com/x.gif"));
    }

    @Test
    public void readsTheGifPageWithoutTheQuery() {
        assertEquals(VIEW, Tenor.page(VIEW + "?utm_source=share#x"));
        assertEquals("https://tenor.com/en-GB/view/cat-gif-1", Tenor.page("https://www.tenor.com/en-GB/view/cat-gif-1"));
        assertEquals(VIEW, Tenor.page(VIEW + ".gif"));
        assertEquals("https://tenor.com/es-419/view/cat-gif-1", Tenor.page("https://tenor.com/es-419/view/cat-gif-1"));
        assertNull(Tenor.page("https://tenor.com/bA1cD.gif"));
        assertNull(Tenor.page("https://tenor.com/search/cat-gifs"));
        assertNull(Tenor.page("https://media.tenor.com/view/x"));
    }

    @Test
    public void asksOembedForAGifPage() throws Exception {
        List<String> asked = new ArrayList<>();
        String image = "https://media.tenor.com/aGj-frNYMFEAAAAN/cat.png";
        assertEquals(image, Tenor.thumbnail(VIEW + "?utm_source=share", tenor(image, asked)));
        assertEquals(List.of("GET " + OEMBED + "https%3A%2F%2Ftenor.com%2Fview%2Fcat-dance-gif-7523542997650649169"), asked);
    }

    @Test
    public void followsAShareLinkToItsPage() throws Exception {
        List<String> asked = new ArrayList<>();
        String image = "https://media.tenor.com/aGj-frNYMFEAAAAN/cat.png";
        assertEquals(image, Tenor.thumbnail("https://tenor.com/bA1cD.gif", tenor(image, asked)));
        assertEquals("HEAD https://tenor.com/bA1cD.gif", asked.get(0));
        assertEquals(2, asked.size());
    }

    @Test
    public void loadsAMediaLinkItself() throws Exception {
        List<String> asked = new ArrayList<>();
        String gif = "https://media1.tenor.com/m/aGj-frNYMFEAAAAC/cat.gif";
        assertEquals(gif, Tenor.thumbnail(gif, tenor("unused", asked)));
        assertTrue(asked.isEmpty());
    }

    @Test
    public void upgradesAnHttpLink() throws Exception {
        List<String> asked = new ArrayList<>();
        assertEquals("https://media.tenor.com/x/cat.gif", Tenor.thumbnail("http://media.tenor.com/x/cat.gif", tenor("unused", asked)));
        Tenor.thumbnail("http://tenor.com/bA1cD.gif", tenor("https://media.tenor.com/x/cat.png", asked));
        assertEquals("HEAD https://tenor.com/bA1cD.gif", asked.get(0));
    }

    @Test
    public void refusesTenorPagesThatArentImages() {
        fails("https://help.tenor.com/hc/en-us", tenor("unused", new ArrayList<>()));
        fails("https://media.tenor.com/x/page.html", tenor("unused", new ArrayList<>()));
    }

    @Test
    public void refusesThumbnailsOffTenor() {
        fails(VIEW, tenor("https://evil.example/x.png", new ArrayList<>()));
        fails(VIEW, tenor("http://media.tenor.com/x.png", new ArrayList<>()));
        fails(VIEW, tenor("", new ArrayList<>()));
    }

    @Test
    public void failsWithoutAGifPage() {
        // A share link redirecting off Tenor, a missing GIF, and a page that isn't a GIF.
        fails("https://tenor.com/bA1cD.gif", (method, url) -> reply(301, "", "https://evil.example/view/x"));
        fails(VIEW, (method, url) -> reply(404, "", null));
        fails("https://tenor.com/search/cat-gifs", (method, url) -> reply(200, "", null));
    }
}
