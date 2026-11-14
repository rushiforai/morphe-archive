/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

/**
 * Where a reblog came from, what Hide reblogs of your posts reads from a Tumblr post. The reblog
 * source bridge patch makes Tumblr's {@code Post} implement it, each method calling the getter
 * Moshi's adapter writes under "reblogged_from_name" and "reblogged_root_name". Nothing in the
 * extension implements it, so without the patch every post is kept.
 */
public interface HushReblogSource {
    /** The blog the post was reblogged from, or null for an original post. */
    String hushRebloggedFromName();

    /** The blog that made the post first, or null for an original post. */
    String hushRebloggedRootName();
}
