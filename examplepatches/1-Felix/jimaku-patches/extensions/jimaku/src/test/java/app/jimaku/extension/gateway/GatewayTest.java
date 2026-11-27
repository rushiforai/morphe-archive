package app.jimaku.extension.gateway;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.net.CookieHandler;
import java.net.HttpURLConnection;
import java.net.ServerSocket;
import java.net.URI;
import java.net.URL;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import app.jimaku.extension.SharedCases;
import app.jimaku.extension.subtitles.Line;

public class GatewayTest {
    private static final String VIDEO = "bWCkSOafQNc";
    private static final String USER_AGENT = "Jimaku-Android/1.2.3";

    private TestServer server;
    private Gateway gateway;
    private CookieHandler previousCookies;

    @Before
    public void start() throws IOException {
        server = new TestServer();
        gateway = new Gateway(server.origin(), USER_AGENT, 2_000, new MemoryInstalls());
        previousCookies = CookieHandler.getDefault();
    }

    @After
    public void stop() throws IOException {
        CookieHandler.setDefault(previousCookies);
        server.close();
    }

    @Test
    public void readsALookupAsTheGatewayAnswersIt() throws Exception {
        server.answer("/videos/" + VIDEO, 200, SharedCases.resource("/gateway/lookup-bWCkSOafQNc.json"));
        Lookup lookup = gateway.lookup(VIDEO, new Cancellation());
        assertEquals("ja", lookup.original);
        assertEquals(Arrays.asList("da", "en"), lookup.translations);
        assertFalse(lookup.mixed);
        assertEquals(Arrays.asList("ja", "da", "en"), lookup.cachedLanguages());
    }

    @Test
    public void doesNotOfferAMixedTranscriptsOriginal() throws Exception {
        server.answer("/videos/" + VIDEO, 200, "{\"video\":\"" + VIDEO + "\",\"original\":\"ja\",\"translations\":[\"de\",\"en\"],\"mixed\":true}");
        assertEquals(Arrays.asList("de", "en"), gateway.lookup(VIDEO, new Cancellation()).cachedLanguages());

        server.answer("/videos/" + VIDEO, 200, "{\"video\":\"" + VIDEO + "\",\"original\":\"ja\",\"translations\":[\"en\",\"ja\"],\"mixed\":true}");
        assertEquals(Arrays.asList("en", "ja"), gateway.lookup(VIDEO, new Cancellation()).cachedLanguages());
    }

    @Test
    public void leavesOutTranslationsItDoesNotKnow() throws Exception {
        server.answer("/videos/" + VIDEO, 200, "{\"original\":\"ja\",\"translations\":[\"en\",\"xx\",3,\"zh-Hant\"],\"mixed\":\"yes\"}");
        Lookup lookup = gateway.lookup(VIDEO, new Cancellation());
        assertEquals(Arrays.asList("en", "zh-Hant"), lookup.translations);
        assertFalse(lookup.mixed);
    }

    @Test
    public void notCachedIsNull() throws Exception {
        assertNull(gateway.lookup("aaaaaaaaaaa", new Cancellation()));
    }

    @Test
    public void unreadableLookupsShowNothing() {
        assertCode("bad_answer", () -> lookupWith(200, "{\"original\":\"xx\",\"translations\":[]}"));
        assertCode("bad_answer", () -> lookupWith(200, "{\"original\":\"ja\"}"));
        assertCode("bad_answer", () -> lookupWith(200, "[1,2]"));
        assertCode("bad_answer", () -> lookupWith(200, "<html>"));
        assertCode("bad_answer", () -> lookupWith(200, ""));
        assertCode("busy", () -> lookupWith(503, "{\"error\":\"busy\"}"));
        assertCode("http_502", () -> lookupWith(502, "<html>Bad gateway</html>"));
    }

    @Test
    public void readsADocumentAsTheGatewayAnswersIt() throws Exception {
        server.answer("/videos/" + VIDEO + "/en", 200, SharedCases.resource("/gateway/document-bWCkSOafQNc-en.json"));
        List<Line> lines = gateway.document(VIDEO, "en", new Cancellation());
        assertEquals(23, lines.size());
        assertEquals(0.8, lines.get(0).start, 0);
        assertEquals(4.3, lines.get(0).end, 0);
        assertTrue(lines.get(0).text, lines.get(0).text.contains("\n"));
        assertEquals("The magic that makes your endings weird.", lines.get(1).text);
    }

    @Test
    public void readsChunkedAnswers() throws Exception {
        server.answerChunked("/videos/" + VIDEO + "/ja", 200,
                "{\"lines\":[{\"start\":1,\"end\":2.5,\"text\":\"魔法の本を見つけた。\\n変な魔法\"}]}");
        List<Line> lines = gateway.document(VIDEO, "ja", new Cancellation());
        assertEquals(1, lines.size());
        assertEquals("魔法の本を見つけた。\n変な魔法", lines.get(0).text);
    }

    @Test
    public void unreadableDocumentsShowNothing() {
        assertCode("bad_answer", () -> documentWith(200, "{\"lines\":[{\"start\":1,\"end\":2}]}"));
        assertCode("bad_answer", () -> documentWith(200, "{\"lines\":[{\"start\":\"1\",\"end\":2,\"text\":\"a\"}]}"));
        assertCode("bad_answer", () -> documentWith(200, "{\"lines\":{}}"));
        assertCode("not_found", () -> documentWith(404, "{\"error\":\"not_found\"}"));
        assertCode("bad_language", () -> gateway.document(VIDEO, "xx", new Cancellation()));
        assertCode("bad_video", () -> gateway.document("../admin", "en", new Cancellation()));
        // The last two were refused before any request.
        assertEquals(4, server.requests.size());
    }

