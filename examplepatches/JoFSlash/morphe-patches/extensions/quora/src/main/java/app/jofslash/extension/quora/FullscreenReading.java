package app.jofslash.extension.quora;

import android.content.res.Resources;
import android.util.Log;
import android.view.View;
import android.view.ViewParent;

import java.lang.ref.WeakReference;

/**
 * Fullscreen reading: hides the top bar and the tabs of the main screen, or the top bar of an
 * answer or question page, while you scroll down, and shows them again when you scroll up or
 * reach the top.
 */
@SuppressWarnings("unused")
public final class FullscreenReading {

    private static final String TAG = "JoFSlashPatches";
    private static final String KEY = "fullscreenReading";

    // How far to scroll, in dp, before the bars hide or come back.
    private static final int TRAVEL_DP = 24;
    // Near the top of the page the bars always show.
    private static final int TOP_DP = 56;

    private static WeakReference<View> navBar = new WeakReference<>(null);
    private static WeakReference<View> tabs = new WeakReference<>(null);
    private static WeakReference<View> lastWebView = new WeakReference<>(null);
    private static boolean navBarHidden;
    private static boolean tabsHidden;
    private static int travel;
    // Hiding or showing a bar resizes the page, which scrolls it; those scrolls are not the reader's.
    private static final long SETTLE_MS = 450;
    private static long settleUntil;

    private FullscreenReading() {
    }

    /**
     * Injection point: start of QWebView.onScrollChanged.
     *
     * @param top    The new scroll position.
     * @param oldTop The previous scroll position.
     */
    public static void onScroll(View webView, int top, int oldTop) {
        try {
            if (webView == null) return;
            if (!PatchSettings.on(KEY)) {
                showBars();
                return;
            }
            if (!findBars(webView)) return;

            float density = webView.getResources().getDisplayMetrics().density;
            int delta = top - oldTop;
            if (android.os.SystemClock.uptimeMillis() < settleUntil) {
                travel = 0;
                return;
            }
            if (top < TOP_DP * density) {
                travel = 0;
                showBars();
                return;
            }
            // Count travel in one direction; a change of direction starts again.
            if ((delta > 0 && travel < 0) || (delta < 0 && travel > 0)) travel = 0;
            travel += delta;
            if (travel > TRAVEL_DP * density) {
                travel = 0;
                hideBars();
            } else if (travel < -TRAVEL_DP * density) {
                travel = 0;
                showBars();
            }
        } catch (Exception ex) {
            Log.e(TAG, "Fullscreen reading failed", ex);
        }
    }

    private static void hideBars() {
        View bar = navBar.get();
        if (bar != null && !navBarHidden && bar.getVisibility() == View.VISIBLE) {
            bar.setVisibility(View.GONE);
            navBarHidden = true;
            settle();
        }
        View tabBar = tabs.get();
        if (tabBar != null && !tabsHidden && tabBar.getVisibility() == View.VISIBLE) {
            tabBar.setVisibility(View.GONE);
            tabsHidden = true;
            settle();
        }
    }

    /** Shows only the bars this class hid, so bars Quora hid itself stay hidden. */
    private static void showBars() {
        View bar = navBar.get();
        if (bar != null && navBarHidden) {
            bar.setVisibility(View.VISIBLE);
            settle();
        }
        navBarHidden = false;
        View tabBar = tabs.get();
        if (tabBar != null && tabsHidden) {
            tabBar.setVisibility(View.VISIBLE);
            settle();
        }
        tabsHidden = false;
    }

    private static void settle() {
        settleUntil = android.os.SystemClock.uptimeMillis() + SETTLE_MS;
        travel = 0;
    }

    /**
     * The bars around this page: on the main screen its top bar and the tabs, on an answer or
     * question page that page's own top bar.
     *
     * @return Whether the page has bars to hide.
     */
    private static boolean findBars(View webView) {
        if (webView == lastWebView.get()) return navBar.get() != null || tabs.get() != null;
        View nav;
        View tabBar = null;
        View container = ancestorNamed(webView, "tab_container");
        if (container != null) {
            nav = findNamed(container, "q_navbar");
            tabBar = findNamed(container, "tab_bar_tabs");
        } else {
            nav = nearestNamed(webView, "q_navbar_wvf");
        }
        if (nav != navBar.get() || tabBar != tabs.get()) {
            // Another page: give back the bars hidden on the previous one first.
            showBars();
            navBar = new WeakReference<>(nav);
            tabs = new WeakReference<>(tabBar);
            navBarHidden = false;
            tabsHidden = false;
        }
        lastWebView = new WeakReference<>(webView);
        return nav != null || tabBar != null;
    }

    /** The closest view with this id above the page, that is, in the page's own screen. */
    private static View nearestNamed(View view, String name) {
        for (ViewParent p = view.getParent(); p instanceof View; p = p.getParent()) {
            View found = findNamed((View) p, name);
            if (found != null) return found;
        }
        return null;
    }

    /** Quora's view ids, by name, so the lookup works whatever number they got in this build. */
    private static String idName(View view) {
        int id = view.getId();
        if (id == View.NO_ID) return null;
        try {
            return view.getResources().getResourceEntryName(id);
        } catch (Resources.NotFoundException ex) {
            return null;
        }
    }

    private static View ancestorNamed(View view, String name) {
        for (ViewParent p = view.getParent(); p instanceof View; p = p.getParent()) {
            if (name.equals(idName((View) p))) return (View) p;
        }
        return null;
    }

    private static View findNamed(View root, String name) {
        if (name.equals(idName(root))) return root;
        if (root instanceof android.view.ViewGroup) {
            android.view.ViewGroup group = (android.view.ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findNamed(group.getChildAt(i), name);
                if (found != null) return found;
            }
        }
        return null;
    }
}
