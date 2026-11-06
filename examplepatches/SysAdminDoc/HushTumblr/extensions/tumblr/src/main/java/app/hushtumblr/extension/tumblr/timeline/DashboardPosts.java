/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMenu;
import app.hushtumblr.extension.tumblr.rootmute.RootPostMutes;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Hide liked posts and Hide your own reblogs, which take posts out of the dashboard and nowhere
 * else. Tumblr reads a dashboard page, a post you open, a review queue and a Blaze list from the
 * same response, so parsing can't tell them apart. Instead the wrapper each card keeps its post in
 * notes the post's {@link #facts} as it's built, and the dashboard page hook asks {@link #page}
 * once it knows the screen is the dashboard.
 *
 * <p>A liked post is one Tumblr sent already liked by the signed-in account ({@link HushLikedPost}).
 * The flag is read as the card is built, so a post liked while it's on screen stays until a later
 * page brings it again. A reblog of yours is one Tumblr says you can edit ({@link HushPaidPost}).
 */
public final class DashboardPosts {
    private DashboardPosts() {}

    /** Tumblr sent the post already liked. */
    static final int LIKED = 1;
    /** The post is a reblog you made. */
    static final int OWN_REBLOG = 2;

    /**
     * Injected into the card wrapper's constructor: what [post] is, as {@link #LIKED} and
     * {@link #OWN_REBLOG} bits, read whatever the switches say so one turned on later applies to
     * the next page. Anything that isn't a post, or can't be read, is neither. Never throws.
     */
    public static int facts(@Nullable Object post) {
        try {
            int facts = PostRules.isLiked(post) ? LIKED : 0;
            HushPost value = PostRules.postOf(post);
            if (value != null && PostRules.isOwn(post) && PostRules.isReblog(value, value.hushTrail())) facts |= OWN_REBLOG;
            return facts;
        } catch (Throwable unreadable) {
            return 0;
        }
    }

    /**
     * [items], a page for [fragment], without the posts these two switches take out when the
     * screen is the dashboard. Any other screen, or a page they leave whole, gets [items] itself
     * back. Never throws.
     */
    public static List<?> page(@Nullable Object fragment, @Nullable List<?> items) {
        // Tumblr can hand a page over while it starts, before HushTumblr may read a switch.
        if (!Utils.settingsReady()) return items;
        String family = FamilyNames.HIDE_LIKED_POSTS;
        try {
            boolean liked = PostRules.on(PatchFamily.Capability.LIKED_POSTS, FamilyNames.HIDE_LIKED_POSTS,
                    Settings.HIDE_LIKED_POSTS);
            boolean own = PostRules.on(PatchFamily.Capability.OWN_REBLOG_POSTS, FamilyNames.HIDE_OWN_REBLOGS,
                    Settings.HIDE_OWN_REBLOGS);
            if (!liked) family = FamilyNames.HIDE_OWN_REBLOGS;
            if (!liked && !own || items == null || items.isEmpty() || !RootPostMutes.onDashboard(fragment)) return items;
            List<Object> kept = new ArrayList<>(items.size());
            int likedOut = 0, ownOut = 0;
            for (Object item : items) {
                int facts = factsOf(item);
                if (liked && (facts & LIKED) != 0) likedOut++;
                else if (own && (facts & OWN_REBLOG) != 0) ownOut++;
                else kept.add(item);
            }
            if (kept.size() == items.size()) return items;
            for (int i = 0; i < likedOut; i++) HookStatus.counted(FamilyNames.HIDE_LIKED_POSTS, "post removed");
            for (int i = 0; i < ownOut; i++) HookStatus.counted(FamilyNames.HIDE_OWN_REBLOGS, "post removed");
            // Tumblr takes an empty page for the end of the feed, so the fragment is told to go on.
            if (kept.isEmpty()) TimelinePaging.emptied(likedOut > 0 ? FamilyNames.HIDE_LIKED_POSTS : FamilyNames.HIDE_OWN_REBLOGS);
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(family, "dashboard page", failure);
            return items;
        }
    }

    /** What [item] noted of its post: a card's wrapper says, and a model is read as it is. */
    private static int factsOf(@Nullable Object item) {
        Object payload = item instanceof HushPostFacts || item instanceof HushLikedPost || item instanceof HushPaidPost
                ? item : RootPostMenu.cardPayload(item);
        return payload instanceof HushPostFacts ? ((HushPostFacts) payload).hushPostFacts() : facts(payload);
    }
}
