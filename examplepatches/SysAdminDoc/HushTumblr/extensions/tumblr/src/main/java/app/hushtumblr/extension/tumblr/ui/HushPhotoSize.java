/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import androidx.annotation.Nullable;

/**
 * One size of a post's image. Sharper images adds this to Tumblr's own image size, whose public
 * getters of these names answer it, so nothing new is written into that class.
 */
public interface HushPhotoSize {
    @Nullable String getUrl();

    int getWidth();

    int getHeight();
}
