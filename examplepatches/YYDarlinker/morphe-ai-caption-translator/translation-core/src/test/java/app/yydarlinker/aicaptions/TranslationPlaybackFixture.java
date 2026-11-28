package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.ContextWrapper;
import android.media.session.PlaybackState;
import android.os.Looper;
import android.os.SystemClock;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.function.BooleanSupplier;
import java.util.zip.GZIPInputStream;
import okhttp3.mockwebserver.Dispatcher;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.mockwebserver.RecordedRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.rules.TemporaryFolder;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;

public abstract class TranslationPlaybackFixture {
    static final String VIDEO = "abcdefghijk";
    static final String OTHER = "zyxwvutsrqp";
    static final String URL = "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=en";
    static final String TRANSLATION = "你好，世界。";
    static final String SIMPLE = "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":5000,\"segs\":"
            + "[{\"utf8\":\"Hello \",\"tOffsetMs\":0},{\"utf8\":\"world.\",\"tOffsetMs\":1000}]}]}";

    @Rule public final TemporaryFolder owned = new TemporaryFolder();
    Context context;
    MockWebServer server;
    volatile byte[] source = SIMPLE.getBytes(StandardCharsets.UTF_8);
    volatile String format = "application/json", target = "zh-Hans", video = VIDEO;
    volatile String key = "fixture-key", model = "fixture-model";
    volatile long position;
    volatile boolean playing, authored;
    volatile String baseUrl;
    volatile Reply reply = (request, payload) -> envelope(response(payload, TRANSLATION));
    volatile TranslationOutput.RenderGuard guard;
    final List<JSONObject> requests = new CopyOnWriteArrayList<>();
    final List<String> diagnostics = new CopyOnWriteArrayList<>();
    final List<JSONObject> bodies = new CopyOnWriteArrayList<>();
    final List<String> statuses = new CopyOnWriteArrayList<>();
    final List<Frame> frames = new CopyOnWriteArrayList<>();
    final List<Throwable> fixtureErrors = new CopyOnWriteArrayList<>();
    final List<Boolean> cleared = new CopyOnWriteArrayList<>();

    static final class Frame {
        final String text, id;
        final long start, end, position;
        final TranslationOutput.RenderGuard guard;

        Frame(String text, String id, long start, long end, long position, TranslationOutput.RenderGuard guard) {
            this.text = text;
            this.id = id;
            this.start = start;
            this.end = end;
            this.position = position;
            this.guard = guard;
        }

        String text() { return text; }

        @Override public String toString() {
            return position + " " + id + " [" + start + ", " + end + "] " + text;
        }
    }


    interface Reply {
        MockResponse answer(JSONObject request, JSONObject payload) throws Exception;
    }

