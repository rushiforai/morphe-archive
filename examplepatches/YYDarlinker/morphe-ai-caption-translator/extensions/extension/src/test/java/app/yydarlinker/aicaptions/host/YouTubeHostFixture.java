package app.yydarlinker.aicaptions.host;

import app.yydarlinker.aicaptions.CaptionSourceControl;
import app.yydarlinker.aicaptions.RebuildCache;
import app.yydarlinker.aicaptions.TranslationRuntime;
import app.yydarlinker.aicaptions.diagnostics.CaptionDiagnostics;
import app.yydarlinker.aicaptions.overlay.CaptionOverlay;
import app.yydarlinker.aicaptions.overlay.CaptionUiGeometryFixture;
import app.yydarlinker.aicaptions.settings.AiCaptionConfig;
import app.yydarlinker.aicaptions.settings.CaptionQuickToggle;
import app.yydarlinker.aicaptions.settings.SecureApiKey;
import app.yydarlinker.aicaptions.source.RawCaptionSource;
import app.yydarlinker.aicaptions.source.SourceCaptionCache;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import app.morphe.extension.youtube.patches.VideoInformation;
import app.morphe.extension.youtube.shared.PlayerType;
import app.morphe.extension.youtube.shared.VideoState;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.function.BooleanSupplier;

import okhttp3.mockwebserver.Dispatcher;
import okhttp3.mockwebserver.MockResponse;
import okhttp3.mockwebserver.MockWebServer;
import okhttp3.mockwebserver.RecordedRequest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.robolectric.Robolectric;
import org.robolectric.Shadows;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

/** Native model accessors stand in for patch-bound Smali. The runtime and overlay are real. */
public class YouTubeHostFixture {
    static final String FIRST = "abcdefghijk";
    static final String SECOND = "lmnopqrstuv";
    static final String THIRD = "123456789ab";
    static final String ORIGINAL = "Hello world.";
    static final String NEXT_CUE = "Second caption.";
    static final String FRENCH = "Bonjour le monde.";
    static final String GERMAN = "Hallo Welt.";
    static final String SPANISH = "Hola mundo.";
    static final String SHORTS_LINE = "这是一整行需要完整显示的中文字幕，左右黑边也是字幕可用空间。";
    private static final int WIDTH = 1264, HEIGHT = 2736;
    private static final String ANCHOR = "yydarlinker.ai.caption.anchor";
    private static final String CAPTION = "yydarlinker.ai.caption.overlay";
    private static final String FIRST_CUE = "{\"tStartMs\":0,\"dDurationMs\":%d,\"segs\":["
            + "{\"utf8\":\"Hello \",\"tOffsetMs\":0},{\"utf8\":\"world.\",\"tOffsetMs\":1000}]}";
    private static final byte[] TEXT = ("{\"events\":[" + String.format(java.util.Locale.ROOT, FIRST_CUE, 30000)
            + "]}").getBytes(StandardCharsets.UTF_8);
    private static final byte[] TWO_CUES = ("{\"events\":[" + String.format(java.util.Locale.ROOT, FIRST_CUE, 4500)
            + ","
            + "{\"tStartMs\":6000,\"dDurationMs\":24000,\"segs\":["
            + "{\"utf8\":\"Second \",\"tOffsetMs\":0},{\"utf8\":\"caption.\",\"tOffsetMs\":1000}]}]}")
            .getBytes(StandardCharsets.UTF_8);
    private static final byte[] SHORTS_CUE = ("{\"events\":[{\"tStartMs\":0,\"dDurationMs\":30000,"
            + "\"segs\":[{\"utf8\":\"" + SHORTS_LINE + "\"}]}]}").getBytes(StandardCharsets.UTF_8);

    enum Origin { DEFAULT, PREFERRED_TRACK }

    static final class Track {
        final String language, id, url;

        Track(String language, String id, String url) {
            this.language = language;
            this.id = id;
            this.url = url;
        }
    }

    static final class Manager {
        String video;
        List<Track> tracks;

        Manager(String video) { this.video = video; }
    }

    @Implements(CaptionAddonSupport.class)
    public static class Flags {
        @Implementation public static boolean aiInstalled() { return true; }
    }

    @Implements(SecureApiKey.class)
    public static class Credentials {
        static boolean available;
        static int reads;

        @Implementation
        public static String load(Context context) {
            reads++;
            return available ? "fixture-key" : "";
        }
    }

    @Implements(NativeCaptionBridge.class)
    public static class Model {
        static int trackReads;

        @Implementation
        public static String nativeModelVideo(Object manager) { return ((Manager) manager).video; }

        @Implementation
        public static List<?> nativeTracks(Object manager) { return ((Manager) manager).tracks; }

        @Implementation
        public static String language(Object track) {
            trackReads++;
            return ((Track) track).language;
        }

        @Implementation
        public static String vss(Object track) { return ((Track) track).id; }

        @Implementation
        public static String url(Object track) { return ((Track) track).url; }
    }

