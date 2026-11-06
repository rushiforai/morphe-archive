/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

/**
 * Tumblr's binder for the Read more row under a cut post. The Collapse long posts patch makes it
 * implement this, the method reading the screen it hands a Read more tap to, so the extension can
 * ask that screen to open a post where it is. Tumblr copies the binder for each reblog trail entry
 * it cut and gives the copy the entry's id, so a copy answers null: an entry's Read more still
 * opens the post by itself.
 */
public interface HushReadMoreBinder {
    /**
     * The screen this binder hands a tap of a post's own Read more to, or null for a trail entry's
     * binder or one with no screen.
     */
    @Nullable
    Object hushReadMoreScreen();
}
