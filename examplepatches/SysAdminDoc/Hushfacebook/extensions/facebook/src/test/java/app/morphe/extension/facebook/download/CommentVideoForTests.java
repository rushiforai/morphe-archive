/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import com.facebook.graphservice.tree.TreeJNI;

import java.util.Collections;

/**
 * The comment sheet's Save video hook, for a test outside this package: one video comment, handed
 * to the hook the way the patch hands it over.
 */
public final class CommentVideoForTests {
    private CommentVideoForTests() {
    }

    /** A comment holding one video with its SD file on Meta's CDN. */
    static TreeJNI videoComment() {
        TreeJNI media = new TreeJNI("Video").with("id", "1718293041526374")
            .with("playable_url", "https://video-mia3-1.xx.fbcdn.net/o1/v/t2/f2/m69/sd.mp4?oh=00_A&oe=6ADE4856");
        TreeJNI attachment = new TreeJNI().with("media", media);
        return new TreeJNI("Comment").with("attachments", Collections.singletonList(attachment));
    }

    /** Asks the hook about a video comment and says whether it answered a row. */
    public static boolean addsARow() {
        return CommentVideo.clickFor(videoComment()) != null;
    }
}
