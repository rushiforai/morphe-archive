/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

/**
 * An item of Tumblr's timelines, one post with everything drawn around it. The Collapse long posts
 * patch makes Tumblr's base class of these implement this, the method handing back what the item
 * shows, so the extension can tell which post a Read more row sits under.
 */
public interface HushTimelineItem {
    /** The post or other thing this item shows. */
    @Nullable
    Object hushPost();
}
