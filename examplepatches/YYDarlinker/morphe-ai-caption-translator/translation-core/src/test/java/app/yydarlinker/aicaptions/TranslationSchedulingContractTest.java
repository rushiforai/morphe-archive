package app.yydarlinker.aicaptions;

import static org.junit.Assert.*;

import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import okhttp3.mockwebserver.MockResponse;
import org.json.JSONArray;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
@LooperMode(LooperMode.Mode.PAUSED)
public class TranslationSchedulingContractTest extends TranslationPlaybackFixture {
    static final String RUNNING = "预算每年都在增长，而军队变化缓慢。";
    static final String LANDING = "新的播放位置。";

    @Test public void playingBootstrapStartsTheNextBlockBeforeTheOpeningCompletes() throws Exception {
        source = sentences(18);
        playing = true;
        at(500);
        var release = new CountDownLatch(1);
        reply = (http, payload) -> {
            if (payload.getString("block").startsWith("b0_")) assertTrue(release.await(6, TimeUnit.SECONDS));
            return envelope(response(payload, RUNNING));
        };
        try {
            activate();
            await("opening request underway", () -> !requests.isEmpty());
            at(500);
            await("opening and next block in parallel", () -> requests.size() >= 2);
            assertTrue(requests.get(0).getString("block").startsWith("b0_"));
            assertTrue(requests.get(1).getString("block").startsWith("b1_"));
            assertTrue(frames.isEmpty());
        } finally {
            release.countDown();
        }
        awaitText(RUNNING);
    }

    @Test public void pausedBootstrapRequestsOnlyTheLandingBlock() throws Exception {
        source = sentences(18);
        reply = (http, payload) -> envelope(response(payload, RUNNING));
        activate();
        awaitText(RUNNING);
        idle(2_000);
        assertEquals(1, requests.size());
    }

    @Test public void seekRevokesTheOldRenderGuardAndShowsTheNewLanding() throws Exception {
        source = sentences(20);
        reply = (http, payload) -> envelope(response(payload,
                payload.getString("block").startsWith("b0_") ? RUNNING : LANDING));
        activate();
        awaitText(RUNNING);
        var old = guard;
        at(80_000);
        awaitText(LANDING);
        assertFalse(old.isValid());
        assertTrue(guard.isValid());
    }

    @Test public void twoFocusAndTwoPrefetchPostsLeaveLaterSeeksQueuedUntilASlotFrees() throws Exception {
        source = sentences(34);
        playing = true;
        at(500);
        var release = new CountDownLatch(1);
        AtomicInteger received = new AtomicInteger();
        reply = (http, payload) -> {
            if (received.incrementAndGet() > 1) assertTrue(release.await(7, TimeUnit.SECONDS));
            return envelope(response(payload, RUNNING));
        };
        try {
            activate();
            awaitText(RUNNING);
            await("two prefetch posts", () -> requests.size() >= 3);
            at(66_000);
            await("first seek's focus post", () -> requests.size() >= 4);
            at(110_000);
            await("second seek's focus post", () -> requests.size() >= 5);
            at(170_000);
            at(225_000);
            idle(200);
            assertEquals(5, requests.size());
            assertEquals(2, diagnostics.stream().filter(line -> line.startsWith("REBUILD_REQUEST ")
                    && line.contains("purpose=prefetch")).count());
        } finally {
            release.countDown();
        }
        await("newest seek gets the free slot", () -> requests.size() >= 6);
        assertTrue(requests.get(5).getString("source_text").contains("sentence 28"));
    }

    @Test public void providerContentFilterDoesNotWasteMorePostsOnTheSameBlock() throws Exception {
        reply = (http, payload) -> new MockResponse().setResponseCode(400).setBody("data_inspection_failed");
        activate();
        await("provider filter", () -> diagnostics.stream().anyMatch(line -> line.contains("reason=content_filter")));
        idle(60_000);
        assertEquals(1, requests.size());
        assertTrue(frames.stream().allMatch(frame -> frame.text.equals("…")));
    }

    @Test public void permanentlyBadPaidRepliesReachAnAbandonmentBudget() throws Exception {
        reply = (http, payload) -> new MockResponse().setResponseCode(503);
        activate();
        for (int attempt = 1; attempt <= 5; attempt++) {
            final int posted = attempt;
            await("provider completed attempt " + posted, () -> diagnostics.stream()
                    .filter(line -> line.startsWith("REBUILD_EVENTS_REJECTED ")).count() >= posted);
            idle(20_000);
            at(position);
        }
        await("bounded budget exhausted", () -> diagnostics.stream().anyMatch(line -> line.startsWith("REBUILD_BLOCK_ABANDONED ")));
        assertEquals(5, requests.size());
        idle(120_000);
        assertEquals(5, requests.size());
    }

    @Test public void rejectedGapRepairCannotSpendTheWholeBlockBudget() throws Exception {
        source = sentences(1);
        AtomicInteger calls = new AtomicInteger();
        reply = (http, payload) -> {
            if (calls.incrementAndGet() == 1) {
                return envelope(response(payload, new JSONArray().put(event(quote(payload, 0, 7), RUNNING))));
            }
            return new MockResponse().setResponseCode(400).setBody("data_inspection_failed");
        };
        activate();
        await("failed limited subrange request", () -> diagnostics.stream().anyMatch(line -> line.startsWith("REBUILD_HOLE_FAILED ")));
        idle(60_000);
        assertEquals(2, requests.size());
        assertTrue(requests.get(1).getString("repair").startsWith("Translate only this missing source range"));
    }

    @Test public void seekAcrossSourceOnlyCaptionsCannotStartPrefetchOrRepair() throws Exception {
        source = sentences(15);
        playing = true;
        original();
        await("first source caption", () -> !frames.isEmpty());
        for (long position : List.of(95_000L, 20_000L, 50_000L)) {
            at(position);
            idle(1_000);
        }
        assertEquals(0, requests.size());
        assertTrue(frames.size() >= 2);
    }
}

