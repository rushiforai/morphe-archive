// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import org.json.JSONException;
import org.junit.Test;

public class ImageServerTest {
    private static final String ALBUM = "https://ap.syncforreddit.com/image?url=imgur-album-";

    private static Imgur.Api answering(int status, String body, List<String> asked) {
        return (method, path, requestBody, contentType) -> {
            asked.add(path);
            return new Http.Reply(status, body.getBytes(StandardCharsets.UTF_8), new HashMap<>());
        };
    }

    private static IOException failure(String url, boolean imgur, Imgur.Api api) {
        try {
            ImageServer.thumbnailUrl(url, imgur ? api : null, null, null);
        } catch (IOException expected) {
            return expected;
        }
        fail("Expected an IOException for " + url);
        return null;
    }

    @Test
    public void loadsAnAlbumPreviewFromImgur() throws IOException {
        List<String> asked = new ArrayList<>();
        Imgur.Api api = answering(200, "{\"data\":{\"cover\":\"CoVeR12\"}}", asked);
        assertEquals("https://i.imgur.com/CoVeR12m.jpg", ImageServer.thumbnailUrl(ALBUM + "SrvAlb1", api, null, null));
        assertEquals(1, asked.size());
    }

    @Test
    public void failsOtherPreviewsWithoutAsking() {
        List<String> asked = new ArrayList<>();
        Imgur.Api api = answering(200, "{}", asked);
        failure("https://ap.syncforreddit.com/image?url=https://tenor.com/view/x-gif-1", true, api);
        failure("https://ap.syncforreddit.com/image?url=gfycat-x", true, api);
        assertTrue(asked.isEmpty());
    }

    @Test
    public void loadsATenorPreviewFromTenor() throws IOException {
        List<String> asked = new ArrayList<>();
        Tenor.Api tenor = (method, url) -> {
            asked.add(url);
            String body = "{\"thumbnail_url\":\"https://media.tenor.com/AbCdAAAAN/x.png\"}";
            return new Http.Reply(200, body.getBytes(StandardCharsets.UTF_8), new HashMap<>());
        };
        String preview = "https://ap.syncforreddit.com/image?url=https://tenor.com/view/x-gif-1";
        assertEquals("https://media.tenor.com/AbCdAAAAN/x.png", ImageServer.thumbnailUrl(preview, null, tenor, null));
        assertEquals(1, asked.size());
        // Without Fix Tenor previews, it fails as before.
        try {
            ImageServer.thumbnailUrl(preview, null, null, null);
            fail("Expected an IOException");
        } catch (IOException expected) {
            assertEquals(1, asked.size());
        }
    }

    @Test
    public void failsAlbumPreviewsWithoutFixImgur() {
        List<String> asked = new ArrayList<>();
        failure(ALBUM + "SrvAlb2", false, answering(200, "{\"data\":{\"cover\":\"CoVeR12\"}}", asked));
        assertTrue(asked.isEmpty());
    }

    @Test
    public void turnsEveryImgurFailureIntoAnIoException() {
        List<String> asked = new ArrayList<>();
        // A malformed answer would throw JSONException, a bad ID IllegalArgumentException, a missing album
        // IllegalStateException: any of them escaping the interceptor would crash the app.
        assertTrue(failure(ALBUM + "SrvAlb3", true, answering(200, "not json", asked)).getCause() instanceof JSONException);
        assertTrue(failure(ALBUM + "../x", true, answering(200, "{}", asked)).getCause() instanceof IllegalArgumentException);
        assertTrue(failure(ALBUM + "SrvAlb4", true, answering(404, "", asked)).getCause() instanceof IllegalStateException);
        assertTrue(failure(ALBUM + "SrvAlb5", true, (m, p, b, c) -> {
            throw new IOException("offline");
        }).getCause() instanceof IOException);
    }

    @Test
    public void remembersOnlyAnswers() {
        List<String> asked = new ArrayList<>();
        // Imgur had no album: remembered.
        assertTrue(ImageServer.worthRemembering(failure(ALBUM + "SrvAlb6", true, answering(404, "", asked))));
        // Offline: tried again next time.
        assertFalse(ImageServer.worthRemembering(failure(ALBUM + "SrvAlb7", true, (m, p, b, c) -> {
            throw new IOException("offline");
        })));
        // Nothing handles it: costs nothing to fail again.
        assertFalse(ImageServer.worthRemembering(failure("https://ap.syncforreddit.com/image?url=gfycat-x", true, answering(200, "{}", asked))));
    }

