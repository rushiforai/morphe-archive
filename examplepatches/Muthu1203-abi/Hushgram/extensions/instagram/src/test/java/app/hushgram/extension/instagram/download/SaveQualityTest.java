/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.hushgram.extension.instagram.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.settings.preference.LogBufferManager;

/**
 * A save held to the download quality, the way a video and an item of either kind start one: the
 * manifest's track and the single files are each picked for the setting, and the one that suits
 * it better is saved. Every save here starts for real and is refused before any socket opens, and
 * the report says which rendition it chose.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SaveQualityTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;

    private static final String HD = "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/clip_720p.mp4?oh=1&oe=2";
    private static final String SD = "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/clip_360p.mp4?oh=1&oe=2";

    /** Three H.264 tracks and a sound track. The 480p shares the 720p's frame size, as Meta's do. */
    private static final String MANIFEST = "<MPD><Period><AdaptationSet mimeType=\"video/mp4\">"
            + representation(1080, 1920, 3_000_000, "1080p", "t1080")
            + representation(720, 1280, 1_500_000, "720p", "t720")
            + representation(720, 1280, 700_000, "480p", "t480")
            + "</AdaptationSet><AdaptationSet mimeType=\"audio/mp4\">"
            + "<Representation codecs=\"mp4a.40.5\" bandwidth=\"64000\">"
            + "<BaseURL>https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/sound.mp4?oh=1&amp;oe=2</BaseURL>"
            + "</Representation></AdaptationSet></Period></MPD>";

    private static String representation(int width, int height, long bandwidth, String label, String name) {
        return "<Representation codecs=\"avc1.64001f\" width=\"" + width + "\" height=\"" + height
                + "\" bandwidth=\"" + bandwidth + "\" FBQualityLabel=\"" + label + "\">"
                + "<BaseURL>https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/" + name + ".mp4?oh=1&amp;oe=2</BaseURL>"
                + "</Representation>";
    }

    /** What a reel's player holds: its two single files and its manifest, any of them null. */
    static final class ReelSource {
        final String hd;
        final String sd;
        final String manifest;

        ReelSource(String hd, String sd, String manifest) {
            this.hd = hd;
            this.sd = sd;
            this.manifest = manifest;
        }

        /** The single files, as a caller hands them to a save. */
        List<MediaSave.Rendition> renditions() {
            return SavesForTests.renditions(hd, sd);
        }
    }

    @Before
    public void setUp() throws IOException {
        context = RuntimeEnvironment.getApplication();
        LogBufferManager.clearLogBuffer();
        // Every Meta name answers a private address, so each save is refused before it connects.
        MediaSave.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });
    }

    @After
    public void tearDown() throws InterruptedException {
        waitForSaves();
        MediaSave.policyForTests = null;
        Settings.DOWNLOAD_QUALITY.resetToDefault();
        LogBufferManager.clearLogBuffer();
    }

    private static void waitForSaves() throws InterruptedException {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (MediaSave.savesInFlight() > 0) {
            assertTrue("a save never finished", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
    }

    /** The report after one video save at [quality], from [source]. */
    private String reelSaveAt(DownloadQuality quality, ReelSource source) throws InterruptedException {
        Settings.DOWNLOAD_QUALITY.save(quality);
        LogBufferManager.clearLogBuffer();
        assertTrue(MediaSave.saveVideo(context, source.renditions(), source.manifest, null));
        waitForSaves();
        return LogBufferManager.buildExportText();
    }

    private static final String DASH_1080 = "from its DASH manifest: video/mp4 avc1.64001f 1080x1920 3000kbps 1080p";
    private static final String DASH_480 = "from its DASH manifest: video/mp4 avc1.64001f 720x1280 700kbps 480p";

    @Test
    public void theBestSavesWhatItAlwaysDid() throws Exception {
        assertSame("the setting doesn't start at the best", DownloadQuality.BEST, MediaSave.quality());
        String report = reelSaveAt(DownloadQuality.BEST, new ReelSource(HD, SD, MANIFEST));
        assertTrue(report, report.contains(DASH_1080));
        assertFalse(report, report.contains("quality setting"));
    }

    @Test
    public void aCeilingTakesTheTrackOrTheFileThatSuitsItBetter() throws Exception {
        ReelSource reel = new ReelSource(HD, SD, MANIFEST);

        String report = reelSaveAt(DownloadQuality.P1080, reel);
        assertTrue(report, report.contains(DASH_1080) && report.contains("quality setting 1080p"));

        // The manifest's 480p beats the single files' 360p under a 480 ceiling.
        report = reelSaveAt(DownloadQuality.P480, reel);
        assertTrue(report, report.contains(DASH_480 + " + audio/mp4 mp4a.40.5"));
        assertTrue(report, report.contains("instead of mp4 (360p), quality setting 480p"));

        // A tie goes to the single file: one fetch, no join.
        report = reelSaveAt(DownloadQuality.P720, reel);
        assertFalse(report, report.contains("DASH manifest"));
        assertTrue(report, report.contains("saving video mp4 (720p) from 2 candidate(s)"));
        assertTrue(report, report.contains("quality setting 720p"));

        // Nothing in the manifest fits 360, and the single 360p file does.
        report = reelSaveAt(DownloadQuality.P360, reel);
        assertFalse(report, report.contains("DASH manifest"));
        assertTrue(report, report.contains("saving video mp4 (360p) from 2 candidate(s)"));

        report = reelSaveAt(DownloadQuality.SMALLEST, reel);
        assertFalse(report, report.contains("DASH manifest"));
        assertTrue(report, report.contains("saving video mp4 (360p) from 2 candidate(s)"));
        assertTrue(report, report.contains("quality setting smallest"));
    }

    /** With nothing at or under the ceiling, the save takes the nearest above it and still starts. */
    @Test
    public void aCeilingWithNoMatchStillSaves() throws Exception {
        String report = reelSaveAt(DownloadQuality.P360, new ReelSource(null, null, MANIFEST));
        assertTrue(report, report.contains(DASH_480 + " + audio/mp4 mp4a.40.5 0x0 64kbps, instead of nothing"));

        report = reelSaveAt(DownloadQuality.P360, new ReelSource(HD, null, null));
        assertTrue(report, report.contains("saving video mp4 (720p) from 1 candidate(s)"));

        report = reelSaveAt(DownloadQuality.SMALLEST, new ReelSource(null, null, MANIFEST));
        assertTrue(report, report.contains(DASH_480));
    }

    /** An item of either kind, such as a story read by value, takes the same route. */
    @Test
    public void anItemIsHeldToTheSettingToo() throws Exception {
        String report = itemSaveAt(DownloadQuality.P480, SavesForTests.renditions(HD, SD), MANIFEST);
        assertTrue(report, report.contains("saving the item " + DASH_480));

        report = itemSaveAt(DownloadQuality.P360, SavesForTests.renditions(HD, SD), MANIFEST);
        assertTrue(report, report.contains("saving video mp4 (360p) from 2 candidate(s)"));
    }

    /** The report after one item save at [quality], from [renditions] and [manifest]. */
    private String itemSaveAt(DownloadQuality quality, List<MediaSave.Rendition> renditions, String manifest)
            throws InterruptedException {
        Settings.DOWNLOAD_QUALITY.save(quality);
        LogBufferManager.clearLogBuffer();
        assertTrue(MediaSave.saveItem(context, renditions, manifest, null));
        waitForSaves();
        return LogBufferManager.buildExportText();
    }

    /**
     * A story carries the manifest its player plays from beside its own 360p file, so the save
     * takes the player's best track and not that file.
     */
    @Test
    public void aStorySavesFromTheManifestItCarries() throws Exception {
        String report = itemSaveAt(DownloadQuality.BEST, SavesForTests.renditions(SD), MANIFEST);
        assertTrue(report, report.contains("saving the item " + DASH_1080
                + " + audio/mp4 mp4a.40.5 0x0 64kbps, instead of mp4 (360p)\n"));

        report = itemSaveAt(DownloadQuality.P480, SavesForTests.renditions(SD), MANIFEST);
        assertTrue(report, report.contains("saving the item " + DASH_480));

        // A photo story carries no manifest, and saves as it always did.
        report = itemSaveAt(DownloadQuality.BEST, SavesForTests.renditions(
                "https://scontent-iad3-1.xx.fbcdn.net/v/t51/photo_1080x1920.jpg?oh=1&oe=2"), null);
        assertTrue(report, report.contains("saving image jpg"));
        assertFalse(report, report.contains("manifest"));
    }

    /** Pictures in one format only, [codecs], which the player shows at 1080p, and AAC-LC sound. */
    private static String onlyIn(String codecs) {
        return "<MPD><Period><AdaptationSet mimeType=\"video/mp4\">"
            + "<Representation codecs=\"" + codecs + "\" width=\"1080\" height=\"1920\" bandwidth=\"2000000\" "
            + "FBQualityLabel=\"1080p\"><BaseURL>https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/only.mp4?oh=1&amp;oe=2"
            + "</BaseURL></Representation></AdaptationSet><AdaptationSet mimeType=\"audio/mp4\">"
            + "<Representation codecs=\"mp4a.40.2\" bandwidth=\"64000\">"
            + "<BaseURL>https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/sound.mp4?oh=1&amp;oe=2</BaseURL>"
            + "</Representation></AdaptationSet></Period></MPD>";
    }

    /**
     * A save that ends below the best picture the manifest offers within the quality setting says
     * so in the report, beside what it saved. Held to a lower setting, the same file isn't below it.
     * The picture here is AV1 on a phone with no AV1 decoder, which no save can keep.
     */
    @Test
    public void aStorySavedBelowWhatItsPlayerOffersSaysSo() throws Exception {
        Object av1Before = ReflectionHelpers.getStaticField(DashSave.class, "canWriteAv1");
        try {
            ReflectionHelpers.setStaticField(DashSave.class, "canWriteAv1", Boolean.FALSE);
            List<MediaSave.Rendition> card = SavesForTests.renditions(SD);
            String manifest = onlyIn("av01.0.08m.08");

            String report = itemSaveAt(DownloadQuality.BEST, card, manifest);
            assertTrue(report, report.contains("saving video mp4 (360p) from 1 candidate(s): mp4 (360p), below the "
                    + "manifest's video/mp4 av01.0.08m.08 1080x1920 2000kbps 1080p, the best it offers within the "
                    + "Download quality\n"));

            report = itemSaveAt(DownloadQuality.P360, card, manifest);
            assertTrue(report, report.contains("saving video mp4 (360p) from 1 candidate(s)"));
            assertFalse(report, report.contains("below the manifest's"));
        } finally {
            ReflectionHelpers.setStaticField(DashSave.class, "canWriteAv1", av1Before);
        }
    }

    /**
     * A suggested story that comes only in VP9 (1080x1920 down to 360x640 on the phone that found
     * it) saves its 1080p VP9 track with its sound, not the card's 360p H.264 file: the save writes
     * that MP4 itself, since Android's muxer won't. The report names no picture it fell short of.
     */
    @Test
    public void aVp9OnlyStorySavesFromItsManifest() throws Exception {
        String report = itemSaveAt(DownloadQuality.BEST, SavesForTests.renditions(SD), onlyIn("vp09.00.40.08"));
        assertTrue(report, report.contains("saving the item from its DASH manifest: video/mp4 vp09.00.40.08 "
                + "1080x1920 2000kbps 1080p + audio/mp4 mp4a.40.2 0x0 64kbps, instead of mp4 (360p)\n"));
    }

    /**
     * What a DASH save's own "lower" note weighs. {@link MediaSave#better} finds the manifest's
     * biggest offered picture regardless of whether the phone could ever write it, so the report can
     * always name it; {@link MediaSave#noticeablyLower} is the separate gate that decides whether
     * the person saving is bothered by it. A 720p save whose only bigger rendition is an AV1 track
     * the phone can't mux isn't told: 720 is what the phone would have saved either way. A 480p save
     * under the same manifest is, whatever wrote the bigger track.
     */
    @Test
    public void aWritableSaveIsNotToldOverAGapNothingCouldClose() {
        DashManifest.Track av1 = new DashManifest.Track("video/mp4", "av01.0.09m.08", 1920, 1080, 2_500_000,
                "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/av1.mp4?oh=1&oe=2", 1080);
        java.util.List<DashManifest.Track> offered = java.util.Collections.singletonList(av1);

        DashManifest.Track better = MediaSave.better(offered, 720, DownloadQuality.BEST);
        assertSame("the report still names the AV1 rendition, whether or not the phone can write it", av1, better);
        assertFalse("a 720p save is what the phone would have saved either way",
                MediaSave.noticeablyLower(720, better.shortSide()));

        better = MediaSave.better(offered, 480, DownloadQuality.BEST);
        assertSame(av1, better);
        assertTrue("a real gap is still worth telling, whatever wrote the bigger track",
                MediaSave.noticeablyLower(480, better.shortSide()));
    }

    /** The exact boundary {@link MediaSave#noticeablyLower} draws: below 720, or below two thirds of the best. */
    @Test
    public void noticeablyLowerDrawsTheLineAtTwoThirdsOr720() {
        assertFalse("720 of 1080 is exactly two thirds: not a gap worth a nag", MediaSave.noticeablyLower(720, 1080));
        assertTrue("719 is a hair under 720, so it's told", MediaSave.noticeablyLower(719, 1080));
        assertTrue("360 of 1080 is a real shortfall", MediaSave.noticeablyLower(360, 1080));
        assertFalse("nothing measured means nothing to compare", MediaSave.noticeablyLower(0, 1080));
        assertFalse("nothing bigger on offer means nothing to tell", MediaSave.noticeablyLower(720, 720));
        assertFalse("721 clears both the floor and two thirds of 1080", MediaSave.noticeablyLower(721, 1080));
    }

    /** Before the settings can be read, a save asks for the best, as every save did before. */
    @Test
    public void beforeTheSettingsAreReadyASaveAsksForTheBest() {
        Settings.DOWNLOAD_QUALITY.save(DownloadQuality.SMALLEST);
        assertSame(DownloadQuality.SMALLEST, MediaSave.quality());
        SettingsContextRule.withoutContext(() ->
                assertSame(DownloadQuality.BEST, MediaSave.quality()));
        // And a paused HushGram answers the default, the way every setting does.
        app.hushgram.extension.shared.settings.PauseForTests.pause(
                app.hushgram.extension.shared.settings.HushgramPause.Reason.SWITCH);
        try {
            assertSame(DownloadQuality.BEST, MediaSave.quality());
        } finally {
            app.hushgram.extension.shared.settings.PauseForTests.resume();
        }
        assertEquals(DownloadQuality.SMALLEST, Settings.DOWNLOAD_QUALITY.savedValue());
    }
}
