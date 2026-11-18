// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;

public class WebsitePreviewsTest {
    private static final String PAGE = "https://www.example.org/news/story.html";

    @Test
    public void readsTheOpenGraphImage() {
        String html = "<html><head><title>x</title>"
                + "<meta name=\"twitter:image\" content=\"https://cdn.example.org/twitter.jpg\">"
                + "<meta property=\"og:image\" content=\"https://cdn.example.org/og.jpg\" />"
                + "<meta property=\"og:image\" content=\"https://cdn.example.org/second.jpg\" />"
                + "</head><body></body></html>";
        assertEquals("https://cdn.example.org/og.jpg", WebsitePreviews.imageIn(html, PAGE));
    }

    @Test
    public void fallsBackToSecureUrlThenTwitter() {
        assertEquals("https://cdn.example.org/s.jpg", WebsitePreviews.imageIn(
                "<meta property='og:image:secure_url' content='https://cdn.example.org/s.jpg'>"
                        + "<meta name=twitter:image content=https://cdn.example.org/t.jpg>", PAGE));
        assertEquals("https://cdn.example.org/t.jpg", WebsitePreviews.imageIn(
                "<META NAME=twitter:image CONTENT=https://cdn.example.org/t.jpg>", PAGE));
        // Empty tags don't count.
        assertEquals("https://cdn.example.org/t.jpg", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"\"><meta name=\"twitter:image\" content=\"https://cdn.example.org/t.jpg\">", PAGE));
        assertNull(WebsitePreviews.imageIn("<meta property=\"og:title\" content=\"x\">", PAGE));
    }

    @Test(timeout = 2000)
    public void readsAHostilePageInLinearTime() {
        String unclosed = "<meta ".repeat(43_690);
        assertNull(WebsitePreviews.imageIn(unclosed, PAGE));
        // One far '>' must not make each "<meta" read to it.
        assertNull(WebsitePreviews.imageIn("<meta a=1 ".repeat(26_000) + ">", PAGE));
        assertNull(WebsitePreviews.imageIn("<a ".repeat(80_000) + ">", PAGE));
        // Nor may one tag's attributes: a long name, unclosed quotes.
        assertNull(WebsitePreviews.imageIn("<meta " + "a".repeat(250_000) + ">", PAGE));
        assertNull(WebsitePreviews.imageIn("<meta " + "a=\"".repeat(80_000) + ">", PAGE));
        // Lowercasing "İ" makes two characters: indexes must come from the page itself.
        assertEquals("https://x.org/a.png", WebsitePreviews.imageIn(
                "<title>İİİİ</title><META property=\"og:image\" content=\"https://x.org/a.png\">", PAGE));
        assertNull(WebsitePreviews.imageIn("<metadata property=\"og:image\" content=\"https://x.org/a.png\">", PAGE));
        assertEquals("https://x.org/a.png", WebsitePreviews.imageIn(
                "<meta>".repeat(40_000) + "<meta/property=\"og:image\" content=\"https://x.org/a.png\">", PAGE));
    }

    @Test
    public void readsAttributes() {
        java.util.Map<String, String> attributes = WebsitePreviews.attributes(
                " property = 'og:image' CONTENT=https://x.org/a.png data-x name=\"a b\" content=second /");
        assertEquals("og:image", attributes.get("property"));
        assertEquals("https://x.org/a.png", attributes.get("content"));
        assertEquals("", attributes.get("data-x"));
        assertEquals("a b", attributes.get("name"));
    }

    @Test
    public void readsAttributesInAnyOrder() {
        assertEquals("https://cdn.example.org/a.png", WebsitePreviews.imageIn(
                "<meta\n  content=\"https://cdn.example.org/a.png\"\n  property=\"og:image\"\n>", PAGE));
    }

    @Test
    public void unescapesAndResolvesAgainstThePage() {
        assertEquals("https://cdn.example.org/i.jpg?w=1200&h=630", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"https://cdn.example.org/i.jpg?w=1200&amp;h=630\">", PAGE));
        assertEquals("https://www.example.org/img/card.png", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"/img/card.png\">", PAGE));
        assertEquals("https://www.example.org/news/card.png", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"card.png\">", PAGE));
        assertEquals("https://cdn.example.org/card.png", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"//cdn.example.org/card.png\">", PAGE));
        // "://" in a path names no host there.
        assertEquals("https://www.example.org/cdn/w=1200/https://[2606:4700::1111]/card.jpg", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"/cdn/w=1200/https://[2606:4700::1111]/card.jpg\">", PAGE).replace("%5B", "[").replace("%5D", "]"));
        assertEquals("https://[2606:4700::1111]/card.png", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"//[2606:4700::1111]/card.png\">", PAGE));
        assertEquals("https://cdn.example.org/a%20b.png", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"https://cdn.example.org/a b.png\">", PAGE));
        assertEquals("https://cdn.example.org/&#x/", WebsitePreviews.unescape("https://cdn.example.org/&#x/"));
        // Pages and images OkHttp loads though URI would refuse them: a '|' in a query, an underscore in a host.
        assertEquals("https://cdn.example.org/card.jpg", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"https://cdn.example.org/card.jpg\">", "https://example.org/story?utm=a|b"));
        assertEquals("https://sub_domain.example.org/card.jpg", WebsitePreviews.imageIn(
                "<meta property=\"og:image\" content=\"/card.jpg\">", "https://sub_domain.example.org/story"));
        assertEquals("a/b'c", WebsitePreviews.unescape("a&#x2F;b&#39;c"));
    }

    @Test
    public void makesHttpImagesHttpsAndRefusesOtherSchemes() {
        assertEquals("https://cdn.example.org/a.png", WebsitePreviews.absolute("http://cdn.example.org/a.png", PAGE));
        assertNull(WebsitePreviews.absolute("data:image/png;base64,AAAA", PAGE));
        assertNull(WebsitePreviews.absolute("javascript:alert(1)", PAGE));
        assertNull(WebsitePreviews.absolute("ftp://cdn.example.org/a.png", PAGE));
        assertNull(WebsitePreviews.absolute("https://user:pass@cdn.example.org/a.png", PAGE));
    }

    @Test
    public void handlesOnlyHttpsLinks() {
        assertTrue(WebsitePreviews.handles("https://github.com/torvalds/linux"));
        assertFalse(WebsitePreviews.handles("http://example.org/"));
        assertFalse(WebsitePreviews.handles("imgur-album-x"));
        assertFalse(WebsitePreviews.handles("https://user@example.org/"));
        assertTrue(WebsitePreviews.handles("https://sub_domain.example.org/a?b=c|d"));
        assertTrue(WebsitePreviews.handles("https://example.org/media/card[1].jpg?filter[id]=1"));
        assertTrue(WebsitePreviews.handles("https://example.org/100%-real#s1#s2"));
        assertTrue(WebsitePreviews.handles("https://[2606:4700::1111]/"));
    }

    @Test
    public void acceptsOnlyWebPages() {
        assertTrue(WebsitePreviews.isHtml("text/html"));
        assertTrue(WebsitePreviews.isHtml("Text/HTML; charset=UTF-8"));
        assertTrue(WebsitePreviews.isHtml("application/xhtml+xml"));
        assertFalse(WebsitePreviews.isHtml("application/json"));
        assertFalse(WebsitePreviews.isHtml("image/png"));
        assertFalse(WebsitePreviews.isHtml(null));
    }

    @Test
    public void readsUpToTheEndOfTheHead() throws IOException {
        String head = "<html><head><meta property=\"og:image\" content=\"x\"></HEAD>";
        byte[] page = (head + "<body>" + "x".repeat(100_000) + "</body>").getBytes(StandardCharsets.UTF_8);
        byte[] read = WebsitePreviews.readHead(new TrickleStream(page, 7), 256 * 1024, Long.MAX_VALUE);
        assertTrue(new String(read, StandardCharsets.UTF_8).contains("</HEAD"));
        assertTrue(read.length < head.length() + 7);
        // A page without a head end stops at the limit.
        byte[] endless = "y".repeat(5000).getBytes(StandardCharsets.UTF_8);
        assertEquals(1000, WebsitePreviews.readHead(new ByteArrayInputStream(endless), 1000, Long.MAX_VALUE).length);
        byte[] small = "<p>tiny".getBytes(StandardCharsets.UTF_8);
        assertArrayEquals(small, WebsitePreviews.readHead(new ByteArrayInputStream(small), 1000, Long.MAX_VALUE));
    }

    @Test
    public void givesUpOnASlowPageAndRemembersIt() throws IOException {
        try {
            WebsitePreviews.readHead(new ByteArrayInputStream(new byte[10]), 1000, System.currentTimeMillis() - 1);
        } catch (ImageServer.Answer expected) {
            return;
        }
        throw new AssertionError("Expected a slow page to be an answer");
    }

    @Test
    public void leavesGfycatToItsOwnPreviews() {
        assertFalse(WebsitePreviews.isWebsite("https://gfycat.com/SomeName"));
        assertFalse(WebsitePreviews.isWebsite("https://thumbs.gfycat.com/SomeName.jpg"));
        assertTrue(WebsitePreviews.isWebsite("https://example.org/gfycat.com"));
    }

    @Test
    public void refusesPrivateAddresses() throws IOException {
        for (String address : new String[] {
            "127.0.0.1", "10.1.2.3", "172.16.0.1", "172.31.255.255", "192.168.1.1", "169.254.169.254", "100.64.0.1",
            "100.127.255.255", "0.0.0.0", "224.0.0.1", "255.255.255.255", "192.0.0.8", "198.18.0.1",
            "::", "::1", "fe80::1", "fc00::1", "fd12:3456::1", "ff02::1", "::ffff:192.168.1.1", "::ffff:127.0.0.1",
            "64:ff9b::a00:1", "64:ff9b:1::c0a8:101", "2002:c0a8:101::1", "::10.0.0.1",
        }) {
            assertFalse(address, WebsitePreviews.isPublic(InetAddress.getByName(address)));
        }
        for (String address : new String[] {
            "1.1.1.1", "140.82.112.3", "100.63.255.255", "100.128.0.1", "172.32.0.1", "192.169.0.1", "2606:4700::1111",
            "64:ff9b::808:808", "2002:808:808::1",
        }) {
            assertTrue(address, WebsitePreviews.isPublic(InetAddress.getByName(address)));
        }
    }

    @Test
    public void failsPagesWithoutAnImage() throws IOException {
        WebsitePreviews.Pages json = link -> new WebsitePreviews.Page(link, "application/json", new byte[0]);
        WebsitePreviews.Pages bare = link -> new WebsitePreviews.Page(link, "text/html", "<title>x</title>".getBytes(StandardCharsets.UTF_8));
        for (WebsitePreviews.Pages pages : new WebsitePreviews.Pages[] {json, bare}) {
            try {
                WebsitePreviews.image("https://example.org/", pages);
            } catch (IllegalStateException expected) {
                continue;
            }
            throw new AssertionError("Expected no image");
        }
    }

    @Test
    public void resolvesAgainstThePageAfterRedirects() throws IOException {
        WebsitePreviews.Pages redirected = link -> new WebsitePreviews.Page("https://www.example.org/final/",
                "text/html", "<meta property=\"og:image\" content=\"card.png\">".getBytes(StandardCharsets.UTF_8));
        assertEquals("https://www.example.org/final/card.png", WebsitePreviews.image("https://example.org/", redirected));
    }

    @Test
    public void refusesPrivateAddressesGivenAsHosts() throws IOException {
        WebsitePreviews.checkHost("example.org");
        WebsitePreviews.checkHost("1.1.1.1");
        WebsitePreviews.checkHost("2606:4700::1111");
        WebsitePreviews.checkHost("notsyncforreddit.com");
        // OkHttp connects to any host of digits and dots without looking it up: 127.1 and 2130706433 are 127.0.0.1.
        for (String host : new String[] {"127.0.0.1", "192.168.1.50", "::1", "fd00::1", "", "127.1", "10.1", "2130706433",
            "127.0.0.0001", "300.1.1.1", "012.0.0.1", "syncforreddit.com", "ap.syncforreddit.com", "AP.SyncForReddit.com."}) {
            try {
                WebsitePreviews.checkHost(host);
            } catch (ImageServer.Answer expected) {
                assertTrue(ImageServer.worthRemembering(expected));
                continue;
            }
            throw new AssertionError("Expected " + host + " to be refused");
        }
    }

    @Test
    public void refusesNamesWithAnyPrivateAddress() throws IOException {
        InetAddress open = InetAddress.getByName("93.184.215.14");
        assertTrue(WebsitePreviews.allPublic(Collections.singletonList(open)));
        // OkHttp may connect to any of a name's addresses.
        assertFalse(WebsitePreviews.allPublic(Arrays.asList(open, InetAddress.getByName("10.0.0.1"))));
        assertTrue(ImageServer.worthRemembering(new ImageServer.RefusedHost("x")));
    }

    /** Gives at most a few bytes per read, as a network stream may. */
    private static final class TrickleStream extends InputStream {
        private final byte[] bytes;
        private final int step;
        private int at;

        TrickleStream(byte[] bytes, int step) {
            this.bytes = bytes;
            this.step = step;
        }

        @Override
        public int read() {
            return at < bytes.length ? bytes[at++] : -1;
        }

        @Override
        public int read(byte[] buffer, int offset, int length) {
            if (at >= bytes.length) return -1;
            int count = Math.min(Math.min(length, step), bytes.length - at);
            System.arraycopy(bytes, at, buffer, offset, count);
            at += count;
            return count;
        }
    }
}
