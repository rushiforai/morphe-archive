package io.github.sabopura.morphe.extension.twitch.ads;

import org.junit.Test;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class StreamSwitchTest {
    @org.junit.BeforeClass
    public static void allPatches() {
        io.github.sabopura.morphe.extension.twitch.ui.Features.enableAllForPreview();
    }

    private static String fixture(String name) {
        InputStream in = StreamSwitchTest.class.getResourceAsStream("/playlists/" + name);
        try (Scanner s = new Scanner(in, StandardCharsets.UTF_8.name()).useDelimiter("\\A")) {
            return s.next();
        }
    }

    private static String live(long sequence) {
        return "#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-TARGETDURATION:6\n#EXT-X-MEDIA-SEQUENCE:" + sequence + "\n"
                + "#EXT-X-TWITCH-LIVE-SEQUENCE:" + sequence + "\n#EXTINF:2.000,live\nhttps://a.ttvnw.net/" + sequence + ".ts\n";
    }

    @Test
    public void cleanStreamsNeverTouchTheBackup() {
        StreamSwitch s = new StreamSwitch();
        AtomicInteger calls = new AtomicInteger();
        for (int i = 0; i < 5; i++) {
            s.choose(live(100 + i), () -> {
                calls.incrementAndGet();
                return null;
            });
            assertEquals(StreamSwitch.Outcome.ORIGINAL, s.lastOutcome());
        }
        assertEquals(0, calls.get());
    }

    @Test
    public void prerollIsReplacedAndTheOriginalReturnsAfterIt() {
        StreamSwitch s = new StreamSwitch();
        String backup = fixture("backup-live.m3u8");

        String first = s.choose(fixture("preroll-start.m3u8"), () -> backup);
        assertEquals(StreamSwitch.Outcome.SWITCHED_TO_BACKUP, s.lastOutcome());
        assertFalse(Playlists.hasStitchedAd(first));
        assertTrue(first.contains("#EXT-X-MEDIA-SEQUENCE:12456"));

        s.choose(fixture("preroll-later.m3u8"), () -> backup);
        assertEquals(StreamSwitch.Outcome.ON_BACKUP, s.lastOutcome());

        String after = s.choose(live(12470), () -> backup);
        assertEquals(StreamSwitch.Outcome.BACK_TO_ORIGINAL, s.lastOutcome());
        assertTrue(after.contains("#EXT-X-MEDIA-SEQUENCE:12470"));
    }

    @Test
    public void staysOnTheBackupUntilTheOriginalHasLiveNumbers() {
        StreamSwitch s = new StreamSwitch();
        String backup = fixture("backup-live.m3u8");
        s.choose(fixture("preroll-start.m3u8"), () -> backup);
        String unnumbered = "#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:16\n#EXT-X-DISCONTINUITY\n#EXTINF:2.000,live\nhttps://a/1.ts\n";
        String out = s.choose(unnumbered, () -> backup);
        assertEquals(StreamSwitch.Outcome.ON_BACKUP, s.lastOutcome());
        assertTrue(out.contains("#EXT-X-MEDIA-SEQUENCE:12456"));
    }

    @Test
    public void keepsTheAdWhenNoBackupIsAvailable() {
        StreamSwitch s = new StreamSwitch();
        String out = s.choose(fixture("preroll-start.m3u8"), () -> null);
        assertEquals(StreamSwitch.Outcome.AD_KEPT, s.lastOutcome());
        assertTrue("stitched cue kept for the cover", out.contains("twitch-stitched-ad"));
    }

    @Test
    public void oneFailedBackupRefreshKeepsTheReplacement() {
        AtomicLong now = new AtomicLong(1_000_000);
        StreamSwitch s = new StreamSwitch(now::get);
        String backup = fixture("backup-live.m3u8");
        String replaced = s.choose(fixture("preroll-start.m3u8"), () -> backup);

        now.addAndGet(6000);
        String held = s.choose(fixture("preroll-later.m3u8"), () -> null);
        assertEquals(StreamSwitch.Outcome.ON_BACKUP, s.lastOutcome());
        assertEquals("the player keeps the backup's numbering", replaced, held);
        assertFalse(Playlists.hasStitchedAd(held));

        now.addAndGet(2000);
        s.choose(fixture("preroll-later.m3u8"), () -> backup);
        assertEquals("one replacement per ad break", StreamSwitch.Outcome.ON_BACKUP, s.lastOutcome());
    }

    @Test
    public void theHeldBackupExpiresAfterAFewSeconds() {
        AtomicLong now = new AtomicLong(1_000_000);
        StreamSwitch s = new StreamSwitch(now::get);
        s.choose(fixture("preroll-start.m3u8"), () -> fixture("backup-live.m3u8"));
        now.addAndGet(StreamSwitch.HOLD_MS + 1);
        String out = s.choose(fixture("preroll-later.m3u8"), () -> null);
        assertEquals(StreamSwitch.Outcome.AD_KEPT, s.lastOutcome());
        assertTrue(out.contains("twitch-stitched-ad"));
    }

    @Test
    public void theHeldBackupNeverOutlivesTheAd() {
        AtomicLong now = new AtomicLong(1_000_000);
        StreamSwitch s = new StreamSwitch(now::get);
        s.choose(fixture("preroll-start.m3u8"), () -> fixture("backup-live.m3u8"));
        now.addAndGet(2000);
        String unnumbered = "#EXTM3U\n#EXT-X-MEDIA-SEQUENCE:16\n#EXT-X-DISCONTINUITY\n#EXTINF:2.000,live\nhttps://a/1.ts\n";
        String out = s.choose(unnumbered, () -> null);
        assertEquals(StreamSwitch.Outcome.BACK_TO_ORIGINAL, s.lastOutcome());
        assertEquals(unnumbered, out);
    }

    @Test
    public void aReplacementIsCountedOncePerAdBreak() {
        AtomicLong now = new AtomicLong(1_000_000);
        StreamSwitch s = new StreamSwitch(now::get);
        String backup = fixture("backup-live.m3u8");
        s.choose(fixture("preroll-start.m3u8"), () -> backup);
        assertEquals(StreamSwitch.Outcome.SWITCHED_TO_BACKUP, s.lastOutcome());
        now.addAndGet(StreamSwitch.HOLD_MS + 1);
        s.choose(fixture("preroll-later.m3u8"), () -> null);
        assertEquals(StreamSwitch.Outcome.AD_KEPT, s.lastOutcome());
        s.choose(fixture("preroll-later.m3u8"), () -> backup);
        assertEquals(StreamSwitch.Outcome.ON_BACKUP, s.lastOutcome());

        s.choose(live(12470), () -> backup);
        assertEquals(StreamSwitch.Outcome.BACK_TO_ORIGINAL, s.lastOutcome());
        s.choose(fixture("preroll-start.m3u8"), () -> backup);
        assertEquals("the next ad break counts again", StreamSwitch.Outcome.SWITCHED_TO_BACKUP, s.lastOutcome());
    }
}
