/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

/**
 * One of the signed-in account's blogs. The reblog source bridge patch makes Tumblr's
 * {@code ShortBlogInfo} implement it, its method calling the getter Moshi's adapter writes under
 * "name".
 */
public interface HushAccountBlog {
    /** The blog's name, the part before .tumblr.com, or null. */
    String hushAccountBlogName();
}
