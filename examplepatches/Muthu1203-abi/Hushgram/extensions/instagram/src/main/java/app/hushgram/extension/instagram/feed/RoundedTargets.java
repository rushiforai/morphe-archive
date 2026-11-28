/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.feed;

/**
 * What Rounded post corners reads from a feed post's touch holder, as a bridge the "Rounded post corners"
 * patch writes. It sits in a class of its own, apart from {@link RoundedCorners}, so a body the runtime ever
 * refused would take down only this read, never the hook Instagram calls as each post is made. Unpatched,
 * it answers null.
 */
public final class RoundedTargets {
    private RoundedTargets() {
    }

    /** The media frame that holder keeps, the view a post's picture or video sits in. The patch writes the body. Answers an Object. */
    public static Object frame(Object holder) {
        return null;
    }
}
