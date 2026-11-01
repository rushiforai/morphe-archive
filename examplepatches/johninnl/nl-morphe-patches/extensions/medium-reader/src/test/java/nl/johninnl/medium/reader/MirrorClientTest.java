package nl.johninnl.medium.reader;

import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.mockwebserver.RecordedRequest;
import okhttp3.tls.HandshakeCertificates;
import okhttp3.tls.HeldCertificate;
import nl.johninnl.medium.vendor.okhttp3.OkHttpClient;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import java.net.CookieHandler;
import java.net.HttpURLConnection;
import java.net.URI;
import java.util.concurrent.TimeUnit;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.ExecutionException;
import okhttp3.mockwebserver.SocketPolicy;
import java.io.ByteArrayOutputStream;
import java.util.zip.GZIPOutputStream;
import static org.junit.Assert.*;

public class MirrorClientTest {
    @org.junit.Rule public org.junit.rules.TemporaryFolder cacheFolder = new org.junit.rules.TemporaryFolder();
    private static final String ID = "dc7f60d860e4";
    private URI origin;
    private HandshakeCertificates clientCertificates;
    private MockWebServer server;
    private CookieHandler previousCookies;
    private int status;
    private String type;
    private String response;
    private String redirect;

    @Before public void startServer() throws Exception {
        previousCookies = CookieHandler.getDefault();
        status = 200; type = "text/html; charset=utf-8"; response = validBody(); redirect = null;
        server = new MockWebServer();
        HeldCertificate certificate = new HeldCertificate.Builder().addSubjectAlternativeName("localhost").build();
        HandshakeCertificates serverCertificates = new HandshakeCertificates.Builder().heldCertificate(certificate).build();
        clientCertificates = new HandshakeCertificates.Builder().addTrustedCertificate(certificate.certificate()).build();
        server.useHttps(serverCertificates.sslSocketFactory(), false);
        server.start();
        origin = server.url("/").uri();
    }

    @After public void stopServer() throws Exception {
        CookieHandler.setDefault(previousCookies);
        server.shutdown();
    }

    private String validBody() {
        return "<link rel='canonical' href='https://medium.com/p/" + ID + "'><article><h1>Title</h1><div class='prose'><p>Complete text.</p></div></article>";
    }

    private MirrorClient client(int maxBytes) {
        MockResponse reply = new MockResponse().setResponseCode(status).setHeader("Content-Type", type).setBody(response);
        if (redirect != null) reply.setHeader("Location", redirect);
        server.enqueue(reply);
        return transport(1000, maxBytes);
    }

    private MirrorClient transport(int timeoutMillis, int maxBytes) {
        OkHttpClient.Builder transport = new OkHttpClient.Builder().sslSocketFactory(
                clientCertificates.sslSocketFactory(), clientCertificates.trustManager());
        return new MirrorClient(origin, transport, timeoutMillis, maxBytes);
    }

    private ArticleBody fetch(MirrorClient client) {
        try { return client.fetch(ID, new Cancellation()); }
        catch (ArticleException e) { throw new AssertionError("Expected article fetch: " + e.code, e); }
    }

    @Test public void fetchesPublicIdAndParsesBody() throws Exception {
        ArticleBody body = fetch(client(4096));
        RecordedRequest request = server.takeRequest(1, TimeUnit.SECONDS);
        assertNotNull(request);
        assertEquals("/" + ID, request.getPath());
        assertEquals("Complete text.", body.blocks.get(0).text);
        assertNull(request.getHeader("Authorization"));
    }

    @Test public void usesPublicFullUrlRouteWithoutForwardingShareOrAttributionQuery() throws Exception {
        client(4096).fetch(ID, "https://code.likeagirl.io/story-" + ID + "?source=tracking&sk=private", new Cancellation());
        RecordedRequest request = server.takeRequest(1, TimeUnit.SECONDS);
        assertEquals("/https://code.likeagirl.io/story-" + ID, request.getPath());
        assertNull(request.getHeader("Cookie")); assertNull(request.getHeader("Authorization"));
    }

    @Test public void olderVerifiedIdentitySnapshotRemainsReadableAndExplicitlyMarked() throws Exception {
        response = validBody() + "<script>const data={article:{updatedAt:\"2026-10-01T00:00:00Z\"}}</script>";
        BodyCache cache = new BodyCache(cacheFolder.newFolder(), 1024 * 1024, 10, 86400000, System::currentTimeMillis);
        CachedArticleLoader loader = new CachedArticleLoader(client(4096), cache);
        ArticleRequest request = new ArticleRequest(ID, "native-revision", java.time.Instant.parse("2026-10-30T00:00:00Z").toEpochMilli());
        ReaderArticle loaded = loader.load(request, new Cancellation());
        assertEquals("Complete text.", loaded.body.blocks.get(0).text); assertTrue(loaded.olderSnapshot); assertFalse(loaded.sourceRevisionVerified);
        ReaderArticle reopened = loader.load(request, new Cancellation());
        assertTrue(reopened.fromCache); assertTrue(reopened.olderSnapshot); assertEquals(1, server.getRequestCount());
        assertTrue(loader.isStored(loaded)); loader.clear(); assertFalse(loader.isStored(loaded));
        assertTrue(loader.cacheEpoch() > loaded.cacheEpoch);
        server.enqueue(new MockResponse().setHeader("Content-Type", "text/html").setBody(response));
        ReaderArticle fetchedAgain = loader.load(request, new Cancellation());
        assertFalse(fetchedAgain.fromCache); assertEquals(loader.cacheEpoch(), fetchedAgain.cacheEpoch); assertEquals(2, server.getRequestCount());
    }

