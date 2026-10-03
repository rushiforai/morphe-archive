/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Layout;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.facebook.feed.HomeFeedFilter;
import app.morphe.extension.facebook.settings.DeVancedSettings;

/**
 * High-Performance Runtime Ad Interceptor for Facebook v573+
 *
 * Scans all active windows (Feed, Reels, Stories, Overlays) directly via:
 * 1. WindowManagerGlobal reflection (all active window decor views).
 * 2. Litho TextDrawable & StaticLayout inspection (extracts rendered canvas text).
 * 3. Exact matching for 'Ad Ã‚Â· Ã°Å¸Å’Â', 'Ã°Å¸â€œÂ£ Ad Ã‚Â· Part 1 / 2', 'Sponsored', 'Suggested for you'.
 * 4. Collapses the root post or reel container (View.GONE, height=0).
 */
public final class FeedSanitizer {

    private static final String TAG = "MorpheFeedSanitizer";
    private static final Handler sHandler = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<View, ViewState> sOriginalStates = new WeakHashMap<>();
    private static volatile boolean sInitialized = false;
    private static volatile boolean sPerformanceMode = false;
    private static volatile boolean sLoopRunning = false;
    private static volatile long sScanIntervalMs = 300L;
    private static WeakReference<Activity> sCurrentActivity = null;
    private static final java.util.Set<Activity> sActiveActivities =
            java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static final java.util.Set<View> sObservedViews =
            java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static volatile int sScanCycleCount = 0;

    private static final String[] SPONSORED_KEYWORDS = {
            "sponsored",
            "suggested for you",
            "paid partnership",
            "promoted"
    };

    private static final Runnable sScanLoop = new Runnable() {
        @Override
        public void run() {
            if (!sLoopRunning || sPerformanceMode) {
                sLoopRunning = false;
                return;
            }
            try {
                if (shouldScan()) scanAllActiveWindows();
            } catch (Throwable t) {
                Log.w(TAG, "Scan cycle exception: ", t);
            }
            if (sLoopRunning && !sPerformanceMode) {
                sHandler.postDelayed(this, sScanIntervalMs);
            } else {
                sLoopRunning = false;
            }
        }
    };

    private static class ViewState {
        int visibility;
        int height;
        ViewState(int v, int h) {
            this.visibility = v;
            this.height = h;
        }
    }

    private FeedSanitizer() {}

    public static void enablePerformanceMode() {
        setPerformanceMode(true);
    }

    public static synchronized void setPerformanceMode(boolean enabled) {
        sPerformanceMode = enabled;
        sScanIntervalMs = enabled ? 1_200L : 300L;
        if (enabled) {
            stopBackgroundScanning();
        } else if (sInitialized) {
            collectPreExistingActivities();
            startBackgroundScanning();
            requestScan();
        }
    }

