/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import org.robolectric.RuntimeEnvironment;

/** The Copy caption row, for a test outside this package: a reel whose caption was seen. */
public final class ReelCaptionForTests {
    private ReelCaptionForTests() {
    }

    private static final String VIDEO_ID = "1122334455667788";

    /** Keeps a caption for a reel, then says whether that reel's More sheet would get the row. */
    public static boolean addsTheRow() {
        ReelCaption.keep(VIDEO_ID, "A caption long enough to be cut off behind See more");
        try {
            return ReelCaption.forVideo(RuntimeEnvironment.getApplication(), VIDEO_ID) != null;
        } finally {
            ReelCaption.forgetAll();
        }
    }
}
