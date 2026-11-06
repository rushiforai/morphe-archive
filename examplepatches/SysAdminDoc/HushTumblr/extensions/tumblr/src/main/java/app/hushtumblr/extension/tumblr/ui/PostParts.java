/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.view.View;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

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
 * tags under the video when the post has no description, and {@link #tvTags} hands it none to write;
 * {@link #tvMore} then takes the "... more" label that would sit there alone. {@code PostCardHeader}
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
     * stays empty, and notes for {@link #tvMore} that this bind's line lost its tags. The tags
     * themselves otherwise. Never throws.
     */
    public static String tvTags(String tags) {
        tvTagsHidden = false;
        if (tags == null || tags.isEmpty()) return tags;
        tvTagsHidden = hides(PatchFamily.Capability.POST_TAGS, FamilyNames.HIDE_HASHTAGS, Settings.HIDE_HASHTAGS,
                "Tumblr TV tags hidden");
        return tvTagsHidden ? "" : tags;
    }

    /** Whether the Tumblr TV bind running now had its tags taken by {@link #tvTags}; read once by {@link #tvMore}. */
    private static boolean tvTagsHidden;

    /** The "... more" labels {@link #tvMore} hid, so it shows only those again. Cards are bound on the main thread. */
    private static final Set<View> hiddenMore = Collections.newSetFromMap(new WeakHashMap<>());

    /**
     * Injected right after Tumblr TV's post text writes its line, on that card's "... more" label and
     * the line it wrote. When the line is empty because {@link #tvTags} took the post's only text, the
     * label goes too, since it opens nothing. On a later bind of the same card with something written,
     * a label hidden here shows again. A post that had neither tags nor a description keeps the label
     * Tumblr gives it, and so does every post with the switch off or paused. A label Tumblr hides on
     * its own after this one did stays marked, so the card's next bind with something written shows
     * it, as a fresh card for that post would. Never throws.
     */
    public static void tvMore(View more, CharSequence written) {
        boolean tookTags = tvTagsHidden;
        tvTagsHidden = false;
        if (more == null) return;
        try {
            if (tookTags && blank(written)) {
                if (more.getVisibility() != View.GONE) {
                    more.setVisibility(View.GONE);
                    hiddenMore.add(more);
                }
            } else if (hiddenMore.remove(more)) {
                more.setVisibility(View.VISIBLE);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_HASHTAGS, "Tumblr TV more label", failure);
        }
    }

    /** Whether {@code written} shows nothing: none, empty, or only spaces and line breaks. */
    private static boolean blank(CharSequence written) {
        if (written == null) return true;
        for (int i = 0; i < written.length(); i++) {
            char c = written.charAt(i);
            if (!Character.isWhitespace(c) && !Character.isSpaceChar(c)) return false;
        }
        return true;
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
