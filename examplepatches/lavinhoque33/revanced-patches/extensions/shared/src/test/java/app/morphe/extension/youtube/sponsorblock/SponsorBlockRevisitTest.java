/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.sponsorblock;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.content.pm.PackageInfo;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Looper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowConnectivityManager;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowNetworkInfo;
import org.robolectric.shadows.ShadowSystemClock;

import java.time.Duration;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.function.BooleanSupplier;

import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.requests.proxy.LoopbackTestConnection;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.VideoInformation;
import app.morphe.extension.youtube.sponsorblock.objects.CategoryBehaviour;
import app.morphe.extension.youtube.sponsorblock.objects.SegmentCategory;
import app.morphe.extension.youtube.sponsorblock.objects.SponsorSegment;
import app.morphe.extension.youtube.sponsorblock.requests.SBRequester;
import app.morphe.extension.youtube.sponsorblock.requests.SBRequester.SegmentSubmitAction;
import app.morphe.extension.youtube.whitelist.VideoChannel;
import app.morphe.extension.youtube.whitelist.Whitelist;
import fi.iki.elonen.NanoHTTPD;
import fi.iki.elonen.NanoHTTPD.Method;
import fi.iki.elonen.NanoHTTPD.Response.Status;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@LooperMode(LooperMode.Mode.PAUSED)
public class SponsorBlockRevisitTest {
    private static final String A = "aaaaaaaaaaa";
    private static final String B = "bbbbbbbbbbb";
    private static final String CHANNEL_ID = "fixtureChannel";
    private static final long VIDEO_DURATION = 120_000;

    private record Query(Method method, String video, String path, String categories) {
    }

    private record Reply(Status status, String body, CountDownLatch hold) {
    }

    private final Queue<Query> requests = new ConcurrentLinkedQueue<>();
    private final Map<String, Queue<Reply>> replies = new ConcurrentHashMap<>();
    private ShadowConnectivityManager network;
    private ShadowLooper main;
    private NanoHTTPD server;
    private String endpoint;

    @Before
    public void setUp() throws Exception {
        var app = RuntimeEnvironment.getApplication();
        PackageInfo info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.versionName = "21.45.90";
        info.applicationInfo = app.getApplicationInfo();
        shadowOf(app.getPackageManager()).installPackage(info);
        Utils.setContext(app);

        main = shadowOf(Looper.getMainLooper());
        network = shadowOf(app.getSystemService(ConnectivityManager.class));
        setConnected(true);

        server = new NanoHTTPD("127.0.0.1", 0) {
            @Override
            public Response serve(IHTTPSession session) {
                var params = session.getParameters();
                String video = params.get("videoID").get(0);
                String categories = params.getOrDefault("categories", List.of("")).get(0);
                Reply reply = replies.computeIfAbsent(key(session.getMethod(), video),
                        ignored -> new ConcurrentLinkedQueue<>()).poll();
                requests.add(new Query(session.getMethod(), video, session.getUri(), categories));

                if (reply == null) {
                    return newFixedLengthResponse(Status.OK, "application/json", "[]");
                }
                if (reply.hold != null) {
                    try {
                        if (!reply.hold.await(7, TimeUnit.SECONDS)) {
                            return newFixedLengthResponse(Status.SERVICE_UNAVAILABLE, MIME_PLAINTEXT, "test timeout");
                        }
                    } catch (InterruptedException ex) {
                        Thread.currentThread().interrupt();
                        return newFixedLengthResponse(Status.SERVICE_UNAVAILABLE, MIME_PLAINTEXT, "test interrupted");
                    }
                }
                return newFixedLengthResponse(reply.status, "application/json", reply.body);
            }
        };
        server.start(NanoHTTPD.SOCKET_READ_TIMEOUT, true);
        endpoint = "http://127.0.0.1:" + server.getListeningPort();
        Requester.setConnectionProvider(LoopbackTestConnection::open);

        Settings.SB_API_URL.save(endpoint);
        Settings.SB_ENABLED.save(true);
        Settings.SB_SEGMENT_MIN_DURATION.save(0F);
        Settings.SB_TOAST_ON_CONNECTION_ERROR.save(false);
        Settings.SB_TRACK_SKIP_COUNT.save(false);
        Settings.SB_LAST_VIP_CHECK.save(System.currentTimeMillis());
        SegmentCategory.SPONSOR.setBehaviour(CategoryBehaviour.SKIP_AUTOMATICALLY_ONCE);
        SegmentCategory.updateEnabledCategories();
        VideoInformation.initialize();
        SegmentPlaybackController.initialize();
    }

