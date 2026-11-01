/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import org.robolectric.RuntimeEnvironment;

/** Reaches AppFont's stand-ins for the settings tests, which live in another package. */
public final class AppFontForTests {
    private AppFontForTests() {}

    /** Whether Tumblr's font gets swapped right now. */
    public static boolean swapsAFont() {
        int[] kept = AppFont.interfaceFontIds;
        AppFont.interfaceFontIds = new int[] {0x7f090005, 0, 0, 0};
        try {
            return AppFont.replacement(RuntimeEnvironment.getApplication(), 0x7f090005) != null;
        } finally {
            AppFont.interfaceFontIds = kept;
        }
    }
}
