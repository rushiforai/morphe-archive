package com.feurstagram.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.HorizontalScrollView;

/**
 * UI-level hiders and the landing-page redirect, all installed on the main
 * tab bar and the activity window. Each is a persistent global-layout listener
 * that resolves its target by resource name (with a clone fallback) so it
 * survives Instagram version bumps that reshuffle hex resource ids.
 */
public final class Hiders {

    private Hiders() {}

    private static boolean sRedirectDone = false;
    private static int sDirectAttempts = 0;

    /** Install every UI hider and the landing redirect on the tab-bar root and window. */
    public static void installAll(ViewGroup root) {
        if (root == null) return;
        Activity activity = Settings.getActivityContext(root) instanceof Activity
                ? (Activity) Settings.getActivityContext(root) : null;
        View decorView = (activity != null && activity.getWindow() != null)
                ? activity.getWindow().getDecorView()
                : root.getRootView();

        // 1. Kick off immediate direct redirect runnable
        attemptOpenDirect(root);

        // 2. Attach global layout listeners to decorView and root
        attachListeners(root, decorView);
        if (decorView != root) {
            attachListeners(root, root);
        }

        // Keep swipes off the pages whose tab was hidden.
        HiddenTabSwipeSkipper.install(root);
    }

    private static void attachListeners(ViewGroup root, View host) {
        if (host == null) return;
        ViewTreeObserver observer = host.getViewTreeObserver();
        if (observer == null || !observer.isAlive()) return;

        // Notes tray, Instants entry-points.
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "block_notes", "cf_hub_recycler_view"));
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "block_instants",
                "creation_entrypoint", "direct_quick_snap_consumption_preview"));

        // Notifications ("heart") button in the feed header.
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "block_notifications",
                true, false, "action_bar_buttons_container_right", "notification"));

        // Bottom-navigation icons: by default in chat-only mode, only Direct and Profile are shown.
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "nav_show_home", false, true, null, "feed_tab"));
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "nav_show_search", false, true, null, "search_tab"));
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "nav_show_reels", false, true, null, "clips_tab"));
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "nav_show_create", false, true, null, "creation_tab"));
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "nav_show_direct", true, true, null, "direct_tab"));
        observer.addOnGlobalLayoutListener(new VisibilityHider(root, "nav_show_profile", true, true, null, "profile_tab"));

        // Explicit bottom-navigation tabs hider ensuring Home, Reels, and Discover are removed.
        observer.addOnGlobalLayoutListener(new BottomTabsHider(root));

        // If bottom tabs are hidden, hide the bottom bar container entirely.
        observer.addOnGlobalLayoutListener(new TabBarHider(root));

        // Direct Inbox root handler: hide back button, handle Back press, and title long-press.
        observer.addOnGlobalLayoutListener(new DirectInboxHandler(root));

        // Profile tab long-press to open settings.
        observer.addOnGlobalLayoutListener(new ProfileTabWatcher(root));

        // "Friends" tab in the Reels viewer header.
        observer.addOnGlobalLayoutListener(new FriendsLaneHider(root));

        // Cold-start landing-page redirect.
        observer.addOnGlobalLayoutListener(new LandingWatcher(root));
    }

    static int resolveId(Context context, String name) {
        if (context == null) return 0;
        Resources resources = context.getResources();
        int id = resources.getIdentifier(name, "id", context.getPackageName());
        if (id == 0) {
            id = resources.getIdentifier(name, "id", "com.instagram.android");
        }
        return id;
    }

    /**
     * Attempts to open Direct Messages on launch by simulating click on inbox button,
     * or dispatching the direct deep link intent.
     */
    public static void attemptOpenDirect(View root) {
        if (sRedirectDone || root == null) return;
        Context context = root.getContext();
        if (context == null) return;

        Activity activity = Settings.getActivityContext(root) instanceof Activity
                ? (Activity) Settings.getActivityContext(root) : null;
        if (activity == null && context instanceof Activity) {
            activity = (Activity) context;
        }

        // Check if intent already has specific destination (external shared post, etc.)
        if (activity != null && activity.getIntent() != null) {
            Intent startIntent = activity.getIntent();
            android.net.Uri data = startIntent.getData();
            if (data != null && data.toString().contains("direct")) {
                sRedirectDone = true;
                return;
            }
            if (data != null && Intent.ACTION_VIEW.equals(startIntent.getAction())) {
                sRedirectDone = true;
                return;
            }
        }

        View searchRoot = (activity != null && activity.getWindow() != null)
                ? activity.getWindow().getDecorView()
                : root.getRootView();
        if (searchRoot == null) searchRoot = root;

        // If Direct Inbox is already visible, mark done
        int inboxBarId = resolveId(context, "direct_inbox_action_bar");
        if (inboxBarId != 0) {
            View bar = searchRoot.findViewById(inboxBarId);
            if (bar != null && bar.getVisibility() == View.VISIBLE) {
                sRedirectDone = true;
                return;
            }
        }

        // Try direct tab or action bar inbox button
        View view = null;
        int directTabId = resolveId(context, "direct_tab");
        if (directTabId != 0) view = searchRoot.findViewById(directTabId);
        if (view == null) {
            int inboxBtnId = resolveId(context, "action_bar_inbox_button");
            if (inboxBtnId != 0) view = searchRoot.findViewById(inboxBtnId);
        }
        if (view == null) {
            int directBtnId = resolveId(context, "direct_button");
            if (directBtnId != 0) view = searchRoot.findViewById(directBtnId);
        }

        if (view != null && view.isShown()) {
            boolean clicked = view.performClick();
            if (clicked) {
                sRedirectDone = true;
                return;
            }
        }

        sDirectAttempts++;
        if (sDirectAttempts < 15) {
            root.postDelayed(() -> attemptOpenDirect(root), 50);
        } else {
            // Fallback: deep-link intent
            try {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("instagram://direct"));
                intent.setPackage(context.getPackageName());
                if (activity != null) {
                    activity.startActivity(intent);
                } else {
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                }
            } catch (Throwable ignored) {}
            sRedirectDone = true;
        }
    }

    /**
     * Applies GONE/VISIBLE to one or more named views on every layout pass,
     * driven by a block_* preference. Toggling the preference off restores the
     * views on the next pass.
     */
    static final class VisibilityHider implements ViewTreeObserver.OnGlobalLayoutListener {
        private final ViewGroup root;
        private final String key;
        private final boolean defaultValue;
        private final boolean invert;
        private final String scope;
        private final String[] names;

        VisibilityHider(ViewGroup root, String key, String... names) {
            this(root, key, true, false, null, names);
        }

        VisibilityHider(ViewGroup root, String key, boolean defaultValue, boolean invert,
                        String scope, String... names) {
            this.root = root;
            this.key = key;
            this.defaultValue = defaultValue;
            this.invert = invert;
            this.scope = scope;
            this.names = names;
        }

        @Override
        public void onGlobalLayout() {
            Context context = root.getContext();
            if (context == null) return;
            Activity activity = Settings.getActivityContext(root) instanceof Activity
                    ? (Activity) Settings.getActivityContext(root) : null;
            View searchRoot = (activity != null && activity.getWindow() != null)
                    ? activity.getWindow().getDecorView()
                    : root.getRootView();
            if (searchRoot == null) searchRoot = root;
            if (scope != null) {
                int scopeId = resolveId(context, scope);
                View scopeView = scopeId == 0 ? null : searchRoot.findViewById(scopeId);
                if (scopeView == null) return;
                searchRoot = scopeView;
            }
            boolean pref = Config.getBlocked(key, defaultValue);
            boolean hidden = invert ? !pref : pref;
            int visibility = hidden ? View.GONE : View.VISIBLE;
            for (String name : names) {
                int id = resolveId(context, name);
                if (id == 0) continue;
                View view = searchRoot.findViewById(id);
                if (view != null) view.setVisibility(visibility);
            }
        }
    }

    /**
     * Unconditionally removes Home, Reels, Discover/Search, and Create tabs from the bottom menu.
     */
    static final class BottomTabsHider implements ViewTreeObserver.OnGlobalLayoutListener {
        private final ViewGroup root;

        BottomTabsHider(ViewGroup root) {
            this.root = root;
        }

        @Override
        public void onGlobalLayout() {
            Context context = root.getContext();
            if (context == null) return;
            Activity activity = Settings.getActivityContext(root) instanceof Activity
                    ? (Activity) Settings.getActivityContext(root) : null;
            View searchRoot = (activity != null && activity.getWindow() != null)
                    ? activity.getWindow().getDecorView()
                    : root.getRootView();
            if (searchRoot == null) searchRoot = root;

            int feedTabId = resolveId(context, "feed_tab");
            int searchTabId = resolveId(context, "search_tab");
            int clipsTabId = resolveId(context, "clips_tab");
            int createTabId = resolveId(context, "creation_tab");

            hideView(searchRoot, feedTabId);
            hideView(searchRoot, searchTabId);
            hideView(searchRoot, clipsTabId);
            hideView(searchRoot, createTabId);

            hideView(root, feedTabId);
            hideView(root, searchTabId);
            hideView(root, clipsTabId);
            hideView(root, createTabId);
        }

        private static void hideView(View container, int id) {
            if (container != null && id != 0) {
                View v = container.findViewById(id);
                if (v != null && v.getVisibility() != View.GONE) {
                    v.setVisibility(View.GONE);
                }
            }
        }
    }

    /**
     * Hides the "Friends" tab from the Reels viewer top action bar.
     */
    static final class FriendsLaneHider implements ViewTreeObserver.OnGlobalLayoutListener {
        private final ViewGroup root;

        FriendsLaneHider(ViewGroup root) {
            this.root = root;
        }

        @Override
        public void onGlobalLayout() {
            Context context = root.getContext();
            if (context == null) return;
            View searchRoot = root.getRootView();
            if (searchRoot == null) searchRoot = root;

            int barId = resolveId(context, "clips_viewer_action_bar");
            if (barId == 0) return;
            View bar = searchRoot.findViewById(barId);
            if (bar == null) return;

            int tabsId = resolveId(context, "action_bar_tab_layout");
            if (tabsId == 0) return;
            View tabs = bar.findViewById(tabsId);
            if (!(tabs instanceof ViewGroup)) return;

            ViewGroup strip = (ViewGroup) tabs;
            if (strip instanceof HorizontalScrollView && strip.getChildCount() == 1
                    && strip.getChildAt(0) instanceof ViewGroup) {
                strip = (ViewGroup) strip.getChildAt(0);
            }

            int visibility = Config.isFriendsLaneBlocked() ? View.GONE : View.VISIBLE;
            for (int i = 1; i < strip.getChildCount(); i++) {
                strip.getChildAt(i).setVisibility(visibility);
            }
        }
    }

    /**
     * Hides the bottom navigation bar when all tabs or non-direct tabs are hidden.
     */
    static final class TabBarHider implements ViewTreeObserver.OnGlobalLayoutListener {
        private final ViewGroup root;

        TabBarHider(ViewGroup root) {
            this.root = root;
        }

        @Override
        public void onGlobalLayout() {
            Context context = root.getContext();
            if (context == null) return;

            boolean showDirect = Config.isNavTabShown("nav_show_direct");
            int directTabId = resolveId(context, "direct_tab");
            View directTab = directTabId == 0 ? null : root.findViewById(directTabId);
            if (showDirect && directTab != null && directTab.getVisibility() == View.VISIBLE) {
                root.setVisibility(View.VISIBLE);
                return;
            }

            boolean anyOtherVisible = Config.isNavTabShown("nav_show_home")
                    || Config.isNavTabShown("nav_show_search")
                    || Config.isNavTabShown("nav_show_create")
                    || Config.isNavTabShown("nav_show_reels")
                    || Config.isNavTabShown("nav_show_profile");

            root.setVisibility(anyOtherVisible ? View.VISIBLE : View.GONE);
        }
    }

    /**
     * Direct Inbox root handler:
     * - Hides the back arrow so the user stays inside the chat app
     * - Enables opening Settings via long-press on the direct inbox title
     * - Intercepts system back key to minimize to home screen
     */
    static final class DirectInboxHandler implements ViewTreeObserver.OnGlobalLayoutListener {
        private final ViewGroup root;

        DirectInboxHandler(ViewGroup root) {
            this.root = root;
        }

        @Override
        public void onGlobalLayout() {
            Context context = root.getContext();
            if (context == null) return;
            Activity activity = Settings.getActivityContext(root) instanceof Activity
                    ? (Activity) Settings.getActivityContext(root) : null;
            View searchRoot = (activity != null && activity.getWindow() != null)
                    ? activity.getWindow().getDecorView()
                    : root.getRootView();
            if (searchRoot == null) searchRoot = root;

            int barId = resolveId(context, "direct_inbox_action_bar");
            if (barId == 0) return;
            View bar = searchRoot.findViewById(barId);
            if (bar == null || bar.getVisibility() != View.VISIBLE) return;

            // Hide back button in Direct Inbox root so back does not fall through
            int backId = resolveId(context, "action_bar_button_back");
            if (backId != 0) {
                View backBtn = bar.findViewById(backId);
                if (backBtn != null && backBtn.getVisibility() != View.GONE) {
                    backBtn.setVisibility(View.GONE);
                }
            }

            // Hook long-click on inbox title to open Settings
            int titleId = resolveId(context, "action_bar_title");
            if (titleId == 0) titleId = resolveId(context, "action_bar_large_title");
            View titleView = titleId == 0 ? bar : bar.findViewById(titleId);
            if (titleView != null) {
                titleView.setOnLongClickListener(v -> {
                    Context act = Settings.getActivityContext(v);
                    if (act != null) {
                        Settings.show(act);
                        return true;
                    }
                    return false;
                });
            }

            // Intercept system Back key while in Direct Inbox: minimize app
            bar.setFocusableInTouchMode(true);
            bar.setOnKeyListener((v, keyCode, event) -> {
                if (keyCode == android.view.KeyEvent.KEYCODE_BACK && event.getAction() == android.view.KeyEvent.ACTION_UP) {
                    Context act = Settings.getActivityContext(v);
                    if (act instanceof Activity) {
                        ((Activity) act).moveTaskToBack(true);
                        return true;
                    }
                }
                return false;
            });
        }
    }

    /**
     * Enables opening Settings via long-press on the profile tab.
     */
    static final class ProfileTabWatcher implements ViewTreeObserver.OnGlobalLayoutListener {
        private final ViewGroup root;
        private boolean hooked = false;

        ProfileTabWatcher(ViewGroup root) {
            this.root = root;
        }

        @Override
        public void onGlobalLayout() {
            if (hooked || root == null) return;
            Context context = root.getContext();
            if (context == null) return;
            int profileId = resolveId(context, "profile_tab");
            if (profileId == 0) return;
            View profileTab = root.findViewById(profileId);
            if (profileTab == null) {
                View searchRoot = root.getRootView();
                if (searchRoot != null) profileTab = searchRoot.findViewById(profileId);
            }
            if (profileTab != null) {
                profileTab.setOnLongClickListener(v -> {
                    Context act = Settings.getActivityContext(v);
                    if (act != null) {
                        Settings.show(act);
                        return true;
                    }
                    return false;
                });
                hooked = true;
            }
        }
    }

    /**
     * Redirects to the chosen landing surface on launch.
     */
    static final class LandingWatcher implements ViewTreeObserver.OnGlobalLayoutListener {
        private ViewGroup container;

        LandingWatcher(ViewGroup container) {
            this.container = container;
        }

        @Override
        public void onGlobalLayout() {
            if (sRedirectDone || container == null) {
                detach();
                return;
            }
            attemptOpenDirect(container);
            if (sRedirectDone) {
                detach();
            }
        }

        private void detach() {
            ViewGroup r = container;
            if (r != null) {
                r.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                container = null;
            }
        }
    }
}
