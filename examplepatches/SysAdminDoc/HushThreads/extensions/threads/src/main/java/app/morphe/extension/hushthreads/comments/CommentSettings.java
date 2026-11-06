/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.comments;

import app.morphe.extension.shared.settings.StringSetting;

/**
 * What a reply is matched against, which isn't a switch. {@link
 * app.morphe.extension.hushthreads.settings.Settings} holds only switches, which is all a settings
 * file carries, so the patterns are kept here, the way a save's choices are.
 */
public final class CommentSettings {
    private CommentSettings() {
    }

    /**
     * The words and domains a reply is matched against, one a line or separated by commas. A shop's
     * domain such as shopee.vn takes out the replies linking to it. Matched whatever the letter
     * case. Empty by default.
     */
    public static final StringSetting FILTER_COMMENT_PATTERNS =
            new StringSetting("hushthreads_filter_comment_patterns", "", false);
}
