/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import com.facebook.graphservice.tree.TreeJNI;

import java.util.Collections;

/**
 * The comment sheet's Save GIF hook, for a test outside this package: one GIF comment, handed to
 * the hook the way the patch hands it over.
 */
public final class CommentGifForTests {
    private CommentGifForTests() {
    }

    /** A comment holding one GIF on Meta's CDN. */
    static TreeJNI gifComment() {
        TreeJNI image = new TreeJNI().with("uri", "https://external-mia5-1.xx.fbcdn.net/emg1/v/t13/1234567890?url=https%3A%2F%2Fmedia4.giphy.com"
            + "%2Fmedia%2Fabc%2Fgiphy.gif&stp=dst-gif_fr_q75&oh=06_Q3&oe=6ADE4856");
        TreeJNI attachment = new TreeJNI().with("media", new TreeJNI("GenericAttachmentMedia").with("animated_image", image));
        return new TreeJNI("Comment").with("attachments", Collections.singletonList(attachment));
    }

    /** Asks the hook about a GIF comment and says whether it answered a row. */
    public static boolean addsARow() {
        return CommentGif.clickFor(gifComment()) != null;
    }
}