    @Test public void doesNotForwardProcessCookieJar() throws Exception {
        CookieHandler.setDefault(new CookieHandler() {
            @Override public Map<String, List<String>> get(URI uri, Map<String, List<String>> headers) {
                return Collections.singletonMap("Cookie", Collections.singletonList("session=private-account-value"));
            }
            @Override public void put(URI uri, Map<String, List<String>> headers) { }
        });
        MockWebServer controlServer = new MockWebServer();
        try {
            controlServer.enqueue(new MockResponse().setBody("control")); controlServer.start();
            HttpURLConnection control = (HttpURLConnection) controlServer.url("/control").url().openConnection();
            control.getInputStream().close(); control.disconnect();
            assertEquals("session=private-account-value", controlServer.takeRequest(1, TimeUnit.SECONDS).getHeader("Cookie"));
        } finally { controlServer.shutdown(); }
        fetch(client(4096));
        String cookie = server.takeRequest(1, TimeUnit.SECONDS).getHeader("Cookie");
        assertTrue("Account cookie leaked to mirror", cookie == null || cookie.isEmpty());
    }

    @Test public void refusesCrossOriginRedirect() throws Exception {
        status = 302; redirect = "https://other.example/" + ID;
        try { client(4096).fetch(ID, new Cancellation()); fail("Cross-origin redirect accepted"); }
        catch (ArticleException e) { assertEquals("REDIRECT", e.code); }
    }

    @Test public void enforcesDecodedResponseLimit() throws Exception {
        response = validBody() + "x".repeat(5000);
        try { client(1024).fetch(ID, new Cancellation()); fail("Oversized response accepted"); }
        catch (ArticleException e) { assertEquals("RESPONSE_LIMIT", e.code); }
    }

    @Test public void rejectsSuccessfulHttpErrorPage() throws Exception {
        response = "<html><body>Article not found</body></html>";
        try { client(4096).fetch(ID, new Cancellation()); fail("Error document accepted"); }
        catch (ArticleException e) { assertEquals("MISSING_BODY", e.code); }
    }

    @Test public void rejectsUnknownMediaType() throws Exception {
        type = "application/json";
        try { client(4096).fetch(ID, new Cancellation()); fail("Unexpected media type accepted"); }
        catch (ArticleException e) { assertEquals("CONTENT_TYPE", e.code); }
    }

    @Test public void cancellationBeforeFetchDoesNotOpenConnection() throws Exception {
        Cancellation cancellation = new Cancellation(); cancellation.cancel();
        try { client(4096).fetch(ID, cancellation); fail("Cancelled request fetched"); }
        catch (ArticleException e) { assertEquals("CANCELLED", e.code); }
        assertEquals(0, server.getRequestCount());
    }

    @Test public void rejectsInvalidIdBeforeNetwork() throws Exception {
        try { client(4096).fetch("../account", new Cancellation()); fail("Invalid ID fetched"); }
        catch (ArticleException e) { assertEquals("IDENTITY", e.code); }
        assertEquals(0, server.getRequestCount());
    }

    @Test public void acceptsBoundedSameOriginRedirectAndValidatesFinalBody() throws Exception {
        server.enqueue(new MockResponse().setResponseCode(302).setHeader("Location", "/resolved"));
        server.enqueue(new MockResponse().setHeader("Content-Type", "text/html").setBody(validBody()));
        assertEquals(ID, transport(2000, 4096).fetch(ID, new Cancellation()).postId);
        assertEquals("/" + ID, server.takeRequest(1, TimeUnit.SECONDS).getPath());
        assertEquals("/resolved", server.takeRequest(1, TimeUnit.SECONDS).getPath());
    }

    @Test public void appliesLimitAfterGzipDecompression() throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (GZIPOutputStream gzip = new GZIPOutputStream(bytes)) { gzip.write((validBody() + "x".repeat(5000)).getBytes(java.nio.charset.StandardCharsets.UTF_8)); }
        assertTrue(bytes.size() < 1024);
        server.enqueue(new MockResponse().setHeader("Content-Type", "text/html").setHeader("Content-Encoding", "gzip")
                .setBody(new okio.Buffer().write(bytes.toByteArray())));
        try { transport(2000, 1024).fetch(ID, new Cancellation()); fail("Decompressed limit was bypassed"); }
        catch (ArticleException e) { assertEquals("RESPONSE_LIMIT", e.code); }
    }

    @Test public void cancellationInterruptsAnActiveRequest() throws Exception {
        server.enqueue(new MockResponse().setSocketPolicy(SocketPolicy.NO_RESPONSE));
        Cancellation cancellation = new Cancellation();
        MirrorClient client = transport(5000, 4096);
        ExecutorService executor = Executors.newSingleThreadExecutor();
        try {
            Future<ArticleBody> result = executor.submit(() -> client.fetch(ID, cancellation));
            assertNotNull(server.takeRequest(2, TimeUnit.SECONDS));
            cancellation.cancel();
            try { result.get(2, TimeUnit.SECONDS); fail("Cancelled request completed successfully"); }
            catch (ExecutionException expected) { assertEquals("CANCELLED", ((ArticleException) expected.getCause()).code); }
        } finally { executor.shutdownNow(); }
    }

    @Test public void stalledResponseHasABoundedDeadline() throws Exception {
        server.enqueue(new MockResponse().setSocketPolicy(SocketPolicy.NO_RESPONSE));
        long start = System.nanoTime();
        try { transport(300, 4096).fetch(ID, new Cancellation()); fail("Stalled request did not time out"); }
        catch (ArticleException e) { assertEquals("TIMEOUT", e.code); }
        assertTrue(TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - start) < 2000);
    }
}
