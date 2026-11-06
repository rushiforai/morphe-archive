/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

/**
 * What Hide liked posts reads from a Tumblr post. The liked post bridge patch makes Tumblr's
 * {@code Post} implement it, its method calling the getter Moshi's adapter writes under "liked".
 * Nothing in the extension implements it, so without the patch every post is kept.
 */
public interface HushLikedPost {
    /** Whether the signed-in account had liked the post when Tumblr sent it. */
    boolean hushLiked();
}
