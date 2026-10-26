package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;

/** The reel a story reshares is read from the overlay 584 keeps it in (#207). */
public class StoryOverlayVideoTest {
    private static final String STILL = "https://scontent-iad3-1.xx.fbcdn.net/v/t39.30808-6/reel_first_frame.jpg?_nc_cat=1&oe=66F0A1B2";
    private static final String CLIP = "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/reel_360p.mp4?_nc_cat=1&oe=66F0A1B2";
    private static final String MANIFEST = "<MPD><Period><AdaptationSet mimeType=\"video/mp4\">"
            + "<Representation codecs=\"avc1.64001f\" width=\"1080\" height=\"1920\" bandwidth=\"4028000\">"
            + "<BaseURL>https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/reel_1080p.mp4</BaseURL>"
            + "</Representation></AdaptationSet></Period></MPD>";

    /** A story card as 584's RegularStoryCard holds its story tree. */
    static final class Card {
        final TreeJNI story;

        Card(TreeJNI story) {
            this.story = story;
        }
    }

    /** The still the story's own attachment holds: the reel's first frame. */
    private static TreeJNI stillAttachment() {
        return new TreeJNI().with("media", new TreeJNI().with("stories_photo_uri", new TreeJNI().with("uri", STILL)));
    }

    /** The reshared reel sticker as the diagnostic of #207 showed it, the manifest in both places. */
    private static TreeJNI reelSticker(String manifest, String url) {
        TreeJNI video = new TreeJNI().with("playlist", manifest).with("id", "7788990011223344");
        TreeJNI reel = new TreeJNI()
                .with("short_form_video_context", new TreeJNI().with("video", video))
                .with("attachments", Collections.singletonList(new TreeJNI().with("media",
                        new TreeJNI().with("playlist", manifest).with("playable_url", url).with("id", "7788990011223344"))));
        TreeJNI sticker = new TreeJNI().with("fb_shorts_story", reel);
        if (url != null) sticker.with("playable_url", url);
        return sticker;
    }

    private static TreeJNI story(TreeJNI... overlays) {
        return new TreeJNI().with("creation_time", 1_756_728_000L)
                .with("attachments", Collections.singletonList(stillAttachment()))
                .with("story_overlays", Arrays.asList(overlays));
    }

    @Test
    public void theFieldsAreReadByTheNamesTheTreeCarries() {
        assertEquals("story_overlays".hashCode(), StoryOverlayVideo.STORY_OVERLAYS);
        assertEquals("fb_shorts_story".hashCode(), StoryOverlayVideo.FB_SHORTS_STORY);
        assertEquals("playlist".hashCode(), StoryOverlayVideo.PLAYLIST);
    }

    @Test
    public void releasedVideoAndAttachmentMediaAreNotRead() {
        TreeJNI video = new TreeJNI().with("playlist", MANIFEST).releasedTree();
        TreeJNI media = new TreeJNI().with("playlist", MANIFEST).with("playable_url", CLIP).releasedTree();
        TreeJNI reel = new TreeJNI()
                .with("short_form_video_context", new TreeJNI().with("video", video))
                .with("attachments", Collections.singletonList(new TreeJNI().with("media", media)));
        assertNull(StoryOverlayVideo.in(new Card(story(new TreeJNI().with("fb_shorts_story", reel)))));
        assertFalse(video.readAfterRelease);
        assertFalse(media.readAfterRelease);
    }

    @Test
    public void aLiveOverlayAddressStillWorksWhenItsNestedVideoWasReleased() {
        TreeJNI video = new TreeJNI().with("playlist", MANIFEST).releasedTree();
        TreeJNI reel = new TreeJNI().with("short_form_video_context", new TreeJNI().with("video", video));
        StoryOverlayVideo found = StoryOverlayVideo.in(new Card(story(new TreeJNI()
                .with("fb_shorts_story", reel).with("playable_url", CLIP))));
        assertNotNull(found);
        assertEquals(CLIP, found.url);
        assertFalse(video.readAfterRelease);
    }

    @Test
    public void aResharedReelGivesItsManifestAddressAndId() {
        StoryOverlayVideo found = StoryOverlayVideo.in(new Card(story(reelSticker(MANIFEST, CLIP))));
        assertNotNull(found);
        assertEquals(MANIFEST, found.manifest);
        assertEquals(CLIP, found.url);
        assertEquals("7788990011223344", found.videoId);
    }

    @Test
    public void aStickerWithOnlyAnAddressStillCounts() {
        TreeJNI sticker = new TreeJNI().with("playable_url", CLIP).with("fb_shorts_story", new TreeJNI());
        StoryOverlayVideo found = StoryOverlayVideo.in(new Card(story(sticker)));
        assertNotNull(found);
        assertNull(found.manifest);
        assertEquals(CLIP, found.url);
        assertNull(found.videoId);
    }

    @Test
    public void theReelsOwnAttachmentStandsInWhenTheContextHasNoPlaylist() {
        TreeJNI reel = new TreeJNI().with("attachments", Collections.singletonList(new TreeJNI().with("media",
                new TreeJNI().with("playlist", MANIFEST).with("playable_url", CLIP).with("id", "1122334455667788"))));
        StoryOverlayVideo found = StoryOverlayVideo.in(new Card(story(new TreeJNI().with("fb_shorts_story", reel))));
        assertNotNull(found);
        assertEquals(MANIFEST, found.manifest);
        assertEquals(CLIP, found.url);
        assertEquals("1122334455667788", found.videoId);
    }

    @Test
    public void aPlainStoryAndOtherStickersGiveNothing() {
        assertNull("no overlays", StoryOverlayVideo.in(new Card(story())));
        TreeJNI mention = new TreeJNI().with("mention_user_id", "1234567890");
        assertNull("a sticker that isn't a reel", StoryOverlayVideo.in(new Card(story(mention))));
        TreeJNI mpd = new TreeJNI().with("fb_shorts_story", new TreeJNI().with("short_form_video_context",
                new TreeJNI().with("video", new TreeJNI().with("playlist", "https://video.xx.fbcdn.net/manifest.mpd"))));
        assertNull("a playlist that isn't the manifest text", StoryOverlayVideo.in(new Card(story(mpd))));
        assertNull("a story Facebook released", StoryOverlayVideo.in(new Card(story(reelSticker(MANIFEST, CLIP)).releasedTree())));
        assertNull("no card", StoryOverlayVideo.in(null));
    }

    @Test
    public void theFirstReelWinsOverALaterOne() {
        String other = "https://video-iad3-1.xx.fbcdn.net/o1/v/t2/f2/m69/other_reel.mp4?_nc_cat=1&oe=66F0A1B2";
        StoryOverlayVideo found = StoryOverlayVideo.in(new Card(story(
                new TreeJNI().with("mention_user_id", "1234567890"),
                reelSticker(MANIFEST, CLIP),
                reelSticker(MANIFEST, other))));
        assertNotNull(found);
        assertEquals(CLIP, found.url);
    }
}
