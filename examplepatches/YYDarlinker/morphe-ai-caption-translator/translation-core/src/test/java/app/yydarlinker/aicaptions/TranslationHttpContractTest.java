package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import okhttp3.mockwebserver.MockResponse;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class TranslationHttpContractTest extends TranslationPlaybackFixture {
    @Test public void unauthorizedConfigurationStopsPaidWork() throws Exception { terminal(401); }
    @Test public void forbiddenConfigurationStopsPaidWork() throws Exception { terminal(403); }
    @Test public void unavailableModelStopsPaidWork() throws Exception { terminal(404); }

    void terminal(int status) throws Exception {
        reply = (request, payload) -> new MockResponse().setResponseCode(status);
        activate();
        await("configuration status", () -> statuses.contains("api_config_error"));
        idle(60_000);
        assertEquals(1, requests.size());
        assertTrue(frames.isEmpty());
    }

    @Test public void retryAfterSecondsKeepsProviderQuietBeforeRetry() throws Exception {
        retryAfter("17");
    }

    @Test public void retryAfterHttpDateKeepsProviderQuietBeforeRetry() throws Exception {
        retryAfter(DateTimeFormatter.RFC_1123_DATE_TIME.format(ZonedDateTime.now(ZoneOffset.UTC).plusSeconds(19)));
    }

    void retryAfter(String header) throws Exception {
        AtomicBoolean first = new AtomicBoolean(true);
        reply = (request, payload) -> first.getAndSet(false)
                ? new MockResponse().setResponseCode(429).setHeader("Retry-After", header)
                : envelope(response(payload, TRANSLATION));
        activate();
        await("rate-limit response", () -> diagnostics.stream().anyMatch(line -> line.startsWith("REBUILD_EVENTS_REJECTED ") && line.contains("reason=http_429")));
        idle(5_000);
        assertEquals(1, requests.size());
        assertTrue(frames.isEmpty());
        idle(30_000);
        at(position);
        awaitText(TRANSLATION);
        assertEquals(2, requests.size());
    }

    @Test public void stalledHttpReplyEnforcesForegroundDeadlineAndCanRecover() throws Exception {
        AtomicBoolean first = new AtomicBoolean(true);
        // Drip the framing bytes of the first chunk. Each socket read can make progress,
        // but no payload byte arrives before the request's absolute deadline.
        reply = (request, payload) -> first.getAndSet(false)
                ? new MockResponse().setChunkedBody("x", 1)
                        .setHeadersDelay(8_500, TimeUnit.MILLISECONDS)
                        .throttleBody(1, 650, TimeUnit.MILLISECONDS)
                : envelope(response(payload, TRANSLATION));
        activate();
        await("provider recorded a real deadline expiry",
                () -> diagnostics.stream().anyMatch(line -> line.startsWith("REBUILD_EVENTS_REJECTED ")
                        && line.contains("deadline_expired")));
        assertTrue(frames.isEmpty());
        idle(5_000);
        at(position);
        awaitText(TRANSLATION);
        assertEquals(2, requests.size());
    }

    @Test public void rejectedOptionalSchemaIsRetriedOnceWithoutSchema() throws Exception {
        AtomicBoolean first = new AtomicBoolean(true);
        reply = (request, payload) -> first.getAndSet(false)
                ? new MockResponse().setResponseCode(400).setBody("response_format unsupported")
                : envelope(response(payload, TRANSLATION));
        activate();
        awaitText(TRANSLATION);
        assertEquals(2, bodies.size());
        assertTrue(bodies.get(0).has("response_format"));
        assertFalse(bodies.get(1).has("response_format"));
        assertEquals(requests.get(0).toString(), requests.get(1).toString());
    }
}

