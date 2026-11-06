/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.privacy;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Tumblr builds every shared or copied post, blog and video link in one place and appends
 * {@code ?source=share} to it there. The hook asks this before the tag goes on: true sends the
 * method to the line that takes the link exactly as the server gave it, with no tag.
 */
public final class ShareLinks {
    private ShareLinks() {}

    /** Placed before Tumblr appends its share tag. Never touches the link itself. */
    public static boolean dropShareTag() {
        if (!Utils.settingsReady()) return false;
        try {
            if (!PatchFamily.Capability.SHARE_LINK_TAG.installed()) return false;
            HookStatus.invoked(FamilyNames.SANITIZE_SHARING_LINKS);
            if (!Settings.SANITIZE_SHARING_LINKS.get()) return false;
            HookStatus.counted(FamilyNames.SANITIZE_SHARING_LINKS, "share tag left off");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SANITIZE_SHARING_LINKS, "switch read", failure);
            return false;
        }
    }
}
