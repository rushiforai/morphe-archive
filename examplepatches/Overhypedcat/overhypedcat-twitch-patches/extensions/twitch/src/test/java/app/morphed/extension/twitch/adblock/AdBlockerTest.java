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

        String out = blocker.process(other, Playlists.media("pbp", 500, "llaa", true));

        assertFalse("blocked on its own: its ads cut out", out.contains("/ads/"));
        assertTrue(out.contains(Playlists.segment("pbp", 500)));
        // never mixed into the stream watched
        String watched = blocker.process(NATIVE_1080, Playlists.media("n", 101, "llll", false));
        assertFalse(watched.contains("pbp"));
        assertEquals(Collections.emptyList(), problems);
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
    public void markersAloneLeaveTwitchsPlaylistAsItIsButForTheMarkers() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String marked = Playlists.media("n", 101, "llll", true);

        String out = blocker.process(NATIVE_1080, marked);

        assertFalse("the app mustn't start its own ad", out.contains("stitched-ad"));
        assertTrue("Twitch's numbering", out.contains("#EXT-X-MEDIA-SEQUENCE:101"));
        assertTrue("the low latency hint stays: without it one slow playlist stalls the player",
                out.contains("#EXT-X-TWITCH-PREFETCH:" + Playlists.segment("n", 105)));
        assertEquals("nothing else changed", marked.replace(Playlists.AD_DATERANGE + "\n", ""), out);
    }

    @Test
    public void aBreakAnnouncedAheadTakesThePrefetchHints() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        // a stitched break starting after the newest segment (101..104: 12:03:22..12:03:28)
        String ahead = Playlists.media("n", 101, "llll", false).replace("#EXT-X-TWITCH-ELAPSED-SECS:100.0\n",
                "#EXT-X-TWITCH-ELAPSED-SECS:100.0\n" + Playlists.AD_DATERANGE.replace("2026-10-28T12:00:00.000Z",
                        "2026-10-28T12:03:40.000Z") + "\n");

        String out = blocker.process(NATIVE_1080, ahead);

        assertFalse("its first ad segments mustn't be fetched early", out.contains("#EXT-X-TWITCH-PREFETCH"));
        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:101"));
    }

    @Test
    public void afterABreakThePlayerGetsTwitchsOwnPlaylistAgain() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 101, "llaa", true)); // the ad: from the backup
        blocker.process(NATIVE_1080, Playlists.media("n", 103, "llll", false)); // clean once
        blocker.process(NATIVE_1080, Playlists.media("n", 104, "llll", false)); // clean twice: the break is over
        assertTrue(notices.contains("over"));

        String stitched = blocker.process(NATIVE_1080, Playlists.media("n", 105, "llll", false));
        String clean = Playlists.media("n", 106, "llll", false);
        String back = blocker.process(NATIVE_1080, clean);

        // Twitch's own playlist again: its low latency hint and every segment, in Twitch's order...
        assertTrue(back.contains("#EXT-X-TWITCH-PREFETCH:" + Playlists.segment("n", 110)));
        for (long s = 106; s <= 109; s++) assertTrue(back.contains(Playlists.segment("n", s)));
        // ...and each segment keeps the number the player knows it by: no jump, nothing played twice or skipped.
        assertSameNumbers(stitched, back);
        stitchedNumbersGoOn(back, blocker.process(NATIVE_1080, Playlists.media("n", 107, "llll", false)));
    }

    @Test
    public void afterACutBreakTheNumberingGoesOnWithoutAJump() {
        // No backup: the ad is cut out, so Twitch's numbers end up ahead of the player's.
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 101, "llaa", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 103, "aall", true));
        blocker.process(NATIVE_1080, Playlists.media("n", 105, "llll", false));
        String stitched = blocker.process(NATIVE_1080, Playlists.media("n", 106, "llll", false));
        String back = blocker.process(NATIVE_1080, Playlists.media("n", 107, "llll", false));

        assertSameNumbers(stitched, back);
        assertFalse("never a smaller discontinuity sequence", discontinuitySequence(back) < discontinuitySequence(stitched));
    }

    @Test
    public void numbersNeverGoBackAcrossABackupBreakAndItsEnd() {
        backupHasAds("site", false);
        List<String> served = new ArrayList<>();
        served.add(blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false)));
        served.add(blocker.process(NATIVE_1080, Playlists.media("n", 101, "llaa", true)));
        served.add(blocker.process(NATIVE_1080, Playlists.media("n", 103, "aall", true)));
        for (long first = 105; first <= 130; first++) {
            now += 2_000;
            served.add(blocker.process(NATIVE_1080, Playlists.media("n", first, "llll", false)));
        }
        java.util.Map<String, Long> numberOf = new java.util.HashMap<>();
        long lastMedia = Long.MIN_VALUE, lastDiscontinuity = Long.MIN_VALUE;
        for (String playlist : served) {
            long media = numbers(playlist).values().stream().mapToLong(Long::longValue).min().orElse(lastMedia);
            assertTrue("the media sequence never goes back:\n" + playlist, media >= lastMedia);
            assertTrue("nor the discontinuity sequence:\n" + playlist, discontinuitySequence(playlist) >= lastDiscontinuity);
            lastMedia = media;
            lastDiscontinuity = discontinuitySequence(playlist);
            for (java.util.Map.Entry<String, Long> e : numbers(playlist).entrySet()) {
                Long before = numberOf.put(e.getKey(), e.getValue());
                if (before != null) assertEquals("a segment keeps its number: " + e.getKey(), before, e.getValue());
            }
        }
        String last = served.get(served.size() - 1);
        assertTrue("Twitch's own playlist in the end, with its prefetch hint",
                last.contains("#EXT-X-TWITCH-PREFETCH:" + Playlists.segment("n", 134)));
    }

    @Test
    public void aMovedStreamIsFollowedWhileAnotherPlayerIsAround() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        // another player's playlist, polled together with the stream (blocked on its own, quietly)
        now += 300;
        blocker.process("https://euc11.playlist.ttvnw.net/v1/playlist/other.m3u8", Playlists.media("o", 300, "llll", false));
        // the stream moves: its old URL stops, the new one shares its segments
        now += 2_000;
        String moved = "https://euc12.playlist.ttvnw.net/v1/playlist/moved.m3u8";
        String out = blocker.process(moved, Playlists.media("n", 101, "llll", false));
        assertTrue(out.contains(Playlists.segment("n", 104)));
        assertTrue("taken as the stream watched", blocker.isKnownMediaPlaylist(moved));
        assertEquals(Collections.emptyList(), problems);
    }

    @Test
    public void aPlaylistBlockedOnItsOwnIsTakenBackWhenTheStreamTurnsOutToHaveMoved() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String moved = "https://euc12.playlist.ttvnw.net/v1/playlist/moved.m3u8";
        // its first poll comes within a second of the old URL's last: taken for another player at first
        now += 500;
        blocker.process(moved, Playlists.media("n", 100, "llll", false));
        // the old URL is no longer polled: it was the stream moving, and an ad is blocked with a backup again
        backupHasAds("site", false);
        now += 3_000;
        String out = blocker.process(moved, Playlists.media("n", 102, "llaa", true));
        assertTrue("the stream's backup, not just a cut", out.contains(Playlists.segment("site", 104)));
    }

    @Test
    public void anotherPlayersAdShowsNoLabel() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        now += 400;
        String out = blocker.process("https://euc11.playlist.ttvnw.net/v1/playlist/other.m3u8",
                Playlists.media("o", 300, "llaa", true));
        assertFalse(out.contains("/ads/"));
        assertEquals("not the stream on screen: no label", Collections.emptyList(), notices);
    }

    @Test
    public void aQualitySwitchedToAfterABreakGoesOnWithTheSameNumbers() {
        // A break cut on 1080p (no backup) moves the stream's numbers; 720p, first polled after it, follows them.
        http.getResponses.clear();
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        now += 2_000;
        blocker.process(NATIVE_1080, Playlists.media("n", 104, "aall", true));
        String on1080 = null;
        for (long first = 106; first <= 125; first++) {
            now += 2_000;
            on1080 = blocker.process(NATIVE_1080, Playlists.media("n", first, "llll", false));
        }
        now += 2_000;
        String on720 = blocker.process(NATIVE_720, Playlists.media("m", 126, "llll", false));
        long newest1080 = Collections.max(numbers(on1080).values());
        long newest720 = Collections.max(numbers(on720).values());
        assertEquals("the next moment, one number on", newest1080 + 1, newest720);
        assertEquals(discontinuitySequence(on1080), discontinuitySequence(on720));
    }

    @Test
    public void aQualityPolledMidBreakAndLeftGoesOnWithTheStreamsNumbersLater() {
        // A break cut on 1080p; 720p polled once in it (cut too), then left; switched to minutes after the break.
        http.getResponses.clear();
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        now += 2_000;
        blocker.process(NATIVE_720, Playlists.media("m", 102, "llaa", true));
        now += 2_000;
        blocker.process(NATIVE_1080, Playlists.media("n", 104, "aall", true));
        String on1080 = null;
        for (long first = 106; first <= 200; first++) {
            now += 2_000;
            on1080 = blocker.process(NATIVE_1080, Playlists.media("n", first, "llll", false));
        }
        now += 2_000;
        String on720 = blocker.process(NATIVE_720, Playlists.media("m", 201, "llll", false));
        assertEquals("the next moment, one number on: not where 720p was left",
                Collections.max(numbers(on1080).values()) + 1, (long) Collections.max(numbers(on720).values()));
    }

    @Test
    public void slowFailingRefreshesStillCountAndTheStaleBackupIsLeft() throws Exception {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        assertTrue(blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true)).contains("/site"));
        // From here every refresh of that backup fails, and takes longer than a poll waits for it.
        http.getResponses.remove("site-1080.m3u8");
        http.delays.put("site-1080.m3u8", 500L);
        String out = "";
        for (int poll = 0; poll < 8 && out.contains("/site") || poll == 0; poll++) {
            Thread.sleep(700);
            now += 2_000;
            out = blocker.process(NATIVE_1080, Playlists.media("n", 103 + poll, "llaa", true));
        }
        assertFalse("the dead backup is given up, not served for the whole break", out.contains("/site"));
    }

    /** Segment URIs to the numbers a playlist gives them. */
    private static java.util.Map<String, Long> numbers(String playlist) {
        java.util.Map<String, Long> out = new java.util.HashMap<>();
        long next = -1;
        for (String line : playlist.split("\n")) {
            if (line.startsWith("#EXT-X-MEDIA-SEQUENCE:")) next = Long.parseLong(line.substring(22).trim());
            else if (!line.isEmpty() && !line.startsWith("#")) out.put(line, next++);
        }
        return out;
    }

    private static long discontinuitySequence(String playlist) {
        for (String line : playlist.split("\n")) {
            if (line.startsWith("#EXT-X-DISCONTINUITY-SEQUENCE:")) return Long.parseLong(line.substring(30).trim());
        }
        return 0;
    }

    private static void assertSameNumbers(String before, String after) {
        java.util.Map<String, Long> was = numbers(before), now = numbers(after);
        int shared = 0;
        for (java.util.Map.Entry<String, Long> e : now.entrySet()) {
            Long earlier = was.get(e.getKey());
            if (earlier == null) continue;
            shared++;
            assertEquals("segment " + e.getKey(), earlier, e.getValue());
        }
        assertTrue("the two playlists share segments", shared > 0);
    }

    private static void stitchedNumbersGoOn(String before, String after) {
        assertSameNumbers(before, after);
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
    public void aStreamMovedBetweenTwoPollsIsFollowedAtOnce() {
        backupHasAds("site", false);
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String moved = "https://euc11.playlist.ttvnw.net/v1/playlist/moved.m3u8";

        // The next poll, at the usual ~2 s, already comes from the new server: its ad is blocked too.
        now += 2_000;
        String out = blocker.process(moved, Playlists.media("n", 102, "llaa", true));

        assertTrue(out.contains(Playlists.segment("site", 104)));
        assertFalse("no ad segment reaches the player", out.contains("/ads/"));
        assertTrue(blocker.isKnownMediaPlaylist(moved));
    }

    @Test
    public void anotherPlayerOfTheSameStreamIsNotTakenForItMoving() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String second = "https://euc11.playlist.ttvnw.net/v1/playlist/second.m3u8";

        // Same segments, polled half a second after the stream's own poll: another player of it, on its own.
        now += 500;
        String text = Playlists.media("n", 100, "llll", false);
        assertSame("no ad: as Twitch sent it", text, blocker.process(second, text));
        // the stream watched goes on at its own URL, untouched by it
        String next = Playlists.media("n", 101, "llll", false);
        assertSame(next, blocker.process(NATIVE_1080, next));
    }

    @Test
    public void recognisesTheNewPlaylistHosts() {
        assertTrue(AdBlocker.isLiveMediaPlaylist("https://euc11.playlist.ttvnw.net/v1/playlist/CqQH5w.m3u8"));
        assertTrue(AdBlocker.isLiveMediaPlaylist("https://video-weaver.fra05.hls.ttvnw.net/v1/playlist/abc.m3u8"));
        assertFalse(AdBlocker.isLiveMediaPlaylist("https://cbb007b04906.j.cloudfront.hls.ttvnw.net/v1/segment/abc.ts"));
    }

    @Test
    public void anotherPlayersPlaylistIsBlockedOnItsOwnWhileTheStreamPlays() {
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        String other = "https://euc11.playlist.ttvnw.net/v1/playlist/other.m3u8";

        now += 500;
        String out = blocker.process(other, Playlists.media("o", 500, "llaa", true));

        assertFalse(out.contains("/ads/"));
        assertFalse("not mixed into the stream watched",
                blocker.process(NATIVE_1080, Playlists.media("n", 101, "llll", false)).contains("/o/"));
        assertEquals(Collections.emptyList(), problems);
    }

    @Test
    public void blocksALivePlaylistWhoseStreamWasntSeen() {
        // A stream picked up again after a long pause, or loaded where its playlist list wasn't seen.
        now += 10 * 60 * 1000;
        String unknown = "https://video-weaver.other.hls.ttvnw.net/v1/playlist/unknown.m3u8";

        String out = blocker.process(unknown, Playlists.media("n", 100, "llaa", true));

        assertFalse("its ads cut out", out.contains("/ads/"));
        assertTrue(blocker.isKnownMediaPlaylist(unknown));
        assertEquals("handled, not an error to report", Collections.emptyList(), problems);
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

    @Test
    public void breakIsNotOverWhileAnotherPolledQualityIsStillInIt() {
        backupHasAds("site", false);
        http.getResponses.put("site-720.m3u8", Playlists.media("site720", 101, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        blocker.process(NATIVE_720, Playlists.media("m", 100, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));
        blocker.process(NATIVE_720, Playlists.media("m", 102, "llaa", true));

        // 720p is clean again, but 1080p was polled moments ago and is still in the break.
        blocker.process(NATIVE_720, Playlists.media("m", 106, "llll", false));
        blocker.process(NATIVE_720, Playlists.media("m", 107, "llll", false));
        assertEquals(0, refreshes);
        assertFalse(notices.contains("over"));

        // Once 1080p is left behind, the break ends, once.
        now += 7_000;
        blocker.process(NATIVE_720, Playlists.media("m", 108, "llll", false));
        assertEquals(1, refreshes);
    }

    @Test
    public void backupThatKeepsFailingToRefreshIsReplaced() {
        backupHasAds("site", false);
        http.getResponses.put("popout-1080.m3u8", Playlists.media("popout", 103, "llll", false));
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        assertTrue(blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true)).contains("/site/"));

        // The site backup dies: its last playlist is served once, then another backup is found.
        http.getResponses.remove("site-1080.m3u8");
        String bridged = blocker.process(NATIVE_1080, Playlists.media("n", 103, "laaa", true));
        assertTrue(bridged.contains(Playlists.segment("site", 104)));

        String replaced = blocker.process(NATIVE_1080, Playlists.media("n", 104, "aaaa", true));
        assertTrue(replaced.contains(Playlists.segment("popout", 106)));
        assertFalse(replaced.contains("/ads/"));
    }

    @Test
    public void onlyPlaylistsAreInspected() {
        assertFalse(blocker.shouldInspect("https://weaver.example/native-1080.ts"));
        assertFalse(blocker.shouldInspect("https://video-edge.example.hls.ttvnw.net/v1/segment/abc.ts"));
        blocker.checkRequest("https://usher.ttvnw.net/api/channel/hls/x/segment.ts");
        assertTrue(problems.isEmpty());
    }

    @Test
    public void manyPreviewsDoNotForgetTheOnesStillPlaying() {
        List<Problem> found = new ArrayList<>();
        BackupStreamFinder finder = new BackupStreamFinder(http, new AccessTokenClient(http, "device"), Logger.NONE, () -> now,
                Problem.Reporter.NONE);
        AdBlocker fresh = new AdBlocker(finder, Logger.NONE, () -> now, AdBlocker.BreakListener.NONE,
                (problem, detail) -> found.add(problem));
        for (int i = 0; i < 600; i++) {
            String previewMaster = "https://usher.ttvnw.net/api/v2/channel/hls/c" + i + ".m3u8?allow_source=true"
                    + "&token=%7B%22player_type%22%3A%22mobile-feed%22%7D&sig=s";
            fresh.process(previewMaster, Playlists.master("https://video-weaver.example.hls.ttvnw.net/v1/playlist/p" + i + ".m3u8"));
        }

        // Preview 450 was opened before the list filled up; clearing the whole list used to drop it.
        String recent = "https://video-weaver.example.hls.ttvnw.net/v1/playlist/p450.m3u8";
        assertFalse(fresh.shouldInspect(recent));
        fresh.checkRequest(recent);
        assertTrue(found.isEmpty());
        // The oldest ones are the ones dropped.
        assertTrue(fresh.shouldInspect("https://video-weaver.example.hls.ttvnw.net/v1/playlist/p0.m3u8"));
    }

    @Test
    public void perPollLinesAreOnlyBuiltWhenTheDetailedLogIsOn() {
        List<String> lines = new ArrayList<>();
        Logger quiet = new Logger() {
            @Override
            public void log(String message) {
                lines.add(message);
            }

            @Override
            public boolean detailed() {
                return false;
            }
        };
        BackupStreamFinder finder = new BackupStreamFinder(http, new AccessTokenClient(http, "device"), quiet, () -> now,
                Problem.Reporter.NONE);
        AdBlocker fresh = new AdBlocker(finder, quiet, () -> now, AdBlocker.BreakListener.NONE, Problem.Reporter.NONE);
        backupHasAds("site", false);
        fresh.process(MASTER_URL, Playlists.master(NATIVE_1080, NATIVE_720));
        fresh.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));
        fresh.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(lines.stream().anyMatch(line -> line.startsWith("Watching somechannel")));
        assertTrue(lines.stream().anyMatch(line -> line.startsWith("Serving site")));
        assertFalse(lines.stream().anyMatch(line -> line.startsWith("Playlist ") || line.startsWith("HTTP ")));
    }

    @Test
    public void backupWithoutAnyVideoQualityIsAnErrorNotAnAd() {
        for (String type : BackupStreamFinder.PLAYER_TYPES) http.getResponses.put("sig=sig-" + type + "&", "#EXTM3U\n");
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(problems.contains(Problem.BACKUPS_UNAVAILABLE));
    }

    @Test
    public void crashingBackupRequestsAreReportedLikeFailingOnes() {
        http.crashes.add("PlaybackAccessToken");
        blocker.process(NATIVE_1080, Playlists.media("n", 100, "llll", false));

        String out = blocker.process(NATIVE_1080, Playlists.media("n", 102, "llaa", true));

        assertTrue(problems.contains(Problem.BACKUPS_UNAVAILABLE));
        assertFalse(out.contains("/ads/"));
    }
}
