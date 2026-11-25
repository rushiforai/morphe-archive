/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.settings;

import android.content.Context;

/** The settings entry's application start, for a test in another package. */
public final class SettingsEntryForTests {
    private SettingsEntryForTests() {
    }

    /** What the settings patch's hook runs as Tumblr's application is created. */
    public static void applicationCreated(Context context) {
        SettingsEntry.onApplicationCreate(context);
    }
}
