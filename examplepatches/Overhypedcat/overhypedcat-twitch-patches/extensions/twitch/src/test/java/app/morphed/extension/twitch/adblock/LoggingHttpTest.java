package app.morphed.extension.twitch.adblock;

import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

public class LoggingHttpTest {
    private final List<String> lines = new ArrayList<>();
    private long now = 1_000;

    private LoggingHttp http(Http delegate) {
        return new LoggingHttp(delegate, lines::add, () -> now);
    }

    @Test
    public void logsStatusTimeAndSizeWithoutQuery() throws IOException {
        Http slow = new Http() {
            @Override
            public Response get(String url, java.util.Map<String, String> headers) {
                now += 250;
                return new Response(200, "#EXTM3U");
            }

            @Override
            public Response post(String url, java.util.Map<String, String> headers, String body) {
                return new Response(403, null);
            }
        };

        http(slow).get("https://usher.ttvnw.net/api/v2/channel/hls/x.m3u8?token=SECRET&sig=s", Collections.emptyMap());
        http(slow).post("https://gql.twitch.tv/gql", Collections.emptyMap(), "{}");

        assertEquals("HTTP GET https://usher.ttvnw.net/api/v2/channel/hls/x.m3u8 -> 200 in 250ms, 7 chars", lines.get(0));
        assertEquals("HTTP POST https://gql.twitch.tv/gql -> 403 in 0ms, 0 chars", lines.get(1));
        assertFalse(lines.get(0).contains("SECRET"));
    }

    @Test
    public void logsAndRethrowsFailures() {
        Http failing = new Http() {
            @Override
            public Response get(String url, java.util.Map<String, String> headers) throws IOException {
                throw new IOException("timeout");
            }

            @Override
            public Response post(String url, java.util.Map<String, String> headers, String body) throws IOException {
                throw new IOException("timeout");
            }
        };
        try {
            http(failing).get("https://x.example/a?token=SECRET", Collections.emptyMap());
            fail();
        } catch (IOException expected) {
            assertTrue(lines.get(0).startsWith("HTTP GET https://x.example/a failed after 0ms"));
            assertFalse(lines.get(0).contains("SECRET"));
        }
    }

    @Test
    public void requestStatsSummariseAndReset() {
        RequestStats.summaryAndReset();
        RequestStats.record(100, true);
        RequestStats.record(RequestStats.SLOW_MS + 500, false);

        assertEquals("player requests: 2, failed 1, slow 1, average 1800ms, max 3500ms", RequestStats.summaryAndReset());
        assertEquals("player requests: none", RequestStats.summaryAndReset());
    }
}
