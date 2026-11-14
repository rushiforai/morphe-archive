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
 * Where a tag tapped under a post leads.
 *
 * <p>Tumblr's listener for a tag under a post asks first whether the screen it's on belongs to a
 * blog. When it does, the tag opens that blog's own search for it, the screen
 * blog.tumblr.com/tagged/tag shows. Everywhere else the tag opens Tumblr's search of every blog.
 * {@link #blogScreen} is put right after that question and can answer yes in Tumblr's place, so
 * the tag opens the blog search for the blog that posted the post, wherever the post is shown.
 */
public final class BlogTags {
    private BlogTags() {}

    /** The prefix Tumblr gives a community's blog name. Its tags open the community's own tag filter. */
    private static final String COMMUNITY_PREFIX = "@@";

    /**
     * Injected right after Tumblr's tag listener has asked whether its screen belongs to a blog,
     * on that answer (non-zero for yes) and the listener. True when Tumblr said so itself. Also
     * true while Tags open the blog's tag search is on and the listener knows the posting blog's
     * name, so Tumblr opens that blog's search for the tag. False otherwise: with the switch off or
     * paused, before HushTumblr has its settings, for a post with no blog Tumblr would search, and
     * for a community's post, which keeps Tumblr's community tag filter. Never throws.
     */
    public static boolean blogScreen(int blogScreen, Object listener) {
        if (blogScreen != 0) return true;
        if (!Utils.settingsReady()) return false;
        try {
            if (!PatchFamily.Capability.TAG_BLOG_LINKS.installed()) return false;
            HookStatus.invoked(FamilyNames.TAG_BLOG_SEARCH);
            if (!Settings.TAG_BLOG_SEARCH.get()) return false;
            if (!(listener instanceof HushTagBlog)) return false;
            String blog = ((HushTagBlog) listener).hushTagBlogName();
            if (blog == null || blog.isEmpty() || blog.startsWith(COMMUNITY_PREFIX)) return false;
            HookStatus.counted(FamilyNames.TAG_BLOG_SEARCH, "tag opened on its blog");
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.TAG_BLOG_SEARCH, "tag blog search", failure);
            return false;
        }
    }
}