    @After
    public void tearDown() {
        if (server != null) {
            server.stop();
        }
        Requester.setConnectionProvider(null);
        Whitelist.getWhitelistedChannels(Whitelist.WhitelistType.SPONSOR_BLOCK).removeIf(
                channel -> channel.channelId().equals(CHANNEL_ID));
        SegmentPlaybackController.clearData();
    }

    @Test
    public void revisitAvoidsAnotherGetAndResetsPerVisitSkipAndViewState() throws Exception {
        enqueueGet(A, segment("original"));
        SponsorSegment first = openAndLoad(A)[0];
        assertTrue(first.shouldAutoSkip());
        first.didAutoSkipped = true;
        SponsorBlockUtils.sendViewRequestAsync(first);
        assertFalse(first.shouldAutoSkip());
        assertTrue(first.recordedAsSkipped);

        openAndLoad(B);
        SponsorSegment revisit = openAndLoad(A)[0];
        assertEquals(first, revisit);
        assertNotSame(first, revisit);
        assertTrue(revisit.shouldAutoSkip());
        assertFalse(revisit.recordedAsSkipped);
        assertEquals(1, count(Method.GET, A));
        assertEquals(1, count(Method.GET, B));
    }

    @Test
    public void caches404AndSuccessfulEmptyButNotHttpOrJsonFailures() throws Exception {
        String failed = "ccccccccccc";
        String malformed = "ddddddddddd";
        enqueue(Method.GET, A, Status.NOT_FOUND, "", null);
        enqueue(Method.GET, failed, Status.SERVICE_UNAVAILABLE, "", null);
        enqueueGet(failed, segment("retry-after-status"));
        String partial = segment("partial");
        enqueueGet(malformed, partial.substring(0, partial.length() - 1) + ",{}]");
        enqueueGet(malformed, segment("retry-after-malformed"));

        assertEquals(0, openAndLoad(A).length);
        assertEquals(0, openAndLoad(B).length);
        assertEquals(0, openAndLoad(failed).length);
        assertEquals("partial", openAndLoad(malformed)[0].UUID);
        assertEquals(0, openAndLoad(A).length);
        assertEquals(0, openAndLoad(B).length);
        assertEquals("retry-after-status", openAndLoad(failed)[0].UUID);
        assertEquals("retry-after-malformed", openAndLoad(malformed)[0].UUID);

        assertEquals(1, count(Method.GET, A));
        assertEquals(1, count(Method.GET, B));
        assertEquals(2, count(Method.GET, failed));
        assertEquals(2, count(Method.GET, malformed));
    }

    @Test
    public void expiryIsMonotonicAndRevisitsDoNotExtendIt() throws Exception {
        enqueueGet(A, segment("first"));
        enqueueGet(A, segment("expired"));
        assertEquals("first", openAndLoad(A)[0].UUID);
        openAndLoad(B);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(4));
        assertEquals("first", openAndLoad(A)[0].UUID);
        assertEquals(1, count(Method.GET, A));

