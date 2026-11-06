/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

/**
 * The patch adds this to the dashboard's fragments. Explore and Communities build their tabs from
 * the dashboard's tab fragment class, so the patch answers per screen: a tab is the dashboard only
 * while the dashboard's host holds it. Only a dashboard screen offers a blog rule in a post's menu
 * or has its pages filtered by one, since a blog rule hides posts on the dashboard and nowhere else.
 * Hide liked posts and Hide your own reblogs filter a dashboard screen's pages the same way.
 */
public interface HushDashboardTimeline {
    /** Whether this screen is on the dashboard right now. */
    boolean hushDashboard();
}
