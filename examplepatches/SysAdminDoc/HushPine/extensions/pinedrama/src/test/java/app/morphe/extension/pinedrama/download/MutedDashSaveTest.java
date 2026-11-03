/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.download;

import static org.junit.Assert.*;

import android.os.Environment;
import android.os.Looper;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

/**
 * A DASH video saved without sound is PineDrama's video stream itself: nothing puts tracks together
 * or copies one out, so the stream is published exactly as it arrived.
 *
 * <p>This runs the native branch on a controlled stream. Whether PineDrama hands a real post's
 * save a DASH gear at all is a separate question, answered only on a device.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class MutedDashSaveTest {
    /**
     * A DASH video stream in the shape PineDrama serves one: fragmented MP4 with a sidx, one H.264
     * track and no sound, 2.0 s, 64x36 turned 90 degrees by the track's display matrix.
     */
    private static final String STREAM = "download/dash-video-only-90.mp4";
    private static final String VIDEO_URL = "https://v16.tiktokcdn.com/dash/video-only";

    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private final Set<String> ownIds = new HashSet<>();
    private final List<File> published = new ArrayList<>();
    private String previousQuality;
    private boolean previousMute, previousDetails, previousTags, previousBurn, previousCheck,
            previousProgress, previousFallback, previousAdvanced;

    @Before public void setUp() throws Exception {
        drainPool();
        previousQuality = Settings.DOWNLOAD_VIDEO_QUALITY.savedValue();
        previousMute = Settings.DOWNLOAD_WITHOUT_SOUND.savedValue();
        previousDetails = Settings.DOWNLOAD_DETAILS.savedValue();
        previousTags = Settings.DOWNLOAD_TAGS.savedValue();
        previousBurn = Settings.DOWNLOAD_BURN_CAPTION.savedValue();
        previousCheck = Settings.CHECK_SAVED_VIDEOS.savedValue();
        previousProgress = Settings.DOWNLOAD_PROGRESS.savedValue();
        previousFallback = Settings.DOWNLOAD_WATERMARK_FALLBACK.savedValue();
        previousAdvanced = SettingsStatus.advancedDownloadsEnabled;
        Shadows.shadowOf(RuntimeEnvironment.getApplication())
                .grantPermissions(android.Manifest.permission.WRITE_EXTERNAL_STORAGE);
    }

    @After public void tearDown() throws Exception {
        try {
            drainPool();
        } finally {
            RemoteMedia.transportForTests = null;
            for (File file : published) file.delete();
            videoIds().removeAll(ownIds);
            Settings.DOWNLOAD_VIDEO_QUALITY.save(previousQuality);
            Settings.DOWNLOAD_WITHOUT_SOUND.save(previousMute);
            Settings.DOWNLOAD_DETAILS.save(previousDetails);
            Settings.DOWNLOAD_TAGS.save(previousTags);
            Settings.DOWNLOAD_BURN_CAPTION.save(previousBurn);
            Settings.CHECK_SAVED_VIDEOS.save(previousCheck);
            Settings.DOWNLOAD_PROGRESS.save(previousProgress);
            Settings.DOWNLOAD_WATERMARK_FALLBACK.save(previousFallback);
            SettingsStatus.advancedDownloadsEnabled = previousAdvanced;
        }
    }

    @Test public void aMutedDashSaveIsTheServedVideoStreamAndLeavesNothingBehind() throws Exception {
        byte[] stream = resource(STREAM);
        List<String> asked = Collections.synchronizedList(new ArrayList<>());
        RemoteMedia.transportForTests = MediaTransportFixtures.publicClient(url -> {
            asked.add(url.toString());
            boolean video = url.toString().equals(VIDEO_URL);
            return MediaTransportFixtures.response(url, video ? 200 : 404, video ? stream : new byte[0]);
        });
        Settings.DOWNLOAD_VIDEO_QUALITY.save("highest");
        Settings.DOWNLOAD_WITHOUT_SOUND.save(true);
        Settings.DOWNLOAD_DETAILS.save(false);
        Settings.DOWNLOAD_TAGS.save(false);
        Settings.DOWNLOAD_BURN_CAPTION.save(false);
        Settings.CHECK_SAVED_VIDEOS.save(false);
        Settings.DOWNLOAD_PROGRESS.save(false);
        Settings.DOWNLOAD_WATERMARK_FALLBACK.save(false);
        // Mute keeps the sound out of the video. No sound file is wanted beside it either, so
        // nothing has a reason to fetch the sound stream.
        SettingsStatus.advancedDownloadsEnabled = false;

        AdvancedDownloadsTest.VideoData video = new AdvancedDownloadsTest.VideoData(List.of(
                new AdvancedDownloadsTest.Gear("normal_1080_0", 900, VIDEO_URL)));
        video.dash = true;
        video.bitRateAudio = List.of(new AdvancedDownloadsTest.Audio("dash-sound", 128));
        PhotoConversionTest.VideoPost post = new PhotoConversionTest.VideoPost("muted-dash-1", video);
        ownIds.add(post.getAid());

        File storage = Environment.getExternalStorageDirectory();
        Set<String> before = listed(storage);
        assertTrue("a muted DASH save is HushPine's", VideoDownloads.start(post, RuntimeEnvironment.getApplication()));
        drainPool();
        Shadows.shadowOf(Looper.getMainLooper()).idle();

        assertEquals("only the picture stream is fetched", List.of(VIDEO_URL), asked);
        Set<String> added = listed(storage);
        added.removeAll(before);
        assertEquals("one file reaches the gallery: " + added, 1, added.size());
        File saved = new File(added.iterator().next());
        published.add(saved);
        assertTrue(saved.getName().endsWith(".mp4"));
        byte[] output = Files.readAllBytes(saved.toPath());
        // Nothing rewrote the container, so the saved file is the served stream byte for byte.
        assertArrayEquals(stream, output);
        Mp4Facts facts = Mp4Facts.read(output);
        assertEquals("one picture track and no sound track", List.of("vide"), facts.handlers);
        assertArrayEquals("still turned 90 degrees",
                new int[]{0, 65536, 0, -65536, 0, 0, 0, 0, 1 << 30}, facts.matrix);
        // An empty-moov stream carries its length in the segment index, not in mvhd.
        assertEquals("still 2.0 s long", 2000, facts.indexedTicks * 1000 / facts.indexTimescale);
        assertFalse("nothing holds the video afterwards", VideoDownloads.saving(post.getAid()));
        File[] left = MediaCache.cacheDirectory(RuntimeEnvironment.getApplication())
                .listFiles((dir, name) -> name.startsWith("selected-video-"));
        assertEquals("the downloaded stream is not left in the cache", 0, left == null ? 0 : left.length);
    }

    /** What an MP4 says about itself: its tracks' handlers, the picture matrix and the indexed length. */
    private static final class Mp4Facts {
        final List<String> handlers = new ArrayList<>();
        int[] matrix;
        long indexedTicks, indexTimescale;

        static Mp4Facts read(byte[] file) {
            Mp4Facts facts = new Mp4Facts();
            facts.walk(ByteBuffer.wrap(file), 0, file.length);
            return facts;
        }

        private void walk(ByteBuffer bytes, int at, int end) {
            while (at + 8 <= end) {
                int size = bytes.getInt(at);
                assertTrue("box sizes stay inside their parent", size >= 8 && at + size <= end);
                String kind = new String(bytes.array(), at + 4, 4, StandardCharsets.US_ASCII);
                int body = at + 8;
                switch (kind) {
                    case "moov": case "trak": case "mdia":
                        walk(bytes, body, at + size);
                        break;
                    case "hdlr":
                        handlers.add(new String(bytes.array(), body + 8, 4, StandardCharsets.US_ASCII));
                        break;
                    case "tkhd":
                        int matrixAt = body + (bytes.get(body) == 0 ? 40 : 52);
                        matrix = new int[9];
                        for (int i = 0; i < 9; i++) matrix[i] = bytes.getInt(matrixAt + 4 * i);
                        break;
                    case "sidx":
                        indexTimescale = bytes.getInt(body + 8) & 0xFFFFFFFFL;
                        int refsAt = body + 12 + (bytes.get(body) == 0 ? 8 : 16);
                        int refs = bytes.getShort(refsAt + 2) & 0xFFFF;
                        for (int i = 0; i < refs; i++) {
                            indexedTicks += bytes.getInt(refsAt + 8 + 12 * i) & 0xFFFFFFFFL;
                        }
                        break;
                    default:
                        break;
                }
                at += size;
            }
        }
    }

    private static byte[] resource(String name) throws IOException {
        try (InputStream input = MutedDashSaveTest.class.getClassLoader().getResourceAsStream(name)) {
            assertNotNull(name, input);
            return input.readAllBytes();
        }
    }

    private static Set<String> listed(File root) {
        Set<String> paths = new HashSet<>();
        File[] children = root.listFiles();
        if (children == null) return paths;
        for (File child : children) {
            if (child.isDirectory()) paths.addAll(listed(child));
            else paths.add(child.getAbsolutePath());
        }
        return paths;
    }

    private static void drainPool() throws Exception {
        for (int wait = 0; wait < 500; wait++) {
            if (MediaJobScheduler.idle()) return;
            Thread.sleep(10);
        }
        throw new IllegalStateException("The media pool never emptied");
    }

    private static Set<String> videoIds() { return ReflectionHelpers.getStaticField(VideoDownloads.class, "ACTIVE"); }
}