        openAndLoad(B);
        ShadowSystemClock.advanceBy(Duration.ofMinutes(1));
        assertEquals("expired", openAndLoad(A)[0].UUID);
        assertEquals(2, count(Method.GET, A));
    }

    @Test
    public void capacityEvictsTheLeastRecentlyUsedResponse() throws Exception {
        openAndLoad(A);
        openAndLoad(B);
        for (int index = 0; index < 98; index++) {
            openAndLoad("fixture_" + index);
        }
        openAndLoad(A); // Touch A; B is now the least-recently-used entry.
        openAndLoad("fixture_98");
        openAndLoad(A);
        openAndLoad(B);

        assertEquals(1, count(Method.GET, A));
        assertEquals(2, count(Method.GET, B));
    }

    @Test
    public void endpointCategoryQueryAndMinimumDurationSeparateCachedResponses() throws Exception {
        enqueueGet(A, segment("original"));
        enqueueGet(A, segment("below-threshold"));
        assertEquals("original", openAndLoad(A)[0].UUID);
        openAndLoad(B);

        Settings.SB_SEGMENT_MIN_DURATION.save(5F);
        assertEquals(0, openAndLoad(A).length);
        assertEquals(2, count(Method.GET, A));
        openAndLoad(B);

        SegmentCategory.SPONSOR.setBehaviour(CategoryBehaviour.IGNORE);
        SegmentCategory.updateEnabledCategories();
        assertEquals(0, openAndLoad(A).length);
        List<Query> queries = requests.stream().filter(query -> query.video.equals(A)).toList();
        assertEquals(3, queries.size());
        assertTrue(queries.get(0).categories.contains("\"sponsor\""));
        assertFalse(queries.get(2).categories.contains("\"sponsor\""));
        openAndLoad(B);

        Settings.SB_API_URL.save(endpoint + "/other");
        assertEquals(0, openAndLoad(A).length);
        assertEquals("/other/api/skipSegments", requests.stream().filter(query -> query.video.equals(A))
                .skip(3).findFirst().orElseThrow().path);
        assertEquals(4, count(Method.GET, A));
    }

    @Test
    public void optedOutWhitelistedAndOfflineVisitsCannotConsumeWarmCache() throws Exception {
        enqueueGet(A, segment("warm"));
        openAndLoad(A);
        openAndLoad(B);
        setConnected(false);
        open(A, false);
        main.idle();
        assertNull(SegmentPlaybackController.getSegments());

        setConnected(true);
        Settings.SB_ENABLED.save(false);
        open(A, false);
        main.idle();
        assertNull(SegmentPlaybackController.getSegments());

        Settings.SB_ENABLED.save(true);
        Whitelist.getWhitelistedChannels(Whitelist.WhitelistType.SPONSOR_BLOCK)
                .add(new VideoChannel("fixture", CHANNEL_ID));
        open(A, false);
        main.idle();
        assertNull(SegmentPlaybackController.getSegments());
        assertEquals(1, count(Method.GET, A));
    }

    @Test
    public void shortsAndOfflineDownloadLookupDoNotUseOrOverwriteWatchCache() throws Exception {
        enqueueGet(A, segment("watch"));
        enqueueGet(A, segment("short"));
        enqueueGet(A, segment("stored-download"));
        assertEquals("watch", openAndLoad(A)[0].UUID);
        openAndLoad(B);

        open(A, true);
        assertEquals("short", awaitSegments()[0].UUID);
        var stored = Utils.submitOnBackgroundThread(() -> SBRequester.getSegments(A, List.of("sponsor")))
                .get(5, TimeUnit.SECONDS);
        assertEquals(SBRequester.DownloadStatus.OK, stored.status());
        assertEquals("stored-download", stored.segments().getJSONObject(0).getString("UUID"));

        openAndLoad(B);
        assertEquals("watch", openAndLoad(A)[0].UUID);
        assertEquals(3, count(Method.GET, A));
    }

    @Test
    public void lateFirstVisitCannotOverwriteSecondVisitOrItsCachedResponse() throws Exception {
        CountDownLatch releaseFirst = new CountDownLatch(1);
        enqueue(Method.GET, A, Status.OK, segment("first-visit"), releaseFirst);
        enqueueGet(A, segment("second-visit"));

        open(A, false);
        await(() -> count(Method.GET, A) == 1);
        openAndLoad(B);
        assertEquals("second-visit", openAndLoad(A)[0].UUID);
        finishLateGet(releaseFirst);
        assertEquals("second-visit", SegmentPlaybackController.getSegments()[0].UUID);

        openAndLoad(B);
        assertEquals("second-visit", openAndLoad(A)[0].UUID);
        assertEquals(2, count(Method.GET, A));
    }

    @Test
    public void submissionRefreshesAndCannotBeUndoneByAPreSubmissionGet() throws Exception {
        enqueueGet(A, segment("old-settings-variant"));
        openAndLoad(A);
        openAndLoad(B);

        Settings.SB_SEGMENT_MIN_DURATION.save(1F);
        CountDownLatch releaseFirst = new CountDownLatch(1);
        CountDownLatch releaseSubmit = new CountDownLatch(1);
        enqueue(Method.GET, A, Status.OK, segment("pre-submit"), releaseFirst);
        enqueue(Method.POST, A, Status.OK, "{}", releaseSubmit);
        enqueueGet(A, segment("submitted"));
        enqueueGet(A, segment("fresh-settings-variant"));

        open(A, false);
        await(() -> count(Method.GET, A) == 2);
        SegmentPlaybackController.submitSegments(A, SegmentCategory.SPONSOR, SegmentSubmitAction.SKIP,
                20_000, 24_000, VIDEO_DURATION);
        await(() -> count(Method.POST, A) == 1);
        openAndLoad(B);
        open(A, false);
        assertNull(SegmentPlaybackController.getSegments());
        assertEquals(2, count(Method.GET, A));

        releaseSubmit.countDown();
        assertEquals("submitted", awaitSegments()[0].UUID);
        finishLateGet(releaseFirst);
        assertEquals("submitted", SegmentPlaybackController.getSegments()[0].UUID);
        openAndLoad(B);
        assertEquals("submitted", openAndLoad(A)[0].UUID);
        assertEquals(3, count(Method.GET, A));

        Settings.SB_SEGMENT_MIN_DURATION.save(0F);
        openAndLoad(B);
        assertEquals("fresh-settings-variant", openAndLoad(A)[0].UUID);
        assertEquals(4, count(Method.GET, A));
    }

    @Test
    public void aSettingsChangeWhileFetchingCannotPublishResultsForTheOldEndpoint() throws Exception {
        CountDownLatch releaseFirst = new CountDownLatch(1);
        enqueue(Method.GET, A, Status.OK, segment("old-endpoint"), releaseFirst);
        enqueueGet(A, segment("new-endpoint"));

        open(A, false);
        await(() -> count(Method.GET, A) == 1);
        Settings.SB_API_URL.save(endpoint + "/other");
        releaseFirst.countDown();

        assertEquals("new-endpoint", awaitSegments()[0].UUID);
        assertEquals(2, count(Method.GET, A));
    }

    private void finishLateGet(CountDownLatch release) throws Exception {
        main.idle();
        // The only remaining ready work will be the held GET's real main-thread completion.
        release.countDown();
        await(() -> !main.isIdle());
        main.idle();
    }

    private void setConnected(boolean connected) {
        network.setActiveNetworkInfo(connected
                ? ShadowNetworkInfo.newInstance(NetworkInfo.DetailedState.CONNECTED,
                        ConnectivityManager.TYPE_WIFI, 0, true, true)
                : null);
    }

    private SponsorSegment[] openAndLoad(String video) throws Exception {
        open(video, false);
        return awaitSegments();
    }

    private void open(String video, boolean isShort) {
        VideoInformation.newPlayerResponseParameter(video, isShort ? "8AEB" : "", "", isShort);
        VideoInformation.setVideoId(video);
        VideoInformation.setVideoLength(VIDEO_DURATION);
        SegmentPlaybackController.newVideoStarted(CHANNEL_ID, "fixture", video, "fixture", VIDEO_DURATION, false);
    }

    private SponsorSegment[] awaitSegments() throws Exception {
        await(() -> {
            main.idle();
            return SegmentPlaybackController.getSegments() != null;
        });
        return SegmentPlaybackController.getSegments();
    }

    private static void await(BooleanSupplier condition) throws InterruptedException {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(5);
        while (!condition.getAsBoolean() && System.nanoTime() < deadline) {
            Thread.sleep(5);
        }
        assertTrue("Timed out waiting for SponsorBlock request or publication", condition.getAsBoolean());
    }

    private long count(Method method, String video) {
        return requests.stream().filter(query -> query.method == method && query.video.equals(video)).count();
    }

    private void enqueueGet(String video, String body) {
        enqueue(Method.GET, video, Status.OK, body, null);
    }

    private void enqueue(Method method, String video, Status status, String body, CountDownLatch hold) {
        replies.computeIfAbsent(key(method, video), ignored -> new ConcurrentLinkedQueue<>())
                .add(new Reply(status, body, hold));
    }

    private static String key(Method method, String video) {
        return method + ":" + video;
    }

    private static String segment(String uuid) {
        return "[{\"segment\":[20,24],\"UUID\":\"" + uuid + "\",\"locked\":1,\"category\":\"sponsor\"}]";
    }
}
