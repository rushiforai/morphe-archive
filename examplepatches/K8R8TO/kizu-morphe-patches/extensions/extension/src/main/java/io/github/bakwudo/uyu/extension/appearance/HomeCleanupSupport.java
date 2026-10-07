package io.github.bakwudo.uyu.extension.appearance;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.util.Map;
import java.util.WeakHashMap;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * Tier-1 Home/navigation controls for Twitch 31.3.1.
 *
 * All resource IDs referenced here were verified against the supplied Twitch 31.3.1 APKM.
 * This class reuses the existing stable BaseViewDelegate hook instead of adding another global
 * bytecode hook.
 */
@SuppressWarnings("unused")
public final class HomeCleanupSupport {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final int MAX_DEPTH = 16;
    private static final Map<View, Boolean> FORCED_VISIBLE = new WeakHashMap<>();
    private static final Map<View, Boolean> ROOTS_WATCHED = new WeakHashMap<>();
    private static final Map<ViewGroup, Boolean> SCROLL_WATCHED = new WeakHashMap<>();
    private static final Map<View, Boolean> ACTIVITY_WATCHED = new WeakHashMap<>();

    private HomeCleanupSupport() {
    }

    public static boolean disableLinkDisclaimer() {
        return Settings.DISABLE_LINK_DISCLAIMER.get();
    }

    public static void onViewCreated(View root) {
        try {
            // Exact Twitch 31.3.1 resource IDs for global/navigation/player controls.
            attachId(root, "create_button",
                    v -> Settings.HIDE_CREATE_BUTTON.get(), false);
            attachId(root, "following_nav_rail_create_button",
                    v -> Settings.HIDE_CREATE_BUTTON.get(), false);
            attachId(root, "cast_button",
                    v -> Settings.HIDE_CAST_BUTTON.get(), false);
            attachId(root, "create_clip_button_compose_view",
                    v -> Settings.HIDE_PLAYER_CREATE_CLIP_BUTTON.get(), false);
            attachId(root, "create_clip_text_button",
                    v -> Settings.HIDE_PLAYER_CREATE_CLIP_BUTTON.get(), false);
            attachId(root, "share_stream_button",
                    v -> Settings.HIDE_PLAYER_LIVE_SHARE_BUTTON.get(), false);

            forceVisibleId(root, "open_search_bar_text_view_container");
            forceVisibleId(root, "open_search_bar_text_view");
            forceVisibleId(root, "search_button");

            attachId(root, "recommended",
                    v -> Settings.HIDE_RECOMMENDATIONS.get(), false);
            attachId(root, "recommended_channels_list_title",
                    v -> Settings.HIDE_RECOMMENDATIONS.get(), false);
            attachId(root, "resume_auto_scroll_root",
                    v -> app.morphe.extension.settings.Settings.HIDE_RESUME_WATCHING.get(), false);

            watchForFollowingFeed(root);
        } catch (Throwable t) {
            Utils.logError("Failed to prepare Home tier-1 controls", t);
        }
    }

    public static void onActivityResumed(android.app.Activity activity) {
        if (activity == null) return;
        final View decor = activity.getWindow().getDecorView();
        if (decor == null) return;

        if (ACTIVITY_WATCHED.put(decor, Boolean.TRUE) == null) {
            ViewTreeObserver observer = decor.getViewTreeObserver();
            if (observer.isAlive()) {
                ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
                    scanActivityForFollowing(decor);
                };
                observer.addOnGlobalLayoutListener(listener);
                decor.postDelayed(() -> {
                    ViewTreeObserver current = decor.getViewTreeObserver();
                    if (current.isAlive()) current.removeOnGlobalLayoutListener(listener);
                }, 20000);
            }
        }

