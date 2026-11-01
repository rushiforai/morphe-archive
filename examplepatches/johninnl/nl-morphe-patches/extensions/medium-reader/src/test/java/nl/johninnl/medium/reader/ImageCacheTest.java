package nl.johninnl.medium.reader;

import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.tls.HandshakeCertificates;
import okhttp3.tls.HeldCertificate;
import nl.johninnl.medium.vendor.okhttp3.OkHttpClient;
import org.junit.*;
import org.junit.rules.TemporaryFolder;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import static org.junit.Assert.*;

public class ImageCacheTest {
    @Rule public TemporaryFolder directory = new TemporaryFolder();
    private MockWebServer server;
    private ImageCache cache;
    private OkHttpClient.Builder transport;
    @Before public void start() throws Exception {
        server = new MockWebServer();
        HeldCertificate cert = new HeldCertificate.Builder().addSubjectAlternativeName("localhost").build();
        HandshakeCertificates host = new HandshakeCertificates.Builder().heldCertificate(cert).build();
        HandshakeCertificates client = new HandshakeCertificates.Builder().addTrustedCertificate(cert.certificate()).build();
        server.useHttps(host.sslSocketFactory(), false); server.start();
        // These tests cover transport/storage. Android bitmap decoding runs on-device.
        transport = new OkHttpClient.Builder().sslSocketFactory(client.sslSocketFactory(), client.trustManager());
        cache = new ImageCache(directory.newFolder(), transport, file -> true);
    }
    @After public void stop() throws Exception { server.shutdown(); }
    private String register(URI uri) throws ArticleException {
        return ReaderImages.register(new ArticleBody.Image(null, uri, "Alt", 100, 80));
    }
    @Test public void registersExternalImageAndReopensCachedBytesWithoutNetwork() throws Exception {
        URI source = server.url("/photo").uri(); String id = register(source);
        assertEquals(id, register(source)); assertNull(ReaderImages.resolve("ordinary-medium-image"));
        assertEquals("content://com.medium.reader.native-reader.images/" + id, ReaderImages.resolve(id));
        byte[] bytes = new byte[] {(byte)137,80,78,71,13,10,26,10,1,2,3};
        server.enqueue(new MockResponse().setHeader("Content-Type", "image/png").setBody(new okio.Buffer().write(bytes)));
        File file = cache.get(id, source, new Cancellation()); assertArrayEquals(bytes, Files.readAllBytes(file.toPath()));
        assertNull(server.takeRequest().getHeader("Cookie"));
        assertEquals(file, cache.get(id, source, new Cancellation())); assertEquals(1, server.getRequestCount());
        assertTrue(cache.contains(id)); cache.clear(); assertFalse(cache.contains(id)); assertFalse(file.exists());
    }
    @Test public void clearingDuringDownloadPreventsItsLateCacheCommit() throws Exception {
        java.util.concurrent.CountDownLatch decoded = new java.util.concurrent.CountDownLatch(1), release = new java.util.concurrent.CountDownLatch(1);
        ImageCache racing = new ImageCache(directory.newFolder(), transport, file -> {
            decoded.countDown();
            try { if (!release.await(2, java.util.concurrent.TimeUnit.SECONDS)) throw new AssertionError("Decoder fixture deadline"); }
            catch (InterruptedException interrupted) { Thread.currentThread().interrupt(); return false; }
            return true;
        });
        URI source = server.url("/photo").uri(); String id = register(source);
        server.enqueue(new MockResponse().setHeader("Content-Type", "image/webp").setBody("RIFF0000WEBP image bytes"));
        java.util.concurrent.ExecutorService worker = java.util.concurrent.Executors.newSingleThreadExecutor();
        try {
            java.util.concurrent.Future<File> result = worker.submit(() -> racing.get(id, source, new Cancellation()));
            assertTrue(decoded.await(2, java.util.concurrent.TimeUnit.SECONDS)); racing.clear(); release.countDown();
            try { result.get(2, java.util.concurrent.TimeUnit.SECONDS); fail("Old download committed after clearing"); }
            catch (java.util.concurrent.ExecutionException expected) { assertTrue(expected.getCause() instanceof IOException); }
            assertFalse(racing.contains(id));
        } finally { release.countDown(); worker.shutdownNow(); }
    }
    @Test public void failedImageDoesNotPublishPartialCacheEntry() throws Exception {
        URI source = server.url("/error").uri(); String id = register(source);
        server.enqueue(new MockResponse().setHeader("Content-Type", "text/html").setBody("Error page"));
        try { cache.get(id, source, new Cancellation()); fail("HTML became an image"); } catch (IOException expected) { }
        server.enqueue(new MockResponse().setHeader("Content-Type", "image/webp").setBody("RIFF0000WEBP image bytes"));
        assertTrue(cache.get(id, source, new Cancellation()).isFile()); assertEquals(2, server.getRequestCount());
    }
    @Test public void cancellationAndUnsafeSourceNeverFetch() throws Exception {
        URI source = server.url("/photo").uri(); String id = register(source); Cancellation token = new Cancellation(); token.cancel();
        try { cache.get(id, source, token); fail("Cancelled image fetched"); } catch (ArticleException expected) { assertEquals("CANCELLED", expected.code); }
        try { register(URI.create("https://account:secret@example.org/photo")); fail("Credentials accepted"); } catch (ArticleException expected) { assertEquals("BAD_IMAGE", expected.code); }
        assertEquals(0, server.getRequestCount());
    }
}