    private static WebsitePreviews.Pages page(String html, List<String> asked) {
        return link -> {
            asked.add(link);
            return new WebsitePreviews.Page(link, "text/html; charset=utf-8", html.getBytes(StandardCharsets.UTF_8));
        };
    }

    @Test
    public void loadsAWebsitePreviewFromThePage() throws IOException {
        List<String> asked = new ArrayList<>();
        String html = "<head><meta property=\"og:image\" content=\"/card.png\"></head>";
        String preview = "https://ap.syncforreddit.com/image?url=https://example.org/post?id=1";
        assertEquals("https://example.org/card.png", ImageServer.thumbnailUrl(preview, null, null, page(html, asked)));
        assertEquals(Collections.singletonList("https://example.org/post?id=1"), asked);
    }

    @Test
    public void leavesOtherPreviewsAloneForWebsitePreviews() {
        List<String> asked = new ArrayList<>();
        WebsitePreviews.Pages pages = page("<meta property=\"og:image\" content=\"https://example.org/x.png\">", asked);
        // Tenor links are Fix Tenor previews', and the rest aren't https links.
        for (String link : new String[] {"https://tenor.com/view/x-gif-1", "gfycat-x", "imgur-album-SrvAlb8", "http://example.org/"}) {
            try {
                ImageServer.thumbnailUrl("https://ap.syncforreddit.com/image?url=" + link, null, null, pages);
                fail("Expected an IOException for " + link);
            } catch (IOException expected) {
                assertFalse(ImageServer.worthRemembering(expected));
            }
        }
        assertTrue(asked.isEmpty());
    }

    @Test
    public void remembersPagesWithoutAnImageButNotLostConnections() {
        String preview = "https://ap.syncforreddit.com/image?url=https://example.org/";
        WebsitePreviews.Pages bare = page("<head><title>x</title></head>", new ArrayList<>());
        WebsitePreviews.Pages offline = link -> {
            throw new IOException("offline");
        };
        // What Guard and the host check throw for a private address, a proxy or an http hop.
        WebsitePreviews.Pages refused = link -> {
            throw new ImageServer.Answer("Not a public address");
        };
        // On Android a lost connection's exception holds a platform one, such as GaiException, a RuntimeException.
        WebsitePreviews.Pages lost = link -> {
            throw (IOException) new UnknownHostException("example.org").initCause(new RuntimeException("android_getaddrinfo failed"));
        };
        WebsitePreviews.Pages pdf = link -> new WebsitePreviews.Page(link, "application/pdf", new byte[0]);
        assertTrue(ImageServer.worthRemembering(websiteFailure(preview, bare)));
        assertFalse(ImageServer.worthRemembering(websiteFailure(preview, offline)));
        assertTrue(ImageServer.worthRemembering(websiteFailure(preview, refused)));
        assertTrue(ImageServer.worthRemembering(websiteFailure(preview, pdf)));
        assertFalse(ImageServer.worthRemembering(websiteFailure(preview, lost)));
    }

    private static IOException websiteFailure(String url, WebsitePreviews.Pages pages) {
        try {
            ImageServer.thumbnailUrl(url, null, null, pages);
        } catch (IOException expected) {
            return expected;
        }
        fail("Expected an IOException for " + url);
        return null;
    }

    @Test
    public void refusesPrivateAddressesOnlyWhileLoadingAWebsitePreview() throws IOException {
        List<InetAddress> lan = Collections.singletonList(InetAddress.getByName("192.168.1.50"));
        ImageServer.PreviewDns dns = new ImageServer.PreviewDns(host -> lan);
        // Other images, such as a self-hosted Imgur proxy, resolve as before.
        assertEquals(lan, dns.lookup("nas.example.org"));
        ImageServer.PREVIEWING.set(Boolean.TRUE);
        try {
            dns.lookup("nas.example.org");
            fail("Expected a private address to be refused");
        } catch (ImageServer.RefusedHost expected) {
            assertTrue(ImageServer.worthRemembering(expected));
        } finally {
            ImageServer.PREVIEWING.remove();
        }
    }
}