        scanActivityForFollowing(decor);
        long[] delays = {100, 300, 750, 1500, 3000, 6000, 12000};
        for (long delay : delays) {
            MAIN.postDelayed(() -> scanActivityForFollowing(decor), delay);
        }
    }

    private static void scanActivityForFollowing(View root) {
        try {
            ViewGroup recycler = findFollowingRecycler(root);
            if (recycler != null) {
                prepareFollowingRecycler(recycler);
            }
        } catch (Throwable t) {
            Utils.logError("Following activity scan failed", t);
        }
    }

    private static void watchForFollowingFeed(final View root) {
        if (ROOTS_WATCHED.put(root, Boolean.TRUE) != null) return;

        final View.OnAttachStateChangeListener attachListener = new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View attached) {
                attached.removeOnAttachStateChangeListener(this);
                watchFollowingWindow(attached);
                probeFollowingFeed(attached);
            }

            @Override
            public void onViewDetachedFromWindow(View detached) {
            }
        };
        root.addOnAttachStateChangeListener(attachListener);

        if (root.isAttachedToWindow()) {
            root.removeOnAttachStateChangeListener(attachListener);
            watchFollowingWindow(root);
        }

        scheduleFollowingProbe(root, 100);
        scheduleFollowingProbe(root, 500);
        scheduleFollowingProbe(root, 1200);
        scheduleFollowingProbe(root, 3000);
        scheduleFollowingProbe(root, 7000);
        scheduleFollowingProbe(root, 12000);
    }

    private static void watchFollowingWindow(final View root) {
        final View windowRoot = root.getRootView();
        if (ROOTS_WATCHED.put(windowRoot, Boolean.TRUE) != null) {
            probeFollowingFeed(root);
            return;
        }

        final ViewTreeObserver observer = windowRoot.getViewTreeObserver();
        if (!observer.isAlive()) return;

        final ViewTreeObserver.OnGlobalLayoutListener listener = new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                probeFollowingFeed(windowRoot);
            }
        };
        observer.addOnGlobalLayoutListener(listener);
        listener.onGlobalLayout();
        MAIN.postDelayed(() -> {
            ViewTreeObserver current = windowRoot.getViewTreeObserver();
            if (current.isAlive()) current.removeOnGlobalLayoutListener(listener);
        }, 15000);
    }

    private static void scheduleFollowingProbe(final View root, long delay) {
        MAIN.postDelayed(() -> probeFollowingFeed(root), delay);
    }

    private static void probeFollowingFeed(View root) {
        try {
            View windowRoot = root.getRootView();
            ViewGroup recycler = findFollowingRecycler(windowRoot);
            if (recycler != null) prepareFollowingRecycler(recycler);
        } catch (Throwable t) {
            Utils.logError("Following feed probe failed", t);
        }
    }

    private static void prepareFollowingRecycler(ViewGroup recycler) {
        attachId(recycler, "leaderboards_container",
                v -> Settings.HIDE_HOME_LEADERBOARDS.get(), false);
        attachId(recycler, "following_tab_turbo_button",
                v -> app.morphe.extension.settings.Settings.HIDE_TURBO_UPSELL.get(), false);
        attachId(recycler, "turbo_upsell_container",
                v -> app.morphe.extension.settings.Settings.HIDE_TURBO_UPSELL.get(), false);
        watchFollowingScroll(recycler);
        scanFollowingRecycler(recycler);
        scheduleRecyclerScan(recycler, 100);
        scheduleRecyclerScan(recycler, 500);
        scheduleRecyclerScan(recycler, 1200);
    }

    private static void watchFollowingScroll(final ViewGroup recycler) {
        if (SCROLL_WATCHED.put(recycler, Boolean.TRUE) != null) return;

        ViewTreeObserver observer = recycler.getViewTreeObserver();
        observer.addOnScrollChangedListener(() -> scheduleRecyclerScan(recycler, 100));
    }

    private static void scheduleRecyclerScan(final ViewGroup recycler, long delay) {
        MAIN.postDelayed(() -> {
            try {
                if (recycler.isAttachedToWindow()) scanFollowingRecycler(recycler);
            } catch (Throwable t) {
                Utils.logError("Following tier-1 scan failed", t);
            }
        }, delay);
    }

    private static void scanFollowingRecycler(ViewGroup recycler) {
        for (int i = 0; i < recycler.getChildCount(); i++) {
            View section = recycler.getChildAt(i);
            View header = findFollowingSectionHeader(section);
            if (header == null) continue;

            String title = collectText(section, 0).trim().toLowerCase(java.util.Locale.ROOT);
            HiddenView.Condition condition = null;

            if (containsAny(title, "resume watching", "continue watching")) {
                condition = v -> app.morphe.extension.settings.Settings.HIDE_RESUME_WATCHING.get();
            } else if (containsAny(title, "offline channels")) {
                condition = v -> app.morphe.extension.settings.Settings.HIDE_OFFLINE_CHANNELS.get();
            }

            if (condition != null) {
                // Hide/restore the complete RecyclerView section item, not its individual
                // descendants. This makes RecyclerView relayout the feed as one unit and
                // prevents partial offline rows or retained section-sized gaps.
                HiddenView.attach(section, condition, true);
            }
        }
    }

    private static View findFollowingSectionHeader(View root) {
        View header = findId(root, "following_tab_section_header");
        if (header != null) return header;
        if (!(root instanceof ViewGroup)) return null;

        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = findFollowingSectionHeader(group.getChildAt(i));
            if (child != null) return child;
        }
        return null;
    }

    private static String collectText(View view, int depth) {
        if (view == null || depth > MAX_DEPTH) return "";
        StringBuilder text = new StringBuilder();

        if (view instanceof TextView) {
            CharSequence value = ((TextView) view).getText();
            if (value != null) text.append(value).append(' ');
        }
        CharSequence description = view.getContentDescription();
        if (description != null) text.append(description).append(' ');

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                text.append(collectText(group.getChildAt(i), depth + 1));
            }
        }
        return text.toString();
    }

    private static boolean isFollowingSectionHeader(View view) {
        return findId(view, "following_tab_section_header") != null;
    }

    private static ViewGroup findFollowingRecycler(View root) {
        View view = findId(root, "following_list_recycler_view");
        return view instanceof ViewGroup ? (ViewGroup) view : null;
    }

    private static boolean isFollowingRoot(View root) {
        return findId(root, "following_list_recycler_view") != null
                || findId(root, "following_tab_section_header") != null
                || findId(root, "following_tab_turbo_button") != null;
    }

    private static ViewGroup findRecyclerAncestor(View view) {
        View current = view;
        for (int i = 0; i < MAX_DEPTH && current.getParent() instanceof ViewGroup; i++) {
            ViewGroup parent = (ViewGroup) current.getParent();
            if (parent.getClass().getName().contains("RecyclerView")) return parent;
            current = parent;
        }
        return null;
    }

    private static View findDirectRecyclerChild(View view, ViewGroup recycler) {
        View current = view;
        for (int i = 0; i < MAX_DEPTH && current.getParent() instanceof ViewGroup; i++) {
            if (current.getParent() == recycler) return current;
            current = (View) current.getParent();
        }
        return null;
    }

    private static boolean isGameHeading(String text) {
        return "games".equals(text)
                || "game".equals(text)
                || "categories".equals(text)
                || "followed categories".equals(text);
    }

    private static boolean containsAny(String text, String... needles) {
        for (String needle : needles) {
            if (text.contains(needle)) return true;
        }
        return false;
    }

    private static void attachId(View root, String name,
                                 HiddenView.Condition condition, boolean restore) {
        View view = findId(root, name);
        if (view != null) HiddenView.attach(view, condition, restore);
    }

    private static void forceVisibleId(View root, String name) {
        View view = findId(root, name);
        if (view == null || FORCED_VISIBLE.put(view, Boolean.TRUE) != null) return;

        ViewTreeObserver observer = view.getViewTreeObserver();
        observer.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                if (Settings.FORCE_SEARCH_BUTTON.get()
                        && view.getVisibility() != View.VISIBLE) {
                    view.setVisibility(View.VISIBLE);
                }
                return true;
            }
        });
    }

    private static View findId(View root, String name) {
        Context context = root.getContext();
        int id = Utils.getResourceId(context, name, "id");
        return id == 0 ? null : root.findViewById(id);
    }
}
