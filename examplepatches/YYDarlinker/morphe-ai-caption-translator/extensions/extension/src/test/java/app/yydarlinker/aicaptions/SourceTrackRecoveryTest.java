package app.yydarlinker.aicaptions;

import app.yydarlinker.aicaptions.host.AiCaptionHook;
import app.yydarlinker.aicaptions.host.CaptionTracks;
import app.yydarlinker.aicaptions.source.RawCaptionSource;

import static org.junit.Assert.*;

import android.content.Context;
import android.content.ContextWrapper;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import okhttp3.mockwebserver.*;
import org.junit.*;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE, shadows = SourceTrackRecoveryTest.YouTubeRoute.class)
public class SourceTrackRecoveryTest {
    static final String VIDEO = "cachevideo1";
    static MockWebServer youtube;
    @Rule public final TemporaryFolder owned = new TemporaryFolder();
    Context context;
    File cache;

    @Implements(AiCaptionHook.class)
    public static class YouTubeRoute {
        @Implementation public static HttpURLConnection openWithYouTubeCronet(URL url) throws Exception {
            assertEquals("https", url.getProtocol());
            assertEquals("www.youtube.com", url.getHost());
            assertEquals("/api/timedtext", url.getPath());
            return (HttpURLConnection) youtube.url(url.getFile()).url().openConnection();
        }
    }

    @Before public void start() throws Exception {
        cache = owned.newFolder();
        context = new ContextWrapper(RuntimeEnvironment.getApplication()) {
            @Override public File getCacheDir() { return cache; }
            @Override public Context getApplicationContext() { return this; }
        };
        CaptionTracks.clear();
        youtube = new MockWebServer();
        youtube.start();
    }

    @After public void stop() throws Exception {
        CaptionTracks.clear();
        youtube.shutdown();
        youtube = null;
    }

    String url(String language, String name) {
        return "https://www.youtube.com/api/timedtext?v=" + VIDEO + "&lang=" + language + "&name=" + name;
    }

    String read(String url) throws Exception {
        return RawCaptionSource.load(context, url, true, null).document.cues().get(0).text;
    }

    void register(String... languages) {
        List<SourceSelection> tracks = new ArrayList<>();
        for (int i = 0; i < languages.length; i++) {
            String name = "auto" + i;
            tracks.add(new SourceSelection(VIDEO, name, languages[i], url(languages[i], name),
                    SourceSelection.Kind.ASR, true, 0, ""));
        }
        CaptionTracks.register(VIDEO, tracks, true);
    }

    MockResponse source(String text) {
        return new MockResponse().setHeader("Content-Type", "application/json").setBody(
                "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,\"segs\":[{\"utf8\":\"" + text + "\"}]}]}");
    }

    String route() throws Exception {
        RecordedRequest request = youtube.takeRequest(2, TimeUnit.SECONDS);
        assertNotNull(request);
        return request.getPath();
    }

    Path persistedTrack() throws Exception { return persistedTracks(1); }

    Path persistedTracks(int count) throws Exception {
        Path root = cache.toPath().resolve("deepseek-source-captions");
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        while (System.nanoTime() < deadline) {
            if (Files.isDirectory(root)) try (var files = Files.list(root)) {
                List<Path> bodies = files.filter(p -> p.getFileName().toString().endsWith(".source")).collect(java.util.stream.Collectors.toList());
                if (bodies.size() >= count) return bodies.get(0);
            }
            Thread.sleep(10);
        }
        throw new AssertionError("source cache body was never published");
    }

    @Test public void failingSourceTriesAtMostThreeAlternativeTracks() throws Exception {
        register("en", "en", "en", "en");
        for (int i = 0; i < 4; i++) youtube.enqueue(new MockResponse().setResponseCode(503));
        youtube.enqueue(source("fourth fallback must not be read"));
        assertThrows(IOException.class, () -> read(url("en", "manual")));
        assertEquals(4, youtube.getRequestCount());
        for (String name : List.of("manual", "auto0", "auto1", "auto2")) {
            assertTrue(route().contains("name=" + name));
        }
    }

    @Test public void fallbackNeverRequestsAnAutomaticTrackInAnotherLanguage() throws Exception {
        register("fr", "en");
        youtube.enqueue(new MockResponse().setResponseCode(503));
        youtube.enqueue(source("same language fallback"));
        assertEquals("same language fallback", read(url("en", "manual")));
        assertTrue(route().contains("name=manual"));
        assertTrue(route().contains("name=auto1"));
        assertEquals(2, youtube.getRequestCount());
    }

    @Test public void successfulThirdFallbackIsMirroredUnderThePrimaryTrack() throws Exception {
        register("en", "en", "en");
        for (int i = 0; i < 3; i++) youtube.enqueue(new MockResponse().setResponseCode(503));
        youtube.enqueue(source("last allowed fallback"));
        String primary = url("en", "manual");
        assertEquals("last allowed fallback", read(primary));
        persistedTracks(3);
        assertEquals("last allowed fallback", read(primary));
        assertEquals(4, youtube.getRequestCount());
    }

    @Test public void badJsonFormatRetriesTheSameOriginalTrack() throws Exception {
        youtube.enqueue(new MockResponse().setResponseCode(404));
        youtube.enqueue(source("format fallback"));
        assertEquals("format fallback", read(url("en", "manual")));
        assertTrue(route().contains("fmt=json3"));
        assertFalse(route().contains("fmt="));
        assertEquals(2, youtube.getRequestCount());
    }

    @Test public void rateLimitDoesNotTryAnotherFormat() throws Exception {
        youtube.enqueue(new MockResponse().setResponseCode(429).setHeader("Retry-After", "17"));
        IOException failure = assertThrows(IOException.class, () -> read(url("en", "manual")));
        assertEquals("http_429", failure.getMessage());
        assertEquals(1, youtube.getRequestCount());
    }

    @Test public void aCorruptPersistedTrackIsFetchedAndOverwritten() throws Exception {
        String url = url("en", "manual");
        youtube.enqueue(source("old caption"));
        assertEquals("old caption", read(url));
        Path body = persistedTrack();
        Files.write(body, "truncated subtitle".getBytes(java.nio.charset.StandardCharsets.UTF_8));
        youtube.enqueue(source("recovered caption"));
        assertEquals("recovered caption", read(url));
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        while (System.nanoTime() < deadline && (!Files.isRegularFile(body)
                || !new String(Files.readAllBytes(body), java.nio.charset.StandardCharsets.UTF_8).contains("recovered caption"))) Thread.sleep(10);
        assertTrue(new String(Files.readAllBytes(body), java.nio.charset.StandardCharsets.UTF_8).contains("recovered caption"));
        assertEquals("recovered caption", read(url));
        assertEquals(2, youtube.getRequestCount());
    }

    @Test public void validCacheIsReusedAcrossRefreshedTrackSignatures() throws Exception {
        String url = url("en", "manual");
        youtube.enqueue(source("cached caption"));
        assertEquals("cached caption", read(url + "&sig=first&expire=123"));
        persistedTrack();
        assertEquals("cached caption", read(url + "&sig=second&expire=456"));
        assertEquals(1, youtube.getRequestCount());
    }

    @Test public void validCacheCannotAnswerADifferentCaptionTrack() throws Exception {
        youtube.enqueue(source("english caption"));
        assertEquals("english caption", read(url("en", "manual")));
        persistedTrack();
        youtube.enqueue(source("autre piste"));
        assertEquals("autre piste", read(url("fr", "manual")));
        assertEquals(2, youtube.getRequestCount());
    }
}
