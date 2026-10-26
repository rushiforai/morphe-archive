/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import com.facebook.graphservice.tree.TreeJNI;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** Save GIF in a comment's long-press sheet (#226): which comments get the row, and what it saves. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CommentGifTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    // The shapes are a real GIPHY comment's, read on 584: the GIF through Meta's image proxy, which
    // re-encodes it, and next to it the still frame the comment list draws.
    private static final String GIF = "https://external-mia5-1.xx.fbcdn.net/emg1/v/t13/1234567890?url=https%3A%2F%2Fmedia4.giphy.com"
            + "%2Fmedia%2Fabc%2Fgiphy.gif&fb_obo=1&utld=giphy.com&stp=dst-gif_fr_q75&ccb=18-1&oh=06_Q3&oe=6ADE4856";
    private static final String STILL = "https://external-mia5-1.xx.fbcdn.net/emg1/v/t13/1234567890?url=https%3A%2F%2Fmedia4.giphy.com"
            + "%2Fmedia%2Fabc%2Fgiphy.gif&fb_obo=1&utld=giphy.com&stp=c0.5000x0.5000f_dst-jpg_p480x480_q75&ccb=13-1&oh=06_Q3&oe=6ADE4856";

    @After
    public void restore() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.DOWNLOAD_PHOTOS.resetToDefault();
    }

    private static TreeJNI gifAttachment(String uri) {
        return new TreeJNI().with("media", new TreeJNI("GenericAttachmentMedia")
                .with("image", new TreeJNI().with("uri", STILL))
                .with("animated_image", new TreeJNI().with("uri", uri)));
    }

    /** A photo comment: a Photo with no animated image, which Facebook's own Save photo covers. */
    private static TreeJNI photoAttachment() {
        return new TreeJNI().with("media", new TreeJNI("Photo").with("image", new TreeJNI().with("uri", STILL)));
    }

    private static TreeJNI comment(TreeJNI... attachments) {
        return new TreeJNI("Comment").with("attachments", Arrays.asList(attachments));
    }

    @Test
    public void aGifCommentGetsTheRowWithTheAnimatedFileNotTheStill() {
        Object click = CommentGif.clickFor(comment(gifAttachment(GIF)));
        assertNotNull(click);
        assertEquals(GIF, ((CommentGif) click).url);
        assertEquals("Save GIF", CommentGif.title());
    }

    @Test
    public void theFirstGifOfSeveralAttachmentsIsTheOne() {
        String second = GIF.replace("abc", "def");
        CommentGif row = (CommentGif) CommentGif.clickFor(comment(photoAttachment(), gifAttachment(second), gifAttachment(GIF)));
        assertNotNull(row);
        assertEquals(second, row.url);
    }

    @Test
    public void aReleasedAnimatedImageIsSkippedForTheNextLiveGif() {
        TreeJNI released = new TreeJNI().with("uri", GIF).releasedTree();
        TreeJNI attachment = new TreeJNI().with("media", new TreeJNI("GenericAttachmentMedia")
                .with("animated_image", released));
        String next = GIF.replace("abc", "def");

        CommentGif row = (CommentGif) CommentGif.clickFor(comment(attachment, gifAttachment(next)));

        assertNotNull(row);
        assertEquals(next, row.url);
        assertFalse("the released GIF image was read", released.readAfterRelease);
    }

    @Test
    public void aCommentWithNoGifGetsNoRow() {
        assertNull("a photo comment keeps Facebook's own Save photo", CommentGif.clickFor(comment(photoAttachment())));
        assertNull("text only", CommentGif.clickFor(new TreeJNI("Comment").with("attachments", Collections.<TreeJNI>emptyList())));
        assertNull("an empty address", CommentGif.clickFor(comment(gifAttachment(""))));
        assertNull("no comment", CommentGif.clickFor(null));
        assertNull("not a model", CommentGif.clickFor("comment"));
        assertNull("a released model", CommentGif.clickFor(comment(gifAttachment(GIF)).releasedTree()));
    }

    @Test
    public void theSwitchOffOrPausedLeavesTheSheetAlone() {
        Settings.DOWNLOAD_PHOTOS.save(false);
        assertNull(CommentGif.clickFor(comment(gifAttachment(GIF))));
        Settings.DOWNLOAD_PHOTOS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull(CommentGif.clickFor(comment(gifAttachment(GIF))));
        PauseForTests.resume();
        assertNotNull(CommentGif.clickFor(comment(gifAttachment(GIF))));
    }

    @Test
    public void theReportSaysWhereTheGifIsWithoutTheAddress() {
        assertEquals("on Meta's media servers", CommentGif.whereIs(GIF));
        assertEquals("on media.giphy.com", CommentGif.whereIs("https://media.giphy.com/media/abc/giphy.gif"));
        assertEquals("no host", CommentGif.whereIs("not an address"));
    }

    @Test
    public void aTapAfterTheSwitchWentOffSavesNothing() {
        CommentGif row = (CommentGif) CommentGif.clickFor(comment(gifAttachment(GIF)));
        assertNotNull(row);
        Settings.DOWNLOAD_PHOTOS.save(false);
        assertNull(row.invoke(null));
    }
}
