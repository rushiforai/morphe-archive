package app.yydarlinker.deepseekcaptions;

import android.app.Activity;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.*;

/**
 * The loopback sink must never hold YouTube's own request while it looks for a source mirror: a
 * missing mirror answers immediately in the requested format, and the next request masks the source
 * once the runtime has cached it.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CaptionStartupOrderTest {
    private static final String TRANSLATED =
            "https://www.youtube.com/api/timedtext?v=abcdefghijk&lang=en&tlang=zh-Hans&fmt=json3";
    private static final String SOURCE_MIRROR =
            "{\"events\":[{\"tStartMs\":0,\"dDurationMs\":1000,"
                    + "\"segs\":[{\"utf8\":\"Hello\"}]}]}";

    private Activity activity;
    private LoopbackCaptionServer server;

    @Before
    public void before() throws Exception {
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        CaptionAddonSupport.initialize(activity);
        SourceCaptionCache.clear(activity);
        server = LoopbackCaptionServer.get(activity);
    }

    @After
    public void after() {
        SourceCaptionCache.clear(activity);
        activity.finish();
    }

    @Test
    public void anUncachedRequestAnswersWithoutWaitingForTheSourceMirror() throws Exception {
        // Warm the server thread so this measures the request path, not the first accept().
        read(server.urlFor(TRANSLATED));
        SourceCaptionCache.clear(activity);

        long began = System.nanoTime();
        String body = read(server.urlFor(TRANSLATED));
        long elapsedMs = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - began);

        assertTrue("the fallback must not wait for the source, elapsed=" + elapsedMs + "ms",
                elapsedMs < 800);
        assertTrue("the answer keeps the requested JSON format", body.contains("\"events\""));
        assertFalse("no source text is ever served", body.contains("Hello"));
    }

    @Test
    public void theNextRequestMasksTheSourceOnceTheMirrorIsCached() throws Exception {
        String key = SourceCaptionCache.key(CaptionUrls.sourceCaptionUrl(TRANSLATED));
        SourceCaptionCache.put(
                activity, key, SOURCE_MIRROR.getBytes(StandardCharsets.UTF_8), "application/json");
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (SourceCaptionCache.get(activity, key) == null && System.nanoTime() < deadline)
            Thread.sleep(10);
        assertNotNull("the source mirror reached the cache", SourceCaptionCache.get(activity, key));

        String body = read(server.urlFor(TRANSLATED));

        assertFalse("the cached source text is replaced by the invisible cue",
                body.contains("Hello"));
        assertTrue("the mirror keeps the cue structure", body.contains("\u2060"));
    }

    private static String read(String url) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(3_000);
        connection.setReadTimeout(3_000);
        try (InputStream input = connection.getInputStream()) {
            return new String(input.readAllBytes(), StandardCharsets.UTF_8);
        } finally {
            connection.disconnect();
        }
    }
}
