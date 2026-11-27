package app.jimaku.extension.gateway;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.net.CookieHandler;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public class HttpTest {
    private static final String USER_AGENT = "Jimaku-Android/1.2.3";

    private TestServer server;
    private CookieHandler previousCookies;

    @Before
    public void start() throws IOException {
        server = new TestServer();
        previousCookies = CookieHandler.getDefault();
    }

    @After
    public void stop() throws IOException {
        CookieHandler.setDefault(previousCookies);
        server.close();
    }

    private URI at(String path) {
        return URI.create(server.origin() + path);
    }

    @Test
    public void aPostCarriesItsBody() throws Exception {
        server.answer("/jobs", 200, "{}");
        String body = "{\"title\":\"魔法の本\",\"events\":[{\"tStartMs\":0}]}";
        Http.Response response = Http.send(Http.Request.post(at("/jobs?video=x"), "application/json", body.getBytes(StandardCharsets.UTF_8)),
                USER_AGENT, 2_000, new Cancellation());
        assertEquals(200, response.status);
        TestServer.Request sent = server.requests.get(0);
        assertEquals("POST /jobs?video=x HTTP/1.1", sent.line);
        assertEquals("application/json", sent.header("content-type"));
        assertEquals(String.valueOf(body.getBytes(StandardCharsets.UTF_8).length), sent.header("content-length"));
        assertEquals(body, sent.body);
    }

    @Test
    public void aPostWithoutABodySaysSo() throws Exception {
        server.answer("/installs", 200, "{}");
        Http.send(Http.Request.post(at("/installs"), "application/json", null), USER_AGENT, 2_000, new Cancellation());
        TestServer.Request sent = server.requests.get(0);
        assertEquals("POST", sent.method());
        assertEquals("0", sent.header("content-length"));
        assertFalse(sent.headers.containsKey("content-type"));
        assertEquals("", sent.body);
    }

    @Test
    public void noRequestCarriesACookieEvenWithACookieStoreInstalled() throws Exception {
        CookieHandler.setDefault(new EveryCookie());
        server.answer("/a", 200, "{}");
        Http.send(Http.Request.get(at("/a")), USER_AGENT, 2_000, new Cancellation());
        Http.send(Http.Request.post(at("/a"), "application/json", "{}".getBytes(StandardCharsets.UTF_8)), USER_AGENT, 2_000, new Cancellation());
        Http.send(Http.Request.post(at("/a"), null, null).with("Authorization", "Bearer s"), USER_AGENT, 2_000, new Cancellation());
        assertEquals(Arrays.asList("accept", "connection", "host", "user-agent"), sorted(server.requests.get(0).headers));
        assertEquals(Arrays.asList("accept", "connection", "content-length", "content-type", "host", "user-agent"), sorted(server.requests.get(1).headers));
        assertEquals(Arrays.asList("accept", "authorization", "connection", "content-length", "host", "user-agent"), sorted(server.requests.get(2).headers));
        for (TestServer.Request request : server.requests) {
            assertFalse(request.headers.containsKey("cookie"));
            assertEquals(Collections.singletonList(USER_AGENT), request.headers.get("user-agent"));
        }
    }

    @Test
    public void aValueWithALineBreakIsNeverSent() {
        try {
            Http.send(Http.Request.get(at("/a")).with("Authorization", "Bearer s\r\nCookie: x"), USER_AGENT, 2_000, new Cancellation());
            fail("sent");
        } catch (IOException e) {
            assertTrue(server.requests.isEmpty());
        }
    }

    @Test
    public void aConnectionThatNeverAnswersHoldsUpNoOtherRead() throws Exception {
        server.answerLate("/stuck", 20_000);
        server.answer("/quick", 200, "{\"ok\":true}");
        ExecutorService pool = Requests.pool((thread, fault) -> { });
        Cancellation stuck = new Cancellation();
        try {
            List<Future<Http.Response>> held = new ArrayList<>();
            // All threads but one wait on answers that don't come.
            for (int i = 0; i < Requests.THREADS - 1; i++) {
                held.add(pool.submit(() -> Http.send(Http.Request.get(at("/stuck")), USER_AGENT, 30_000, stuck)));
            }
            long started = System.nanoTime();
            Future<Http.Response> quick = pool.submit(() -> Http.send(Http.Request.get(at("/quick")), USER_AGENT, 30_000, new Cancellation()));
            assertEquals("{\"ok\":true}", quick.get(3, TimeUnit.SECONDS).text());
            assertTrue(System.nanoTime() - started < 3_000_000_000L);
            for (Future<Http.Response> each : held) assertFalse(each.isDone());
        } finally {
            stuck.cancel();
            pool.shutdownNow();
        }
    }

    private static List<String> sorted(Map<String, List<String>> headers) {
        List<String> names = new ArrayList<>(headers.keySet());
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
