package com.feurstagram.extension;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;

/**
 * Watches the window for the bottom tab bar's "feed_tab" (Home) and "direct_tab"
 * (Messages) buttons and gives each a long-press that opens the Oxbow settings.
 *
 * This is the sole settings entry point. An injected action-bar button was tried
 * but failed to appear on many devices, since it depends on the feed's top action
 * bar being present and laid out a particular way. Long-pressing a tab only needs
 * the tab bar, which always exists, so settings stay reachable everywhere. The ids
 * are resolved by name (with a clone fallback) so they survive Instagram version bumps.
 *
 * It stays attached: Instagram can rebuild the tab buttons mid-session, and the
 * new ones need the long-press again. Each button is armed once, tracked weakly.
 */
public final class HomeTabWatcher implements ViewTreeObserver.OnGlobalLayoutListener {

    // Note: do NOT call setTag(...) on the tabs to mark them. Instagram stores its own
    // object in the tab's view tag and casts it back on resume, so an overwritten tag
    // crashes (ClassCastException).
    private static final View.OnLongClickListener OPEN_SETTINGS = v -> {
        Context activity = Settings.getActivityContext(v);
        if (activity == null) return false;
        Settings.show(activity);
        return true;
    };

    private final ViewGroup root;
    private WeakReference<View> armedHome = new WeakReference<>(null);
    private WeakReference<View> armedDirect = new WeakReference<>(null);

    public HomeTabWatcher(ViewGroup root) {
        this.root = root;
    }

    @Override
    public void onGlobalLayout() {
        Context context = root.getContext();
        if (context == null) return;
        View window = root.getRootView();

        View homeTab = find(context, window, "feed_tab");
        if (homeTab != null && homeTab != armedHome.get()) {
            homeTab.setOnLongClickListener(OPEN_SETTINGS);
            armedHome = new WeakReference<>(homeTab);
            // First launch with a signed-in account: point at the gesture just
            // installed. The tab bar only exists once the user is past the login
            // screens, so reaching here *is* "after the Instagram connection".
            // No-op once delivered or while a watch is already running.
            Onboarding.maybeShow(root);
        }
        // Oxbow: Messages opens them too, so Home can be hidden.
        View directTab = find(context, window, "direct_tab");
        if (directTab != null && directTab != armedDirect.get()) {
            directTab.setOnLongClickListener(OPEN_SETTINGS);
            armedDirect = new WeakReference<>(directTab);
        }
    }

    private static View find(Context context, View window, String name) {
        int id = Hiders.resolveId(context, name);
        return id == 0 || window == null ? null : window.findViewById(id);
    }
}
