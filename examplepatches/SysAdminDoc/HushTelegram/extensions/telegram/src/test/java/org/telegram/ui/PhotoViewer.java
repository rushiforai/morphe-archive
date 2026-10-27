/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package org.telegram.ui;

import android.app.Activity;

/** The video viewer as the extension finds it: a class by this name that holds the activity under some field name. */
public final class PhotoViewer {
    public Activity y;

    public PhotoViewer(Activity activity) {
        this.y = activity;
    }
}
