/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * More images per post (#21). Tumblr's post editor lets a post hold 10 images, where the website
 * lets it hold 30. The editor's limit is built once per process, the first time a post is written or
 * edited, and an image shared in from another app is cut at the same 10. Both go through here.
 */
public final class MoreImages {
    /** How many images Tumblr's website lets one post hold. */
    static final int WEBSITE_LIMIT = 30;

    /** What the report counts each time the editor's or a share's limit is raised. */
    static final String RAISED = "image limit raised";

    private MoreImages() {
    }

    /**
     * The image limit Tumblr builds the editor with, or cuts a share at: [stock] (10), or the
     * website's 30 with the switch on. Never throws, and never lowers a limit.
     */
    public static int imageBlocks(int stock) {
        try {
            if (!on()) return stock;
            HookStatus.counted(FamilyNames.MORE_IMAGES_PER_POST, RAISED);
            return Math.max(stock, WEBSITE_LIMIT);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MORE_IMAGES_PER_POST, "image limit", failure);
            return stock;
        }
    }

    private static boolean on() {
        if (!Utils.settingsReady() || !PatchFamily.Capability.IMAGE_LIMIT.installed()) return false;
        HookStatus.invoked(FamilyNames.MORE_IMAGES_PER_POST);
        return Settings.MORE_IMAGES_PER_POST.get();
    }
}
