/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.Test;

/**
 * The original picture of a photo Story with music, found on the media model the card caches by
 * what it holds: a video and the photo it was made from, on a card whose node holds the tree
 * Facebook's own card kind asks for before it calls a Story made from a photo. A video Story with a
 * cover photo (an Instagram cross-post), a video Story's thumbnail, a video Story with no photo, a
 * plain photo Story, a card with no media cached and a released media tree give nothing.
 */
public class StoryPhotoTest {
    private static final String VIDEO = "https://video.xx.fbcdn.net/v/t42/story_photo_to_video.mp4";
    private static final String PHOTO = "https://scontent.xx.fbcdn.net/v/t39/story_photo_original.jpg";
    private static final String THUMBNAIL = "https://scontent.xx.fbcdn.net/v/t15/story_video_thumbnail.jpg";

    /** A story card as 582's RegularStoryCard holds its trees: its story, then its media once getMedia ran. */
    static final class Card {
        final TreeJNI story;
        final TreeJNI media;
        final String id = "1234567890";

        Card(TreeJNI story, TreeJNI media) {
            this.story = story;
            this.media = media;
        }
    }

    /** A story node Facebook would call made from a photo: it holds the tree its card kind asks for. */
    private static TreeJNI story() {
        return crossPost().with(StoryPhoto.MADE_FROM_PHOTO, new TreeJNI());
    }

    /** A story node without that tree, as the emulator's Instagram cross-posted video Stories came. */
    private static TreeJNI crossPost() {
        return new TreeJNI().with("creation_time", 1_756_728_000L);
    }

    private static TreeJNI image(String uri) {
        return new TreeJNI().with("uri", uri);
    }

    /** The ids are the ones 582's media getters load (LX/39C, LX/193;->A0v, RegularStoryCard.getMedia). */
    @Test
    public void theFieldsAreReadByTheIdsFacebooksOwnGettersLoad() {
        assertEquals(0x319918f3, StoryPhoto.STORIES_PHOTO_URI);
        assertEquals(0x1c56c, StoryPhoto.URI);
        assertEquals(0x2cdc643e, VideoMenuItem.PLAYABLE_URL);
        // RegularStoryCard's card kind getter (582 A0p) reads this tree of its node before 2NB.A0H
        // may answer PHOTO_REVERT_P2V.
        assertEquals(0xaa18ee7f, StoryPhoto.MADE_FROM_PHOTO);
    }

    @Test
    public void aPhotoStoryWithMusicGivesTheOriginalPhoto() {
        TreeJNI media = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", image(PHOTO));
        assertEquals(PHOTO, StoryPhoto.originalOf(new Card(story(), media)));
    }

    @Test
    public void aVideoStoryWithACoverPhotoGivesNothing() {
        // 2026-10-14 on the 582 emulator: two Instagram cross-posted video Stories carried a
        // stories_photo_uri (a frame of the video) beside their video, with no Save photo meant.
        TreeJNI media = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", image(PHOTO));
        assertNull(StoryPhoto.originalOf(new Card(crossPost(), media)));
    }

    /** Save photo on more stories (#38): the node's mark isn't asked, the media's photo is. */
    @Test
    public void onMoreStoriesAnyVideoStoryWithAPhotoGivesIt() {
        TreeJNI media = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", image(PHOTO));
        assertEquals(PHOTO, PostDetails.string(StoryPhoto.photoOf(new Card(crossPost(), media), true), StoryPhoto.URI));
        assertEquals(PHOTO, PostDetails.string(StoryPhoto.photoOf(new Card(story(), media), true), StoryPhoto.URI));
        assertNull("off, the mark is still asked", StoryPhoto.photoOf(new Card(crossPost(), media), false));
        TreeJNI thumbnail = new TreeJNI().with("playable_url", VIDEO).with("stories_video_thumbnail", image(THUMBNAIL));
        assertNull(StoryPhoto.photoOf(new Card(crossPost(), thumbnail), true));
        assertNull(StoryPhoto.photoOf(new Card(crossPost(), new TreeJNI().with("stories_photo_uri", image(PHOTO))), true));
        assertNull(StoryPhoto.photoOf(new Card(crossPost(), new TreeJNI().with("playable_url", VIDEO)
                .with("stories_photo_uri", image(" "))), true));
    }

    @Test
    public void aVideoStorysThumbnailIsNotTakenForAPhoto() {
        TreeJNI media = new TreeJNI().with("playable_url", VIDEO).with("stories_video_thumbnail", image(THUMBNAIL));
        assertNull(StoryPhoto.originalOf(new Card(story(), media)));
    }

    @Test
    public void aVideoStoryGivesNothing() {
        assertNull(StoryPhoto.originalOf(new Card(story(), new TreeJNI().with("playable_url", VIDEO))));
    }

    @Test
    public void aPlainPhotoStoryGivesNothing() {
        // getMedia already carries this photo, and the save takes it from there.
        assertNull(StoryPhoto.originalOf(new Card(story(), new TreeJNI().with("stories_photo_uri", image(PHOTO)))));
    }

    @Test
    public void aPhotoWithNoAddressGivesNothing() {
        TreeJNI blank = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", image(" "));
        assertNull(StoryPhoto.originalOf(new Card(story(), blank)));
        TreeJNI none = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", new TreeJNI());
        assertNull(StoryPhoto.originalOf(new Card(story(), none)));
    }

    @Test
    public void aCardWithoutItsMediaGivesNothing() {
        assertNull(StoryPhoto.originalOf(new Card(story(), null)));
        assertNull(StoryPhoto.originalOf(null));
        assertNull(StoryPhoto.originalOf("not a card"));
    }

    @Test
    public void aReleasedMediaTreeIsNeverRead() {
        TreeJNI media = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", image(PHOTO)).releasedTree();
        assertNull(StoryPhoto.originalOf(new Card(story(), media)));
        assertFalse(media.readAfterRelease);
    }

    @Test
    public void aReleasedPhotoChildIsNeverRead() {
        TreeJNI released = image(PHOTO).releasedTree();
        TreeJNI media = new TreeJNI().with("playable_url", VIDEO).with("stories_photo_uri", released);

        assertNull(StoryPhoto.originalOf(new Card(story(), media)));
        assertNull(StoryPhoto.photoOf(new Card(crossPost(), media), true));
        assertFalse("the live media's released photo was read", released.readAfterRelease);
    }
}
