/*
 * Copyright 2026 pixkk
 */
package app.pixkk.extension.feed;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.pixkk.extension.core.GlobalLayoutHook;
import app.pixkk.extension.core.Logger;
import app.pixkk.extension.core.Settings;
import app.pixkk.extension.core.Utils;

/**
 * Changes the gaps down the right of a video: under the avatar, between the buttons (like,
 * comments, save, share) and above the music disc, each on its own.
 *
 * The buttons are slots of a fixed height packed one under the other in a column, so a gap is
 * changed by moving slots, not by resizing them: each is raised by the gaps below it, which
 * leaves the music disc where it is and spreads or closes up everything above it. Moving a view
 * leaves the layout alone, so this
 * runs after each pass without starting another. The column and the views above it stop clipping,
 * or a slot moved past the column's top edge would be cut off.
 *
 * Ids are 47.5.3's: {@code id/lke}, the column, and {@code id/ex9}, each slot in it. The slot
 * that holds the music disc spans the column's width and is left where it is.
 */
public final class RailSpacing {
    private static final int COLUMN_ID = 0x7f0a3e46;
    private static final int SLOT_ID = 0x7f0a1ab2;
    /** {@code id/iam}, the avatar and follow block, which tells the avatar's slot from a button's. */
    private static final int AVATAR_ID = 0x7f0a2cd1;
    private static final int MAX_DEPTH = 40;
    /** A slot at least this share of the column's width is the music disc's, not a button's. */
    private static final float DISC_SLOT_WIDTH_SHARE = 0.9f;

    /** One listener per screen: the feed and a video opened from a profile or search can both be up. */
    private static final Map<Activity, GlobalLayoutHook> HOOKS = new WeakHashMap<>();
    /** The slots moved here, so that putting the setting back to zero puts them back. */
    private static final Map<View, Boolean> moved = new WeakHashMap<>();

    private RailSpacing() {
    }

    /**
     * Called from the patched {@code MainActivity.onCreate} and {@code DetailActivity.onCreate};
     * the work is posted, as the activity has no content yet at this point.
     */
    public static void install(Activity activity) {
        if (activity == null) return;
        Utils.runOnMainThread(() -> {
            try {
                ViewGroup root = activity.findViewById(android.R.id.content);
                if (root == null) return;
                GlobalLayoutHook hook = HOOKS.get(activity);
                if (hook == null) {
                    hook = new GlobalLayoutHook();
                    HOOKS.put(activity, hook);
                }
                // The listener holds the root weakly: this map must not keep the activity alive.
                WeakReference<ViewGroup> held = new WeakReference<>(root);
                hook.install(root, () -> {
                    ViewGroup current = held.get();
                    if (current != null) apply(current);
                });
            } catch (Throwable ex) {
                Logger.printException(() -> "Could not install the right column spacing", ex);
            }
        });
    }

    /** The three gaps in pixels: under the avatar, between the buttons, above the music disc. */
    private static final class Gaps {
        final float avatar;
        final float buttons;
        final float disc;

        Gaps(float density) {
            avatar = Settings.RAIL_AVATAR_GAP_DP.get() * density;
            buttons = Settings.RAIL_SPACING_DP.get() * density;
            disc = Settings.RAIL_DISC_GAP_DP.get() * density;
        }

        boolean any() {
            return avatar != 0 || buttons != 0 || disc != 0;
        }
    }

    private static void apply(ViewGroup root) {
        try {
            Gaps gaps = new Gaps(root.getResources().getDisplayMetrics().density);
            if (!gaps.any() && moved.isEmpty()) return;
            walk(root, root, gaps, 0);
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not space the right column", ex);
        }
    }

    private static void walk(View view, ViewGroup root, Gaps gaps, int depth) {
        if (view.getVisibility() == View.GONE || depth > MAX_DEPTH) return;
        if (view.getId() == COLUMN_ID && view instanceof ViewGroup) {
            arrange((ViewGroup) view, root, gaps);
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), root, gaps, depth + 1);
    }

    /**
     * Every gap is measured up from the music disc, which stays where it is: the lowest button
     * rises by the disc gap, each button above it by one more button gap, and the avatar, above
     * the highest button, by the avatar gap on top of that.
     */
    private static void arrange(ViewGroup column, ViewGroup root, Gaps gaps) {
        List<View> buttons = new ArrayList<>();
        View avatar = null;
        for (int i = 0; i < column.getChildCount(); i++) {
            View child = column.getChildAt(i);
            if (child.getId() != SLOT_ID || child.getVisibility() != View.VISIBLE || child.getHeight() == 0) continue;
            if (child.getWidth() >= column.getWidth() * DISC_SLOT_WIDTH_SHARE) continue;
            if (child.findViewById(AVATAR_ID) != null) avatar = child;
            else buttons.add(child);
        }
        // Lowest first.
        Collections.sort(buttons, (a, b) -> Integer.compare(b.getTop(), a.getTop()));
        if (gaps.any()) stopClipping(column, root);
        float rise = gaps.disc;
        for (int i = 0; i < buttons.size(); i++) {
            if (i > 0) rise += gaps.buttons;
            shift(buttons.get(i), -rise);
        }
        if (avatar != null) {
            // With every button gone the avatar sits right above the disc.
            shift(avatar, -(buttons.isEmpty() ? gaps.disc : rise + gaps.avatar));
        }
    }

    private static void shift(View slot, float by) {
        if (by != 0) {
            slot.setTranslationY(by);
            moved.put(slot, Boolean.TRUE);
        } else if (moved.remove(slot) != null) {
            slot.setTranslationY(0);
        }
    }

    private static void stopClipping(ViewGroup column, ViewGroup root) {
        column.setClipChildren(false);
        for (ViewParent parent = column.getParent(); parent instanceof ViewGroup && parent != root;
             parent = parent.getParent()) {
            ((ViewGroup) parent).setClipChildren(false);
        }
    }
}
