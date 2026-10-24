package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.PauseForTests;
import app.morphe.extension.shared.settings.preference.LogBufferManager;

/**
 * Save on a story that reshares a reel takes the reel's video (#207). The story's own media is a
 * still, the reel's first frame, and 584 keeps the reel in the story's overlays. Saves start
 * against private addresses, so none opens a socket; the hosts the save looked up say which
 * address it took, and the report says why.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class StoryOverlayVideoSaveTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String PHOTO_HOST = "scontent-iad3-2.xx.fbcdn.net";
    private static final String VIDEO_HOST = "video-iad3-1.xx.fbcdn.net";
    private static final String STILL = "https://" + PHOTO_HOST + "/v/t39.30808-6/reel_first_frame.jpg?_nc_cat=1&oe=66F0A1B2";
    private static final String CLIP = "https://" + VIDEO_HOST + "/o1/v/t2/f2/m69/reel_360p.mp4?_nc_cat=1&oe=66F0A1B2";
    private static final String MANIFEST = "<MPD><Period><AdaptationSet mimeType=\"video/mp4\">"
            + "<Representation codecs=\"avc1.64001f\" width=\"1080\" height=\"1920\" bandwidth=\"4028000\">"
            + "<BaseURL>https://" + VIDEO_HOST + "/o1/v/t2/f2/m69/reel_1080p.mp4</BaseURL>"
            + "</Representation></AdaptationSet></Period></MPD>";

    private final List<String> looked = Collections.synchronizedList(new ArrayList<>());
    private final List<PostDetails> saved = Collections.synchronizedList(new ArrayList<>());

    @Before
    public void setUp() {
        LogBufferManager.clearLogBuffer();
        MediaDownload.policyForTests = new MediaUrlPolicy(host -> {
            looked.add(host);
            return new InetAddress[] { InetAddress.getByName("10.9.8.7") };
        });
        MediaDownload.detailsForTests = saved::add;
    }

    @After
    public void tearDown() throws InterruptedException {
        settle();
        MediaDownload.policyForTests = null;
        MediaDownload.detailsForTests = null;
        PauseForTests.resume();
        Settings.DOWNLOAD_STORIES.resetToDefault();
        HookStatus.clear();
        LogBufferManager.clearLogBuffer();
    }

    private static void settle() throws InterruptedException {
        long deadline = System.nanoTime() + 20_000_000_000L;
        while (MediaDownload.savesInFlight() > 0) {
            assertTrue("a save never finished", System.nanoTime() < deadline);
            Thread.sleep(10);
        }
    }

    private static Context context() {
        return RuntimeEnvironment.getApplication();
    }

    /**
     * A story card as 584's RegularStoryCard holds one: its {@code getMedia()} answers the still
     * Facebook shows, its media model is that photo, and its story tree carries the overlays.
     */
    public static final class StillCard {
        final String id = "1234567890";
        final TreeJNI story;
        final TreeJNI media = new TreeJNI().with("stories_photo_uri", new TreeJNI().with("uri", STILL));
        private final Shown shown = new Shown();

        StillCard(TreeJNI... overlays) {
            story = new TreeJNI().with("creation_time", 1_756_728_000L)
                    .with("attachments", Collections.singletonList(new TreeJNI().with("media", media)))
                    .with("story_overlays", Arrays.asList(overlays));
        }

        public Shown getMedia() {
            return shown;
        }
    }

    /** What the card shows: the still, 675 by 1200, as the #207 diagnostic printed it. */
    public static final class Shown {
        final int width = 675;
        final int height = 1200;
        final String uri = STILL;
        final String id = "1234567890";
    }

    /** The reshared reel sticker, the manifest where the context keeps it and on the reel's own attachment. */
    private static TreeJNI reelSticker() {
        TreeJNI video = new TreeJNI().with("playlist", MANIFEST).with("id", "7788990011223344");
        TreeJNI reel = new TreeJNI()
                .with("short_form_video_context", new TreeJNI().with("video", video))
                .with("attachments", Collections.singletonList(new TreeJNI().with("media",
                        new TreeJNI().with("playlist", MANIFEST).with("playable_url", CLIP).with("id", "7788990011223344"))));
        return new TreeJNI().with("playable_url", CLIP).with("fb_shorts_story", reel);
    }

    @Test
    public void saveOnAResharedReelTakesTheReelsVideo() throws InterruptedException {
        assertTrue(MediaDownload.saveStory(context(), new StillCard(reelSticker()), new Object()));
        settle();

        assertEquals("one save went to the downloader", 1, saved.size());
        assertTrue("the save took the reel's video: " + looked, looked.contains(VIDEO_HOST));
        assertFalse("and not the still: " + looked, looked.contains(PHOTO_HOST));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("the story shows a reshared reel over a still, so the save takes the reel's video from its manifest"));
        assertTrue(report, report.contains("from its DASH manifest"));
        assertFalse("the report never names the still as the save", report.contains("saving image"));
    }

    @Test
    public void theSaveIsNamedAfterTheReel() throws InterruptedException {
        assertTrue(MediaDownload.saveStory(context(), new StillCard(reelSticker()), new Object()));
        settle();

        assertEquals(1, saved.size());
        assertEquals("7788990011223344", saved.get(0).videoId);
    }

    @Test
    public void aReelWithOnlyAnAddressSavesThatFile() throws InterruptedException {
        TreeJNI sticker = new TreeJNI().with("playable_url", CLIP).with("fb_shorts_story", new TreeJNI());
        assertTrue(MediaDownload.saveStory(context(), new StillCard(sticker), new Object()));
        settle();

        assertEquals(1, saved.size());
        assertTrue("the save took the reel's file: " + looked, looked.contains(VIDEO_HOST));
        assertFalse(looked.contains(PHOTO_HOST));
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("so the save takes the reel's video from its one file"));
    }

    @Test
    public void aStillWithNoReelSavesAsBefore() throws InterruptedException {
        TreeJNI mention = new TreeJNI().with("mention_user_id", "1234567890");
        assertTrue(MediaDownload.saveStory(context(), new StillCard(mention), new Object()));
        settle();

        assertEquals(1, saved.size());
        assertTrue("the still went: " + looked, looked.contains(PHOTO_HOST));
        assertFalse(looked.contains(VIDEO_HOST));
        assertFalse(LogBufferManager.buildExportText().contains("reshared reel"));
    }

    @Test
    public void theSwitchOffLeavesTheReelToFacebook() throws InterruptedException {
        Settings.DOWNLOAD_STORIES.save(false);
        assertFalse(MediaDownload.saveStory(context(), new StillCard(reelSticker()), new Object()));
        settle();
        assertEquals(0, saved.size());
        assertTrue(looked.isEmpty());
    }
}
