/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import android.content.res.ColorStateList;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Dark search bar and Follow button. Two of Tumblr's controls are white in every theme: the search
 * bar at the top of Explore (a white pill holding a gray icon and "Search Tumblr") and the Follow
 * button in a blog's top bar (a white pill with black text). On a black page they're the brightest
 * things on the screen.
 *
 * <p>The patch hands {@link #exploreSearchBar} the bar when Explore's header finds it, and
 * {@link #blogFollowButton} the Follow item when a blog builds its top bar. Each keeps Tumblr's own
 * shape and only changes its colors: the pill turns black and what's on it
 * turns light. The label switch takes "Search Tumblr" off the bar and leaves the icon. Nothing
 * changes while a switch is off, HushTumblr is paused, the settings aren't ready or anything throws.
 */
public final class DarkControls {
    /** The steps a failure is reported under. */
    static final String BAR_STEP = "Explore search bar";
    static final String FOLLOW_STEP = "blog Follow button";

    /** What the diagnostic report counts. Fixed text only. */
    static final String BAR_DARKENED = "search bar darkened";
    static final String LABEL_HIDDEN = "search bar label hidden";
    static final String FOLLOW_DARKENED = "Follow button darkened";

    /** True black, what an AMOLED screen leaves unlit (#24 asked for it by name). */
    static final int DARK = 0xFF000000;

    /** White at 65%, the strength of the black Tumblr draws on the white bar. */
    static final int SOFT_WHITE = 0xA6FFFFFF;

    static final int WHITE = 0xFFFFFFFF;

    private DarkControls() {
    }

    /**
     * Injected where Explore's header keeps its search bar, with the bar. Darkens the pill and
     * lightens its icon and label, and takes the label off, each when its switch is on. Never throws.
     */
    public static void exploreSearchBar(@Nullable View bar) {
        try {
            if (!(bar instanceof ViewGroup) || !ready(PatchFamily.Capability.DARK_CONTROLS)) return;
            boolean dark = Settings.DARK_SEARCH_BAR.get();
            boolean bare = Settings.HIDE_SEARCH_BAR_LABEL.get();
            if (!dark && !bare) return;
            ViewGroup pill = (ViewGroup) bar;
            if (dark) pill.setBackgroundTintList(ColorStateList.valueOf(DARK));
            for (int i = 0; i < pill.getChildCount(); i++) {
                View child = pill.getChildAt(i);
                if (child instanceof TextView) {
                    if (dark) ((TextView) child).setTextColor(SOFT_WHITE);
                    if (bare) child.setVisibility(View.GONE);
                } else if (dark && child instanceof ImageView) {
                    ((ImageView) child).setImageTintList(ColorStateList.valueOf(SOFT_WHITE));
                }
            }
            if (dark) HookStatus.counted(FamilyNames.DARK_SEARCH_BAR_AND_FOLLOW, BAR_DARKENED);
            if (bare) HookStatus.counted(FamilyNames.DARK_SEARCH_BAR_AND_FOLLOW, LABEL_HIDDEN);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_SEARCH_BAR_AND_FOLLOW, BAR_STEP, failure);
        }
    }

    /**
     * Injected where a blog's top bar keeps its Follow item, with the item. Darkens the button the
     * item shows and turns its text white while the switch is on. Never throws.
     */
    public static void blogFollowButton(@Nullable MenuItem item) {
        try {
            if (item == null || !ready(PatchFamily.Capability.DARK_CONTROLS)
                    || !Settings.DARK_BLOG_FOLLOW_BUTTON.get()) return;
            View button = item.getActionView();
            if (!(button instanceof TextView)) return;
            button.setBackgroundTintList(ColorStateList.valueOf(DARK));
            ((TextView) button).setTextColor(WHITE);
            HookStatus.counted(FamilyNames.DARK_SEARCH_BAR_AND_FOLLOW, FOLLOW_DARKENED);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DARK_SEARCH_BAR_AND_FOLLOW, FOLLOW_STEP, failure);
        }
    }

    private static boolean ready(PatchFamily.Capability capability) {
        if (!Utils.settingsReady() || !capability.installed()) return false;
        HookStatus.invoked(FamilyNames.DARK_SEARCH_BAR_AND_FOLLOW);
        return true;
    }
}
