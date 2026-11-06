package dev.twitchpatches.extension.ads.hls;

import org.junit.Test;
import static org.junit.Assert.*;

public final class LiveWindowTest {
    private static final String BASE = "https://video-weaver.test.hls.ttvnw.net/live/main.m3u8";
    private static HlsPlaylist live(long sequence, String name, int count, String date) {
        StringBuilder body = new StringBuilder("#EXTM3U\n#EXT-X-TARGETDURATION:2\n#EXT-X-TWITCH-LIVE-SEQUENCE:").append(sequence).append('\n');
        if (date != null) body.append("#EXT-X-PROGRAM-DATE-TIME:").append(date).append('\n');
        for (int i = 0; i < count; i++) body.append("#EXTINF:2,live\n").append(name).append(sequence + i).append(".ts\n");
        return HlsPlaylist.parse(body.toString(), BASE);
    }

    @Test public void overlapFreezesUrlsAndKeepsOneClockAcrossSources() {
        LiveWindow window = new LiveWindow();
        window.absorb(live(100, "main", 2, "2026-10-02T17:00:00Z"), "main");
        assertTrue(window.advance(true));
        window.absorb(live(101, "backup", 3, "2026-10-02T17:00:09Z"), "mobile_feed");
        assertTrue(window.advance(true));
        String rendered = window.render(2, false);
        assertTrue(rendered.contains("main101.ts"));
        assertFalse(rendered.contains("backup101.ts"));
        assertTrue(rendered.contains("backup102.ts"));
        assertTrue(rendered.contains("2026-10-02T17:00:04Z"));
        assertFalse(rendered.contains("2026-10-02T17:00:09Z"));
        assertTrue(rendered.contains("#EXT-X-DISCONTINUITY\n"));
    }

    @Test public void missedRangeFollowsFreshContiguousRunInsteadOfFreezingOldWindow() {
        LiveWindow window = new LiveWindow();
        window.absorb(live(10, "main", 2, null), "main");
        window.advance(true);
        window.absorb(live(13, "backup", 2, null), "popout");
        assertTrue(window.advance(true));
        assertTrue(window.render(2, false).contains("#EXT-X-MEDIA-SEQUENCE:13\n"));
        assertTrue(window.render(2, false).contains("backup13.ts"));
        assertFalse(window.render(2, false).contains("main10.ts"));
        window.absorb(live(12, "bridge", 1, null), "mobile_feed");
        assertFalse(window.advance(true));
        assertFalse(window.render(2, false).contains("bridge12.ts"));
    }

    @Test public void unavailableBackupReturnsOriginalWithoutContaminatingCleanLedger() {
        LiveWindow window = new LiveWindow();
        window.absorb(live(40, "main", 2, null), "main");
        window.advance(true);
        HlsPlaylist ads = HlsPlaylist.parse("#EXTM3U\n#EXT-X-DATERANGE:ID=\"stitched-ad\"\n#EXTINF:2,ad\nad.ts\n", BASE);
        assertNull(window.finish(ads, false));
        assertFalse(window.render(2, false).contains("ad.ts"));
        window.absorb(live(42, "back", 1, null), "mobile_feed");
        assertTrue(window.advance(true));
        String rendered = window.render(2, false);
        assertTrue(rendered.contains("#EXT-X-MEDIA-SEQUENCE:40\n"));
        assertFalse(rendered.contains("ad.ts"));
        assertTrue(rendered.contains("back42.ts"));
    }

    @Test public void entirelyAdOnlyPrerollIsReplacedByCleanBackup() {
        HlsPlaylist ads = HlsPlaylist.parse("#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:0\n" +
                "#EXT-X-DATERANGE:ID=\"stitched-ad\"\n#EXTINF:5,\npreroll.ts\n", BASE);
        LiveWindow window = new LiveWindow();
        assertTrue(window.acceptCleanBackup(live(7977, "clean", 14, null), "mobile_feed"));
        String output = window.finish(ads, true);
        assertNotNull(output);
        assertTrue(output.contains("#EXT-X-MEDIA-SEQUENCE:7977\n"));
        assertTrue(output.contains("#EXT-X-TWITCH-LIVE-SEQUENCE:7977\n"));
        assertFalse(output.contains("preroll.ts"));
        assertFalse(output.contains("stitched-ad"));
    }

    @Test public void repeatedCleanBackupPollRemainsAcceptedUntilNextPublication() {
        LiveWindow window = new LiveWindow();
        HlsPlaylist clean = live(100, "clean", 14, null);
        assertTrue(window.acceptCleanBackup(clean, "mobile_feed"));
        String first = window.render(2, false);
        for (int poll = 0; poll < 3; poll++) {
            assertTrue(window.acceptCleanBackup(clean, "mobile_feed"));
            assertEquals(first, window.render(2, false));
        }
        assertTrue(window.acceptCleanBackup(live(101, "clean", 14, null), "mobile_feed"));
        assertTrue(window.render(2, false).contains("clean114.ts"));
    }

