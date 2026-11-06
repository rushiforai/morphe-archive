package dev.twitchpatches.extension.ui;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

final class UiFullscreenPolicy implements Application.ActivityLifecycleCallbacks {
    private static final WeakHashMap<Activity, Session> sessions = new WeakHashMap<>();

    static void initialize(Application app) { app.registerActivityLifecycleCallbacks(new UiFullscreenPolicy()); }

    private static Session session(Activity activity) {
        if (activity == null || !activity.getClass().getName().equals("tv.twitch.android.feature.viewer.landing.ViewerLandingActivity")) return null;
        Session value = sessions.get(activity);
        if (value == null) { value = new Session(activity); sessions.put(activity, value); }
        return value;
    }

    private static Activity activity(Context context) {
        for (int depth = 0; depth < 16; depth++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) break;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        return null;
    }

    static void nativeLayout(View root, boolean fullscreen) {
        if (root == null) return;
        Session value = session(activity(root.getContext()));
        if (value == null) return;
        value.nativePlayers.put(root, fullscreen);
        value.onGlobalLayout();
    }

    static void modernLayout(Activity activity, boolean fullscreen) {
        Session value = session(activity);
        if (value == null) return;
        value.modernFullscreen = fullscreen;
        value.onGlobalLayout();
    }

    static void hostBars(Activity activity, boolean hidden) {
        Session value = session(activity);
        if (value == null) return;
        value.bars.hostRequested(hidden);
        value.onGlobalLayout();
    }

    static int legacyRequest(View view, int flags) {
        Activity activity = activity(view.getContext());
        Session value = sessions.get(activity);
        if (value == null || value.subscription == null || activity.getWindow().getDecorView() != view) return flags;
        value.bars.hostRequestedFlags(view.getSystemUiVisibility(), flags);
        if (!value.fullscreen(activity)) return flags;
        if (UiSettings.enabled("fullscreen_hide_status_bar"))
            flags |= View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN;
        if (UiSettings.enabled("fullscreen_hide_navigation_bar"))
            flags |= View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
                    View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
        return flags;
    }

    static int showRequest(WindowInsetsController controller, int types) {
        for (var entry : sessions.entrySet()) {
            Activity activity = entry.getKey();
            Session value = entry.getValue();
            if (value.subscription == null || activity.getWindow().getInsetsController() != controller) continue;
            value.bars.hostRequestedShow(types);
            if (!value.fullscreen(activity)) return types;
            if (UiSettings.enabled("fullscreen_hide_status_bar")) types &= ~WindowInsets.Type.statusBars();
            if (UiSettings.enabled("fullscreen_hide_navigation_bar")) types &= ~WindowInsets.Type.navigationBars();
            return types;
        }
        return types;
    }

    static int filterInsets(View view, int types) {
        try {
            if (!"fullscreen_layout".equals(view.getResources().getResourceEntryName(view.getId()))) return types;
        } catch (android.content.res.Resources.NotFoundException missing) { return types; }
        Activity activity = activity(view.getContext());
        Session value = sessions.get(activity);
        if (value != null) value.container = new WeakReference<>(view);
        return filterInsets(activity, types);
    }

    static int filterInsets(Activity activity, int types) {
        Session value = sessions.get(activity);
        boolean fullscreen = value != null && value.subscription != null && value.fullscreen(activity);
        return UiInsetTypes.filter(types, fullscreen && UiSettings.enabled("fullscreen_hide_status_bar"),
                fullscreen && UiSettings.enabled("fullscreen_hide_navigation_bar"));
    }

    @Override public void onActivityResumed(Activity activity) { Session value = session(activity); if (value != null) value.start(); }
    @Override public void onActivityPaused(Activity activity) { Session value = sessions.get(activity); if (value != null) value.stop(); }
    @Override public void onActivityDestroyed(Activity activity) { Session value = sessions.remove(activity); if (value != null) value.stop(); }
    @Override public void onActivityCreated(Activity activity, Bundle state) { }
    @Override public void onActivityStarted(Activity activity) { }
    @Override public void onActivityStopped(Activity activity) { }
    @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }

    private static final class Session implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnWindowFocusChangeListener {
        private final WeakReference<Activity> reference;
        private final WeakHashMap<View, Boolean> nativePlayers = new WeakHashMap<>();
        private final UiWindowBars bars = new UiWindowBars();
        private final int containerId;
        private WeakReference<View> container = new WeakReference<>(null);
        private AutoCloseable subscription;
        private boolean modernFullscreen, applying;
        private boolean hideStatus, hideNavigation;

        Session(Activity activity) {
            reference = new WeakReference<>(activity);
            containerId = activity.getResources().getIdentifier("fullscreen_layout", "id", activity.getPackageName());
        }

        void start() {
            Activity activity = reference.get();
            if (activity == null || subscription != null) return;
            ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
            observer.addOnGlobalLayoutListener(this);
            observer.addOnWindowFocusChangeListener(this);
            subscription = UiSettings.observe(() -> {
                Activity current = reference.get();
                if (current != null) current.getWindow().getDecorView().post(this::onGlobalLayout);
            });
            bars.invalidate();
            onGlobalLayout();
        }

        void stop() {
            if (subscription != null) {
                try { subscription.close(); }
                catch (Exception error) { android.util.Log.w("TwitchPatchesUI", "Fullscreen subscription cleanup failed"); }
                subscription = null;
            }
            Activity activity = reference.get();
            if (activity == null) return;
            ViewTreeObserver observer = activity.getWindow().getDecorView().getViewTreeObserver();
            if (observer.isAlive()) {
                observer.removeOnGlobalLayoutListener(this);
                observer.removeOnWindowFocusChangeListener(this);
            }
            hideStatus = hideNavigation = false;
            bars.apply(activity.getWindow(), false, false);
            refreshInsets(activity);
        }

        @Override public void onWindowFocusChanged(boolean focused) {
            if (focused) { bars.invalidate(); onGlobalLayout(); }
        }

        @Override public void onGlobalLayout() {
            Activity activity = reference.get();
            if (activity == null || subscription == null || applying) return;
            boolean fullscreen = fullscreen(activity);
            boolean status = fullscreen && UiSettings.enabled("fullscreen_hide_status_bar");
            boolean navigation = fullscreen && UiSettings.enabled("fullscreen_hide_navigation_bar");
            applying = true;
            try {
                boolean changed = status != hideStatus || navigation != hideNavigation;
                hideStatus = status;
                hideNavigation = navigation;
                if (bars.apply(activity.getWindow(), status, navigation) || changed) refreshInsets(activity);
            } finally { applying = false; }
        }

        private boolean fullscreen(Activity activity) {
            if (activity.getResources().getConfiguration().orientation != Configuration.ORIENTATION_LANDSCAPE ||
                    activity.isInPictureInPictureMode()) return false;
            if (modernFullscreen) return true;
            for (var entry : nativePlayers.entrySet()) {
                View root = entry.getKey();
                if (entry.getValue() && root.isAttachedToWindow() && root.isShown()) return true;
            }
            return false;
        }

        private void refreshInsets(Activity activity) {
            View view = container.get();
            if ((view == null || !view.isAttachedToWindow()) && containerId != 0) {
                view = activity.getWindow().getDecorView().findViewById(containerId);
                container = new WeakReference<>(view);
            }
            if (view == null || !view.isAttachedToWindow()) return;
            WindowInsets insets = view.getRootWindowInsets();
            // A preference change can require new padding even when Android's insets are unchanged.
            if (insets != null) view.dispatchApplyWindowInsets(insets);
        }
    }
}
