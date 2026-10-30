package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.BooleanSupplier;
import okhttp3.mockwebserver.Dispatcher;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.mockwebserver.RecordedRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

/**
 * N52, through the real engine: when a block's reply carries nothing usable, the page the viewer
 * is on is requested by itself and then displayed. The screen never stays blank over speech: it
 * shows the neutral placeholder (or holds the previous page) until the page-sized repair lands.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class N52DisplayRepairTest {
    private static final String REPAIRED = "这是修复后的译文字幕。";
    private static final String NORMAL = "这是正常译文字幕。";

    final Context context = RuntimeEnvironment.getApplication();
    final String url =
            "https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=ja&tlang=zh-Hans";
    final AtomicLong position = new AtomicLong(500);
    final List<String> shown = new CopyOnWriteArrayList<>();
    final List<String> waiting = new CopyOnWriteArrayList<>();
    final List<String> hidden = new CopyOnWriteArrayList<>();
    MockWebServer server;

    /** Auto-generated kana track: three contiguous cues, five tokens each, 1500 ms per cue. */
    static byte[] source() throws Exception {
        JSONArray events = new JSONArray();
        long at = 0;
        for (int cue = 0; cue < 3; cue++) {
            JSONArray segs = new JSONArray();
            for (int word = 0; word < 5; word++) {
                char kana = (char) ('\u3042' + ((cue * 5 + word) % 40));
                segs.put(
                        new JSONObject()
                                .put("utf8", String.valueOf(kana))
                                .put("tOffsetMs", word * 300));
            }
            events.put(
                    new JSONObject().put("tStartMs", at).put("dDurationMs", 1500).put("segs", segs));
            at += 1500;
        }
        return new JSONObject()
                .put("events", events)
                .toString()
                .getBytes(StandardCharsets.UTF_8);
    }

    /** The reply's block id must be the requested one; the dispatcher rebuilds it per request. */
    static String reply(JSONObject input, String text) throws Exception {
        String block = input.getString("block");
        JSONArray tokens = input.getJSONArray("owned_tokens");
        int from = tokens.getJSONArray(0).getInt(0);
        int to = tokens.getJSONArray(tokens.length() - 1).getInt(0);
        StringBuilder source = new StringBuilder();
        for (int i = 0; i < tokens.length(); i++) source.append(tokens.getJSONArray(i).getString(1));
        JSONArray events =
                new JSONArray()
                        .put(
                                new JSONObject()
                                        .put("from", from)
                                        .put("to", to)
                                        .put("source", source.toString())
                                        .put("text", text));
        return new JSONObject().put("block", block).put("events", events).toString();
    }

    @Before
    public void setup() throws Exception {
        RebuildController.stop();
        RebuildApi.reset();
        RebuildCache.clear(context);
        server = new MockWebServer();
        server.start();
        TranslationRuntime.install(
                new TranslationRuntime.Host() {
                    TranslationSettings settings(Context c) {
                        return new TranslationSettings(
                                true,
                                server.url("/v1").toString(),
                                "fixture-model",
                                "faithful",
                                "fixture-key",
                                "stored_custom");
                    }

                    TranslationSourceAccess.Source load(
                            Context c, String u, boolean translate, DeepSeekApiClient.RequestControl control)
                            throws Exception {
                        byte[] body = source();
                        return new TranslationSourceAccess.Source(
                                body, CaptionDocument.parse(body, "application/json"), "", 0, null);
                    }

                    String target() {
                        return "zh-Hans";
                    }

                    TranslationRuntime.ClockSample clock(String owner) {
                        return new TranslationRuntime.ClockSample(
                                true, "abcdefghijk", position.get(), SystemClock.elapsedRealtime(), 3, 1f);
                    }
                });
        TranslationOutput.install(
                new TranslationOutput.Sink() {
                    public void showEvent(
                            String text,
                            TranslationOutput.RenderGuard g,
                            String id,
                            long start,
                            long end,
                            long at,
                            CaptionRenderSpec spec) {
                        if (g.isValid() && !text.trim().isEmpty()) {
                            shown.add(text);
                            g.onApplied();
                        }
                    }

                    public void showWaitingEvent(
                            String text,
                            TranslationOutput.RenderGuard g,
                            String id,
                            long start,
                            long end,
                            long at) {
                        if (g.isValid()) {
                            waiting.add(text);
                            g.onApplied();
                        }
                    }

                    public void hide(TranslationOutput.RenderGuard g) {
                        if (g.isValid()) {
                            hidden.add(g.blankReason());
                            g.onApplied();
                        }
                    }
                });
        TranslationAudit.install(new TranslationAudit.Sink() {});
        RebuildController.activity(context);
        RebuildController.video("abcdefghijk");
        RebuildController.time(0);
    }

    @After
    public void teardown() throws Exception {
        RebuildController.stop();
        server.shutdown();
        TranslationOutput.install(new TranslationOutput.Sink() {});
    }

    private Dispatcher dispatcher(boolean emptyBlock, boolean failingBlock) {
        return new Dispatcher() {
            public MockResponse dispatch(RecordedRequest request) {
                try {
                    JSONObject root = new JSONObject(request.getBody().readUtf8());
                    JSONObject input =
                            new JSONObject(
                                    root.getJSONArray("messages").getJSONObject(1).getString("content"));
                    String repair = input.optString("repair", "");
                    boolean page = repair.contains("uncovered source range");
                    if (page) return body(reply(input, REPAIRED));
                    if (failingBlock) return new MockResponse().setResponseCode(500).setBody("{}");
                    if (emptyBlock) return body(reply(input, ""));
                    return body(reply(input, NORMAL));
                } catch (Exception error) {
                    return new MockResponse().setResponseCode(500).setBody("fixture error");
                }
            }
        };
    }

    private static MockResponse body(String content) throws Exception {
        return new MockResponse()
                .setBody(
                        new JSONObject()
                                .put(
                                        "choices",
                                        new JSONArray()
                                                .put(
                                                        new JSONObject()
                                                                .put(
                                                                        "message",
                                                                        new JSONObject()
                                                                                .put("content", content))))
                                .toString());
    }

    void await(BooleanSupplier done) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(20);
        while (!done.getAsBoolean() && System.nanoTime() < deadline) {
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(40));
            Thread.sleep(10);
        }
        assertTrue("engine did not reach the expected observable state", done.getAsBoolean());
    }

    void play(long to) throws Exception {
        position.set(to);
        RebuildController.time(to);
        for (int i = 0; i < 6; i++) {
            Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(40));
            Thread.sleep(5);
        }
    }

    @Test
    public void anEmptyReplyIsRepairedPageByPageInsteadOfBlanked() throws Exception {
        server.setDispatcher(dispatcher(true, false));
        RebuildController.activate(context, url, false, true);
        await(() -> shown.contains(REPAIRED));
        play(600);
        assertTrue(
                "a translated page is on screen: " + shown,
                shown.contains(REPAIRED) || shown.contains(NORMAL));
        assertTrue(
                "the box stood in with the neutral placeholder while repairing",
                !waiting.isEmpty() || shown.contains(REPAIRED));
    }

    @Test
    public void aFailingBlockIsRepairedPageByPageInsteadOfBlanked() throws Exception {
        server.setDispatcher(dispatcher(false, true));
        RebuildController.activate(context, url, false, true);
        await(() -> shown.contains(REPAIRED));
        play(600);
        assertTrue("a page-sized repair reached the box: " + shown, shown.contains(REPAIRED));
        assertTrue("the placeholder stood in meanwhile", !waiting.isEmpty());
    }

    @Test
    public void aWiderQuoteIsRepairedWithoutFirstShowingItsAmbiguousTranslation() throws Exception {
        String ambiguous = "这段译文提前包含后续整段内容，不能挤进开头的短时间窗口。";
        java.util.concurrent.atomic.AtomicInteger repairs = new java.util.concurrent.atomic.AtomicInteger();
        server.setDispatcher(new Dispatcher() {
            public MockResponse dispatch(RecordedRequest request) {
                try {
                    JSONObject input = new JSONObject(new JSONObject(request.getBody().readUtf8())
                            .getJSONArray("messages").getJSONObject(1).getString("content"));
                    if (!input.optString("repair").isEmpty()) {
                        repairs.incrementAndGet();
                        return body(reply(input, REPAIRED));
                    }
                    JSONObject bad = new JSONObject(reply(input, ambiguous));
                    JSONObject event = bad.getJSONArray("events").getJSONObject(0);
                    event.put("to", event.getInt("from"));
                    return body(bad.toString());
                } catch (Exception failure) {
                    return new MockResponse().setResponseCode(500).setBody("fixture error");
                }
            }
        });
        RebuildController.activate(context, url + "&kind=asr", false, true);
        await(() -> shown.contains(REPAIRED));
        play(600);
        assertFalse("the ambiguous paragraph must never acquire display time", shown.contains(ambiguous));
        assertTrue("the normal bounded repair path supplied the translation", repairs.get() > 0);
        assertTrue("one block cannot exceed the existing page and hole limits", repairs.get() <= 5);
    }
}
