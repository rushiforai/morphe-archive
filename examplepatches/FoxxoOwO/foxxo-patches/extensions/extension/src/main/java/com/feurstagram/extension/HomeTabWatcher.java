package com.feurstagram.extension;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

/**
 * Watches the bottom tab bar and installs the long-press settings gesture on every
 * tab it can see, not just Home.
 *
 * This is the sole settings entry point. An injected action-bar button was tried
 * but failed to appear on many devices, since it depends on the feed's top action
 * bar being present and laid out a particular way. Long-press only needs the tab
 * bar, which always exists - but binding it to the Home tab alone made the gesture
 * unreachable in chat-only mode, where Home is hidden, which left the toggles
 * (stories, ads, popups, ...) behind a debug build and an ADB broadcast.
 *
 * So every tab gets the listener plus the bar itself, and the watcher stays attached:
 * Instagram re-inflates the bar when the tab set changes, and a detached listener
 * would leave the new bar without the gesture. Setting the same listener again is a
 * no-op for touch handling. Ids are resolved by name (with a clone fallback) so this
 * survives version bumps.
 */
public final class HomeTabWatcher implements ViewTreeObserver.OnGlobalLayoutListener {

    /** Resolved by name on every pass; unknown ids are skipped. */
    private static final String[] TAB_IDS = {
            "feed_tab",
            "search_tab",
            "clips_tab",
            "creation_tab",
            "direct_tab",
            "profile_tab",
    };

    private final ViewGroup tabBar;

    private final View.OnLongClickListener openSettings = v -> {
        Context activity = Settings.getActivityContext(v);
        if (activity == null) return false;
        Settings.show(activity);
        return true;
    };

    public HomeTabWatcher(ViewGroup tabBar) {
        this.tabBar = tabBar;
    }

    @Override
    public void onGlobalLayout() {
        ViewGroup bar = tabBar;
        if (bar == null) return;
        Context context = bar.getContext();
        if (context == null) return;

        // The bar itself first, for layouts that route the touch here instead of a child.
        bind(bar);

        View root = bar.getRootView();
        if (root == null) return;
        for (String name : TAB_IDS) {
            int id = Hiders.resolveId(context, name);
            if (id == 0) continue; // resource not found yet; next pass will retry
            bind(root.findViewById(id));
        }
    }

    /**
     * Note: do NOT call view.setTag(...) to mark a view. Instagram stores its own
     * object in the tab's tag and casts it back on resume, so an overwritten tag
     * crashes with a ClassCastException.
     */
    private void bind(View view) {
        if (view == null) return;
        // Re-setting the same listener on every layout pass is harmless (it replaces
        // itself) and it is the only way to catch tabs Instagram swaps out on resume.
        view.setOnLongClickListener(openSettings);
    }
}