    @Implements(CaptionQuickToggle.class)
    public static class Menus {
        static boolean top, shorts;
        static String label;
        static View.OnClickListener click;
        static int closed;

        @Implementation public static boolean topMenu() { return top; }
        @Implementation public static boolean shortsOpen() { return shorts; }

        @Implementation
        public static int addNativeRow(Object panel, Drawable icon, String text,
                View.OnClickListener listener, int index) {
            label = text;
            click = listener;
            return index + 1;
        }

        @Implementation public static void dismissNative() { closed++; }
    }

    Activity activity;
    MockWebServer provider;
    final List<String> sourceRequests = new CopyOnWriteArrayList<>();
    final List<String> modelRequests = new CopyOnWriteArrayList<>();
    final CountDownLatch sourceStarted = new CountDownLatch(1), releaseSource = new CountDownLatch(1);
    final CountDownLatch modelStarted = new CountDownLatch(1), releaseModel = new CountDownLatch(1);
    volatile boolean holdFirstSource, holdFirstModel, twoCues, longShortsCue;
    volatile String unavailableSource = "";

    @Before
    public void prepareHost() throws Exception {
        Credentials.available = true;
        Credentials.reads = Model.trackReads = 0;
        Menus.top = Menus.shorts = false;
        Menus.label = null;
        Menus.click = null;
        Menus.closed = 0;
        VideoInformation.videoId = "";
        VideoInformation.position = 0;
        VideoInformation.speed = 1;
        VideoState.current = VideoState.PLAYING;
        PlayerType.current = PlayerType.NONE;
        CaptionUiGeometryFixture.shorts = false;
        CaptionUiGeometryFixture.bounds = new Rect(0, 0, WIDTH, 750);
        activity = newActivity();
        CaptionTracks.clear();
        CaptionDiagnostics.clear(activity);
        SourceCaptionCache.clear(activity);
        RebuildCache.clear(activity);
        provider = new MockWebServer();
        provider.setDispatcher(new Dispatcher() {
            @Override
            public MockResponse dispatch(RecordedRequest request) throws InterruptedException {
                if ("/v1/models".equals(request.getPath()))
                    return new MockResponse().setBody("{\"data\":[{\"id\":\"fixture-model\"}]}");
                try {
                    return modelResponse(request);
                } catch (InterruptedException interrupted) {
                    throw interrupted;
                } catch (Exception invalid) {
                    return new MockResponse().setResponseCode(500);
                }
            }
        });
        provider.start();
        AiCaptionConfig.saveBaseUrl(activity, provider.url("/v1").toString());
        AiCaptionConfig.saveModel(activity, "fixture-model");
        RawCaptionSource.installFetcherForTests(this::fetchTrack);
    }

    Activity newActivity() {
        Activity created = Robolectric.buildActivity(Activity.class).setup().visible().get();
        created.getResources().getDisplayMetrics().widthPixels = WIDTH;
        created.getResources().getDisplayMetrics().heightPixels = HEIGHT;
        created.setContentView(new FrameLayout(created));
        return created;
    }

    void install(boolean enabled) {
        AiCaptionConfig.saveEnabled(activity, enabled);
        CaptionAddonSupport.initialize(activity);
        frames();
    }

    @After
    public void shutDown() throws Exception {
        releaseSource.countDown();
        releaseModel.countDown();
        if (AiCaptionHook.installed()) {
            AiCaptionHook.onVideoId("");
            CaptionQuickToggle.setEngine(activity, false);
        }
        idle(100);
        CaptionOverlay.setActivity(null);
        activity.finish();
        RawCaptionSource.installFetcherForTests(null);
        provider.shutdown();
    }

    private RawCaptionSource.Fetch fetchTrack(Context context, String url, long deadline,
            CaptionSourceControl control) throws Exception {
        sourceRequests.add(url);
        if (holdFirstSource && sourceStarted.getCount() > 0) {
            sourceStarted.countDown();
            if (!releaseSource.await(5, TimeUnit.SECONDS)) throw new IOException("source fixture timeout");
        }
        if (!unavailableSource.isEmpty() && url.contains(unavailableSource))
            throw new java.net.SocketTimeoutException("fixture primary timeout");
        byte[] body = longShortsCue ? SHORTS_CUE : twoCues ? TWO_CUES : TEXT;
        return new RawCaptionSource.Fetch(body, "application/json");
    }

