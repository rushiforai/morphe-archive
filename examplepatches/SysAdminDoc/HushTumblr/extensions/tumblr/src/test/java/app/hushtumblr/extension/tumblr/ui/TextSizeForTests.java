/*
 * Ported from https://github.com/SysAdminDoc/Hushfacebook at e332bd2b3 (GPL-3.0),
 * modified for HushTumblr (Tumblr), 2026.
 *
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.res.Resources;

import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;

/** Text size as another package's test sees it. */
public final class TextSizeForTests {
    private TextSizeForTests() {
    }

    /**
     * A Tumblr activity starting in a fresh process: true when the font scale its resources report
     * changed. The settings entry's callback runs this on every activity.
     */
    public static boolean aStartScales() {
        TextSize.forgetForTests();
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).create()) {
            Resources resources = controller.get().getResources();
            Configuration start = new Configuration(resources.getConfiguration());
            try {
                TextSize.activity(controller.get());
                return Math.abs(resources.getConfiguration().fontScale - start.fontScale) > 0.0005f;
            } finally {
                // Before Android 12 Robolectric's screens share one resources object, so the next
                // probe would start at this size. A fresh process starts at the phone's.
                resources.updateConfiguration(start, resources.getDisplayMetrics());
            }
        } finally {
            TextSize.forgetForTests();
        }
    }
}
