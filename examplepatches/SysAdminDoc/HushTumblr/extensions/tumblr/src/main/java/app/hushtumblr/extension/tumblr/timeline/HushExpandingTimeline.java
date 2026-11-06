/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

/**
 * A timeline screen. The Collapse long posts patch makes Tumblr's timeline implement this, the
 * method building one of its items' rows again where the item is, the way Tumblr's own inline
 * expand refreshes the list.
 */
public interface HushExpandingTimeline {
    /**
     * Marks [item]'s post opened for Tumblr's own height cut, then builds its rows again in place
     * and redraws the list. False when the list isn't there yet or doesn't hold [item], and for a
     * capped card or a post the server marked to cut, which Tumblr opens on their own page.
     */
    boolean hushExpandPost(@Nullable Object item);
}
