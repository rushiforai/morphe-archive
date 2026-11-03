/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Which parts of a post card Tumblr leaves out.
 *
 * <p>Each hook is put first in a method of the card and asked each time a card is bound, so the
 * switches show on the next card that scrolls in, without a restart. {@code PostCardWrappedTags}
 * draws a post's tags in the row under it, which also holds the source link, a submission credit
 * and a badge. While {@link #hideTags} answers true, the method that draws the tags is handed none,
 * so the row keeps the rest and goes away when there's nothing else in it. Tumblr TV writes a post's
 * tags under the video when the post has no description, and {@link #tvTags} hands it none to write.
 * {@code PostCardHeader}
 * hides its Follow button when its own check says so, and {@link #hideFollowButton} makes the
 * check say so. Each entry of a reblog trail has a header with a Follow button of its own, shown
 * only for an entry, and {@link #trailFollow} hands it none.
 */
public final class PostParts {
    private PostParts() {}

    /**
     * Injected at the start of the method that draws a post's tags, which then gets no tags to draw.
     * True while Hide hashtags is on. False with the switch off, paused, or before HushTumblr has its
     * settings. Never throws.
     */
    public static boolean hideTags() {
        return hides(PatchFamily.Capability.POST_TAGS, FamilyNames.HIDE_HASHTAGS, Settings.HIDE_HASHTAGS,
                "tags hidden");
    }

    /**
     * Injected where Tumblr TV's post text, for a post with no description, has read the post's tags
     * as one ", "-separated String. None while Hide hashtags is on, so the line under the video
     * stays empty. The tags themselves otherwise. Never throws.
     */
    public static String tvTags(String tags) {
        if (tags == null || tags.isEmpty()) return tags;
        return hides(PatchFamily.Capability.POST_TAGS, FamilyNames.HIDE_HASHTAGS, Settings.HIDE_HASHTAGS,
                "Tumblr TV tags hidden") ? "" : tags;
    }

    /**
     * Injected at the start of the check that decides whether a post header hides its Follow
     * button, which then answers yes. True while Hide the Follow button is on. False with the switch
     * off, paused, or before HushTumblr has its settings. Never throws.
     */
    public static boolean hideFollowButton() {
        return hides(PatchFamily.Capability.FOLLOW_BUTTON, FamilyNames.HIDE_FOLLOW_BUTTON,
                Settings.HIDE_FOLLOW_BUTTON, "follow button hidden");
    }

    /**
     * Injected first thing in the method that shows a reblog trail entry's Follow button, on the
     * entry it shows the button for. Null while Hide the Follow button is on, so Tumblr hides the
     * button the way it does when there's nobody to follow. The entry itself otherwise. Never throws.
     */
    public static Object trailFollow(Object entry) {
        if (entry == null) return null;
        return hides(PatchFamily.Capability.FOLLOW_BUTTON, FamilyNames.HIDE_FOLLOW_BUTTON,
                Settings.HIDE_FOLLOW_BUTTON, "reblog trail follow button hidden") ? null : entry;
    }

    private static boolean hides(PatchFamily.Capability hook, String family, BooleanSetting setting,
            String counted) {
        // Tumblr binds cards while it starts, before HushTumblr may read a switch.
        if (!Utils.settingsReady()) return false;
        try {
            if (!hook.installed()) return false;
            HookStatus.invoked(family);
            if (!setting.get()) return false;
            HookStatus.counted(family, counted);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(family, "switch read", failure);
            return false;
        }
    }
}