    @Test
    public void namesOnlyTheVideoAndTheLanguage() throws Exception {
        server.answer("/videos/" + VIDEO, 200, SharedCases.resource("/gateway/lookup-bWCkSOafQNc.json"));
        server.answer("/videos/" + VIDEO + "/en", 200, SharedCases.resource("/gateway/document-bWCkSOafQNc-en.json"));
        gateway.lookup(VIDEO, new Cancellation());
        gateway.document(VIDEO, "en", new Cancellation());
        assertEquals("GET /videos/" + VIDEO + " HTTP/1.1", server.requests.get(0).line);
        assertEquals("GET /videos/" + VIDEO + "/en HTTP/1.1", server.requests.get(1).line);
    }

    @Test
    public void sendsNoCookieOrCredentialsEvenWithACookieStoreInstalled() throws Exception {
        CookieHandler.setDefault(new EveryCookie());
        server.answer("/videos/" + VIDEO, 200, SharedCases.resource("/gateway/lookup-bWCkSOafQNc.json"));
        server.answer("/videos/" + VIDEO + "/en", 200, SharedCases.resource("/gateway/document-bWCkSOafQNc-en.json"));

        // The platform's connection would send the store's cookie: the reason Jimaku doesn't use it.
        HttpURLConnection platform = (HttpURLConnection) new URL(server.origin() + "/videos/" + VIDEO).openConnection();
        try (InputStream ignored = platform.getInputStream()) {
            assertEquals(200, platform.getResponseCode());
        }
        assertTrue(server.requests.get(0).headers.containsKey("cookie"));

        gateway.lookup(VIDEO, new Cancellation());
        gateway.document(VIDEO, "en", new Cancellation());
        for (TestServer.Request request : server.requests.subList(1, server.requests.size())) {
            assertEquals(Arrays.asList("accept", "connection", "host", "user-agent"), sorted(request.headers));
            assertEquals(Collections.singletonList(USER_AGENT), request.headers.get("user-agent"));
            assertEquals(Collections.singletonList("application/json"), request.headers.get("accept"));
            assertFalse(request.headers.containsKey("cookie"));
            assertFalse(request.headers.containsKey("authorization"));
        }
    }

    @Test
    public void userAgentNamesJimakuAndTheBundleVersionOnly() {
        assertTrue(Gateway.userAgent(), Gateway.userAgent().matches("Jimaku-Android/[0-9]+\\.[0-9]+\\.[0-9]+(-[0-9A-Za-z.]+)?"));
    }

    @Test
    public void cancellingEndsAWaitingRead() throws Exception {
        server.answerLate("/videos/" + VIDEO, 10_000);
        Gateway slow = new Gateway(server.origin(), USER_AGENT, 30_000, new MemoryInstalls());
        Cancellation cancellation = new Cancellation();
        Thread canceller = new Thread(() -> {
            try {
                Thread.sleep(200);
            } catch (InterruptedException ignored) {
                return;
            }
            cancellation.cancel();
        });
        long started = System.nanoTime();
        canceller.start();
        assertCode("cancelled", () -> slow.lookup(VIDEO, cancellation));
        assertTrue("took " + (System.nanoTime() - started) / 1_000_000 + " ms", System.nanoTime() - started < 3_000_000_000L);
    }

    @Test
    public void aCancelledVideoMakesNoMoreRequests() {
        Cancellation cancellation = new Cancellation();
        cancellation.cancel();
        assertCode("cancelled", () -> gateway.lookup(VIDEO, cancellation));
        assertTrue(server.requests.isEmpty());
    }

    @Test
    public void unreachableIsOffline() throws Exception {
        int port;
        try (ServerSocket closed = new ServerSocket(0)) {
            port = closed.getLocalPort();
        }
        Gateway away = new Gateway("http://127.0.0.1:" + port, USER_AGENT, 2_000, new MemoryInstalls());
        assertCode("offline", () -> away.lookup(VIDEO, new Cancellation()));
    }

    private Lookup lookupWith(int status, String body) throws GatewayException {
        server.answer("/videos/" + VIDEO, status, body);
        return gateway.lookup(VIDEO, new Cancellation());
    }

    private List<Line> documentWith(int status, String body) throws GatewayException {
        server.answer("/videos/" + VIDEO + "/en", status, body);
        return gateway.document(VIDEO, "en", new Cancellation());
    }

    private interface Read {
        Object run() throws GatewayException;
    }

    private static void assertCode(String code, Read read) {
        try {
            read.run();
            fail("expected " + code);
        } catch (GatewayException e) {
            assertEquals(code, e.code);
        }
    }

    private static List<String> sorted(Map<String, List<String>> headers) {
        List<String> names = new java.util.ArrayList<>(headers.keySet());
        Collections.sort(names);
        return names;
    }

    /** A cookie store that has a cookie for every address. */
    private static final class EveryCookie extends CookieHandler {
        @Override
        public Map<String, List<String>> get(URI uri, Map<String, List<String>> requestHeaders) {
            return Collections.singletonMap("Cookie", Collections.singletonList("session=secret"));
        }

        @Override
        public void put(URI uri, Map<String, List<String>> responseHeaders) {
        }
    }
}