    private MockResponse modelResponse(RecordedRequest request) throws Exception {
        JSONObject root = new JSONObject(request.getBody().readUtf8());
        JSONObject payload = new JSONObject(root.getJSONArray("messages").getJSONObject(1).getString("content"));
        String language = payload.getString("language");
        modelRequests.add(language);
        if (holdFirstModel && modelStarted.getCount() > 0) {
            modelStarted.countDown();
            if (!releaseModel.await(5, TimeUnit.SECONDS)) return new MockResponse().setResponseCode(504);
        }
        JSONArray tokens = payload.getJSONArray("owned_tokens");
        JSONObject event = new JSONObject()
                .put("from", tokens.getJSONArray(0).getInt(0))
                .put("to", tokens.getJSONArray(tokens.length() - 1).getInt(0))
                .put("source", payload.getString("source_text"))
                .put("text", "de".equals(language) ? GERMAN : "es".equals(language) ? SPANISH : FRENCH);
        JSONObject result = new JSONObject().put("block", payload.getString("block"))
                .put("events", new JSONArray().put(event));
        return new MockResponse().setBody(new JSONObject().put("choices", new JSONArray()
                .put(new JSONObject().put("message", new JSONObject().put("content", result.toString()))))
                .toString());
    }

    static String url(String owner, String language) {
        return "https://www.youtube.com/api/timedtext?v=" + owner + "&lang=" + language;
    }

    static Track source(String owner, String language) {
        return new Track(language, "." + language, url(owner, language));
    }

    static Track translated(String owner, String target) {
        return new Track(target, "t" + target + ".en", url(owner, "en") + "&tlang=" + target);
    }

    static Track asr(String owner, String language) {
        return new Track(language, "a." + language, url(owner, language) + "&kind=asr&sig=fixture");
    }

    void video(String id) {
        AiCaptionHook.onVideoId(id);
        VideoInformation.videoId = id;
        VideoInformation.position = 0;
    }

    void type(PlayerType type) {
        PlayerType.current = type;
        AiCaptionHook.onPlayerType(type);
    }

    void regular(String id) {
        video(id);
        type(PlayerType.WATCH_WHILE_MAXIMIZED);
        AiCaptionHook.onVideoTime(0);
    }

    void shorts(boolean open, boolean surface) {
        Menus.shorts = open;
        CaptionUiGeometryFixture.shorts = surface;
        CaptionUiGeometryFixture.bounds = new Rect(0, 0, WIDTH, open ? 2200 : 750);
        CaptionQuickToggle.onShortsStateChanged();
    }

    void commit(Manager manager, Track track, Origin origin, int reason) {
        NativeCaptionBridge.onNativeAppliedEvent(manager, track, track, origin, reason, manager.video);
    }

    ImageView captionButton(String label) {
        ImageView button = new ImageView(activity);
        button.setContentDescription(label);
        button.setClickable(true);
        ((ViewGroup) activity.findViewById(android.R.id.content)).addView(
                button, new FrameLayout.LayoutParams(60, 60));
        frames();
        return button;
    }

    void buttonState(ImageView button, String label) {
        AiCaptionHook.onNativeCaptionButtonController(button);
        button.setContentDescription(label);
        idle(40);
    }

    static long ownerEpoch() { return ((CaptionRuntimePorts) TranslationRuntime.host()).ownerEpoch(); }

    static TranslationRuntime.ClockSample clock() {
        return ((CaptionRuntimePorts) TranslationRuntime.host()).clock(CaptionActions.currentVideoIdSnapshot());
    }

    void time(long position) {
        VideoInformation.position = position;
        AiCaptionHook.onVideoTime(position);
        frames();
    }

    FrameLayout anchor() { return activity.getWindow().getDecorView().findViewWithTag(ANCHOR); }

    TextView caption() { return activity.getWindow().getDecorView().findViewWithTag(CAPTION); }

    boolean shows(String text) {
        TextView view = caption();
        return anchor() != null && anchor().getVisibility() == View.VISIBLE && view != null
                && view.getText().toString().replaceAll("\\s+", "").contains(text.replace(" ", ""));
    }

    void awaitCaption(String text) { await(() -> shows(text), "visible caption: " + text); }

    void await(BooleanSupplier condition, String description) {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(6);
        while (System.nanoTime() < deadline) {
            frames();
            if (condition.getAsBoolean()) return;
            try {
                Thread.sleep(10);
            } catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new AssertionError(interrupted);
            }
        }
        String history = CaptionDiagnostics.history(activity);
        fail("Timed out waiting for " + description + "\n"
                + history.substring(Math.max(0, history.length() - 5000)));
    }

    void frames() {
        View root = activity.getWindow().getDecorView();
        root.measure(View.MeasureSpec.makeMeasureSpec(WIDTH, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(HEIGHT, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, WIDTH, HEIGHT);
        root.getViewTreeObserver().dispatchOnPreDraw();
        idle(24);
    }

    static void idle(long ms) {
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));
    }

    static void worker(Runnable callback) throws Exception {
        java.util.concurrent.FutureTask<Void> run = new java.util.concurrent.FutureTask<>(callback, null);
        Thread thread = new Thread(run, "fixture-host-worker");
        thread.start();
        run.get(3, TimeUnit.SECONDS);
    }

    void wasRequested(String name, String expected) {
        assertTrue("source requests: " + sourceRequests, sourceRequests.stream().anyMatch(
                request -> expected.equals(Uri.parse(request).getQueryParameter(name))));
    }
}
