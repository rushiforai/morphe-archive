package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class TranslationSessionContractTest extends TranslationPlaybackFixture {
    @Test public void sourceSelectionRendersOriginalWithoutProviderCallsOrNativeOwnership() throws Exception {
        original();
        awaitText("Hello world.");
        assertEquals(0, server.getRequestCount());
        assertFalse(RebuildController.ownsNativeTrack());
    }

    @Test public void translationPostsOnceAndPublishesASourceBoundCaption() throws Exception {
        activate();
        awaitText(TRANSLATION);
        assertEquals(1, requests.size());
        assertEquals("Hello world.", requests.get(0).getString("source_text"));
        assertTrue(RebuildController.ownsNativeTrack());
        assertTrue(guard.isValid());
        assertFalse(guard.session().isEmpty());
    }

    @Test public void repeatedActivationDoesNotOpenAnotherRequestWhilePending() throws Exception {
        var release = new CountDownLatch(1);
        reply = (request, payload) -> {
            assertTrue(release.await(5, TimeUnit.SECONDS));
            return envelope(response(payload, TRANSLATION));
        };
        try {
            activate();
            await("one pending provider request", () -> requests.size() == 1);
            for (int i = 0; i < 5; i++) activate();
            idle(350);
            assertEquals(1, requests.size());
        } finally {
            release.countDown();
        }
        awaitText(TRANSLATION);
        assertEquals(1, requests.size());
    }

    @Test public void stopRevokesTheRenderedCaptionAndNativeOwnership() throws Exception {
        activate();
        awaitText(TRANSLATION);
        var old = guard;
        RebuildController.stop();
        idle(300);
        assertFalse(old.isValid());
        assertFalse(RebuildController.visible());
        assertFalse(RebuildController.ownsNativeTrack());
    }

    @Test public void lateReplyCannotPublishAfterVideoAndTargetChange() throws Exception {
        var release = new CountDownLatch(1);
        reply = (request, payload) -> {
            boolean replacement = "ja".equals(payload.getString("language"));
            if (!replacement) assertTrue(release.await(5, TimeUnit.SECONDS));
            return envelope(response(payload, replacement ? "こんにちは、世界。" : TRANSLATION));
        };
        try {
            activate();
            await("first in-flight request and waiting caption", () -> !requests.isEmpty() && guard != null);
            var old = guard;
            replaceVideo();
            target = "ja";
            activate();
            awaitText("こんにちは、世界。");
            assertFalse(old.isValid());
        } finally {
            release.countDown();
        }
        idle(500);
        assertFalse(frames.stream().anyMatch(frame -> frame.text().equals(TRANSLATION)));
        assertEquals(2, requests.size());
    }

    @Test public void clearingTranslationCacheRetranslatesTheCurrentSelection() throws Exception {
        activate();
        awaitText(TRANSLATION);
        RebuildController.clearCache(context);
        await("cache clear and a replacement caption", () -> cleared.size() == 1 && requests.size() == 2
                && frames.stream().filter(f -> f.text().equals(TRANSLATION)).count() >= 2);
        assertEquals(Boolean.TRUE, cleared.get(0));
        assertTrue(RebuildController.ownsNativeTrack());
    }
}

