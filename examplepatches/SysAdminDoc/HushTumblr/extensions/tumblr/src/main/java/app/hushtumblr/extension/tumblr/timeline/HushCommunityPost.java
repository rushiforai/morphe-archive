/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

/**
 * What Keep reblogs in communities reads from a Tumblr post. The community post bridge patch makes
 * Tumblr's {@code Post} implement it, its method calling the getter Moshi's adapter writes under
 * "community". Nothing in the extension implements it, so without the patch no post counts as one
 * shared to a community.
 */
public interface HushCommunityPost {
    /** The community the post was shared to, or null for a post outside any community. */
    @Nullable
    Object hushCommunity();
}
