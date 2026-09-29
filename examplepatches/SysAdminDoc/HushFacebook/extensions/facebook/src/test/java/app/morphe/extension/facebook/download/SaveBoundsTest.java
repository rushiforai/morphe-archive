/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.provider.MediaStore;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;

import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.settings.BaseSettings;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * What a save may hold: a manifest is kept and read only up to a size and a track count, it's read
 * on the save's own thread, and the work files of every running save together keep to the free
 * space, which cleanup of old work files can't take back from a save still running.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class SaveBoundsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final byte[] MP4_HEAD = {
        0, 0, 0, 0x18, 'f', 't', 'y', 'p', 'm', 'p', '4', '2',
        0, 0, 0, 0, 'm', 'p', '4', '2', 'i', 's', 'o', 'm',
    };

    private static final String HD = "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/clip_720p.mp4?oh=1&oe=2";

    private final CountDownLatch release = new CountDownLatch(1);
    private LocalServer server;
    private LocalServer second;
    private MediaUrlPolicy policy;
    private Context context;
    private MediaSaveTest.Gallery gallery;

    @Before
    public void setUp() throws IOException {
        server = new LocalServer();
        second = new LocalServer();
        int port = server.port();
        int secondPort = second.port();
        policy = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") }) {
            @Override
            Refusal refusal(URL url) {
                if (url.getHost().equals("127.0.0.1") && (url.getPort() == port || url.getPort() == secondPort)) return null;
                return super.refusal(url);
            }
        };
        context = RuntimeEnvironment.getApplication();
        gallery = Robolectric.setupContentProvider(MediaSaveTest.Gallery.class, MediaStore.AUTHORITY);
        for (long row = 1; row <= 4; row++) {
            Shadows.shadowOf(context.getContentResolver()).registerOutputStream(gallery.videoUri(row),
                    new ByteArrayOutputStream());
        }
        LogBufferManager.clearLogBuffer();
    }

    @After
    public void tearDown() throws IOException {
        release.countDown();
        server.close();
        second.close();
        DashSave.usableForTests = null;
        MediaDownload.policyForTests = null;
        BaseSettings.DEBUG.resetToDefault();
        LogBufferManager.clearLogBuffer();
    }

    private static String manifest(String representations) {
        return "<MPD><Period><AdaptationSet mimeType=\"video/mp4\">" + representations
                + "</AdaptationSet></Period></MPD>";
    }

    private static String representation(int n) {
        return "<Representation codecs=\"avc1.64001f\" width=\"720\" height=\"1280\" bandwidth=\"" + (400_000 + n)
                + "\"><BaseURL>https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/v" + n + ".mp4?oh=1&amp;oe=2</BaseURL>"
                + "</Representation>";
    }

    private static String captured() throws IOException {
        try (InputStream in = SaveBoundsTest.class.getResourceAsStream("meta-public-dash.mpd")) {
            assertNotNull(in);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int read; (read = in.read(buffer)) > 0; ) bytes.write(buffer, 0, read);
            return new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        }
    }

    /** [manifest] padded past [length] characters with a comment, which changes none of its tracks. */
    private static String padded(String manifest, int length) {
        StringBuilder text = new StringBuilder(manifest).append("<!--");
        while (text.length() < length) text.append("padding ");
        return text.append("-->").toString();
    }

    @Test
    public void aManifestOverTheLimitsIsNotRead() throws IOException {
        String normal = captured();
        assertEquals("the captured 580 manifest", 9, DashManifest.parse(normal).size());

        assertTrue(DashManifest.parse(padded(normal, 128 * 1024 + 1)).isEmpty());

        StringBuilder many = new StringBuilder();
        for (int n = 0; n < 64; n++) many.append(representation(n));
        assertEquals(64, DashManifest.parse(manifest(many.toString())).size());
        many.append(representation(64));
        assertTrue("65 tracks were read", DashManifest.parse(manifest(many.toString())).isEmpty());

        // Every unclosed group used to be scanned to the end of the text: quadratic in its length.
        StringBuilder unclosed = new StringBuilder("<MPD>");
        while (unclosed.length() < 120 * 1024) unclosed.append("<AdaptationSet>");
        long started = System.nanoTime();
        assertTrue(DashManifest.parse(unclosed.toString()).isEmpty());
        long tookMs = (System.nanoTime() - started) / 1_000_000;
        assertTrue("an unclosed manifest took " + tookMs + " ms", tookMs < 1_000);
    }

    @Test
    public void aManifestOverTheLimitsIsNotKept() {
        String id = "500000000000" + System.nanoTime() % 1000;
        String big = padded(manifest(representation(1)), 128 * 1024 + 1);
        PlayerSources.remember(new PlayerSourcesForTests.Params(id, new PlayerSourcesForTests.HdSource(HD, big)),
                "videoId", "hd", "manifest");

        PlayerSources.Source kept = PlayerSources.byId(id);
        assertNotNull("the player's single file went too", kept);
        assertEquals(HD, kept.hdUrl);
        assertNull("an oversized manifest was kept", kept.manifest);
    }

    private static void waitForSaves() throws InterruptedException {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (MediaDownload.savesInFlight() > 0) {
            assertTrue("a save never finished", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
    }

    /** The report line holding [part]. */
    private static String line(String report, String part) {
        int at = report.indexOf(part);
        assertTrue(report, at >= 0);
        return report.substring(report.lastIndexOf('\n', at) + 1, report.indexOf('\n', at));
    }

    /** A reel's tap used to read its whole manifest on the thread that draws Facebook. */
    @Test
    public void theManifestIsReadOnTheSavesOwnThread() throws Exception {
        BaseSettings.DEBUG.save(true);
        // Every Meta name answers a private address here, so the save is refused before it connects.
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });

        assertTrue(MediaDownload.saveVideo(context, new CompatibleSaveTest.ReelSource(HD, null,
                manifest(representation(1) + representation(2))), "hd", "sd", "manifest"));
        waitForSaves();

        String read = line(LogBufferManager.buildExportText(), "the manifest of the reel offers 2 track(s)");
        assertTrue(read, read.contains("| hushfacebook-save |"));
    }

    /** An oversized manifest leaves the save to the single file Facebook's player named. */
    @Test
    public void anOversizedManifestSavesTheSingleFile() throws Exception {
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> new InetAddress[] { InetAddress.getByName("10.9.8.7") });
        String big = padded(manifest(representation(1)), 128 * 1024 + 1);

        assertTrue(MediaDownload.saveVideo(context, new CompatibleSaveTest.ReelSource(HD, null, big), "hd", "sd",
                "manifest"));
        waitForSaves();

        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("the manifest of the reel is over the limits a save reads ("
                + big.length() + " characters), saving the single file"));
        assertTrue(report, report.contains("saving video mp4 (720p) from 1 candidate(s)"));
        assertFalse(report, report.contains("from its DASH manifest"));
    }

    private File folder() {
        return DashSave.workFolder(context);
    }

    private long workBytes() {
        long total = 0;
        File[] files = folder().listFiles();
        if (files != null) for (File file : files) total += file.length();
        return total;
    }

    /** The free space is [base] less what the work folder holds, as it would be on a phone. */
    private void freeSpace(long base) {
        DashSave.usableForTests = () -> DashSave.KEEP_FREE + base - workBytes();
    }

    private Downloader.Result saveFile(String url) {
        return MediaDownload.fileJob(context, url, Downloader.Kind.VIDEO).run(new MediaStoreWriter(context, true),
                Downloader.SILENT);
    }

    private Downloader.Result saveDash(DashManifest.Track video, DashManifest.Track audio) {
        return MediaDownload.dashJob(context, video, audio, null).run(new MediaStoreWriter(context, true),
                Downloader.SILENT);
    }

    @Test
    public void aFileLargerThanTheFreeSpaceIsRefused() {
        MediaDownload.policyForTests = policy;
        freeSpace(100_000);
        server.serveGenerated("/big.mp4", "video/mp4", MP4_HEAD, 200_000, Long.MAX_VALUE, null);

        Downloader.Result result = saveFile(server.origin() + "/big.mp4");

        assertEquals(result.toString(), Downloader.Status.WRITE_ERROR, result.status);
        assertTrue(result.toString(), result.reason.startsWith("not enough free space"));
        assertEquals(0, gallery.inserts.size());
        assertEquals(0, workBytes());
    }

    /**
     * Two saves at once share the free space. The first still has 134,440 bytes to come, so the
     * second, 150,000 bytes, doesn't fit in the 300,000 until the first is done.
     */
    @Test
    public void runningSavesShareTheFreeSpace() throws Exception {
        MediaDownload.policyForTests = policy;
        freeSpace(300_000);
        server.serveHeld("/first.mp4", "video/mp4", MP4_HEAD, 200_000, 40_000, release);
        second.serveGenerated("/second.mp4", "video/mp4", MP4_HEAD, 150_000, Long.MAX_VALUE, null);

        AtomicReference<Downloader.Result> first = new AtomicReference<>();
        Thread running = new Thread(() -> first.set(saveFile(server.origin() + "/first.mp4")));
        running.start();
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (workBytes() < 65_000) {
            assertTrue("the first save never started", System.nanoTime() < deadline);
            Thread.sleep(10);
        }

        Downloader.Result result = saveFile(second.origin() + "/second.mp4");
        assertEquals(result.toString(), Downloader.Status.WRITE_ERROR, result.status);
        assertTrue(result.toString(), result.reason.startsWith("not enough free space"));

        release.countDown();
        running.join(20_000);
        assertEquals(String.valueOf(first.get()), Downloader.Status.OK, first.get().status);
        result = saveFile(second.origin() + "/second.mp4");
        assertEquals("the space the first save used came back: " + result, Downloader.Status.OK, result.status);
    }

    /**
     * A track sent with no length claims the whole cap while it arrives. Once it's in, it claims
     * what it holds, so the join after it isn't refused for space the track never used. Nothing
     * describes the tracks to Robolectric's extractor, so getting as far as the join is the pass.
     */
    @Test
    public void aTrackSentWithNoLengthClaimsOnlyWhatItHoldsOnceItsIn() {
        MediaDownload.policyForTests = policy;
        freeSpace(3 * 1024 * 1024);
        byte[] picture = new byte[50_000];
        System.arraycopy(MP4_HEAD, 0, picture, 0, MP4_HEAD.length);
        server.serve("/v.mp4", 200, "video/mp4", picture, -1);
        DashManifest.Track video = new DashManifest.Track("video/mp4", "avc1.64001f", 1280, 720, 1_200_000,
                server.origin() + "/v.mp4");

        Downloader.Result result = saveDash(video, null);

        assertEquals("WRITE_ERROR (the tracks could not be joined)", result.toString());
        assertEquals(0, workBytes());
    }

    /**
     * A work file an hour old is left from a stopped save, and the next save removed it. A DASH save
     * whose sound took over an hour lost its picture that way.
     */
    @Test
    public void cleanupLeavesARunningSavesFilesAlone() throws Exception {
        MediaDownload.policyForTests = policy;
        byte[] picture = new byte[4_096];
        System.arraycopy(MP4_HEAD, 0, picture, 0, MP4_HEAD.length);
        server.serve("/v.mp4", 200, "video/mp4", picture, picture.length);
        second.serveHeld("/a.mp4", "audio/mp4", MP4_HEAD, 200_000, 40_000, release);
        DashManifest.Track video = new DashManifest.Track("video/mp4", "avc1.64001f", 1280, 720, 1_200_000,
                server.origin() + "/v.mp4");
        DashManifest.Track audio = new DashManifest.Track("audio/mp4", "mp4a.40.2", 0, 0, 128_000,
                second.origin() + "/a.mp4");
        File stale = new File(folder(), "video-left-behind.mp4");
        assertTrue(stale.createNewFile());
        long twoHoursAgo = System.currentTimeMillis() - 2 * 60 * 60 * 1000L;
        assertTrue(stale.setLastModified(twoHoursAgo));

        Thread running = new Thread(() -> saveDash(video, audio));
        running.start();
        File track = null;
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (track == null) {
            assertTrue("the sound track never started", System.nanoTime() < deadline);
            Thread.sleep(10);
            File[] files = folder().listFiles();
            boolean sound = false;
            File picked = null;
            for (File file : files == null ? new File[0] : files) {
                if (file.getName().startsWith("audio") && file.length() > 0) sound = true;
                if (file.getName().startsWith("video") && !file.getName().equals(stale.getName())) picked = file;
            }
            if (sound) track = picked;
        }
        assertTrue(track.setLastModified(twoHoursAgo));

        folder();

        assertFalse("an old file no save owns was kept", stale.exists());
        assertTrue("a running save's picture was removed", track.exists());
        release.countDown();
        running.join(20_000);
    }
}
