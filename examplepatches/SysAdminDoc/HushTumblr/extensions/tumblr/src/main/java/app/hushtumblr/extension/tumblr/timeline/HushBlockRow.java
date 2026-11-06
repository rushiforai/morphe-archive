/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.util.List;

/**
 * One row of a post as Tumblr draws it: a text block, an image row of one or more images, a video
 * and so on. The Collapse long posts patch makes Tumblr's block row implement it, the method
 * reading the row's own block list.
 */
public interface HushBlockRow {
    /** The row's blocks, in order. */
    @Nullable
    List<?> hushBlocks();
}
