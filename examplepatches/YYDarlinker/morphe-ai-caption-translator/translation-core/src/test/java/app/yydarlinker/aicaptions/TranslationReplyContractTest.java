package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.mockwebserver.MockResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class TranslationReplyContractTest extends TranslationPlaybackFixture {
    static final String FIRST = "第零句说，";
    static final String SECOND = "预算每年都在增长，";
    static final String THIRD = "而军队变化缓慢。";

    @Test public void aWrongQuoteCannotPublishUnderTheProviderSchema() throws Exception {
        rejected((payload) -> event("Other words.", "错配的翻译。"));
    }

    @Test public void aMissingQuoteCannotPublish() throws Exception {
        rejected((payload) -> new JSONObject().put("text", "缺少引用。"));
    }

    @Test public void reorderedTokensCannotPublish() throws Exception {
        rejected((payload) -> event("world. Hello", "顺序错误。"));
    }

    @Test public void inventedSourceTokensCannotPublish() throws Exception {
        rejected((payload) -> event("Hello brave world.", "额外的词。"));
    }

    @Test public void whitespaceInAnExactQuotePreservesOwnership() throws Exception {
        reply = (http, payload) -> envelope(response(payload,
                new JSONArray().put(event("Hello   world.", TRANSLATION))));
        activate();
        awaitText(TRANSLATION);
        assertEquals(1, requests.size());
        assertEquals(0L, frames.get(0).start);
        assertTrue(frames.get(0).end > frames.get(0).start);
    }

    @Test public void aSplitStreamPublishesTheCoherentPrefixBeforeTheLastEventArrives() throws Exception {
        source = sentences(1);
        position = 500;
        TranslationRuntime.loopbackStreamingForTests(java.net.URI.create(baseUrl).getHost());
        reply = (http, payload) -> {
            assertTrue(http.optBoolean("stream"));
            JSONObject answer = response(payload, clauseEvents(payload));
            String text = answer.toString();
            int lastEvent = text.lastIndexOf(",{");
            String early = sse(text.substring(0, lastEvent + 1), false);
            String late = sse(text.substring(lastEvent + 1), true) + "data: [DONE]\n\n";
            return new MockResponse().setHeader("Content-Type", "text/event-stream")
                    .setBody(early + late)
                    .throttleBody(early.getBytes(java.nio.charset.StandardCharsets.UTF_8).length, 3, TimeUnit.SECONDS);
        };
        long start = System.nanoTime();
        activate();
        awaitText(FIRST + SECOND);
        assertTrue("prefix is visible while the final chunk is held",
                System.nanoTime() - start < TimeUnit.SECONDS.toNanos(3));
        assertEquals(1, requests.size());
    }

    @Test public void aProviderRefusingSseGetsOnePlainFallback() throws Exception {
        TranslationRuntime.loopbackStreamingForTests(java.net.URI.create(baseUrl).getHost());
        reply = (http, payload) -> http.optBoolean("stream")
                ? new MockResponse().setResponseCode(400).setBody("stream unsupported")
                : envelope(response(payload, TRANSLATION));
        activate();
        awaitText(TRANSLATION);
        assertEquals(2, bodies.size());
        assertTrue(bodies.get(0).getBoolean("stream"));
        assertFalse(bodies.get(1).optBoolean("stream"));
    }

    @Test public void aPartialReplyRepairsOnlyTheMissingSourceAndKeepsAcceptedText() throws Exception {
        source = sentences(1);
        AtomicInteger calls = new AtomicInteger();
        reply = (http, payload) -> calls.incrementAndGet() == 1
                ? envelope(response(payload, new JSONArray().put(event(quote(payload, 0, 7), FIRST + SECOND))))
                : envelope(response(payload, THIRD));
        activate();
        await("bounded gap request", () -> requests.size() >= 2);
        assertNotEquals(requests.get(0).getString("source_text"), requests.get(1).getString("source_text"));
        assertTrue(requests.get(1).getString("source_text").startsWith("while"));
        await("accepted opening", () -> frames.stream().anyMatch(f -> f.text.contains(FIRST)));
        at(4500);
        await("restored ending", () -> frames.stream().anyMatch(f -> f.text.contains(THIRD)));
        assertEquals(2, requests.size());
    }

    interface BadEvent { JSONObject create(JSONObject request) throws Exception; }

    void rejected(BadEvent event) throws Exception {
        reply = (request, payload) -> envelope(response(payload, new JSONArray().put(event.create(payload))));
        activate();
        await("source mismatch rejected", () -> diagnostics.stream().anyMatch(
                line -> line.startsWith("REBUILD_EVENTS_REJECTED ") ||
                        line.startsWith("REBUILD_PARTIAL_ACCEPTED ") && line.contains("covered_tokens=0")));
        assertTrue(frames.stream().allMatch(frame -> frame.text.equals("…")));
        assertEquals("Hello world.", requests.get(0).getString("source_text"));
    }

    static JSONArray clauseEvents(JSONObject payload) throws Exception {
        return new JSONArray().put(event(quote(payload, 0, 4), FIRST))
                .put(event(quote(payload, 5, 7), SECOND))
                .put(event(quote(payload, 8, payload.getJSONArray("owned_tokens").length() - 1), THIRD));
    }

    static String sse(String content, boolean last) throws Exception {
        return "data: " + new JSONObject().put("choices", new JSONArray().put(new JSONObject()
                .put("index", 0).put("delta", new JSONObject().put("content", content))
                .put("finish_reason", last ? "stop" : JSONObject.NULL))) + "\n\n";
    }
}

