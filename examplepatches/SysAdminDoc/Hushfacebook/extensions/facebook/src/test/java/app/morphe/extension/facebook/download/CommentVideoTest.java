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
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushfacebookPause;
import app.morphe.extension.shared.settings.PauseForTests;

/** Save video in a comment's long-press sheet (#318): which comments get the row, and what it saves. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CommentVideoTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ID = "1718293041526374";
    private static final String HD = "https://video-mia3-1.xx.fbcdn.net/o1/v/t2/f2/m69/hd.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6ImhkIn0&oh=00_A&oe=6ADE4856";
    private static final String SD = "https://video-mia3-1.xx.fbcdn.net/o1/v/t2/f2/m69/sd.mp4?efg=eyJ2ZW5jb2RlX3RhZyI6InNkIn0&oh=00_A&oe=6ADE4856";

    @Before
    public void switchOn() {
        // Download any video starts off.
        Settings.DOWNLOAD_VIDEOS.save(true);
    }

    @After
    public void restore() {
        HookStatus.clear();
        PauseForTests.resume();
        Settings.DOWNLOAD_VIDEOS.resetToDefault();
        Settings.DOWNLOAD_ACTION.resetToDefault();
    }

    private static TreeJNI videoAttachment(String id, String hd, String sd) {
        TreeJNI media = new TreeJNI("Video").with("id", id);
        if (hd != null) media.with("hd_playable_url", hd);
        if (sd != null) media.with("playable_url", sd);
        return new TreeJNI().with("media", media);
    }

    /** A GIF comment, which Download any photo's Save GIF covers: its media has an animated image. */
    private static TreeJNI gifAttachment() {
        return new TreeJNI().with("media", new TreeJNI("GenericAttachmentMedia")
                .with("animated_image", new TreeJNI().with("uri", "https://media.giphy.com/media/abc/giphy.gif"))
                .with("playable_url", SD));
    }

    private static TreeJNI photoAttachment() {
        return new TreeJNI().with("media", new TreeJNI("Photo").with("id", "998877").with("image", new TreeJNI().with("uri", "https://scontent.xx.fbcdn.net/p.jpg")));
    }

    private static TreeJNI comment(TreeJNI... attachments) {
        return new TreeJNI("Comment").with("attachments", Arrays.asList(attachments));
    }

    @Test
    public void aVideoCommentGetsTheRowWithItsIdAndFiles() {
        CommentVideo row = (CommentVideo) CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD)));
        assertNotNull(row);
        assertEquals(ID, row.id);
        assertEquals(HD, row.hd);
        assertEquals(SD, row.sd);
        assertEquals("Save video", CommentVideo.title());
    }

    @Test
    public void aVideoThatNamesNoFileStillGetsTheRowForItsPlayer() {
        // The player records the DASH manifest under the id, so the id alone is enough to save it.
        CommentVideo row = (CommentVideo) CommentVideo.clickFor(comment(videoAttachment(ID, null, null)));
        assertNotNull(row);
        assertEquals(ID, row.id);
        assertNull(row.hd);
        assertNull(row.sd);
    }

    @Test
    public void mediaOfAnotherTypeThatNamesAVideoFileGetsTheRow() {
        TreeJNI attachment = new TreeJNI().with("media", new TreeJNI("GenericAttachmentMedia")
                .with("id", ID).with("playable_url_quality_hd", HD));
        CommentVideo row = (CommentVideo) CommentVideo.clickFor(comment(attachment));
        assertNotNull(row);
        assertEquals("the HD file Facebook names under its other field", HD, row.hd);
        assertNull(row.sd);
    }

    @Test
    public void theFirstVideoOfSeveralAttachmentsIsTheOne() {
        String second = "1718293041526375";
        CommentVideo row = (CommentVideo) CommentVideo.clickFor(
                comment(photoAttachment(), videoAttachment(second, null, SD), videoAttachment(ID, HD, SD)));
        assertNotNull(row);
        assertEquals(second, row.id);
    }

    @Test
    public void aReleasedVideoIsSkippedUnreadForTheNextLiveOne() {
        TreeJNI released = new TreeJNI("Video").with("id", ID).with("playable_url", SD).releasedTree();
        String next = "1718293041526375";

        CommentVideo row = (CommentVideo) CommentVideo.clickFor(
                comment(new TreeJNI().with("media", released), videoAttachment(next, HD, SD)));

        assertNotNull(row);
        assertEquals(next, row.id);
        assertFalse("the released video was read", released.readAfterRelease);
    }

    @Test
    public void aCommentWithNoVideoGetsNoRow() {
        assertNull("a GIF is Save GIF's", CommentVideo.clickFor(comment(gifAttachment())));
        assertNull("a photo keeps Facebook's own Save photo", CommentVideo.clickFor(comment(photoAttachment())));
        assertNull("text only", CommentVideo.clickFor(new TreeJNI("Comment").with("attachments", Collections.<TreeJNI>emptyList())));
        assertNull("a file that isn't a web address", CommentVideo.clickFor(comment(
                new TreeJNI().with("media", new TreeJNI("GenericAttachmentMedia").with("playable_url", "file:///sdcard/v.mp4")))));
        assertNull("no comment", CommentVideo.clickFor(null));
        assertNull("not a model", CommentVideo.clickFor("comment"));
        assertNull("a released comment", CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD)).releasedTree()));
    }

    @Test
    public void theSwitchOffOrPausedLeavesTheSheetAlone() {
        Settings.DOWNLOAD_VIDEOS.save(false);
        assertNull(CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD))));
        Settings.DOWNLOAD_VIDEOS.save(true);
        PauseForTests.pause(HushfacebookPause.Reason.SWITCH);
        assertNull(CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD))));
        PauseForTests.resume();
        assertNotNull(CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD))));
    }

    @Test
    public void downloadsSentAsLinksTitleTheRowSendToApp() {
        Settings.DOWNLOAD_ACTION.save(SendLink.Action.SEND);
        assertEquals("Send to app", CommentVideo.title());
    }

    @Test
    public void eachSheetWithAVideoIsCountedAsBound() {
        CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD)));
        CommentVideo.clickFor(comment(photoAttachment()));
        assertEquals(FamilyNames.VIDEO_DOWNLOAD + ": invoked 2, 1 found, 0 missing", statusLine());
    }

    private static String statusLine() {
        for (String line : HookStatus.report()) {
            if (line.startsWith(FamilyNames.VIDEO_DOWNLOAD + ":")) return line;
        }
        return null;
    }

    @Test
    public void aTapAfterTheSwitchWentOffSavesNothing() {
        CommentVideo row = (CommentVideo) CommentVideo.clickFor(comment(videoAttachment(ID, HD, SD)));
        assertNotNull(row);
        Settings.DOWNLOAD_VIDEOS.save(false);
        assertNull(row.invoke(null));
    }
}
