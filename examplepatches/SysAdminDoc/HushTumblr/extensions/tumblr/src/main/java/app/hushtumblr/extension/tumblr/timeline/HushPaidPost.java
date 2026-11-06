/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

/**
 * Structured placement context, added to Tumblr's Post model by the paid-post bridge that Hide ads,
 * Hide your own reblogs and Hide Featured posts pull in.
 */
public interface HushPaidPost {
    /** The server's header_context.icon, or null when the post has no header context. */
    @Nullable
    String hushHeaderIcon();

    /** Whether the account follows this post's blog, under "followed". */
    boolean hushFollowed();

    /** Whether the account can edit this post, under "can_edit". */
    boolean hushCanEdit();

    /** Both followed and can_edit were explicitly parsed, rather than supplied by native defaults. */
    boolean hushPaidContextKnown();
}
