package app.morphed.extension.twitch.adblock;

import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphed.extension.twitch.Playlists;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class AdBlockerTest {
    private static final String MASTER_URL = "https://usher.ttvnw.net/api/v2/channel/hls/SomeChannel.m3u8"
            + "?allow_source=true&token=app-token&sig=app-sig&player_backend=mediaplayer";
    private static final String NATIVE_1080 = "https://weaver.example/native-1080.m3u8";
    private static final String NATIVE_720 = "https://weaver.example/native-720.m3u8";

    private final FakeHttp http = new FakeHttp();
    private long now = 1_000_000;
    private int refreshes;
    private final List<String> notices = new ArrayList<>();
    private final List<Problem> problems = new ArrayList<>();
    private AdBlocker blocker;

    @Before
    public void setUp() {
        Problem.Reporter reporter = (problem, detail) -> problems.add(problem);
        BackupStreamFinder finder = new BackupStreamFinder(http, new AccessTokenClient(http, "device"), Logger.NONE, () -> now, reporter);
        AdBlocker.BreakListener breaks = new AdBlocker.BreakListener() {
            @Override
            public void onBlocking(String quality) {
                notices.add("blocking " + quality);
            }

            @Override
            public void onBreakOver() {
                notices.add("over");
                refreshes++;
            }
        };
        blocker = new AdBlocker(finder, Logger.NONE, () -> now, breaks, reporter);

        for (String type : BackupStreamFinder.PLAYER_TYPES) {
            http.postResponses.put("\"playerType\":\"" + type + "\"", FakeHttp.tokenResponse(type));
            http.getResponses.put("sig=sig-" + type + "&", Playlists.master(
                    "https://weaver.example/" + type + "-1080.m3u8", "https://weaver.example/" + type + "-720.m3u8"));
        }
        blocker.process(MASTER_URL, Playlists.master(NATIVE_1080, NATIVE_720));
    }

    private void backupHasAds(String type, boolean ads) {
        http.getResponses.put(type + "-1080.m3u8", Playlists.media(type, 101, ads ? "llaa" : "llll", ads));
    }

    @Test
    public void inspectsOnlyUsherAndKnownPlaylists() {
        assertTrue(blocker.shouldInspect(MASTER_URL));
        assertTrue(blocker.shouldInspect(NATIVE_1080 + "?reassign=1"));
        assertFalse(blocker.shouldInspect("https://weaver.example/unknown.m3u8"));
        assertFalse(blocker.shouldInspect("https://edge.example/n/100.ts"));
    }

    @Test
    public void cleanPlaylistIsUntouched() {
        String text = Playlists.media("n", 100, "llll", false);

        assertSame(text, blocker.process(NATIVE_1080, text));
        assertTrue(http.requests.isEmpty());
    }

    @Test
    public void markerOnlyBreakStripsMarkersWithoutBackupSearch() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String out = blocker.process(NATIVE_1080, Playlists.media("n", 101, "llll", true));

        assertFalse(out.contains("stitched-ad"));
        assertTrue(out.contains(Playlists.segment("n", 104)));
        assertTrue(http.requests.isEmpty());
    }

    @Test
    public void stitchedAdIsReplacedWithFirstCleanBackup() {
        backupHasAds("site", true);
        backupHasAds("popout", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        String out = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("popout", 104)));
        assertFalse(out.contains("/ads/"));
        assertTrue(http.requests.contains("GET https://weaver.example/site-1080.m3u8"));
        // The app's own token is swapped out, its other parameters stay.
        String usher = http.requests.stream().filter(r -> r.contains("sig-popout")).findFirst().orElse("");
        assertTrue(usher.contains("/api/v2/channel/hls/SomeChannel.m3u8?allow_source=true&player_backend=mediaplayer&sig=sig-popout&token="));
        assertFalse(usher.contains("app-token"));
    }

    @Test
    public void laterPollsReuseTheChosenBackup() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        long tokenRequests = http.count("POST");

        http.getResponses.put("site-1080.m3u8", Playlists.media("site", 102, "llll", false));
        String out = blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));

        assertEquals(tokenRequests, http.count("POST"));
        assertTrue(out.contains(Playlists.segment("site", 105)));
    }

    @Test
    public void returnsToNativeAfterTheBreak() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        String out = blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", false));

        assertTrue(out.contains(Playlists.segment("n", 109)));
        assertFalse(out.contains("site"));
    }

    @Test
    public void refreshesPlayerOnceWhenSwappedBreakEnds() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        assertEquals(0, refreshes);

        blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 107, "llll", false));

        assertEquals(1, refreshes);
    }

    @Test
    public void noticeShowsBackupQualityUntilTheBreakEnds() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 107, "llll", false));

        assertEquals(Arrays.asList("blocking 1080p", "over"), notices);
    }

    @Test
    public void breakEndsWhenAdSegmentsAreGoneEvenIfMarkersLinger() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        String out = blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 107, "llll", true));

        assertEquals(Arrays.asList("blocking 1080p", "over"), notices);
        assertTrue(out.contains(Playlists.segment("n", 109)));
        assertFalse(out.contains("weaver.example/site"));
    }

    @Test
    public void watchingOnlyWhileAStreamPolls() {
        // setUp loaded the master playlist only: the stream is opening, not playing yet.
        assertFalse(blocker.isWatching());

        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        assertTrue(blocker.isWatching());

        now += 3_000;
        assertTrue(blocker.isWatching());

        // Left the stream: no playlist for a while.
        now += 4_000;
        assertFalse(blocker.isWatching());
    }

    @Test
    public void previewsOnTheMainPageAreNotWatching() {
        BackupStreamFinder finder = new BackupStreamFinder(http, new AccessTokenClient(http, "device"), Logger.NONE, () -> now,
                Problem.Reporter.NONE);
        AdBlocker fresh = new AdBlocker(finder, Logger.NONE, () -> now, AdBlocker.BreakListener.NONE, Problem.Reporter.NONE);
        String previewMaster = "https://usher.ttvnw.net/api/v2/channel/hls/other.m3u8?allow_source=true"
                + "&token=%7B%22player_type%22%3A%22mobile-feed%22%7D&sig=s";
        String previewVariant = "https://video-weaver.example.hls.ttvnw.net/v1/playlist/preview.m3u8";
        fresh.process(previewMaster, Playlists.master(previewVariant));

        assertFalse(fresh.shouldInspect(previewVariant));
        assertFalse(fresh.isWatching());
    }

    @Test
    public void slowSearchDoesNotHoldThePlayerAndIsUsedOnTheNextPoll() throws Exception {
        backupHasAds("site", false);
        http.delays.put("site-1080.m3u8", 2_500L);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        long start = System.nanoTime();
        String first = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        long waitedMs = (System.nanoTime() - start) / 1_000_000;

        assertTrue("player waited " + waitedMs + "ms", waitedMs < 2_200);
        assertFalse(first.contains("/site/"));

        Thread.sleep(2_000);
        http.delays.clear();
        String second = blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));
        assertTrue(second.contains(Playlists.segment("site", 104)));
    }

    @Test
    public void lowerQualityCleanStreamIsUsedWhileABetterOneIsStillLoading() throws Exception {
        backupHasAds("site", false);
        http.getResponses.put("autoplay-1080.m3u8", Playlists.media("autoplay", 101, "llll", false));
        http.delays.put("site-1080.m3u8", 3_000L);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        String first = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        assertTrue(first.contains(Playlists.segment("autoplay", 104)));

        // The better (source quality) stream arrives later and takes over from its next new segment;
        // moments already shown from the 360p stream are not repeated.
        Thread.sleep(3_500);
        http.delays.clear();
        http.getResponses.put("site-1080.m3u8", Playlists.media("site", 103, "llll", false));
        String later = blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));
        assertTrue(later.contains(Playlists.segment("site", 105)));
        assertFalse(later.contains(Playlists.segment("site", 104)));
    }

    @Test
    public void slowRefreshKeepsServingTheBackupInUse() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        http.delays.put("site-1080.m3u8", 2_500L);
        String out = blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));

        assertTrue(out.contains(Playlists.segment("site", 104)));
        assertFalse(out.contains("/ads/"));
    }

    @Test
    public void qualityLeftMidBreakDoesNotHoldTheBreakOpen() {
        backupHasAds("site", false);
        http.getResponses.put("site-720.m3u8", Playlists.media("site720", 101, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        // The player switched to 720p during the break and never polls 1080p again.
        now += 7_000;
        blocker.process(NATIVE_720, Playlists.media("m", 106, "llll", false));
        blocker.process(NATIVE_720, Playlists.media("m", 107, "llll", false));

        assertEquals(1, refreshes);
    }

    @Test
    public void otherPreviewPlayerTypesAreLeftAlone() {
        assertTrue(AdBlocker.isPreview("https://usher.ttvnw.net/x.m3u8?token=%7B%22player_type%22%3A%22autoplay%22%7D"));
        assertTrue(AdBlocker.isPreview("https://usher.ttvnw.net/x.m3u8?token=%7B%22player_type%22%3A%22creator_mode_preview%22%7D"));
        assertFalse(AdBlocker.isPreview("https://usher.ttvnw.net/x.m3u8?token=%7B%22player_type%22%3A%22mobile_player%22%7D"));
    }

    @Test
    public void cleanSourceQualityDoesNotWaitForSlowerTypes() {
        backupHasAds("site", false);
        http.delays.put("\"playerType\":\"autoplay\"", 4_000L);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        long start = System.nanoTime();
        String out = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("site", 104)));
        assertTrue((System.nanoTime() - start) / 1_000_000 < 1_500);
    }

    @Test
    public void oneCleanPollBetweenTwoAdsDoesNotEndTheBreak() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 108, "llaa", true));

        assertEquals(0, refreshes);
        assertFalse(notices.contains("over"));
    }

    @Test
    public void unrelatedPlaylistIsNotTakenForTheStreamMovingServers() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String other = "https://euc11.playlist.ttvnw.net/v1/playlist/pbp.m3u8";
        now += 3_000;
        String text = Playlists.media("pbp", 500, "llaa", true);

        assertSame(text, blocker.process(other, text));
        assertFalse(blocker.isKnownMediaPlaylist(other));
        assertEquals(Collections.emptyList(), notices);
    }

    @Test
    public void streamHiccupPlaceholdersAreNotAds() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String hiccup = Playlists.media("n", 101, "llll", false).replace("/n/104.ts", "/_404/104.ts");

        blocker.process(NATIVE_1080, hiccup);

        assertTrue(http.requests.isEmpty());
        assertEquals(Collections.emptyList(), notices);
    }

    @Test
    public void markersWithoutAdSegmentsShowNoNotice() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 101, "llll", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llll", false));

        assertEquals(Collections.emptyList(), notices);
    }

    @Test
    public void streamPreviewsAreLeftAlone() {
        String previewMaster = "https://usher.ttvnw.net/api/v2/channel/hls/other.m3u8?allow_source=true"
                + "&token=%7B%22channel%22%3A%22other%22%2C%22player_type%22%3A%22mobile-feed%22%7D&sig=s";
        String previewVariant = "https://video-weaver.example.hls.ttvnw.net/v1/playlist/preview.m3u8";
        blocker.process(previewMaster, Playlists.master(previewVariant));

        assertFalse(blocker.shouldInspect(previewVariant));
        assertFalse(blocker.isUnrecognizedLivePlaylist(previewVariant));
        assertTrue(http.requests.isEmpty());
        assertEquals(Collections.emptyList(), notices);
    }

    @Test
    public void readsPlayerTypeFromToken() {
        assertEquals("mobile-feed", AdBlocker.tokenPlayerType(
                "https://usher.ttvnw.net/x.m3u8?a=1&token=%7B%22player_type%22%3A%22mobile-feed%22%7D&sig=s"));
        assertEquals(null, AdBlocker.tokenPlayerType(MASTER_URL));
        assertFalse(AdBlocker.isPreview(
                "https://usher.ttvnw.net/x.m3u8?token=%7B%22player_type%22%3A%22site%22%7D"));
    }

    @Test
    public void noticeWithoutQualityWhenAdsAreOnlyCutOut() {
        for (String type : BackupStreamFinder.PLAYER_TYPES) backupHasAds(type, true);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertEquals(Collections.singletonList("blocking null"), notices);
    }

    @Test
    public void prefersSourceQualityOverAutoplayWhenBothAreClean() {
        backupHasAds("site", true);
        backupHasAds("popout", true);
        http.getResponses.put("embed-1080.m3u8", Playlists.media("embed", 101, "llll", false));
        http.getResponses.put("autoplay-1080.m3u8", Playlists.media("autoplay", 101, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        String out = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("embed", 104)));
    }

    @Test
    public void qualityLabels() {
        assertEquals("360p", AdBlocker.qualityLabel("640x360"));
        assertEquals(null, AdBlocker.qualityLabel(null));
    }

    @Test
    public void markerOnlyBreakDoesNotRefreshPlayer() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 101, "llll", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llll", false));

        assertEquals(0, refreshes);
    }

    @Test
    public void doesNotFloodTwitchWhileEveryBackupHasAds() {
        for (String type : BackupStreamFinder.PLAYER_TYPES) backupHasAds(type, true);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        long tokens = http.count("POST");
        long requests = http.requests.size();

        // Next poll two seconds later: no new search at all.
        now += 2_000;
        blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));
        assertEquals(requests, http.requests.size());

        // After the pause it searches again, reusing the tokens it already has.
        now += 10_000;
        blocker.process(NATIVE_1080, Playlists.media("n", 104, "aaaa", true));
        assertEquals(tokens, http.count("POST"));
        assertTrue(http.requests.size() > requests);
    }

    @Test
    public void stripsNativeWhenEveryBackupHasAds() {
        for (String type : BackupStreamFinder.PLAYER_TYPES) backupHasAds(type, true);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        String out = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("n", 103)));
        assertFalse(out.contains("/ads/"));
        assertFalse(out.contains("weaver.example/site"));
    }

    @Test
    public void matchesTheQualityThePlayerIsOn() {
        http.getResponses.put("site-720.m3u8", Playlists.media("site720", 101, "llll", false));
        blocker.process(NATIVE_720, Playlists.media("n", 100, "llll", false));

        String out = blocker.process(NATIVE_720, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("site720", 104)));
    }

    @Test
    public void normalOperationReportsNoProblems() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", false));

        assertEquals(Collections.emptyList(), problems);
    }

    @Test
    public void reportsAdMarkersItDoesNotRecognise() {
        String changed = Playlists.media("n", 100, "llll", false).replace("#EXT-X-TWITCH-ELAPSED-SECS:100.0",
                "#EXT-X-DATERANGE:ID=\"x\",CLASS=\"twitch-video-ad\",START-DATE=\"2026-10-28T12:00:00Z\"");

        blocker.process(NATIVE_1080, changed);

        assertEquals(Collections.singletonList(Problem.UNRECOGNIZED_AD_MARKERS), problems);
    }

    @Test
    public void reportsWhenEveryBackupErrors() {
        for (String type : BackupStreamFinder.PLAYER_TYPES) {
            http.postResponses.put("\"playerType\":\"" + type + "\"", "{\"errors\":[{\"message\":\"PersistedQueryNotFound\"}]}");
        }
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertEquals(Collections.singletonList(Problem.BACKUPS_UNAVAILABLE), problems);
    }

    @Test
    public void backupsWithAdsAreNotAnError() {
        for (String type : BackupStreamFinder.PLAYER_TYPES) backupHasAds(type, true);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertEquals(Collections.emptyList(), problems);
    }

    @Test
    public void reportsUsherPlaylistsItDoesNotRecognise() {
        blocker.checkRequest("https://usher.ttvnw.net/api/v3/live/somechannel.m3u8?token=x");
        blocker.checkRequest("https://usher.ttvnw.net/vod/123.m3u8");
        blocker.checkRequest("https://edge.example/n/100.ts");

        assertEquals(Collections.singletonList(Problem.UNRECOGNIZED_PLAYLIST), problems);
    }

    @Test
    public void followsAStreamMovedToAnotherPlaylistServer() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String moved = "https://video-weaver.other.hls.ttvnw.net/v1/playlist/moved.m3u8";
        assertTrue(blocker.shouldInspect(moved));

        // The old URL stopped being polled, so the new one is the same stream on another server.
        now += 3_000;
        String out = blocker.process(moved, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("site", 104)));
        assertTrue(blocker.isKnownMediaPlaylist(moved));
        assertEquals(Collections.emptyList(), problems);
    }

    @Test
    public void recognisesTheNewPlaylistHosts() {
        assertTrue(AdBlocker.isLiveMediaPlaylist("https://euc11.playlist.ttvnw.net/v1/playlist/CqQH5w.m3u8"));
        assertTrue(AdBlocker.isLiveMediaPlaylist("https://video-weaver.fra05.hls.ttvnw.net/v1/playlist/abc.m3u8"));
        assertFalse(AdBlocker.isLiveMediaPlaylist("https://cbb007b04906.j.cloudfront.hls.ttvnw.net/v1/segment/abc.ts"));
    }

    @Test
    public void leavesAnotherPlayersPlaylistAloneWhileTheStreamPlays() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String other = "https://euc11.playlist.ttvnw.net/v1/playlist/other.m3u8";
        String text = Playlists.media("o", 500, "llaa", true);

        now += 1_000;
        assertSame(text, blocker.process(other, text));
        assertFalse(blocker.isKnownMediaPlaylist(other));
        assertEquals(Collections.emptyList(), problems);
        assertEquals(Collections.emptyList(), notices);
    }

    @Test
    public void reportsUnknownPlaylistServerWithoutARecentStream() {
        now += 10 * 60 * 1000;
        String unknown = "https://video-weaver.other.hls.ttvnw.net/v1/playlist/unknown.m3u8";
        String text = Playlists.media("n", 100, "llaa", true);

        assertSame(text, blocker.process(unknown, text));
        assertEquals(Collections.singletonList(Problem.UNRECOGNIZED_PLAYLIST), problems);
    }

    @Test
    public void failedPlayerTypeIsSkippedForAWhile() {
        http.postResponses.put("\"playerType\":\"site\"", "{\"errors\":[{\"message\":\"server error\"}]}");
        backupHasAds("popout", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        backupHasAds("popout", true);
        long siteRequests = http.requests.stream().filter(r -> r.contains("\"playerType\":\"site\"")).count();

        blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));

        assertEquals(siteRequests, http.requests.stream().filter(r -> r.contains("\"playerType\":\"site\"")).count());
    }
}