    @Test public void multiformatPrerollKeepsCleanInitializationAndAdvancesAcrossSourceMaps() {
        String prefix = "#EXTM3U\n#EXT-X-VERSION:6\n#EXT-X-TARGETDURATION:6\n";
        HlsPlaylist ads = HlsPlaylist.parse(prefix + "#EXT-X-DATERANGE:ID=\"stitched-ad\"\n" +
                "#EXT-X-MAP:URI=\"ad-init.mp4\"\n#EXTINF:5,\nad.m4s\n", BASE);
        HlsPlaylist first = HlsPlaylist.parse(prefix + "#EXT-X-TWITCH-LIVE-SEQUENCE:80\n" +
                "#EXT-X-MAP:URI=\"clean-init.mp4\"\n#EXTINF:2,\nclean80.m4s\n" +
                "#EXT-X-TWITCH-PREFETCH:clean81.m4s\n", BASE);
        LiveWindow window = new LiveWindow();
        assertTrue(window.acceptCleanBackup(first, "mobile_feed"));
        String output = window.finish(ads, true);
        assertNotNull(output);
        assertTrue(output.contains("#EXT-X-VERSION:6\n"));
        assertTrue(output.contains("clean-init.mp4"));
        assertFalse(output.contains("ad-init.mp4"));
        assertFalse(output.contains("ad.m4s"));
        HlsPlaylist next = HlsPlaylist.parse(prefix + "#EXT-X-TWITCH-LIVE-SEQUENCE:81\n" +
                "#EXT-X-MAP:URI=\"next-init.mp4\"\n#EXTINF:2,\nnext81.m4s\n", BASE);
        assertTrue(window.acceptCleanBackup(next, "popout"));
        HlsPlaylist rendered = HlsPlaylist.parse(window.finish(ads, true), BASE);
        assertTrue(rendered.supported);
        assertEquals(Long.valueOf(81), rendered.segments.get(1).liveSequence);
        assertTrue(rendered.segments.get(1).discontinuity);
        assertTrue(rendered.segments.get(1).map.endsWith("next-init.mp4"));
        assertTrue(rendered.segments.get(1).uri.endsWith("next81.m4s"));
    }

    @Test public void qualityLanesUseBroadcastNumbersRatherThanIndependentCounters() {
        LiveWindow high = new LiveWindow(), low = new LiveWindow();
        high.acceptCleanBackup(live(90, "high", 15, null), "popout");
        low.acceptCleanBackup(live(94, "low", 15, null), "popout");
        HlsPlaylist first = HlsPlaylist.parse(high.render(2, false), BASE);
        HlsPlaylist second = HlsPlaylist.parse(low.render(2, false), BASE);
        assertEquals(100L, first.segments.get(10).liveSequence.longValue());
        assertEquals(100L, second.segments.get(6).liveSequence.longValue());
        assertEquals(first.mediaSequence + 10, second.mediaSequence + 6);
    }

    @Test public void prefetchedUrlIsFrozenWhenPublishedAcrossSourceChange() {
        LiveWindow window = new LiveWindow();
        String base = "#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-TWITCH-LIVE-SEQUENCE:100\n";
        HlsPlaylist primary = HlsPlaylist.parse(base + "#EXTINF:2,\nmain100.ts\n" +
                "#EXT-X-TWITCH-PREFETCH:main101.ts\n#EXT-X-TWITCH-PREFETCH:main102.ts\n", BASE);
        window.absorb(primary, "main"); window.advance(true);
        assertTrue(window.render(2, false).contains("#EXT-X-TWITCH-PREFETCH:" +
                "https://video-weaver.test.hls.ttvnw.net/live/main101.ts"));
        assertTrue(window.acceptCleanBackup(live(101, "backup", 2, null), "popout"));
        String rendered = window.render(2, false);
        assertTrue(rendered.contains("main101.ts"));
        assertTrue(rendered.contains("main102.ts"));
        assertFalse(rendered.contains("backup101.ts"));
        assertFalse(rendered.contains("#EXT-X-DISCONTINUITY\n"));
        assertTrue(rendered.contains("#EXT-X-VERSION:3\n"));
    }

    @Test public void mixedAdBackupIsRejectedAndCannotEnterLedger() {
        LiveWindow window = new LiveWindow();
        HlsPlaylist mixed = HlsPlaylist.parse("#EXTM3U\n#EXT-X-TWITCH-LIVE-SEQUENCE:100\n" +
                "#EXTINF:2,\nlive.ts\n#EXT-X-DISCONTINUITY\n#EXTINF:5,\nad.ts\n", BASE);
        assertFalse(window.acceptCleanBackup(mixed, "popout"));
        assertNull(window.render(2, false));
    }

    @Test public void longSessionsPruneWindowsAndNeverRegressSequence() {
        LiveWindow window = new LiveWindow();
        for (int i = 0; i < 5000; i++) {
            window.absorb(live(i, "main", 1, null), "main");
            assertTrue(window.advance(true));
        }
        String rendered = window.render(2, true);
        assertTrue(rendered.contains("#EXT-X-MEDIA-SEQUENCE:4985\n"));
        assertFalse(rendered.contains("main4984.ts"));
        assertTrue(rendered.endsWith("#EXT-X-ENDLIST\n"));
        window.absorb(live(1, "late", 10, null), "main");
        assertFalse(window.advance(true));
        assertEquals(rendered, window.render(2, true));
    }
}
