/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import java.util.List;

/**
 * The signed-in account's blogs, what Hide reblogs of your posts reads to know which blogs are
 * yours. The reblog source bridge patch makes Tumblr's account ({@code com.tumblr.UserInfo})
 * implement it, its method reading the immutable list a fresh user/info response gave it.
 */
public interface HushAccountBlogs {
    /** Each of the account's blogs, a {@link HushAccountBlog} once bridged, or null. */
    List<?> hushAccountBlogs();
}
