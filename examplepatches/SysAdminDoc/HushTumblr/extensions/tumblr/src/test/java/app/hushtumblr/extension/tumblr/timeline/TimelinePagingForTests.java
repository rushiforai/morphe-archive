/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

/** Lets tests in other packages read {@link TimelinePaging}'s answers and start it over. */
public final class TimelinePagingForTests {
    private TimelinePagingForTests() {}

    public static final int NEXT = TimelinePaging.NEXT;
    public static final String EMPTIED = TimelinePaging.EMPTIED;

    public static void reset() {
        TimelinePaging.resetForTests();
    }
}
