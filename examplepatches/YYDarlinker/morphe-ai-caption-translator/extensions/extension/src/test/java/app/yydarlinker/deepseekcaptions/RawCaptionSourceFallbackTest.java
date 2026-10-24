package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import android.app.Activity;
import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * The fallback of a source track: a preferred track that cannot be read (a large manual track over
 * the deadline, for example) is replaced, inside the same load call, by the video's automatic track
 * in the same language. A successful fallback is cached under the requested track, so entering the
 * video again does not download the failed track again. Without a fallback the load still fails
 * loudly, and a cancellation never turns into another request.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class RawCaptionSourceFallbackTest {
    private static final String MANUAL_BODY =
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,"
                    + "\"segs\":[{\"utf8\":\"manual text\"}]}]}";
    private static final String AUTO_BODY =
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,"
                    + "\"segs\":[{\"utf8\":\"auto text\"}]}]}";

    /** Counts the reads; the manual track times out, the automatic track answers. */
    private static final class Fake implements RawCaptionSource.TrackFetcher {
        final List<String> urls = Collections.synchronizedList(new ArrayList<>());
        final boolean failManual;
        final String manualBody, autoBody;

        Fake(boolean failManual, String manualBody, String autoBody) {
            this.failManual = failManual;
            this.manualBody = manualBody;
            this.autoBody = autoBody;
        }

        @Override
        public RawCaptionSource.Fetch fetch(
                Context context, String url, long deadline, CaptionSourceControl control)
                throws Exception {
            urls.add(url);
            if (url.contains("name=manual")) {
                if (failManual) throw new SocketTimeoutException("source_deadline");
                return fetch(manualBody);
            }
            return fetch(autoBody);
        }

        private static RawCaptionSource.Fetch fetch(String body) {
            return new RawCaptionSource.Fetch(
                    body.getBytes(StandardCharsets.UTF_8), "application/json");
        }
    }

    private static final class Consumer implements CaptionSourceControl {
        volatile boolean cancelled;

        @Override
        public boolean isCancelled() {
            return cancelled;
        }

        @Override
        public void onConnection(HttpURLConnection connection) {}
    }

    private Activity activity;

    @Before
    public void before() {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        CaptionAddonSupport.initialize(activity);
        SourceCatalog.clear();
        SourceCaptionCache.clear(activity);
        CaptionDiagnostics.clear(activity);
        RawCaptionSource.installFetcherForTests(null);
    }

    @After
    public void after() {
        RawCaptionSource.installFetcherForTests(null);
        SourceCatalog.clear();
        SourceCaptionCache.clear(activity);
        activity.finish();
    }

    @Test
    public void aTimedOutPreferredTrackFallsBackToTheSameLanguageAutomaticTrack() throws Exception {
        String video = "s8fallback1";
        String manual = manual(video), auto = auto(video);
        SourceCatalog.register(
                video,
                Collections.singletonList(
                        new SourceSelection(
                                video,
                                "a.en",
                                "en",
                                auto,
                                SourceSelection.Kind.ASR,
                                true,
                                0,
                                "")),
                true);
        NativeAsrTrackReference.remember("en", "a.en", auto);
        Fake fake = new Fake(true, MANUAL_BODY, AUTO_BODY);
        RawCaptionSource.installFetcherForTests(fake);

        RawCaptionSource.Source source =
                RawCaptionSource.load(activity, manual, true, new Consumer());

        assertNotNull(source);
        assertEquals(1, source.document.cues().size());
        assertEquals(
                "the automatic track is the fallback text",
                "auto text",
                source.document.cues().get(0).text);
        String history = CaptionDiagnostics.history(activity);
        assertTrue(
                "the fallback is a decision, not silence: " + history,
                history.contains("SOURCE_FALLBACK_TRACK"));
        assertTrue(history.contains("preferred=en/manual"));
        assertTrue(history.contains("fallback=en/asr"));

        // The bytes of the working track are mirrored under the requested track, so the next entry
        // into this video reads the cache instead of downloading the failed 6.7 MB track again.
        String requestedKey =
                SourceCaptionCache.key(
                        SourceFormatPolicy.json3(CaptionUrls.sourceCaptionUrl(manual)));
        assertTrue("the fallback was cached under the requested track", awaitCached(requestedKey));
        Fake reentry = new Fake(true, MANUAL_BODY, AUTO_BODY);
        RawCaptionSource.installFetcherForTests(reentry);
        RawCaptionSource.Source again =
                RawCaptionSource.load(activity, manual, true, new Consumer());
        assertArrayEquals(source.body, again.body);
        assertTrue("the second load must not fetch anything: " + reentry.urls, reentry.urls.isEmpty());
    }

    @Test
    public void aPreferredTrackThatLoadsIsNotReplacedByAFallback() throws Exception {
        String video = "s8success01";
        String manual = manual(video), auto = auto(video);
        NativeAsrTrackReference.remember("en", "a.en", auto);
        Fake fake = new Fake(false, MANUAL_BODY, AUTO_BODY);
        RawCaptionSource.installFetcherForTests(fake);

        RawCaptionSource.Source source =
                RawCaptionSource.load(activity, manual, true, new Consumer());

        assertEquals("manual text", source.document.cues().get(0).text);
        assertEquals("one track read, no fallback", 1, fake.urls.size());
        assertTrue(fake.urls.get(0).contains("name=manual"));
        assertFalse(CaptionDiagnostics.history(activity).contains("SOURCE_FALLBACK_TRACK"));
    }

    @Test
    public void aTimedOutPreferredTrackWithoutFallbackStillFails() throws Exception {
        String video = "s8nofall001";
        Fake fake = new Fake(true, MANUAL_BODY, AUTO_BODY);
        RawCaptionSource.installFetcherForTests(fake);

        try {
            RawCaptionSource.load(activity, manual(video), true, new Consumer());
            fail("a load without a fallback must not return a source");
        } catch (SocketTimeoutException expected) {
            assertEquals("source_deadline", expected.getMessage());
        }
        assertFalse(
                "no fallback may be invented",
                CaptionDiagnostics.history(activity).contains("SOURCE_FALLBACK_TRACK"));
        assertEquals("only the preferred track was read", 1, fake.urls.size());
    }

    @Test
    public void aCancelledLoadDoesNotTryAFallbackTrack() throws Exception {
        String video = "s8cancel001";
        NativeAsrTrackReference.remember("en", "a.en", auto(video));
        Fake fake = new Fake(true, MANUAL_BODY, AUTO_BODY);
        RawCaptionSource.installFetcherForTests(fake);
        Consumer consumer = new Consumer();
        consumer.cancelled = true;

        try {
            RawCaptionSource.load(activity, manual(video), true, consumer);
            fail("a cancelled load must stop");
        } catch (InterruptedException expected) {
            assertEquals("source_cancelled", expected.getMessage());
        }
        assertFalse(
                "a stop never becomes another request",
                CaptionDiagnostics.history(activity).contains("SOURCE_FALLBACK_TRACK"));
        assertTrue(fake.urls.isEmpty());
    }

    private boolean awaitCached(String key) throws InterruptedException {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (System.nanoTime() < deadline) {
            if (SourceCaptionCache.get(activity, key) != null) return true;
            Thread.sleep(5);
        }
        return SourceCaptionCache.get(activity, key) != null;
    }

    private static String manual(String video) {
        return "https://www.youtube.com/api/timedtext?v="
                + video
                + "&lang=en&name=manual&expire=1&signature=manual";
    }

    private static String auto(String video) {
        return "https://www.youtube.com/api/timedtext?v="
                + video
                + "&lang=en&kind=asr&vss=a.en&expire=1&signature=auto";
    }
}