    @Before public void startFixture() throws Exception {
        var cache = owned.newFolder("cache");
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public java.io.File getCacheDir() { return cache; }
            @Override public Context getApplicationContext() { return this; }
        };
        server = new MockWebServer();
        server.setDispatcher(new Dispatcher() {
            @Override public MockResponse dispatch(RecordedRequest request) throws InterruptedException {
                try {
                    if (!"POST".equals(request.getMethod()) || !"/v1/chat/completions".equals(request.getPath())) {
                        throw new AssertionError("unexpected provider request " + request);
                    }
                    JSONObject body = new JSONObject(request.getBody().readUtf8());
                    JSONObject payload = new JSONObject(body.getJSONArray("messages").getJSONObject(1).getString("content"));
                    bodies.add(body);
                    requests.add(payload);
                    return reply.answer(body, payload);
                } catch (InterruptedException stopped) {
                    throw stopped;
                } catch (Exception | AssertionError failure) {
                    fixtureErrors.add(failure);
                    return new MockResponse().setResponseCode(500);
                }
            }
        });
        server.start();
        baseUrl = server.url("/v1").toString();
        TranslationRuntime.install(new TranslationRuntime.Host() {
            @Override protected TranslationSettings settings(Context c) {
                return new TranslationSettings(true, baseUrl, model, "faithful", key, "stored_custom");
            }

            @Override protected TranslationSourceAccess.Source load(Context c, String url, boolean translate,
                                                          CaptionApiClient.RequestControl control) throws Exception {
                return new TranslationSourceAccess.Source(source, CaptionDocument.parse(source, format), "", 0, null);
            }

            @Override protected String target() { return target; }
            @Override protected boolean authoredTrack(String url) { return authored; }

            @Override protected TranslationRuntime.ClockSample clock(String owner) {
                // The native player reports a positive playback rate even when the state is paused.
                return new TranslationRuntime.ClockSample(true, video, position, SystemClock.elapsedRealtime(),
                        playing ? PlaybackState.STATE_PLAYING : PlaybackState.STATE_PAUSED, 1);
            }

            @Override protected void mark(Context c, String stage, String detail, CaptionCredentialRef credential) {
                diagnostics.add(stage + " " + detail);
            }

            @Override protected void cacheClearFinished(Context c, boolean success) { cleared.add(success); }
        });
        TranslationOutput.install(new TranslationOutput.Sink() {
            @Override public void showStatus(String text, TranslationOutput.RenderGuard owner) {
                if (owner.isValid()) statuses.add(text);
            }

            @Override public void showWaitingEvent(String text, TranslationOutput.RenderGuard owner,
                                                   String id, long start, long end, long at) {
                if (owner.isValid()) guard = owner;
            }

            @Override public void showEvent(String text, TranslationOutput.RenderGuard owner,
                                            String id, long start, long end, long at, CaptionRenderSpec spec) {
                if (!owner.isValid()) return;
                guard = owner;
                frames.add(new Frame(text, id, start, end, at, owner));
                owner.onApplied();
            }
        });
        RebuildController.stop();
        RebuildController.video(video);
    }

    @After public void stopFixture() throws Exception {
        try {
            RebuildController.stop();
            TranslationRuntime.loopbackStreamingForTests("");
            TranslationOutput.install(new TranslationOutput.Sink() {});
            server.shutdown();
        } finally {
            if (!fixtureErrors.isEmpty()) throw new AssertionError("loopback fixture failed", fixtureErrors.get(0));
        }
    }

    void activate() { RebuildController.activate(context, url() + "&tlang=" + target, false, true); }
    void original() { RebuildController.activate(context, url(), true, true); }
    String url() { return URL.replace(VIDEO, video); }

    void at(long at) {
        position = at;
        RebuildController.time(at);
    }

    void replaceVideo() {
        video = OTHER;
        RebuildController.video(video);
    }

    void idle(long millis) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    void await(String description, BooleanSupplier observed) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(12);
        while (!observed.getAsBoolean() && fixtureErrors.isEmpty() && System.nanoTime() < deadline) {
            idle(35);
            Thread.sleep(5);
        }
        assertTrue(description + " [requests=" + requests.size() + ", status=" + statuses
                + ", frames=" + frames + ", fixture errors=" + fixtureErrors
                + ", diagnostics=" + diagnostics.stream().filter(line -> !line.startsWith("REBUILD_DISPLAY_GAP ")).limit(40).collect(java.util.stream.Collectors.toList()) + "]",
                observed.getAsBoolean());
    }

    void awaitText(String text) throws Exception {
        await("show " + text, () -> frames.stream().anyMatch(frame -> text.equals(frame.text())));
    }

    static byte[] readResource(String name) throws Exception {
        try (InputStream raw = TranslationPlaybackFixture.class.getResourceAsStream(name)) {
            assertNotNull(name, raw);
            if (!name.endsWith(".gz")) return raw.readAllBytes();
            try (InputStream gzip = new GZIPInputStream(raw)) {
                return gzip.readAllBytes();
            }
        }
    }

    static JSONObject response(JSONObject payload, String text) throws Exception {
        return response(payload, new JSONArray().put(event(payload.getString("source_text"), text)));
    }

    static JSONObject event(String source, String text) throws Exception {
        return new JSONObject().put("source", source).put("text", text);
    }

    static JSONObject response(JSONObject payload, JSONArray events) throws Exception {
        return new JSONObject().put("block", payload.getString("block")).put("events", events);
    }

    static MockResponse envelope(JSONObject content) throws Exception {
        return new MockResponse().setBody(new JSONObject().put("choices", new JSONArray().put(
                new JSONObject().put("finish_reason", "stop").put("message",
                        new JSONObject().put("content", content.toString())))).toString());
    }

    static String quote(JSONObject payload, int from, int to) throws Exception {
        JSONArray tokens = payload.getJSONArray("owned_tokens");
        StringBuilder out = new StringBuilder();
        for (int i = from; i <= to; i++) {
            if (i > from) out.append(' ');
            out.append(tokens.getJSONArray(i).getString(1));
        }
        return out.toString();
    }

    static byte[] sentences(int count) throws Exception {
        JSONArray events = new JSONArray();
        for (int i = 0; i < count; i++) {
            JSONArray words = new JSONArray();
            String[] sentence = ("sentence " + i
                    + " says the budget grows every year while the army changes slowly over time.").split(" ");
            for (int word = 0; word < sentence.length; word++) {
                words.put(new JSONObject().put("utf8", (word == 0 ? "" : " ") + sentence[word])
                        .put("tOffsetMs", word * 450));
            }
            events.put(new JSONObject().put("tStartMs", i * 7900L).put("dDurationMs", 7200).put("segs", words));
        }
        return new JSONObject().put("events", events).toString().getBytes(StandardCharsets.UTF_8);
    }
}

