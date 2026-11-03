/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 * The two helpers Hushfeed's SessionLockOverlay shares with the block buttons and PausePlayback;
 * the session lock itself is not ported.
 */
package app.czyeru.extension.tiktok.blockauthor;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;

public final class OverlayGeometry {
    private OverlayGeometry() {
    }

    // All overlay geometry runs on the main thread. Reuse these on player and layout callbacks.
    private static final int[] ROOT_POSITION = new int[2];
    private static final int[] NAVIGATION_POSITION = new int[2];

    /** What a curtained child was, and which panels are over it. */
    private static final class Curtained {
        final int previous;
        final java.util.Set<View> panels = java.util.Collections.newSetFromMap(
                new java.util.WeakHashMap<>());

        Curtained(int previous) {
            this.previous = previous;
        }
    }

    private static final java.util.WeakHashMap<View, Curtained> previousAccessibilityImportance =
            new java.util.WeakHashMap<>();


    /**
     * The bottom margin that leaves TikTok's navigation reachable, measured on the main thread.
     *
     * <p>The content root can extend behind the system navigation bar. Its margin must include
     * that gap below TikTok's row, while root padding has already been deducted by FrameLayout.
     * Unknown or implausible geometry keeps the feed fully covered until a later layout.
     */
    public static int navigationHeight(Activity activity, ViewGroup root) {
        if (activity == null || root == null || root.getHeight() <= 0) return 0;
        View homeTab = FeedVisibility.homeTabView(activity);
        if (homeTab == null) return 0;

        View bar = homeTab;
        int contentWidth = root.getWidth() - root.getPaddingLeft() - root.getPaddingRight();
        // Up to the row that spans the width, which is the bar rather than the one tab in it.
        for (int step = 0; step < 4 && bar.getParent() instanceof ViewGroup; step++) {
            ViewGroup parent = (ViewGroup) bar.getParent();
            if (parent == root) break;
            bar = parent;
            if (bar.getWidth() >= contentWidth && bar.getWidth() > 0) break;
        }
        // A bar clear display set GONE keeps its last size and place, and that strip is where
        // TikTok draws its own clear display bar, whose X brings the tabs back. It stays out from
        // under the panel like the tabs do: covered, nothing on screen led anywhere but the
        // panel's own buttons.
        int height = bar.getHeight();
        if (height <= 0 || height >= root.getHeight() / 3) return 0;
        View ancestor = bar;
        while (ancestor != root && ancestor.getParent() instanceof View) {
            ancestor = (View) ancestor.getParent();
        }
        if (ancestor != root) return 0;

        root.getLocationOnScreen(ROOT_POSITION);
        bar.getLocationOnScreen(NAVIGATION_POSITION);
        int margin = ROOT_POSITION[1] + root.getHeight() - root.getPaddingBottom()
                - NAVIGATION_POSITION[1];
        return margin >= height && margin < root.getHeight() / 3 ? margin : 0;
    }

    /**
     * Takes everything behind the panel out of the reading order, or puts it back.
     *
     * <p>The panel covers the feed for anyone looking at it, and covers nothing at all for
     * anyone swiping through it with a screen reader. Each view's own setting is kept so that
     * putting it back does not hand TikTok a value this project invented. Shared with the
     * catcher {@code PausePlayback} puts up on returning to the app, which is the same shape:
     * one view over the content root that has to be the only thing on the page.
     */
    public static void hideBehind(ViewGroup root, View panel, boolean hidden) {
        if (root == null) return;
        for (int index = 0; index < root.getChildCount(); index++) {
            View child = root.getChildAt(index);
            if (child == panel) continue;
            if (hidden) {
                Curtained state = previousAccessibilityImportance.get(child);
                if (state == null) {
                    state = new Curtained(child.getImportantForAccessibility());
                    previousAccessibilityImportance.put(child, state);
                }
                // Per panel, not a flag: the hold panel and the tap catcher share this, and
                // the later one lifting must not hand the feed back while the earlier one is
                // up. A panel curtaining twice, as the hold does on a relayout, counts once.
                state.panels.add(panel);
                child.setImportantForAccessibility(
                        View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
            } else {
                Curtained state = previousAccessibilityImportance.get(child);
                if (state == null) continue;
                state.panels.remove(panel);
                if (!state.panels.isEmpty()) continue;
                previousAccessibilityImportance.remove(child);
                child.setImportantForAccessibility(state.previous);
            }
        }
    }
}
