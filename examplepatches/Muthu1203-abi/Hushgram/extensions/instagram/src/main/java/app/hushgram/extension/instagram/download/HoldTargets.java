/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

/**
 * What Hold to download reads from the two touch owners it's told about, as bridges the "Download any
 * video" patch writes. They sit in a class of their own, apart from {@link HoldDownload}, so a body the
 * runtime ever refused would take down only these reads, never the hooks Instagram calls on every touch.
 * Unpatched, each answers null.
 */
public final class HoldTargets {
    private HoldTargets() {
    }

    /** The post a feed media frame's touch holder keeps. The patch writes the body. Answers an Object. */
    public static Object feedMedia(Object holder) {
        return null;
    }

    /** The feed state that holder keeps, which knows the carousel page on screen. The patch writes the body. Answers an Object. */
    public static Object feedState(Object holder) {
        return null;
    }

    /** The media frame that holder keeps, the view the post's picture or video sits in. The patch writes the body. Answers an Object. */
    public static Object feedFrame(Object holder) {
        return null;
    }

    /** The post a reel's gesture detector keeps, through the reel item it was made for. The patch writes the body. Answers an Object. */
    public static Object reelMedia(Object detector) {
        return null;
    }
}
