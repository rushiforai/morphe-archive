package app.onlynazril.extension.tiktok.settings;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import app.onlynazril.extension.tiktok.internal.Debug;

/**
 * Opens Tweaks by holding the Home tab in TikTok's bottom bar.
 *
 * The system Home key never reaches an app, so the shortcut is on the app's own Home tab. The bar
 * is found by resource id ({@code bottom_tab_container}, with {@code bottom_tab_layout} as the
 * fallback), and the first clickable child in it is the Home tab: the bar order is Home, Friends,
 * create, Inbox, Profile on every build checked. The id names are readable in 47.7.1 and 47.7.2,
 * which is why this is a runtime lookup rather than a bytecode anchor.
 *
 * One listener per resumed activity, installed from the layout pass so it lands on a bar that has
 * been measured, and removed again when the switch is turned off.
 */
public final class HomeHold {
    private static final String ID_CONTAINER = "bottom_tab_container";
    private static final String ID_LAYOUT = "bottom_tab_layout";
    private static final int MAX_DEPTH = 24;

    private static final Set<Activity> WATCHED = Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<View, Boolean> OURS = Collections.synchronizedMap(new WeakHashMap<>());

    private static volatile boolean installed;
    private static volatile boolean toldInstalled;
    private static volatile boolean toldMissing;

    private HomeHold() {}

    /** Registers the lifecycle hook once, as early as the application context is available. */
    public static void install(Context context) {
        if (installed || !(context instanceof Application)) return;
        synchronized (HomeHold.class) {
            if (installed) return;
            ((Application) context).registerActivityLifecycleCallbacks(new Lifecycle());
            installed = true;
        }
    }

    private static void resumed(Activity activity) {
        if (activity == null) return;
        if (!WATCHED.add(activity)) {
            attach(activity);
            return;
        }
        try {
            activity.getWindow().getDecorView().getViewTreeObserver()
                    .addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                        @Override
                        public void onGlobalLayout() {
                            attach(activity);
                        }
                    });
        } catch (Throwable t) {
            Debug.print("home hold: cannot watch layout (" + t + ")");
        }
        attach(activity);
    }

    private static void attach(Activity activity) {
        try {
            View bar = bar(activity);
            View home = bar != null ? firstTab(bar) : fallbackTab(activity);
            // Last resort: a bar drawn as one opaque view has no tab to name. Holding anywhere on
            // the bar is still better than a switch that does nothing, and the log says which
            // shape was found.
            if (home == null && bar != null) home = bar;
            if (home == null) {
                if (!toldMissing) {
                    toldMissing = true;
                    Debug.print("home hold: no tab-sized view at the bottom");
                }
                return;
            }
            if (OURS.containsKey(home) || home.isLongClickable()) return;

            home.setLongClickable(true);
            home.setOnLongClickListener(view -> {
                view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                TikTokActivityHook.open(activity);
                return true;
            });
            OURS.put(home, Boolean.TRUE);
            if (!toldInstalled) {
                toldInstalled = true;
                Debug.print("home hold: long press on " + home.getClass().getName()
                        + " (" + home.getWidth() + " wide)");
            }
        } catch (Throwable t) {
            Debug.print("home hold: " + t);
        }
    }

    /** The bottom bar, resolved by id and accepted only when it sits in the lower half. */
    private static View bar(Activity activity) {
        Resources resources = activity.getResources();
        String pkg = activity.getPackageName();
        int id = resources.getIdentifier(ID_CONTAINER, "id", pkg);
        if (id == 0) id = resources.getIdentifier(ID_LAYOUT, "id", pkg);
        if (id == 0) return null;

        View view = activity.findViewById(id);
        if (view == null) return null;
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        int height = resources.getDisplayMetrics().heightPixels;
        return at[1] > height / 2 ? view : null;
    }

    /**
     * The bar found without its id: the first tab-sized clickable view in the bottom fifth of the
     * screen. Kept as a fallback because a build may strip the resource names the id lookup needs.
     */
    private static View fallbackTab(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        int height = decor.getHeight();
        int width = decor.getWidth();
        if (height <= 0 || width <= 0) return null;

        List<View> clickable = new ArrayList<>();
        collect(decor, clickable, 0);
        for (View view : clickable) {
            int w = view.getWidth();
            if (w < width / 8 || w > (width * 2) / 5) continue;
            int[] at = new int[2];
            view.getLocationOnScreen(at);
            if (at[1] < (height * 4) / 5) continue;
            return view;
        }
        return null;
    }

    /**
     * The first tab-sized clickable view under the bar.
     *
     * The container is a bottom-gravity placeholder that TikTok fills at runtime, and some builds
     * put one clickable wrapper around the whole bar. Taking the first clickable view outright
     * would then put the long press on the bar itself, so a tab has to be roughly a fifth of the
     * bar's width. The icon inside a tab is narrower than that and is only a fallback.
     */
    private static View firstTab(View bar) {
        int width = bar.getWidth();
        List<View> clickable = new ArrayList<>();
        collect(bar, clickable, 0);
        View fallback = null;
        for (View view : clickable) {
            int w = view.getWidth();
            if (w <= 0) continue;
            if (width > 0 && w >= width / 8 && w <= (width * 2) / 5) return view;
            if (fallback == null && width > 0 && w < (width * 3) / 5) fallback = view;
        }
        return fallback;
    }

    private static void collect(View view, List<View> out, int depth) {
        if (!(view instanceof ViewGroup) || depth > MAX_DEPTH) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            if (child.isClickable() && child.getWidth() > 0 && child.getHeight() > 0) {
                out.add(child);
            }
            collect(child, out, depth + 1);
        }
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle state) {}

        @Override
        public void onActivityStarted(Activity activity) {}

        @Override
        public void onActivityResumed(Activity activity) {
            HomeHold.resumed(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {}

        @Override
        public void onActivityStopped(Activity activity) {}

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle state) {}

        @Override
        public void onActivityDestroyed(Activity activity) {
            WATCHED.remove(activity);
        }
    }
}
