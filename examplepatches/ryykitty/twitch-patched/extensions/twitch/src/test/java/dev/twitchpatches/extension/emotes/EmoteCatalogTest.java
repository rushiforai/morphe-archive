package dev.twitchpatches.extension.emotes;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import static org.junit.Assert.*;

public class EmoteCatalogTest {
    private static final String ENTRY = "{\"channelEmotes\":[{\"id\":\"example\",\"code\":\"ChannelCode\"}]}";

    @Test public void cancelledChannelRequestCannotPublishItsLateResponse() throws Exception {
        CountDownLatch started = new CountDownLatch(1);
        CountDownLatch release = new CountDownLatch(1);
        CountDownLatch returned = new CountDownLatch(1);
        EmoteCatalog catalog = new EmoteCatalog(id -> { }, (url, optional) -> {
            if (url.endsWith("/11") && url.contains("betterttv")) {
                started.countDown();
                boolean waiting = true;
                while (waiting) {
                    try { release.await(); waiting = false; }
                    catch (InterruptedException ignored) { /* Simulates a transport that completes after cancellation. */ }
                }
                returned.countDown();
                return ENTRY;
            }
            return url.equals(EmoteProviders.BTTV_GLOBAL) ? "[]" : "{}";
        }, () -> { });
        try {
            catalog.ensure("11");
            assertTrue(started.await(2, TimeUnit.SECONDS));
            catalog.cancelOutside("22");
            release.countDown();
            assertTrue(returned.await(2, TimeUnit.SECONDS));
            synchronized (catalog) { assertFalse(catalog.snapshot("11").containsKey("ChannelCode")); }
        } finally { release.countDown(); catalog.cancelPending(); }
    }

    @Test public void oneProviderFailureDoesNotEraseOtherProviderOrCauseRetryStorm() throws Exception {
        CountDownLatch ready = new CountDownLatch(1);
        CountDownLatch failed = new CountDownLatch(1);
        AtomicInteger attempts = new AtomicInteger();
        EmoteCatalog catalog = new EmoteCatalog(id -> { if (id != null) ready.countDown(); }, (url, optional) -> {
            if (url.contains("7tv")) { attempts.incrementAndGet(); throw new java.io.IOException("Unavailable"); }
            return optional ? ENTRY : "[]";
        }, failed::countDown);
        try {
            catalog.ensure("11");
            assertTrue(ready.await(2, TimeUnit.SECONDS));
            assertTrue(failed.await(2, TimeUnit.SECONDS));
            assertTrue(catalog.snapshot("11").containsKey("ChannelCode"));
            for (int i = 0; i < 100; i++) catalog.ensure("11");
            assertTrue(attempts.get() <= 2);
        } finally { catalog.cancelPending(); }
    }
}
