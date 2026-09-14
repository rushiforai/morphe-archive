package app.morphe.extension.tiktok.download;

import static java.net.HttpURLConnection.HTTP_MOVED_TEMP;
import static java.net.HttpURLConnection.HTTP_OK;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import com.ss.android.ugc.aweme.base.model.UrlModel;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.nio.file.Files;
import java.util.Base64;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/** Network destinations that extension-owned media downloads are allowed to reach. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class MediaTransportSecurityTest {
    private static final byte[] PNG = Base64.getDecoder().decode(
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/l9sAAAAASUVORK5CYII=");

    /**
     * Previous media tests used a local HTTP server and therefore proved only byte copying.
     * They never made the platform expose that it was following a redirect outside our code.
     */
    @Test public void anAutomaticRedirectCannotDowngradeToCleartext() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        withHttpsHandler(url -> {
            opened.incrementAndGet();
            return response(url, true);
        }, () -> {
            File target = File.createTempFile("redirect-downgrade", ".tmp");
            Files.write(target.toPath(), new byte[]{9, 8, 7});
            try {
                assertThrows(IOException.class, () -> RemoteMedia.fetch(
                        List.of("https://8.8.8.8/start"), target, RemoteMedia.Kind.IMAGE));
                assertFalse("a refused redirect left its old or partial target", target.exists());
                assertEquals("the HTTPS hop should be inspected exactly once", 1, opened.get());
            } finally {
                target.delete();
            }
        });
    }

    /** A URL that spells HTTPS is still local when its resolved address is loopback. */
    @Test public void anHttpsLoopbackLiteralIsRejectedBeforeOpeningAConnection() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        withHttpsHandler(url -> {
            opened.incrementAndGet();
            return response(url, false);
        }, () -> {
            File target = File.createTempFile("loopback-media", ".tmp");
            try {
                assertThrows(IOException.class, () -> RemoteMedia.fetch(
                        List.of("https://127.0.0.1/private"), target, RemoteMedia.Kind.IMAGE));
                assertEquals("a local endpoint was opened before it was refused", 0, opened.get());
                assertFalse("a refused local URL left a target", target.exists());
            } finally {
                target.delete();
            }
        });
    }

    /** Download quality must not prefer a gear that the downloader will later refuse. */
    @Test public void qualitySelectionDoesNotTreatCleartextAsUsableMedia() {
        assertNull(QualitySelector.choose(
                List.of(new Gear("http://cdn.example/video.mp4")), "highest"));
        assertNull(QualitySelector.choose(
                List.of(new Gear("https://reader:secret@cdn.example/video.mp4")), "highest"));
    }

    @Test public void urlShapeRequiresHttpsAHostAndNoUserInformation() {
        assertTrue(MediaTransport.hasAllowedShape("https://v16-webapp-prime.tiktokcdn.com/video"));
        assertFalse(MediaTransport.hasAllowedShape("http://v16-webapp-prime.tiktokcdn.com/video"));
        assertFalse(MediaTransport.hasAllowedShape("https://name@v16-webapp-prime.tiktokcdn.com/video"));
        assertFalse(MediaTransport.hasAllowedShape("https:///video"));
        assertFalse(MediaTransport.hasAllowedShape("not a URL"));
        assertFalse(MediaTransport.hasAllowedShape(null));
    }

    @Test public void localPrivateWildcardAndMulticastAddressesAreNotMediaDestinations()
            throws Exception {
        for (String address : new String[]{
                "0.0.0.0", "10.0.0.1", "127.0.0.1", "169.254.4.2",
                "172.16.1.2", "192.168.1.2", "224.0.0.1", "255.255.255.255",
                "::", "::1", "fc00::1", "fd12:3456::1", "fe80::1", "ff02::1"
        }) {
            assertFalse(address, MediaTransport.isPublicAddress(InetAddress.getByName(address)));
        }
        assertTrue(MediaTransport.isPublicAddress(InetAddress.getByName("8.8.8.8")));
        assertTrue(MediaTransport.isPublicAddress(
                InetAddress.getByName("2606:4700:4700::1111")));
    }

    @Test public void everyDnsReadMustStillBePublic() throws Exception {
        AtomicInteger resolutions = new AtomicInteger();
        AtomicInteger opened = new AtomicInteger();
        FakeConnection response = new FakeConnection(
                new URL("https://cdn.example/video"), HTTP_OK, null, PNG);
        MediaTransport.Client client = new MediaTransport.Client(host -> {
            byte[] address = resolutions.incrementAndGet() == 1
                    ? new byte[]{8, 8, 8, 8}
                    : new byte[]{127, 0, 0, 1};
            return new InetAddress[]{InetAddress.getByAddress(host, address)};
        }, url -> {
            opened.incrementAndGet();
            return response;
        });

        assertThrows(IOException.class, () -> client.open(
                "https://cdn.example/video", MediaBudget.deadline(),
                1000, 1000, null, false));
        assertEquals(2, resolutions.get());
        assertEquals(1, opened.get());
        assertEquals("the socket operation ran after the hostname became local",
                0, response.responseReads);
        assertTrue("the refused connection was not released", response.disconnected);
    }

    @Test public void onePrivateAnswerRefusesTheWholeHostname() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        MediaTransport.Client client = new MediaTransport.Client(host -> new InetAddress[]{
                InetAddress.getByAddress(host, new byte[]{8, 8, 8, 8}),
                InetAddress.getByAddress(host, new byte[]{10, 0, 0, 8})
        }, url -> {
            opened.incrementAndGet();
            return new FakeConnection(url, HTTP_OK, null, PNG);
        });

        assertThrows(IOException.class, () -> client.open(
                "https://v16.tiktokcdn.com/media", MediaBudget.deadline(),
                1000, 1000, null, false));
        assertEquals(0, opened.get());
    }

    @Test public void aPublicTikTokCdnRedirectStillDownloads() throws Exception {
        Map<String, FakeConnection> connections = new LinkedHashMap<>();
        MediaTransport.Client client = publicClient(url -> {
            FakeConnection connection;
            if ("/start".equals(url.getPath())) {
                connection = new FakeConnection(url, HTTP_MOVED_TEMP,
                        "https://v16-webapp-prime.tiktokcdn.com/media", new byte[0]);
            } else {
                connection = new FakeConnection(url, HTTP_OK, null, PNG);
            }
            connections.put(url.toString(), connection);
            return connection;
        });

        File target = File.createTempFile("public-cdn-redirect", ".tmp");
        try {
            assertEquals("png", RemoteMedia.fetch(
                    List.of("https://v16.tiktokcdn.com/start"), target,
                    RemoteMedia.Kind.IMAGE, client));
            assertArrayEquals(PNG, Files.readAllBytes(target.toPath()));
            assertEquals(2, connections.size());
            for (FakeConnection connection : connections.values()) {
                assertFalse("a redirect was delegated to the platform",
                        connection.getInstanceFollowRedirects());
                assertTrue("a completed hop was not released", connection.disconnected);
            }
        } finally {
            target.delete();
        }
    }

    @Test public void redirectLoopsStopBeforeTheSameEndpointOpensAgain() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        MediaTransport.Client client = publicClient(url -> {
            opened.incrementAndGet();
            String location = "/a".equals(url.getPath()) ? "/b" : "/a";
            return new FakeConnection(url, HTTP_MOVED_TEMP, location, new byte[0]);
        });

        assertThrows(IOException.class, () -> client.open(
                "https://v16.tiktokcdn.com/a", MediaBudget.deadline(),
                1000, 1000, null, false));
        assertEquals("the loop reopened an endpoint already visited", 2, opened.get());
    }

    @Test public void redirectChainsHaveOneSharedFiveHopLimit() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        MediaTransport.Client client = publicClient(url -> {
            opened.incrementAndGet();
            int step = Integer.parseInt(url.getPath().substring(1));
            return new FakeConnection(url, HTTP_MOVED_TEMP,
                    "/" + (step + 1), new byte[0]);
        });

        assertThrows(IOException.class, () -> client.open(
                "https://v16.tiktokcdn.com/0", MediaBudget.deadline(),
                1000, 1000, null, false));
        assertEquals(MediaTransport.MAX_REDIRECTS + 1, opened.get());
    }

    @Test public void aRedirectToLoopbackStopsBeforeOpeningThatHop() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        MediaTransport.Client client = new MediaTransport.Client(host -> {
            byte[] address = "private.example".equals(host)
                    ? new byte[]{127, 0, 0, 1}
                    : new byte[]{8, 8, 8, 8};
            return new InetAddress[]{InetAddress.getByAddress(host, address)};
        }, url -> {
            opened.incrementAndGet();
            return new FakeConnection(url, HTTP_MOVED_TEMP,
                    "https://private.example/metadata", new byte[0]);
        });

        assertThrows(IOException.class, () -> client.open(
                "https://v16.tiktokcdn.com/start", MediaBudget.deadline(),
                1000, 1000, null, false));
        assertEquals(1, opened.get());
    }

    @Test public void aRedirectCannotIntroduceUserInformation() throws Exception {
        AtomicInteger opened = new AtomicInteger();
        MediaTransport.Client client = publicClient(url -> {
            opened.incrementAndGet();
            return new FakeConnection(url, HTTP_MOVED_TEMP,
                    "https://reader:secret@v16.tiktokcdn.com/media", new byte[0]);
        });

        assertThrows(IOException.class, () -> client.open(
                "https://v16.tiktokcdn.com/start", MediaBudget.deadline(),
                1000, 1000, null, false));
        assertEquals(1, opened.get());
    }

    @Test public void aBrokenMediaBodyLeavesNoPartialFile() throws Exception {
        byte[] prefix = java.util.Arrays.copyOf(PNG, 24);
        MediaTransport.Client client = publicClient(url -> new FakeConnection(
                url, HTTP_OK, null, failingAfter(prefix)));
        File target = File.createTempFile("partial-media", ".tmp");
        try {
            assertThrows(IOException.class, () -> RemoteMedia.fetch(
                    List.of("https://v16.tiktokcdn.com/media"), target,
                    RemoteMedia.Kind.IMAGE, client));
            assertFalse("a broken response left media bytes on disk", target.exists());
        } finally {
            target.delete();
        }
    }

    @Test public void aBrokenStickerBodyLeavesNoPartialFile() throws Exception {
        byte[] prefix = java.util.Arrays.copyOf(PNG, 24);
        MediaTransport.Client client = publicClient(url -> new FakeConnection(
                url, HTTP_OK, null, failingAfter(prefix)));
        File target = File.createTempFile(
                "partial-sticker", ".tmp", RuntimeEnvironment.getApplication().getCacheDir());
        try {
            assertThrows(IOException.class, () -> StickerGallerySaver.downloadSticker(
                    "https://v16.tiktokcdn.com/sticker", target,
                    RuntimeEnvironment.getApplication(), MediaBudget.deadline(), client));
            assertFalse("a broken sticker response left bytes on disk", target.exists());
        } finally {
            target.delete();
        }
    }

    private static HttpURLConnection response(URL url, boolean automaticRedirect) {
        return new HttpURLConnection(url) {
            @Override public int getResponseCode() {
                return automaticRedirect && !getInstanceFollowRedirects()
                        ? HTTP_MOVED_TEMP : HTTP_OK;
            }

            @Override public String getHeaderField(String name) {
                if (automaticRedirect && "Location".equalsIgnoreCase(name)) {
                    return "http://127.0.0.1/private";
                }
                return "Content-Length".equalsIgnoreCase(name)
                        ? String.valueOf(PNG.length) : null;
            }

            @Override public InputStream getInputStream() {
                return new ByteArrayInputStream(PNG);
            }

            @Override public void connect() { }
            @Override public void disconnect() { }
            @Override public boolean usingProxy() { return false; }
        };
    }

    private interface ConnectionFactory {
        URLConnection open(URL url) throws IOException;
    }

    private interface CheckedRunnable {
        void run() throws Exception;
    }

    private static MediaTransport.Client publicClient(MediaTransport.ConnectionOpener opener) {
        return new MediaTransport.Client(host -> new InetAddress[]{
                InetAddress.getByAddress(host, new byte[]{8, 8, 8, 8})
        }, opener);
    }

    private static InputStream failingAfter(byte[] prefix) {
        return new InputStream() {
            private int offset;

            @Override public int read() throws IOException {
                if (offset >= prefix.length) throw new IOException("fixture stream broke");
                return prefix[offset++] & 255;
            }
        };
    }

    private static final class FakeConnection extends HttpURLConnection {
        private final int responseCode;
        private final String location;
        private final InputStream input;
        int responseReads;
        boolean disconnected;

        FakeConnection(URL url, int responseCode, String location, byte[] body) {
            this(url, responseCode, location, new ByteArrayInputStream(body));
        }

        FakeConnection(URL url, int responseCode, String location, InputStream input) {
            super(url);
            this.responseCode = responseCode;
            this.location = location;
            this.input = input;
        }

        @Override public int getResponseCode() {
            responseReads++;
            return responseCode;
        }

        @Override public String getHeaderField(String name) {
            if ("Location".equalsIgnoreCase(name)) return location;
            return null;
        }

        @Override public String getContentType() {
            return "image/png";
        }

        @Override public InputStream getInputStream() {
            return input;
        }

        @Override public void connect() { }

        @Override public void disconnect() {
            disconnected = true;
        }

        @Override public boolean usingProxy() {
            return false;
        }
    }

    @SuppressWarnings("unchecked")
    private static void withHttpsHandler(ConnectionFactory factory, CheckedRunnable action)
            throws Exception {
        // Make the JDK install its ordinary HTTPS handler before replacing the cache entry.
        new URL("https://8.8.8.8/");
        Hashtable<String, URLStreamHandler> handlers =
                ReflectionHelpers.getStaticField(URL.class, "handlers");
        URLStreamHandler previous = handlers.get("https");
        handlers.put("https", new URLStreamHandler() {
            @Override protected URLConnection openConnection(URL url) throws IOException {
                return factory.open(url);
            }
        });
        try {
            action.run();
        } finally {
            handlers.put("https", previous);
        }
    }

    private static final class Address extends UrlModel {
        private final List<String> urls;

        Address(String url) {
            urls = List.of(url);
        }

        @Override public List<String> getUrlList() {
            return urls;
        }
    }

    private static final class Gear {
        public final String gearName = "1080p";
        public final int bitRate = 1;
        public final UrlModel playAddr;

        Gear(String url) {
            playAddr = new Address(url);
        }
    }
}
