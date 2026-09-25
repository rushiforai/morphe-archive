package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;

/**
 * Geometry-based fallback for TikTok 46.7.3's profile sidebar.
 *
 * Earlier fixes assumed TikTok moved the profile with translationX or a shared scrollX. Device logs
 * showed neither path being observed even though the profile visibly moved. This guard therefore
 * measures the actual on-screen X coordinate and cancels the displacement of the top-most large
 * underlay view regardless of whether TikTok caused it through layout, ViewPager scroll or
 * translation. It only acts while a large right-side drawer panel is visible.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeProfileOverlayGuard {
    private static final int MAX_NODES = 1800;
    private static final WeakHashMap<View, Guard> GUARDS = new WeakHashMap<>();
    private static final WeakHashMap<View, Float> ORIGINAL_TRANSLATIONS = new WeakHashMap<>();
    private static final AtomicInteger LOG_BUDGET = new AtomicInteger(20);

    private ThemeProfileOverlayGuard() {}

    public static void install(Activity activity) {
        try {
            if (activity == null || activity.isFinishing() || activity.getWindow() == null) return;
            View root = activity.getWindow().getDecorView();
            if (root == null) return;
            synchronized (GUARDS) {
                Guard existing = GUARDS.get(root);
                if (existing != null) {
                    existing.activityRef = new WeakReference<>(activity);
                    return;
                }
                Guard guard = new Guard(activity, root);
                GUARDS.put(root, guard);
                guard.attach();
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean themeActive(View root) {
        try {
            return root != null && root.getContext() != null
                    && !"default".equals(ThemeStateStore.currentPreset(root.getContext()));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean compensate(View root) {
        try {
            if (!(root instanceof ViewGroup) || root.getWidth() <= 0 || root.getHeight() <= 0) {
                restoreAll();
                return false;
            }

            int rootWidth = root.getWidth();
            int rootHeight = root.getHeight();
            View drawer = findDrawer((ViewGroup) root, rootWidth, rootHeight);
            if (drawer == null) {
                restoreAll();
                return false;
            }

            View target = findShiftedUnderlay((ViewGroup) root, drawer, rootWidth, rootHeight);
            if (target == null) return true;

            int[] xy = location(target);
            if (xy == null) return true;
            int x = xy[0];
            int threshold = Math.max(dp(root.getContext(), 3), Math.round(rootWidth * 0.006f));
            if (x >= -threshold) return true;

            synchronized (ORIGINAL_TRANSLATIONS) {
                if (!ORIGINAL_TRANSLATIONS.containsKey(target)) {
                    ORIGINAL_TRANSLATIONS.put(target, target.getTranslationX());
                }
            }

            float correction = -x;
            target.setTranslationX(target.getTranslationX() + correction);

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                try {
                    drawer.bringToFront();
                    drawer.setElevation(Math.max(drawer.getElevation(), dp(root.getContext(), 18)));
                } catch (Throwable ignored) {
                }
            }

            if (LOG_BUDGET.getAndDecrement() > 0) {
                final int originalX = x;
                final float delta = correction;
                final String cls = target.getClass().getName();
                Logger.printInfo(() -> "[BlueIT Profile Overlay V2] underlay screenX corrected x="
                        + originalX + " delta=" + delta + " view=" + cls);
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static View findDrawer(ViewGroup root, int rootWidth, int rootHeight) {
        View best = null;
        int bestScore = Integer.MIN_VALUE;
        ArrayDeque<Node> queue = new ArrayDeque<>();
        queue.addLast(new Node(root, 0));
        int visited = 0;

        while (!queue.isEmpty() && visited++ < MAX_NODES) {
            Node node = queue.removeFirst();
            View view = node.view;
            if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) continue;

            if (view instanceof ViewGroup && view != root) {
                ViewGroup group = (ViewGroup) view;
                int width = group.getWidth();
                int height = group.getHeight();
                int[] xy = location(group);
                if (xy != null
                        && width >= rootWidth * 0.42f
                        && width <= rootWidth * 1.10f
                        && height >= rootHeight * 0.58f
                        && xy[0] >= rootWidth * 0.05f
                        && xy[0] < rootWidth * 0.96f) {
                    int texts = countTextViews(group, 4, 14);
                    if (texts >= 3) {
                        int score = texts;
                        if (xy[0] >= rootWidth * 0.14f) score += 6;
                        if (xy[0] + width >= rootWidth * 0.90f) score += 4;
                        String marker = className(group) + " " + resourceName(group);
                        if (containsAny(marker, "sidebar", "drawer", "side_menu", "profile_menu")) {
                            score += 12;
                        }
                        if (score > bestScore) {
                            best = group;
                            bestScore = score;
                        }
                    }
                }

                if (node.depth < 34) {
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
        }
        return best;
    }

    private static View findShiftedUnderlay(
            ViewGroup root,
            View drawer,
            int rootWidth,
            int rootHeight
    ) {
        ArrayList<View> candidates = new ArrayList<>();
        ArrayDeque<Node> queue = new ArrayDeque<>();
        queue.addLast(new Node(root, 0));
        int visited = 0;
        int threshold = Math.max(dp(root.getContext(), 3), Math.round(rootWidth * 0.006f));

        while (!queue.isEmpty() && visited++ < MAX_NODES) {
            Node node = queue.removeFirst();
            View view = node.view;
            if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) continue;
            if (view == drawer || isDescendantOf(view, drawer) || isDescendantOf(drawer, view)) {
                continue;
            }

            int[] xy = location(view);
            if (xy != null
                    && view.getWidth() >= rootWidth * 0.62f
                    && view.getHeight() >= rootHeight * 0.42f
                    && xy[0] < -threshold) {
                candidates.add(view);
            }

            if (view instanceof ViewGroup && node.depth < 34) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                }
            }
        }

        View best = null;
        int bestDepth = Integer.MAX_VALUE;
        int bestArea = 0;
        for (View candidate : candidates) {
            int depth = depth(candidate);
            int area = candidate.getWidth() * candidate.getHeight();
            if (depth < bestDepth || (depth == bestDepth && area > bestArea)) {
                best = candidate;
                bestDepth = depth;
                bestArea = area;
            }
        }
        return best;
    }

    private static void restoreAll() {
        synchronized (ORIGINAL_TRANSLATIONS) {
            for (Map.Entry<View, Float> entry : new ArrayList<>(ORIGINAL_TRANSLATIONS.entrySet())) {
                View view = entry.getKey();
                Float value = entry.getValue();
                if (view == null || value == null) continue;
                try {
                    view.setTranslationX(value);
                } catch (Throwable ignored) {
                }
            }
            ORIGINAL_TRANSLATIONS.clear();
        }
    }

    private static boolean isDescendantOf(View child, View ancestor) {
        try {
            ViewParent parent = child == null ? null : child.getParent();
            while (parent instanceof View) {
                if (parent == ancestor) return true;
                parent = parent.getParent();
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static int depth(View view) {
        int result = 0;
        try {
            ViewParent parent = view.getParent();
            while (parent instanceof View) {
                result++;
                parent = parent.getParent();
            }
        } catch (Throwable ignored) {
        }
        return result;
    }

    private static int countTextViews(View root, int maxDepth, int maxCount) {
        if (root == null || maxDepth < 0 || maxCount <= 0) return 0;
        int count = 0;
        if (root instanceof TextView) {
            CharSequence text = ((TextView) root).getText();
            if (text != null && !text.toString().trim().isEmpty()) count = 1;
        }
        if (count >= maxCount || !(root instanceof ViewGroup) || maxDepth == 0) return count;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < maxCount; i++) {
            count += countTextViews(group.getChildAt(i), maxDepth - 1, maxCount - count);
        }
        return count;
    }

    private static int[] location(View view) {
        try {
            int[] xy = new int[2];
            view.getLocationOnScreen(xy);
            return xy;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String className(View view) {
        try {
            return view.getClass().getName().toLowerCase(Locale.ROOT);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static String resourceName(View view) {
        try {
            int id = view.getId();
            if (id == View.NO_ID || id == 0) return "";
            return view.getResources().getResourceEntryName(id).toLowerCase(Locale.ROOT);
        } catch (Throwable ignored) {
            return "";
        }
    }

    private static boolean containsAny(String value, String... tokens) {
        if (value == null || value.isEmpty()) return false;
        String lower = value.toLowerCase(Locale.ROOT);
        for (String token : tokens) {
            if (lower.contains(token)) return true;
        }
        return false;
    }

    private static int dp(Context context, int value) {
        try {
            return Math.round(value * context.getResources().getDisplayMetrics().density);
        } catch (Throwable ignored) {
            return value;
        }
    }

    private static final class Guard implements
            ViewTreeObserver.OnPreDrawListener,
            ViewTreeObserver.OnGlobalLayoutListener,
            ViewTreeObserver.OnScrollChangedListener,
            View.OnAttachStateChangeListener {
        WeakReference<Activity> activityRef;
        final View root;

        Guard(Activity activity, View root) {
            this.activityRef = new WeakReference<>(activity);
            this.root = root;
        }

        void attach() {
            try {
                ViewTreeObserver observer = root.getViewTreeObserver();
                if (observer.isAlive()) {
                    observer.addOnPreDrawListener(this);
                    observer.addOnGlobalLayoutListener(this);
                    observer.addOnScrollChangedListener(this);
                }
                root.addOnAttachStateChangeListener(this);
            } catch (Throwable ignored) {
            }
        }

        void detach() {
            try {
                ViewTreeObserver observer = root.getViewTreeObserver();
                if (observer.isAlive()) {
                    observer.removeOnPreDrawListener(this);
                    observer.removeOnGlobalLayoutListener(this);
                    observer.removeOnScrollChangedListener(this);
                }
                root.removeOnAttachStateChangeListener(this);
                restoreAll();
            } catch (Throwable ignored) {
            }
        }

        @Override
        public boolean onPreDraw() {
            try {
                Activity activity = activityRef.get();
                if (activity == null || activity.isFinishing() || !root.isAttachedToWindow()) {
                    detachAndForget();
                    return true;
                }
                if (!themeActive(root)) {
                    restoreAll();
                    return true;
                }
                compensate(root);
            } catch (Throwable ignored) {
            }
            return true;
        }

        @Override public void onGlobalLayout() { }
        @Override public void onScrollChanged() { }
        @Override public void onViewAttachedToWindow(View v) { }
        @Override public void onViewDetachedFromWindow(View v) { detachAndForget(); }

        private void detachAndForget() {
            detach();
            synchronized (GUARDS) {
                Guard current = GUARDS.get(root);
                if (current == this) GUARDS.remove(root);
            }
        }
    }

    private static final class Node {
        final View view;
        final int depth;
        Node(View view, int depth) {
            this.view = view;
            this.depth = depth;
        }
    }
}
