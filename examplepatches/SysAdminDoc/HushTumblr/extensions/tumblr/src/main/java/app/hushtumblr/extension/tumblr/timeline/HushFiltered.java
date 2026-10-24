/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.util.List;

/**
 * Tumblr's note on a post it covers with "This post contains filtered content". The filtered post
 * bridge patch makes Tumblr's {@code Filtered} model implement it, each method calling the getter
 * Moshi's adapter writes under the JSON key named on it. Tumblr covers the post when either list
 * has something in it.
 */
public interface HushFiltered {
    /** The filtered tags the post carries, under "tags". */
    @Nullable
    List<?> hushFilteredTags();

    /** The filtered words its content holds, under "content". */
    @Nullable
    List<?> hushFilteredContent();
}
