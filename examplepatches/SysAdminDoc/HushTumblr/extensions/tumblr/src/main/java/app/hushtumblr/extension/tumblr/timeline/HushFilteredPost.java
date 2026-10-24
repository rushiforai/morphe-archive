/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

/**
 * What Hide filtered posts reads from a Tumblr post. The filtered post bridge patch makes Tumblr's
 * {@code Post} implement it, its method calling the getter Moshi's adapter writes under
 * "filtered". Nothing in the extension implements it, so without the patch every post is kept.
 */
public interface HushFilteredPost {
    /**
     * What of your own filters the post matched, a {@link HushFiltered}, or null for a post Tumblr
     * shows as it is. Typed as an object because the model class is Tumblr's.
     */
    @Nullable
    Object hushFiltered();
}
