/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package com.tumblr.rumblr.communities;

/**
 * Stands in for Tumblr's PostOverflowMenuItem, one row of a community post's three-dot menu. Tumblr
 * has a subclass per row; these are the two the Blaze tests need.
 */
public abstract class PostOverflowMenuItem {
    private PostOverflowMenuItem() {}

    /** The Promote row, which starts a Blaze campaign for the post. */
    public static final class PromotePost extends PostOverflowMenuItem {}

    /** The Copy link row. */
    public static final class CopyLink extends PostOverflowMenuItem {}
}
