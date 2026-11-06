/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import android.content.Context;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.tumblr.timeline.HushRootPost;

/**
 * Appends local actions to the native menu after proving a current local timeline host: the post
 * mute, and on the dashboard a rule for the posting blog's reblogs or its originals.
 */
public final class RootPostMenu {
    private RootPostMenu() {}

    public static void add(Object builder, Object post, Context context, Object host) {
        try {
            RootPostMuteAction action = action(post, context, host);
            if (action != null) addNative(builder, L10n.t("Mute this post locally"), action);
            RootPostMuteAction blog = blogAction(post, context, host);
            if (blog != null) addNative(builder, RootPostMuteUi.menuTitle(blog.entry()), blog);
        } catch (Throwable unreadable) {
            // A changed native model or menu leaves Tumblr's menu intact, without logging IDs.
        }
    }

    static RootPostMuteAction action(Object post, Context context, Object host) {
        return action(root(post), context, host, false);
    }

    /** Only a dashboard tab offers a blog rule, since that's the only place one hides anything. */
    static RootPostMuteAction blogAction(Object post, Context context, Object host) {
        return action(blogRule(post), context, host, true);
    }

    private static RootPostMuteAction action(String entry, Context context, Object host, boolean blog) {
        if (!RootPostMutes.enabled() || RootPostMutes.capture() == null || context == null) return null;
        try {
            HushLocalTimeline timeline = host instanceof HushRootMenuHost ? ((HushRootMenuHost) host).hushTimelineOwner()
                    : host instanceof HushLocalTimeline ? (HushLocalTimeline) host : null;
            boolean valid = blog ? RootPostMuteStore.validBlogRule(entry) && RootPostMutes.onDashboard(timeline)
                    : RootPostMuteStore.validRoot(entry);
            return timeline != null && valid && RootPostLocalTimeline.contains(timeline, entry)
                    ? new RootPostMuteAction(entry, context, timeline) : null;
        } catch (Throwable unreadable) {
            return null;
        }
    }

    static String root(Object post) {
        Object payload = payload(post);
        return payload instanceof HushRootPost ? ((HushRootPost) payload).hushRootId() : null;
    }

    static String blogRule(Object post) {
        Object payload = payload(post);
        return payload instanceof HushBlogRulePost ? ((HushBlogRulePost) payload).hushBlogRule() : null;
    }

    /** What [item] holds of the same kind as [entry]: its blog rule for a rule, else its root. */
    static String entryOf(Object item, String entry) {
        return RootPostMuteStore.validBlogRule(entry) ? blogRule(item) : root(item);
    }

    /** A model is its own payload. A native card or timeline object is unpacked by the patch. */
    private static Object payload(Object post) {
        return post instanceof HushRootPost || post instanceof HushBlogRulePost ? post : cardPayload(post);
    }

    public static Object cardPayload(Object post) { return null; }
    public static void addNative(Object builder, String title, RootPostMuteAction callback) {}
    public static Object unit() { return null; }
}
