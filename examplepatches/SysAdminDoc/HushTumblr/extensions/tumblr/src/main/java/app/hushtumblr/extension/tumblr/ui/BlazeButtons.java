/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Takes the Blaze buttons off posts while Hide Blaze prompts is on.
 *
 * <p>Four places start a Blaze campaign from a post, each from its own answer:
 * <ul>
 *   <li>{@link #ownPostButton}: the flame in the row under your own posts (and on Tumblr TV),
 *   from the row state's "show Blaze" getter.</li>
 *   <li>{@link #postMenuItem}: the Blaze item in a post's three-dot menu, from the post's own
 *   "can Blaze" getter, which both menu builders read.</li>
 *   <li>{@link #shareTarget}: the Blaze target in the share sheet, from the sheet's
 *   {@code can_blaze} argument.</li>
 *   <li>{@link #communityMenu}: Promote in a community post's menu, from the list of items the
 *   server's menu model hands over.</li>
 * </ul>
 * Each answers Tumblr's own value while the switch is off, HushTumblr is paused, or the settings
 * aren't ready, so Tumblr's own logic decides then. Keep Blaze posts and the Blaze dashboard read
 * other values and stay as they are.
 */
public final class BlazeButtons {
    /** A community post's Promote item. Rumblr's model classes keep their names. */
    static final String PROMOTE_POST = "com.tumblr.rumblr.communities.PostOverflowMenuItem$PromotePost";

    private BlazeButtons() {}

    /**
     * Injected in front of the return of the author actions row's "show Blaze" getter. False while
     * the switch is on, so the flame leaves the row and the others keep their places. Never throws.
     */
    public static boolean ownPostButton(int shown) {
        return hidden(shown, "own post flame");
    }

    /**
     * Injected in front of the return of the post's "can Blaze" getter, which only the overflow
     * menu builders read. False while the switch is on, so the menu has no Blaze item. Never throws.
     */
    public static boolean postMenuItem(int shown) {
        return hidden(shown, "post menu item");
    }

    /**
     * Injected where the share sheet has read its {@code can_blaze} argument. False while the switch
     * is on, so the sheet has no Blaze target. Never throws.
     */
    public static boolean shareTarget(int shown) {
        return hidden(shown, "share sheet target");
    }

    /**
     * Injected where a community post's menu gets its items. A new list without Promote while the
     * switch is on, the same list otherwise. Never throws.
     */
    @Nullable
    public static List<?> communityMenu(@Nullable List<?> items) {
        if (items == null || items.isEmpty() || !Utils.settingsReady()) return items;
        try {
            if (!PatchFamily.Capability.BLAZE_BUTTONS.installed()) return items;
            HookStatus.invoked(FamilyNames.HIDE_BLAZE_PROMPTS);
            if (!Settings.HIDE_BLAZE_PROMPTS.get()) return items;
            List<Object> kept = new ArrayList<>(items.size());
            for (Object item : items) if (item == null || !PROMOTE_POST.equals(item.getClass().getName())) kept.add(item);
            if (kept.size() == items.size()) return items;
            HookStatus.counted(FamilyNames.HIDE_BLAZE_PROMPTS, "community menu Promote");
            return kept;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_BLAZE_PROMPTS, "community menu", failure);
            return items;
        }
    }

    /** False while the switch is on and Tumblr would show it, Tumblr's own answer otherwise. */
    private static boolean hidden(int shown, String what) {
        boolean tumblr = shown != 0;
        // The row and the menus can be built while Tumblr starts, before HushTumblr may read a switch.
        if (!tumblr || !Utils.settingsReady()) return tumblr;
        try {
            if (!PatchFamily.Capability.BLAZE_BUTTONS.installed()) return true;
            HookStatus.invoked(FamilyNames.HIDE_BLAZE_PROMPTS);
            if (!Settings.HIDE_BLAZE_PROMPTS.get()) return true;
            HookStatus.counted(FamilyNames.HIDE_BLAZE_PROMPTS, what);
            return false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_BLAZE_PROMPTS, what, failure);
            return true;
        }
    }
}