    public static void requestScan() {
        if (sPerformanceMode || !shouldScan()) return;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            scanAllActiveWindows();
        } else {
            sHandler.post(() -> {
                if (shouldScan()) scanAllActiveWindows();
            });
        }
    }

    public static synchronized void initialize(Application app) {
        if (sInitialized || app == null) return;
        sInitialized = true;

        Log.i(TAG, "Initializing FeedSanitizer ad & AI blocker...");

        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                if (activity != null && !sPerformanceMode) {
                    sActiveActivities.add(activity);
                    sCurrentActivity = new WeakReference<>(activity);
                    attachDecorListeners(activity);
                }
            }

            @Override
            public void onActivityStarted(Activity activity) {
                if (activity != null && !sPerformanceMode) {
                    sActiveActivities.add(activity);
                    sCurrentActivity = new WeakReference<>(activity);
                    attachDecorListeners(activity);
                }
            }

            @Override
            public void onActivityResumed(Activity activity) {
                if (activity != null && !sPerformanceMode) {
                    sActiveActivities.add(activity);
                    sCurrentActivity = new WeakReference<>(activity);
                    attachDecorListeners(activity);
                    requestScan();
                }
            }

            @Override
            public void onActivityPaused(Activity activity) {
                // Keep activity in sActiveActivities so decor view is never lost
            }

            @Override public void onActivityStopped(Activity a) {}
            @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (activity != null) {
                    sActiveActivities.remove(activity);
                    if (sCurrentActivity != null && sCurrentActivity.get() == activity) {
                        sCurrentActivity = null;
                    }
                }
            }
        });

        if (sPerformanceMode) {
            Log.i(TAG, "Performance mode active; runtime scanning disabled.");
            return;
        }

        collectPreExistingActivities();
        startBackgroundScanning();
    }

    private static synchronized void startBackgroundScanning() {
        if (!sInitialized || sPerformanceMode || sLoopRunning) return;
        sLoopRunning = true;
        sHandler.post(sScanLoop);
        Log.i(TAG, "FeedSanitizer loop started successfully.");
    }

    private static void collectPreExistingActivities() {
        try {
            Class<?> atClass = Class.forName("android.app.ActivityThread");
            Method currentAtMethod = atClass.getDeclaredMethod("currentActivityThread");
            currentAtMethod.setAccessible(true);
            Object at = currentAtMethod.invoke(null);
            if (at != null) {
                Field mActivitiesField = atClass.getDeclaredField("mActivities");
                mActivitiesField.setAccessible(true);
                Object activitiesMap = mActivitiesField.get(at);
                if (activitiesMap instanceof Map) {
                    for (Object record : ((Map<?, ?>) activitiesMap).values()) {
                        if (record != null) {
                            Field activityField = record.getClass().getDeclaredField("activity");
                            activityField.setAccessible(true);
                            Activity act = (Activity) activityField.get(record);
                            if (act != null && !act.isFinishing() && !act.isDestroyed()) {
                                sActiveActivities.add(act);
                                sCurrentActivity = new WeakReference<>(act);
                                attachDecorListeners(act);
                            }
                        }
                    }
                }
            }
        } catch (Throwable ignored) {}
    }

    private static void attachDecorListeners(Activity activity) {
        if (sPerformanceMode || activity == null || activity.getWindow() == null) return;
        View decor = activity.getWindow().peekDecorView();
        if (decor == null) {
            try {
                decor = activity.getWindow().getDecorView();
            } catch (Throwable ignored) {
            }
        }
        if (decor != null && sObservedViews.add(decor)) {
            android.view.ViewTreeObserver vto = decor.getViewTreeObserver();
            if (vto != null && vto.isAlive()) {
                vto.addOnScrollChangedListener(FeedSanitizer::requestScan);
            }
        }
    }

    private static boolean shouldScan() {
        return !sPerformanceMode && (DeVancedSettings.isAdsDisabled() ||
                DeVancedSettings.isAiFilterEnabled() ||
                DeVancedSettings.isHomeReelsHidden() ||
                DeVancedSettings.isHomeStoriesHidden() ||
                DeVancedSettings.isHomeSuggestionsHidden());
    }

    public static synchronized void stopBackgroundScanning() {
        sLoopRunning = false;
        sHandler.removeCallbacks(sScanLoop);
        sOriginalStates.clear();
        sCurrentActivity = null;
        sActiveActivities.clear();
    }

    public static synchronized void trimCaches() {
        sOriginalStates.clear();
    }

    /**
     * Scans all active windows from live activities and WindowManagerGlobal.
     */
    private static void scanAllActiveWindows() {
        Activity currentActivity =
                sCurrentActivity == null ? null : sCurrentActivity.get();
        if (currentActivity != null &&
                currentActivity.getClass().getName().startsWith(
                        "app.morphe.extension.facebook.settings."
                )) {
            return;
        }

        List<View> roots = new ArrayList<>();

        // 1. Gather all decor views from all live activities
        for (Activity a : sActiveActivities) {
            if (a != null && !a.isFinishing() && !a.isDestroyed() && a.getWindow() != null) {
                View decor = a.getWindow().peekDecorView();
                if (decor == null) {
                    try {
                        decor = a.getWindow().getDecorView();
                    } catch (Throwable ignored) {}
                }
                if (decor != null && !roots.contains(decor)) {
                    roots.add(decor);
                    attachDecorListeners(a);
                }
            }
        }

        // If roots is still empty, attempt fallback activity collection
        if (roots.isEmpty()) {
            collectPreExistingActivities();
            for (Activity a : sActiveActivities) {
                if (a != null && !a.isFinishing() && !a.isDestroyed() && a.getWindow() != null) {
                    View decor = a.getWindow().peekDecorView();
                    if (decor == null) {
                        try {
                            decor = a.getWindow().getDecorView();
                        } catch (Throwable ignored) {}
                    }
                    if (decor != null && !roots.contains(decor)) {
                        roots.add(decor);
                        attachDecorListeners(a);
                    }
                }
            }
        }

        // 2. Also check WindowManagerGlobal for dialog / popup windows
        List<View> wmgRoots = getAllActiveRootViews();
        for (View v : wmgRoots) {
            if (v != null && !roots.contains(v)) {
                roots.add(v);
            }
        }

        for (View root : roots) {
            if (root != null &&
                    root.getVisibility() == View.VISIBLE &&
                    !isDeVancedSettingsRoot(root)) {
                scanViewTree(root, 0);
            }
        }

        sScanCycleCount++;
        if (sScanCycleCount <= 5 || sScanCycleCount % 30 == 0) {
            Log.i(TAG, "Scan #" + sScanCycleCount + " roots=" + roots.size()
                    + " activities=" + sActiveActivities.size());
        }
    }

    private static boolean isDeVancedSettingsRoot(View root) {
        Context context = root.getContext();
        while (context != null) {
            if (context.getClass().getName().startsWith(
                    "app.morphe.extension.facebook.settings."
            )) {
                return true;
            }
            if (!(context instanceof ContextWrapper)) return false;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) return false;
            context = next;
        }
        return false;
    }

    /**
     * Traverses the view tree, inspects each view for sponsored/AI text/drawables,
     * and collapses the parent post or reel container.
     */
    private static void scanViewTree(View view, int depth) {
        if (view == null || depth > 30) return;

        // Skip pure video surfaces to save CPU
        if (isVideoSurface(view)) return;

        // Check if this view (or its drawables / StaticLayouts) contains ad or AI text
        if (hasSponsoredText(view)) {
            View postOrReelRoot = findPostOrReelRoot(view);
            if (postOrReelRoot != null) {
                hideAdView(postOrReelRoot);
                return; // Stop scanning children of this hidden ad item
            }
        }

        // Recurse into children if it's a ViewGroup
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                scanViewTree(vg.getChildAt(i), depth + 1);
            }
        }
    }

    /**
     * Multi-layer ad and AI detector:
     * 1. ContentDescription
     * 2. TextView / Button getText()
     * 3. View Tag
     * 4. Litho Canvas Drawables & StaticLayouts
     */
    private static boolean hasSponsoredText(View view) {
        if (view == null) return false;

        // 1. Content Description
        CharSequence desc = view.getContentDescription();
        if (isBlockedLabel(desc)) {
            Log.i(TAG, "Matched contentDescription: " + desc);
            return true;
        }

        // 2. TextView / Button
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text != null && text.length() > 0 && text.length() < 100 && sScanCycleCount <= 3) {
                Log.d(TAG, "TV: '" + text + "' class=" + view.getClass().getSimpleName());
            }
            if (isBlockedLabel(text)) {
                Log.i(TAG, "Matched TextView text: " + text);
                return true;
            }
        }

        // 3. View Tag
        Object tag = view.getTag();
        if (tag instanceof CharSequence && isBlockedLabel((CharSequence) tag)) {
            Log.i(TAG, "Matched tag: " + tag);
            return true;
        }

        // 4. Litho Canvas Drawables & StaticLayouts
        if (checkDrawablesForAdText(view)) {
            return true;
        }

        return false;
    }

    /**
     * Inspects all Drawables attached to the view (including Litho ComponentHost drawables).
     * Litho renders text via StaticLayout inside custom Drawables on the Canvas.
     */
    private static boolean checkDrawablesForAdText(View view) {
        try {
            Drawable bg = view.getBackground();
            if (checkDrawable(bg)) return true;

            if (android.os.Build.VERSION.SDK_INT >= 23) {
                Drawable fg = view.getForeground();
                if (checkDrawable(fg)) return true;
            }

            // Inspect fields of custom ViewGroups (Litho ComponentHost, LithoView, etc.)
            Class<?> cls = view.getClass();
            int depth = 0;
            while (cls != null && cls != ViewGroup.class && cls != View.class && cls != Object.class && depth < 3) {
                for (Field f : cls.getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(view);
                        if (val instanceof Drawable) {
                            if (checkDrawable((Drawable) val)) return true;
                        } else if (val instanceof Drawable[]) {
                            for (Drawable d : (Drawable[]) val) {
                                if (checkDrawable(d)) return true;
                            }
                        } else if (val instanceof List) {
                            for (Object item : (List<?>) val) {
                                if (item instanceof Drawable && checkDrawable((Drawable) item)) return true;
                            }
                        } else if (val instanceof Layout) {
                            if (isBlockedLabel(((Layout) val).getText())) return true;
                        } else if (val instanceof CharSequence) {
                            if (isBlockedLabel((CharSequence) val)) return true;
                        }
                    } catch (Throwable ignored) {}
                }
                cls = cls.getSuperclass();
                depth++;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static boolean checkDrawable(Drawable d) {
        if (d == null) return false;
        try {
            Class<?> cls = d.getClass();
            int depth = 0;
            while (cls != null && cls != Drawable.class && cls != Object.class && depth < 3) {
                for (Field f : cls.getDeclaredFields()) {
                    try {
                        f.setAccessible(true);
                        Object val = f.get(d);
                        if (val instanceof Layout) {
                            CharSequence text = ((Layout) val).getText();
                            if (isBlockedLabel(text)) return true;
                        } else if (val instanceof CharSequence) {
                            if (isBlockedLabel((CharSequence) val)) return true;
                        }
                    } catch (Throwable ignored) {}
                }
                cls = cls.getSuperclass();
                depth++;
            }
        } catch (Throwable ignored) {}
        return false;
    }

    /**
     * Strips zero-width unicode characters and normalizes text for exact ad matching.
     */
    public static boolean isSponsoredLabel(CharSequence cs) {
        if (cs == null || cs.length() == 0 || cs.length() > 120) return false;

        // Strip zero-width spaces, soft hyphens, non-breaking spaces
        String s = cs.toString()
                .replaceAll("[\\u200B-\\u200D\\uFEFF\\u00A0\\u00AD]", "")
                .trim()
                .toLowerCase(Locale.US);

        if (s.isEmpty()) return false;

        // 1. Sponsored keywords
        for (String kw : SPONSORED_KEYWORDS) {
            if (s.equals(kw) || s.startsWith(kw + " ") || s.startsWith(kw + "\u00B7") || s.startsWith(kw + "\u2022") || s.startsWith(kw + "-") || s.startsWith(kw + "|")) {
                return true;
            }
        }

        // 2. Exact matches
        if (s.equals("ad")
                || s.startsWith("ad ")
                || s.startsWith("ad\u00B7")
                || s.startsWith("ad \u00B7")
                || s.startsWith("ad\u2022")
                || s.startsWith("ad \u2022")
                || s.startsWith("ad|")
                || s.startsWith("ad-")
                || s.startsWith("ad/")
                || s.contains("ad \u00B7 part")
                || s.contains("ad \u2022 part")
                || s.contains("ad \u00B7")
                || s.contains("ad \u2022")
                || s.contains("\uD83D\uDCE2 ad")
                || s.contains("advertisement")) {
            return true;
        }

        return false;
    }

    private static boolean isBlockedLabel(CharSequence text) {
        return (DeVancedSettings.isAdsDisabled() && isSponsoredLabel(text)) ||
                (DeVancedSettings.isAiFilterEnabled() && isAiGeneratedLabel(text)) ||
                HomeFeedFilter.shouldHideHomeLabel(text);
    }

    private static boolean isAiGeneratedLabel(CharSequence value) {
        if (value == null || value.length() == 0 || value.length() > 200) return false;
        String text = value.toString()
                .replaceAll("[\\u200B-\\u200D\\uFEFF\\u00A0\\u00AD]", "")
                .trim()
                .toLowerCase(Locale.US);
        return HomeFeedFilter.isAiLabel(text);
    }

    /**
     * Walks UP the view tree to find the top-level feed post or reel item container.
     */
    private static View findPostOrReelRoot(View view) {
        View current = view;
        View best = view;

        for (int i = 0; i < 20; i++) {
            if (current.getParent() instanceof ViewGroup) {
                ViewGroup parent = (ViewGroup) current.getParent();
                CharSequence accessibilityClass = parent.getAccessibilityClassName();
                String parentClass = (
                        parent.getClass().getName() + " " +
                                (accessibilityClass == null
                                        ? ""
                                        : accessibilityClass.toString())
                ).toLowerCase(Locale.US);

                // If parent is a scrolling list container, 'current' is the exact feed item root
                if (parentClass.contains("recyclerview")
                        || parentClass.contains("listview")
                        || parentClass.contains("viewpager")
                        || parentClass.contains("nestedfeed")
                        || parentClass.contains("reels")
                        || parentClass.contains("scrollview")
                        || parent.getId() == android.R.id.list) {
                    return current;
                }

                // If 'current' is a large container (post or reel dimensions)
                if (current.getHeight() > 250 && current.getWidth() > 250) {
                    best = current;
                }

                current = parent;
            } else {
                break;
            }
        }
        return best;
    }

    private static void hideAdView(View view) {
        if (view == null) return;
        Runnable r = () -> {
            try {
                if (view.getVisibility() != View.GONE) {
                    ViewGroup.LayoutParams lp = view.getLayoutParams();
                    int originalHeight = (lp != null) ? lp.height : ViewGroup.LayoutParams.WRAP_CONTENT;
                    sOriginalStates.put(view, new ViewState(view.getVisibility(), originalHeight));

                    view.setVisibility(View.GONE);
                    if (lp != null) {
                        lp.height = 0;
                        view.setLayoutParams(lp);
                    }
                    view.requestLayout();
                    Log.i(TAG, "COLLAPSED AD/AI ITEM: " + view.getClass().getSimpleName() + " (w=" + view.getWidth() + ", h=" + view.getHeight() + ")");
                }
            } catch (Throwable t) {
                Log.w(TAG, "hideAdView error: ", t);
            }
        };
        if (Looper.myLooper() == Looper.getMainLooper()) {
            r.run();
        } else {
            sHandler.post(r);
        }
    }

    @SuppressWarnings("unchecked")
    private static List<View> getAllActiveRootViews() {
        List<View> views = new ArrayList<>();
        try {
            Class<?> wmgClass = Class.forName("android.view.WindowManagerGlobal");
            Method getInstanceMethod = wmgClass.getDeclaredMethod("getInstance");
            getInstanceMethod.setAccessible(true);
            Object wmgInstance = getInstanceMethod.invoke(null);

            Field mViewsField = wmgClass.getDeclaredField("mViews");
            mViewsField.setAccessible(true);
            Object mViews = mViewsField.get(wmgInstance);
            if (mViews instanceof List) {
                views.addAll((List<View>) mViews);
            }
        } catch (Throwable ignored) {}
        return views;
    }

    private static boolean isVideoSurface(View view) {
        String cn = view.getClass().getName().toLowerCase(Locale.US);
        return cn.contains("surfaceview")
                || cn.contains("textureview");
    }
}
