/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

/**
 * The patch adds this to Tumblr's Post and its card model. The value is the blog rule that would
 * hide this post: "reblogs:" plus the posting blog for a reblog, "originals:" plus it for a proven
 * original, or null when either half can't be told.
 */
public interface HushBlogRulePost {
    String hushBlogRule();
}
