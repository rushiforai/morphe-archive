package io.github.sabopura.morphe.extension.twitch;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class FailureLogTest {
    private static final long FIRST_AT = new GregorianCalendar(2026, Calendar.NOVEMBER, 16, 12, 3, 4).getTimeInMillis();

    private static FailureLog log(int limit) {
        return new FailureLog(limit, () -> FIRST_AT);
    }

    private static Throwable at(Throwable failure, StackTraceElement... frames) {
        failure.setStackTrace(frames);
        return failure;
    }

    private static List<String> names(List<FailureLog.Place> places) {
        List<String> names = new ArrayList<>();
        for (FailureLog.Place place : places) names.add(place.name);
        return names;
    }

    @Test
    public void aPlaceKeepsItsFirstFailureAndCountsTheRepeats() {
        FailureLog log = log(64);
        assertNotNull(log.record("player.vod-id", new NoSuchMethodException("getId")));
        assertNull(log.record("player.vod-id", new IllegalStateException("later")));
        assertNull(log.record("player.vod-id", new IllegalStateException("later")));

        List<FailureLog.Place> places = log.places();
        assertEquals(1, places.size());
        assertEquals(3, places.get(0).times);
        assertEquals("java.lang.NoSuchMethodException: getId", places.get(0).failure);
        assertEquals(FIRST_AT, places.get(0).firstAt);
    }

    @Test
    public void placesAreBoundedAndFailuresBeyondOnlyCounted() {
        FailureLog log = log(2);
        log.record("a", new RuntimeException());
        log.record("b", new RuntimeException());
        assertNull(log.record("c", new RuntimeException()));
        log.record("c", new RuntimeException());
        log.record("a", new RuntimeException());

        assertEquals(2, log.size());
        assertEquals(2, log.unrecorded());
        assertEquals(Arrays.asList("a", "b"), names(log.places()));
        assertEquals(2, log.places().get(0).times);
    }

    @Test
    public void aSnapshotStaysAsItWasRead() {
        FailureLog log = log(64);
        log.record("a", new RuntimeException());
        List<FailureLog.Place> snapshot = log.places();
        log.record("a", new RuntimeException());
        log.record("b", new RuntimeException());

        assertEquals(1, snapshot.size());
        assertEquals(1, snapshot.get(0).times);
        try {
            snapshot.clear();
            fail("the snapshot can be changed");
        } catch (UnsupportedOperationException expected) {
        }
    }

    @Test
    public void urlQueriesAreDroppedAndMessagesStayOneShortLine() {
        assertEquals("Could not load https://usher.ttvnw.net/api/channel/hls/name.m3u8 (403)", FailureLog.clean(
                "Could not load https://usher.ttvnw.net/api/channel/hls/name.m3u8?token=secret&sig=abc (403)"));
        assertEquals("redirect to https://id.twitch.tv/oauth2/authorize",
                FailureLog.clean("redirect to https://id.twitch.tv/oauth2/authorize#access_token=abc"));
        assertEquals("tv.twitch.android.models.channel.ChannelModel.getId []",
                FailureLog.clean("tv.twitch.android.models.channel.ChannelModel.getId []"));
        assertEquals("first line second line", FailureLog.clean("first line\n\tsecond line "));
        assertEquals("Expected ':' after \"…\" at character 31 of {\"…\":\"…\", \"…\"",
                FailureLog.clean("Expected ':' after \"name\" at character 31 of {\"access_token\":\"abc123\", \"refresh"));
        assertEquals("For input string: \"…\"", FailureLog.clean("For input string: \"someone\""));
        assertEquals("Attempt to invoke virtual method 'java.lang.String tv.twitch.Foo.getName()' on a null object reference",
                FailureLog.clean("Attempt to invoke virtual method 'java.lang.String tv.twitch.Foo.getName()' on a null object reference"));

        char[] filler = new char[2000];
        Arrays.fill(filler, 'x');
        String cleaned = FailureLog.clean(new String(filler));
        assertEquals(160, cleaned.length());
        assertTrue(cleaned.endsWith("…"));
    }

    @Test
    public void theCauseIsNamedWithTheFailure() {
        assertEquals("java.lang.reflect.InvocationTargetException; caused by java.lang.NullPointerException: boom",
                FailureLog.describe(new InvocationTargetException(new NullPointerException("boom"))));
        assertEquals("java.lang.IllegalStateException", FailureLog.describe(new IllegalStateException()));
    }

    @Test
    public void theFrameShownIsThePatchsOwnCodeNeverTwitchs() {
        Throwable failure = at(new RuntimeException(),
                new StackTraceElement("tv.twitch.android.models.Foo", "a", "SourceFile", 12),
                new StackTraceElement("io.github.sabopura.morphe.extension.twitch.player.PlayerTools", "onVod",
                        "PlayerTools.java", 177),
                new StackTraceElement("tv.twitch.android.Bar", "b", "SourceFile", 3));
        assertEquals("player.PlayerTools.onVod(PlayerTools.java:177)", FailureLog.frame(failure));

        assertEquals("", FailureLog.frame(at(new RuntimeException(),
                new StackTraceElement("tv.twitch.android.models.Foo", "a", "SourceFile", 12))));
    }

    @Test
    public void theReportListsEachPlaceInTheOrderItFailed() {
        FailureLog log = log(64);
        Throwable renamed = at(new NoSuchMethodException("tv.twitch.ChannelModel.getId []"),
                new StackTraceElement("io.github.sabopura.morphe.extension.twitch.player.PlayerTools", "onVod",
                        "PlayerTools.java", 177));
        log.record("player.vod-channel", renamed);
        log.record("player.vod-channel", renamed);
        log.record("chat.row", at(new IllegalStateException()));

        assertEquals("Twitch: 32.0.0\n"
                        + "\n"
                        + "Places that did not work: 2\n"
                        + "\n"
                        + "1. player.vod-channel: 2 times, first at 12:03:04\n"
                        + "   java.lang.NoSuchMethodException: tv.twitch.ChannelModel.getId []\n"
                        + "   at player.PlayerTools.onVod(PlayerTools.java:177)\n"
                        + "\n"
                        + "2. chat.row: once, first at 12:03:04\n"
                        + "   java.lang.IllegalStateException",
                FailureLog.format(Collections.singletonList("Twitch: 32.0.0"), log.places(), log.unrecorded()));
    }

    @Test
    public void theReportSaysWhenFailuresWereNotListed() {
        FailureLog log = log(1);
        log.record("a", at(new RuntimeException()));
        log.record("b", at(new RuntimeException()));

        assertTrue(FailureLog.format(Collections.<String>emptyList(), log.places(), log.unrecorded())
                .endsWith("\n\nFailures at places not listed: 1"));
    }

    @Test
    public void aHealthyRunSaysSo() {
        assertEquals("Twitch: 32.0.0\n\nNo problems recorded.",
                FailureLog.format(Collections.singletonList("Twitch: 32.0.0"), log(64).places(), 0));
    }

    @Test
    public void failuresFromManyThreadsAreAllCountedWithinTheBound() throws Exception {
        FailureLog log = log(64);
        int threads = 8, rounds = 500, distinct = 100;
        ExecutorService pool = Executors.newFixedThreadPool(threads);
        CountDownLatch start = new CountDownLatch(1);
        for (int t = 0; t < threads; t++) {
            pool.execute(() -> {
                try {
                    start.await();
                } catch (InterruptedException e) {
                    return;
                }
                for (int i = 0; i < rounds; i++) log.record("place-" + i % distinct, new RuntimeException());
            });
        }
        start.countDown();
        pool.shutdown();
        assertTrue(pool.awaitTermination(30, TimeUnit.SECONDS));

        assertEquals(64, log.size());
        int counted = log.unrecorded();
        for (FailureLog.Place place : log.places()) counted += place.times;
        assertEquals(threads * rounds, counted);
    }
}
