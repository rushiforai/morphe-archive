/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

/**
 * The dashboard page patch adds this to the wrapper a timeline card holds its post in. The wrapper
 * doesn't keep the post, so it notes what {@link DashboardPosts} needs from it as it's built.
 */
public interface HushPostFacts {
    /** {@link DashboardPosts#facts} of the post this was built from. */
    int hushPostFacts();
}
