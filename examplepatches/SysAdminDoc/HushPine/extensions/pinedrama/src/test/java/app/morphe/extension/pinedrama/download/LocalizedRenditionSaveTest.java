/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.download;

import static org.junit.Assert.*;

import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.os.Looper;
import app.morphe.extension.pinedrama.SettingsContextRule;
import app.morphe.extension.pinedrama.settings.Settings;
import app.morphe.extension.pinedrama.settings.SettingsStatus;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowMediaExtractor;
import org.robolectric.shadows.util.DataSource;
import org.robolectric.util.ReflectionHelpers;

/**
 * #10, a whole save of a drama whose taller renditions are a copy cut for the app's language: the
 * dub is mixed into that copy, and PineDrama's download file keeps the original sound. The saved
 * video has the taller picture and the original sound, whichever way it's asked for.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, shadows = {LocalizedRenditionSaveTest.TaggedExtractor.class, TrackMuxerTest.RecordingMuxer.class})
public class LocalizedRenditionSaveTest {
    private static final String RENDITION_URL = "https://v16.tiktokcdn.com/localized/1080";
    private static final String ORIGINAL_URL = "https://v16.tiktokcdn.com/original/540";
    private static final byte[] RENDITION_PICTURE = filled('P', 11), RENDITION_SOUND = filled('d', 3);
    private static final byte[] ORIGINAL_PICTURE = filled('Q', 11), ORIGINAL_SOUND = filled('o', 3);

    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private final Set<String> ownIds = new HashSet<>();
    private final List<File> published = new ArrayList<>();
    private final List<String> asked = Collections.synchronizedList(new ArrayList<>());
    private boolean previousAdvanced;

    @Before public void setUp() throws Exception {
        drainPool();
        previousAdvanced = SettingsStatus.advancedDownloadsEnabled;
        SettingsStatus.advancedDownloadsEnabled = false;
        TrackMuxerTest.SampleExtractor.useDefaultAudio();
        TrackMuxerTest.RecordingMuxer.resetRecording();
        Settings.DOWNLOAD_VIDEO_QUALITY.resetToDefault();
        Settings.DOWNLOAD_WITHOUT_SOUND.save(false);
        Settings.REMOVE_DOWNLOAD_WATERMARK.save(true);
        Settings.DOWNLOAD_DETAILS.save(false);
        Settings.DOWNLOAD_TAGS.save(false);
        Settings.DOWNLOAD_BURN_CAPTION.save(false);
        Settings.CHECK_SAVED_VIDEOS.save(false);
        Settings.DOWNLOAD_PROGRESS.save(false);
        Settings.DOWNLOAD_WATERMARK_FALLBACK.save(false);
        Shadows.shadowOf(RuntimeEnvironment.getApplication())
                .grantPermissions(android.Manifest.permission.WRITE_EXTERNAL_STORAGE);
        RemoteMedia.transportForTests = MediaTransportFixtures.publicClient(url -> {
            asked.add(url.toString());
            byte[] body = url.toString().equals(RENDITION_URL) ? file(TaggedExtractor.RENDITION)
                    : url.toString().equals(ORIGINAL_URL) ? file(TaggedExtractor.ORIGINAL) : null;
            return MediaTransportFixtures.response(url, body != null ? 200 : 404, body != null ? body : new byte[0]);
        });
    }

    @After public void tearDown() throws Exception {
        try {
            drainPool();
        } finally {
            RemoteMedia.transportForTests = null;
            for (File file : published) file.delete();
            videoIds().removeAll(ownIds);
            Settings.DOWNLOAD_VIDEO_QUALITY.resetToDefault();
            Settings.DOWNLOAD_WITHOUT_SOUND.resetToDefault();
            Settings.REMOVE_DOWNLOAD_WATERMARK.resetToDefault();
            SettingsStatus.advancedDownloadsEnabled = previousAdvanced;
        }
    }

    @Test public void anAutomaticSaveHasTheTallerPictureAndTheOriginalSound() throws Exception {
        save(localized("automatic"));
        assertEquals("the sound comes from PineDrama's file", List.of(RENDITION_URL, ORIGINAL_URL), asked);
        assertArrayEquals("the taller picture", RENDITION_PICTURE, track(0));
        assertArrayEquals("the original sound, not the dub", ORIGINAL_SOUND, track(1));
    }

    @Test public void aChosenQualityDoesToo() throws Exception {
        Settings.DOWNLOAD_VIDEO_QUALITY.save("1080");
        save(localized("chosen"));
        assertArrayEquals(RENDITION_PICTURE, track(0));
        assertArrayEquals(ORIGINAL_SOUND, track(1));
    }

    @Test public void aSaveWithoutSoundLeavesTheDubOut() throws Exception {
        Settings.DOWNLOAD_WITHOUT_SOUND.save(true);
        save(localized("muted"));
        assertEquals("no sound is wanted", List.of(RENDITION_URL), asked);
        assertArrayEquals(RENDITION_PICTURE, track(0));
        assertEquals("the file has no sound track", 0, track(1).length);
    }

    @Test public void aRenditionOfPineDramasOwnFileIsSavedAsItCame() throws Exception {
        AdvancedDownloadsTest.VideoData video = new AdvancedDownloadsTest.VideoData(List.of(
                new AdvancedDownloadsTest.Gear("adapt_lowest_1080_1", 900, RENDITION_URL).uri("v15044gf0000same")));
        video.downloadNoWatermarkAddr = new AdvancedDownloadsTest.Address(ORIGINAL_URL, 10)
                .uri("v15044gf0000same").frame(540, 960);
        File saved = save(new PhotoConversionTest.VideoPost("ordinary", video));
        assertEquals(List.of(RENDITION_URL), asked);
        assertTrue("nothing was put together", TrackMuxerTest.RecordingMuxer.samples.isEmpty());
        assertArrayEquals(file(TaggedExtractor.RENDITION), Files.readAllBytes(saved.toPath()));
    }

    private PhotoConversionTest.VideoPost localized(String id) {
        AdvancedDownloadsTest.VideoData video = new AdvancedDownloadsTest.VideoData(List.of(
                new AdvancedDownloadsTest.Gear("lower_1080_1", 900, RENDITION_URL).uri("v1c836g5000cdubbed")));
        video.downloadNoWatermarkAddr = new AdvancedDownloadsTest.Address(ORIGINAL_URL, 10)
                .uri("v1c025g50000source").frame(540, 960);
        return new PhotoConversionTest.VideoPost(id, video);
    }

    private File save(PhotoConversionTest.VideoPost post) throws Exception {
        ownIds.add(post.getAid());
        File storage = android.os.Environment.getExternalStorageDirectory();
        Set<String> before = listed(storage);
        assertTrue(VideoDownloads.start(post, RuntimeEnvironment.getApplication()));
        drainPool();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Set<String> added = listed(storage);
        added.removeAll(before);
        assertEquals("one file reaches the gallery: " + added, 1, added.size());
        File saved = new File(added.iterator().next());
        published.add(saved);
        return saved;
    }

    /** Everything written to one track of the saved file. */
    private static byte[] track(int index) {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (TrackMuxerTest.Sample sample : TrackMuxerTest.RecordingMuxer.samples) {
            if (sample.track == index) bytes.write(sample.payload, 0, sample.payload.length);
        }
        return bytes.toByteArray();
    }

    /** A file the fetch accepts as an MP4, with the name of what it holds after the header. */
    private static byte[] file(String tag) {
        byte[] header = {0, 0, 0, 24, 'f', 't', 'y', 'p', 'i', 's', 'o', 'm', 0, 0, 2, 0};
        byte[] name = tag.getBytes(StandardCharsets.US_ASCII);
        byte[] whole = Arrays.copyOf(header, header.length + name.length);
        System.arraycopy(name, 0, whole, header.length, name.length);
        return whole;
    }

    private static byte[] filled(char value, int count) {
        byte[] bytes = new byte[count];
        Arrays.fill(bytes, (byte) value);
        return bytes;
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

    /** Opens a fetched file as what it says it is: both of them hold a picture and a sound. */
    @Implements(MediaExtractor.class)
    public static class TaggedExtractor extends TrackMuxerTest.SampleExtractor {
        static final String RENDITION = "rendition", ORIGINAL = "original";

        @Implementation @Override protected void setDataSource(String path) {
            String text;
            try {
                text = new String(Files.readAllBytes(new File(path).toPath()), StandardCharsets.US_ASCII);
            } catch (IOException exception) {
                throw new IllegalStateException(exception);
            }
            boolean rendition = text.endsWith(RENDITION);
            DataSource source = DataSource.toDataSource(path);
            ShadowMediaExtractor.addTrack(source, MediaFormat.createVideoFormat("video/avc", 1080, 1920),
                    rendition ? RENDITION_PICTURE : ORIGINAL_PICTURE);
            ShadowMediaExtractor.addTrack(source, MediaFormat.createAudioFormat("audio/mp4a-latm", 44_100, 2),
                    rendition ? RENDITION_SOUND : ORIGINAL_SOUND);
            super.setDataSource(path);
        }
    }
}
