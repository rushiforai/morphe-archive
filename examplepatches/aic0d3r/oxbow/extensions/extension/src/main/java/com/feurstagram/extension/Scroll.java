package com.feurstagram.extension;

import android.view.View;
import android.view.ViewGroup;

/**
 * The reel viewer, hooked as it creates its pager:
 * - endless scrolling: the pager starts with swiping disabled, so a reel opened from a DM,
 *   a profile or a search result stays a single reel;
 * - comments: the "Add comment..." bar under the reel is hidden. The viewer runs in its own
 *   activity, out of reach of the tab-bar hiders, so the hider is installed from here.
 */
public final class Scroll {

    private Scroll() {}

    /** Hook, right after the reel viewer stores its ViewPager2. */
    public static void onReelPager(Object pager) {
        if (!(pager instanceof View)) return;
        View view = (View) pager;
        if (Config.isEndlessScrollBlocked()) {
            try {
                pager.getClass().getMethod("setUserInputEnabled", boolean.class).invoke(pager, false);
            } catch (Throwable ignored) {
            }
        }
        if (Config.isCommentsBlocked()) {
            view.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                View root = view.getRootView();
                if (!(root instanceof ViewGroup)) return;
                int id = Hiders.resolveId(root.getContext(), "comment_composer_inner_layout");
                View bar = id == 0 ? null : root.findViewById(id);
                if (bar != null && bar.getVisibility() != View.GONE) bar.setVisibility(View.GONE);
            });
        }
    }
}
