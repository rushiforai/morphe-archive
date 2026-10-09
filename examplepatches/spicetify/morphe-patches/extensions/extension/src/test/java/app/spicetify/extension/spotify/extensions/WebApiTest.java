package app.spicetify.extension.spotify.extensions;

import static app.spicetify.extension.spotify.extensions.PlayerBridgeTest.CEILING_SECONDS;
import static java.nio.charset.StandardCharsets.UTF_8;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.content.Context;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLog;
import org.robolectric.shadows.ShadowToast;

/** Robolectric for its real {@code org.json}; the plain android.jar only has stubs. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class WebApiTest {
    @Test
    public void searchUrlAsksForOneTrackAtTheOffsetInTheTokensMarket() {
        assertEquals("https://api.spotify.com/v1/search?q=a&type=track&limit=1&offset=5&market=from_token",
                WebApi.searchUrl("a", 5));
        assertEquals("the query is URL-encoded",
                "https://api.spotify.com/v1/search?q=a+b%26c&type=track&limit=1&offset=0&market=from_token",
                WebApi.searchUrl("a b&c", 0));
    }

    @Test
    public void parseSearchReadsTheFirstTrackAndTheTotal() throws Exception {
        WebApi.SearchResult found =
                WebApi.parseSearch("{\"tracks\":{\"items\":[{\"uri\":\"spotify:track:x\"}],\"total\":42}}");

        assertEquals("spotify:track:x", found.trackUri);
        assertEquals(42, found.total);
    }

    @Test
    public void parseSearchOfAnEmptyPageGivesNoUriButStillTheTotal() throws Exception {
        WebApi.SearchResult found = WebApi.parseSearch("{\"tracks\":{\"items\":[],\"total\":42}}");

        assertNull(found.trackUri);
        assertEquals(42, found.total);
    }

    @Test
    public void parseTokenReadsTheAccessTokenAndAnErrorCodeAbove0Fails() throws Exception {
        assertEquals("abc", WebApi.parseToken(
                "{\"accessToken\":\"abc\",\"expiresIn\":3600,\"tokenType\":\"Bearer\",\"errorCode\":0}"));
        try {
            WebApi.parseToken("{\"errorCode\":3,\"errorDescription\":\"logged out\"}");
            fail("expected IOException");
        } catch (IOException expected) {
            assertEquals("sp://auth/v2/token responded with an error: 3, logged out", expected.getMessage());
        }
    }

    @Test
    public void aTruncatedTokenAnswerKeepsTheTokenOutOfTheMessageTheStatusTheLogAndTheToast() throws Exception {
        String truncated = "{\"accessToken\":\"SECRET-TOKEN\",\"expiresIn\":3600"; // no closing brace
        String why = "sp://auth/v2/token gave an answer that isn't a JSON object";
        try {
            WebApi.parseToken(truncated);
            fail("expected IOException");
        } catch (IOException expected) {
            assertEquals(why, expected.getMessage());
        }

        // The same answer through a run, whose failure goes to the status, the log and a Toast.
        Context context = RuntimeEnvironment.getApplication();
        Extensions.setAppContext(context);
        Extensions.status(Extensions.RANDOM_SONG, "not run");
        PlayerBridgeTest.FakeRouter router = new PlayerBridgeTest.FakeRouter();
        PlayerBridge.attach(router);
        RandomSong.playFromSpotify(context, (url, token) -> {
            throw new AssertionError("no search without a token");
        });
        router.next().callback.onResponse(200, truncated.getBytes(UTF_8));

        RandomSongTest.awaitToast("Couldn't find a random song: " + why);
        RandomSongTest.awaitStatus("Couldn't find a random song: " + why);
        assertFalse(ShadowToast.getTextOfLatestToast().contains("SECRET-TOKEN"));
        assertFalse(Extensions.latestStatus(Extensions.RANDOM_SONG).contains("SECRET-TOKEN"));
        for (ShadowLog.LogItem item : ShadowLog.getLogs()) {
            String logged = item.msg + (item.throwable == null ? "" : " " + item.throwable);
            assertFalse(logged, logged.contains("SECRET-TOKEN"));
        }
    }

    @Test
    public void aTokenAHeaderCantCarryIsRefusedWithoutShowingIt() throws Exception {
        // A line break, a character past ASCII and DEL: none is printable ASCII.
        for (String escaped : new String[] {"\\n", "\\u00e9", "\\u007f"}) {
            try {
                WebApi.parseToken("{\"accessToken\":\"SECRET" + escaped + "TOKEN\"}");
                fail("expected IOException for " + escaped);
            } catch (IOException expected) {
                assertEquals("sp://auth/v2/token gave a token with a character outside printable ASCII",
                        expected.getMessage());
            }
        }
    }

    @Test
    public void theRealGetSendsTheBearerTokenAndA429FailsWithoutIt() throws Exception {
        // com.sun.net.httpserver isn't on this source set's classpath, which is android.jar's, so a
        // plain socket on 127.0.0.1 serves the one request.
        try (ServerSocket server = new ServerSocket(0, 1, InetAddress.getByName("127.0.0.1"))) {
            FutureTask<String> serving = new FutureTask<>(() -> {
                try (Socket client = server.accept()) {
                    BufferedReader request = new BufferedReader(new InputStreamReader(client.getInputStream(), UTF_8));
                    String authorization = null;
                    for (String line; (line = request.readLine()) != null && !line.isEmpty(); ) {
                        if (line.regionMatches(true, 0, "Authorization:", 0, 14)) {
                            authorization = line.substring(14).trim();
                        }
                    }
                    client.getOutputStream().write(("HTTP/1.1 429 Too Many Requests\r\n"
                            + "Content-Length: 0\r\nConnection: close\r\n\r\n").getBytes(UTF_8));
                    client.getOutputStream().flush();
                    return authorization;
                }
            });
            new Thread(serving, "Web API test server").start();

            try {
                WebApi.HTTP.get("http://127.0.0.1:" + server.getLocalPort() + "/v1/search?q=a", "tok");
                fail("expected IOException");
            } catch (IOException expected) {
                assertEquals("the Web API answered HTTP 429", expected.getMessage());
                assertFalse(expected.getMessage().contains("tok"));
            }
            assertEquals("Bearer tok", serving.get(CEILING_SECONDS, TimeUnit.SECONDS));
        }
    }

    @Test
    public void theRealGetSurfacesA429sRetryAfterAndQuotaExceededWithoutTheToken() throws Exception {
        String quota = "{\"error\":{\"status\":429,\"message\":\"Too many requests\",\"reason\":\"QUOTA_EXCEEDED\"}}";
        WebApi.RateLimited limited = rateLimitedBy("Retry-After: 30\r\n", quota);
        assertEquals("the Web API answered HTTP 429 (QUOTA_EXCEEDED), retry after 30 s", limited.getMessage());
        assertEquals(30, limited.retryAfterSeconds);
        assertTrue(limited.quotaExceeded);

        String tooMany = "{\"error\":{\"status\":429,\"message\":\"Too many requests\"}}";
        limited = rateLimitedBy("Retry-After: 2\r\n", tooMany);
        assertEquals("the Web API answered HTTP 429, retry after 2 s", limited.getMessage());
        assertEquals(2, limited.retryAfterSeconds);
        assertFalse(limited.quotaExceeded);

        limited = rateLimitedBy("", "not json");
        assertEquals("the Web API answered HTTP 429", limited.getMessage());
        assertEquals(0, limited.retryAfterSeconds);
        assertFalse(limited.quotaExceeded);
    }

    @Test
    public void theRealGetGoesThroughThePace() {
        assertTrue(WebApi.HTTP instanceof WebApi.Paced);
    }

    @Test
    public void thePaceSendsOneRequestASecondAtMost() throws Exception {
        FakeClock clock = new FakeClock();
        List<Long> sent = new ArrayList<>();
        WebApi.Paced paced = new WebApi.Paced((url, token) -> {
            sent.add(clock.now);
            return "{}";
        }, clock);

        paced.get("https://api.spotify.com/v1/tracks/a", "token");
        paced.get("https://api.spotify.com/v1/tracks/b", "token"); // waits out the rest of the second
        clock.now += 1500;
        paced.get("https://api.spotify.com/v1/tracks/c", "token"); // more than a second after the last one

        assertEquals(Arrays.asList(5000L, 6000L, 7500L), sent);
        assertEquals(Arrays.asList(1000L), clock.sleeps);
    }

    @Test
    public void a429PausesThePaceForItsRetryAfterAndRequestsInThePauseFailAtOnce() throws Exception {
        FakeClock clock = new FakeClock();
        List<String> sent = new ArrayList<>();
        WebApi.Paced paced = new WebApi.Paced((url, token) -> {
            sent.add(url);
            if (sent.size() == 1) {
                throw new WebApi.RateLimited("the Web API answered HTTP 429, retry after 5 s", 5, false);
            }
            return "{}";
        }, clock);

        WebApi.RateLimited limited = rateLimited(paced, "SECRET-TOKEN");
        assertEquals("the 429 itself reaches the caller", "the Web API answered HTTP 429, retry after 5 s",
                limited.getMessage());
        clock.now += 1000;
        limited = rateLimited(paced, "SECRET-TOKEN");
        assertEquals("the Web API asked to wait 4 s more", limited.getMessage());
        assertEquals(4, limited.retryAfterSeconds);
        assertFalse(limited.quotaExceeded);
        clock.now += 500;
        assertEquals("part of a second counts as a whole one", 4, rateLimited(paced, "SECRET-TOKEN").retryAfterSeconds);
        assertEquals("held back without a request", 1, sent.size());

        clock.now += 3500; // the pause is over
        assertEquals("{}", paced.get("https://api.spotify.com/v1/tracks/a", "SECRET-TOKEN"));
        assertEquals(2, sent.size());
        assertTrue("never a wait for the pause itself", clock.sleeps.isEmpty());
    }

    @Test
    public void quotaExceededStopsThePaceForTheSession() throws Exception {
        FakeClock clock = new FakeClock();
        List<String> sent = new ArrayList<>();
        WebApi.Paced paced = new WebApi.Paced((url, token) -> {
            sent.add(url);
            throw new WebApi.RateLimited("the Web API answered HTTP 429 (QUOTA_EXCEEDED), retry after 60 s", 60, true);
        }, clock);

        assertTrue(rateLimited(paced, "SECRET-TOKEN").quotaExceeded);
        clock.now += 24 * 60 * 60 * 1000L; // a day later, long past its Retry-After
        WebApi.RateLimited stopped = rateLimited(paced, "SECRET-TOKEN");

        assertEquals("the Web API quota is used up (QUOTA_EXCEEDED) until Spotify restarts", stopped.getMessage());
        assertTrue(stopped.quotaExceeded);
        assertEquals("nothing more is sent", 1, sent.size());
    }

    /** Serves one 429 with {@code headers} and {@code body} to the real GET, and returns what it threw. */
    private static WebApi.RateLimited rateLimitedBy(String headers, String body) throws Exception {
        try (ServerSocket server = new ServerSocket(0, 1, InetAddress.getByName("127.0.0.1"))) {
            FutureTask<Void> serving = new FutureTask<>(() -> {
                try (Socket client = server.accept()) {
                    BufferedReader request = new BufferedReader(new InputStreamReader(client.getInputStream(), UTF_8));
                    for (String line; (line = request.readLine()) != null && !line.isEmpty(); ) {
                        // read the request's headers
                    }
                    byte[] content = body.getBytes(UTF_8);
                    client.getOutputStream().write(("HTTP/1.1 429 Too Many Requests\r\n" + headers
                            + "Content-Type: application/json\r\nContent-Length: " + content.length
                            + "\r\nConnection: close\r\n\r\n").getBytes(UTF_8));
                    client.getOutputStream().write(content);
                    client.getOutputStream().flush();
                }
                return null;
            });
            new Thread(serving, "Web API test server").start();
            try {
                WebApi.blockingGet("http://127.0.0.1:" + server.getLocalPort() + "/v1/tracks/a", "SECRET-TOKEN");
                throw new AssertionError("expected a RateLimited");
            } catch (WebApi.RateLimited expected) {
                assertFalse(expected.getMessage().contains("SECRET-TOKEN"));
                serving.get(CEILING_SECONDS, TimeUnit.SECONDS);
                return expected;
            }
        }
    }

    /** What one request through {@code paced} threw; the token never shows in it. */
    private static WebApi.RateLimited rateLimited(WebApi.Paced paced, String token) throws IOException {
        try {
            paced.get("https://api.spotify.com/v1/tracks/a", token);
            throw new AssertionError("expected a RateLimited");
        } catch (WebApi.RateLimited expected) {
            assertFalse(expected.getMessage().contains(token));
            return expected;
        }
    }

    /** A clock the test moves by hand; a sleep moves it on at once. */
    private static final class FakeClock implements WebApi.Clock {
        /** Anywhere: the real clock counts from an arbitrary origin. */
        long now = 5000;
        final List<Long> sleeps = new ArrayList<>();

        @Override
        public long millis() {
            return now;
        }

        @Override
        public void sleep(long millis) {
            sleeps.add(millis);
            now += millis;
        }
    }
}
