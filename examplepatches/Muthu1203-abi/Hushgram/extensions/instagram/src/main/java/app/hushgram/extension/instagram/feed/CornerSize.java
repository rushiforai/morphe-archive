/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.feed;

/** How round a feed post's picture or video is cut at its corners, in density independent pixels. */
public enum CornerSize {
    SMALL(8),
    LARGE(16);

    public final int dp;

    CornerSize(int dp) {
        this.dp = dp;
    }
}
