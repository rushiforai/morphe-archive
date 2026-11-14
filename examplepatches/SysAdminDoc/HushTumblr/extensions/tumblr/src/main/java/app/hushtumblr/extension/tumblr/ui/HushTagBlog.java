/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import androidx.annotation.Nullable;

/**
 * The listener behind a tag under a post. Tags open the blog's tag search makes Tumblr's own
 * listener implement this while patching, answering from the blog it was built with.
 */
public interface HushTagBlog {
    /**
     * The name of the blog that posted the post the tag is under. Null when the listener holds no
     * blog, or one Tumblr itself treats as empty, the same test Tumblr makes before its own blog
     * search.
     */
    @Nullable String hushTagBlogName();
}
