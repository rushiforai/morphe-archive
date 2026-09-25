package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.graphics.Color;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;

/**
 * Frame-synchronous guard for TikTok 46.7.3 UI that is rebuilt after the normal theme passes.
 *
 * Recycler-backed Inbox/Activity rows can be rebound while scrolling and briefly expose TikTok's
 * stock light background before a posted reapply runs. This guard marks those screens dirty from
 * scroll/layout callbacks and performs the existing ThemeEngine pass from OnPreDraw, after TikTok
 * has bound/layout the new children but before Android renders that frame.
 *
 * The profile sidebar uses another presentation path on some 46.7.3 devices: a shared horizontal
 * host is scrolled by roughly the drawer width. In that case resetting translationX cannot work.
 * We leave the host and sidebar animation untouched and compensate only the large profile sibling by
 * +scrollX, which keeps the underlay visually stationary while the drawer moves above it.
 */
@SuppressWarnings({"unused", "deprecation", "JavaReflectionMemberAccess"})
public final class ThemeRealtimeUiGuard {
    private static final int MAX_HINT_NODES = 700;
    private static final int MAX_SIDEBAR_NODES = 1500;
    private static final long SCREEN_HINT_REFRESH_MS = 120L;
    private static final long ACTIVE_IDLE_RESTYLE_MS = 180L;

    private static final WeakHashMap<View, Guard> GUARDS = new WeakHashMap<>();
    private static final WeakHashMap<View, Float> SIDEBAR_COMPENSATED = new WeakHashMap<>();
    private static final AtomicBoolean INSTALLED_LOGGED = new AtomicBoolean(false);
    private static final AtomicInteger SIDEBAR_LOG_BUDGET = new AtomicInteger(16);

    private static volatile Method applyActivityMethod;

    private ThemeRealtimeUiGuard() {}

    public static void install(Activity activity) {
        try {
            if (activity == null || activity.isFinishing() || activity.getWindow() == null) return;
            View root = activity.getWindow().getDecorView();
            if (root == null) return;

            synchronized (GUARDS) {
                Guard existing = GUARDS.get(root);
                if (existing != null) {
                    existing.activityRef = new WeakReference<>(activity);
                    existing.dirty = true;
                    return;
                }

                Guard guard = new Guard(activity, root);
                GUARDS.put(root, guard);
                guard.attach();
            }

            if (INSTALLED_LOGGED.compareAndSet(false, true)) {
                Logger.printInfo(() -> "[BlueIT Theme Guard] realtime pre-draw guard installed");
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean themeActive(View root) {
        try {
            return root != null
                    && root.getContext() != null
                    && !"default".equals(ThemeStateStore.currentPreset(root.getContext()));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void applyThemeImmediately(Activity activity) {
        try {
            Method method = applyActivityMethod;
            if (method == null) {
                synchronized (ThemeRealtimeUiGuard.class) {
                    method = applyActivityMethod;
                    if (method == null) {
                        method = ThemeEngine.class.getDeclaredMethod("applyActivity", Activity.class);
                        method.setAccessible(true);
                        applyActivityMethod = method;
                    }
                }
            }
            method.invoke(null, activity);
        } catch (Throwable ignored) {
            // The normal scheduled ThemeEngine passes remain the fail-open fallback.
        }
    }

    private static int dynamicScreenKind(View root) {
        try {
            if (root == null || root.getHeight() <= 0) return 0;
            int rootHeight = root.getHeight();
            boolean inbox = false;
            boolean activity = false;
            boolean directChat = false;

            ArrayDeque<ScanNode> queue = new ArrayDeque<>();
            queue.addLast(new ScanNode(root, 0));
            int visited = 0;

            while (!queue.isEmpty() && visited++ < MAX_HINT_NODES) {
                ScanNode node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE) continue;

                if (view instanceof TextView) {
                    TextView textView = (TextView) view;
                    CharSequence value = textView.getText();
                    if (value != null) {
                        String lower = value.toString().trim().toLowerCase(Locale.ROOT);
                        if (lower.equals("schreib etwas")
                                || lower.equals("schreibe etwas")
                                || lower.equals("write a message")
                                || lower.equals("send a message")
                                || lower.equals("type a message")
                                || lower.equals("write something")) {
                            directChat = true;
                        }

                        int[] location = location(view);
                        boolean topTitle = location != null
                                && location[1] >= 0
                                && location[1] < rootHeight * 0.28f;
                        if (topTitle) {
                            if (lower.equals("posteingang")
                                    || lower.equals("inbox")
                                    || lower.equals("messages")
                                    || lower.equals("nachrichten")) {
                                inbox = true;
                            }
                            if (lower.equals("aktivität")
                                    || lower.equals("activity")
                                    || lower.equals("all activity")
                                    || lower.equals("alle aktivitäten")
                                    || lower.equals("notifications")
                                    || lower.equals("benachrichtigungen")) {
                                activity = true;
                            }
                        }
                    }
                }

                if (view instanceof ViewGroup && node.depth < 30) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                    }
                }
            }

            if (directChat) return 0;
            if (activity) return 2;
            return inbox ? 1 : 0;
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static void styleSuggestedAccountsHeader(View root) {
        try {
            if (root == null || root.getWidth() <= 0) return;
            int background = ThemeEngine.backgroundColor(root.getContext());
            int text = ThemeEngine.textColor(root.getContext());
            int secondary = ThemeEngine.secondaryTextColor(root.getContext());

            ArrayDeque<ScanNode> queue = new ArrayDeque<>();
            queue.addLast(new ScanNode(root, 0));
            int visited = 0;
            while (!queue.isEmpty() && visited++ < MAX_HINT_NODES) {
                ScanNode node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE) continue;

                if (view instanceof TextView) {
                    TextView textView = (TextView) view;
                    CharSequence value = textView.getText();
                    if (value != null && isSuggestedAccountsLabel(value.toString())) {
                        textView.setTextColor(text);
                        textView.setHintTextColor(secondary);

                        View current = textView;
                        for (int depth = 0; depth < 3; depth++) {
                            ViewParent parent = current.getParent();
                            if (!(parent instanceof View)) break;
                            current = (View) parent;
                            if (current.getWidth() >= root.getWidth() * 0.72f) {
                                current.setBackgroundColor(opaque(background));
                            }
                        }
                    }
                }

                if (view instanceof ViewGroup && node.depth < 24) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isSuggestedAccountsLabel(String value) {
        if (value == null) return false;
        String lower = value.trim().toLowerCase(Locale.ROOT);
        return lower.equals("vorgeschlagene konten")
                || lower.equals("vorgeschlagene accounts")
                || lower.equals("suggested accounts")
                || lower.equals("suggested users")
                || lower.equals("suggested accounts for you")
                || lower.equals("konten, die dir gefallen könnten");
    }

    /**
     * Compensates the profile sibling when TikTok presents the sidebar by scrolling a shared
     * horizontal host. Returns true while a plausible profile-sidebar host is active.
     */
    private static boolean compensateSidebarScroll(View root) {
        try {
            if (!(root instanceof ViewGroup) || root.getWidth() <= 0 || root.getHeight() <= 0) {
                clearSidebarCompensation();
                return false;
            }

            int rootWidth = root.getWidth();
            int rootHeight = root.getHeight();
            View sidebar = findSidebarCandidate((ViewGroup) root, rootWidth, rootHeight);
            if (sidebar == null) {
                clearSidebarCompensation();
                return false;
            }

            ArrayList<View> touched = new ArrayList<>();
            int compensated = 0;
            int observedScroll = 0;

            ViewParent parent = sidebar.getParent();
            while (parent instanceof ViewGroup) {
                ViewGroup host = (ViewGroup) parent;
                int scrollX = host.getScrollX();
                if (Math.abs(scrollX) >= Math.max(dp(root, 12), rootWidth * 0.08f)
                        && host.getWidth() >= rootWidth * 0.72f
                        && host.getHeight() >= rootHeight * 0.55f) {
                    observedScroll = scrollX;
                    View sidebarBranch = directChildContaining(host, sidebar);
                    if (sidebarBranch != null) {
                        for (int i = 0; i < host.getChildCount(); i++) {
                            View child = host.getChildAt(i);
                            if (child == sidebarBranch || child.getVisibility() != View.VISIBLE) continue;
                            if (child.getWidth() < rootWidth * 0.62f
                                    || child.getHeight() < rootHeight * 0.42f) {
                                continue;
                            }

                            // A positive parent scroll moves children left. Translating only the
                            // profile sibling by the same positive amount cancels that visual move,
                            // while the drawer branch keeps TikTok's native slide animation.
                            child.setTranslationX(scrollX);
                            touched.add(child);
                            compensated++;
                        }
                    }
                    if (compensated > 0) break;
                }
                parent = host.getParent();
            }

            // Keep the older translation-only case covered too, but never move the drawer subtree.
            if (compensated == 0) {
                compensated += neutralizeNegativeUnderlayTranslations(
                        (ViewGroup) root,
                        sidebar,
                        rootWidth,
                        rootHeight,
                        touched
                );
            }

            synchronized (SIDEBAR_COMPENSATED) {
                ArrayList<View> stale = new ArrayList<>();
                for (Map.Entry<View, Float> entry : SIDEBAR_COMPENSATED.entrySet()) {
                    View view = entry.getKey();
                    if (view != null && !touched.contains(view)) stale.add(view);
                }
                for (View view : stale) {
                    try {
                        view.setTranslationX(0f);
                    } catch (Throwable ignored) {
                    }
                    SIDEBAR_COMPENSATED.remove(view);
                }
                for (View view : touched) {
                    SIDEBAR_COMPENSATED.put(view, view.getTranslationX());
                }
            }

            if (compensated > 0 && SIDEBAR_LOG_BUDGET.getAndDecrement() > 0) {
                final int count = compensated;
                final int sx = observedScroll;
                Logger.printInfo(() -> "[BlueIT Theme Guard] sidebar underlay compensated views="
                        + count + " hostScrollX=" + sx);
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static View findSidebarCandidate(ViewGroup root, int rootWidth, int rootHeight) {
        View best = null;
        int bestScore = Integer.MIN_VALUE;
        ArrayDeque<ScanNode> queue = new ArrayDeque<>();
        queue.addLast(new ScanNode(root, 0));
        int visited = 0;

        while (!queue.isEmpty() && visited++ < MAX_SIDEBAR_NODES) {
            ScanNode node = queue.removeFirst();
            View view = node.view;
            if (view == null || view.getVisibility() != View.VISIBLE) continue;

            if (view instanceof ViewGroup && view != root) {
                ViewGroup group = (ViewGroup) view;
                int width = group.getWidth();
                int height = group.getHeight();
                if (width >= rootWidth * 0.56f
                        && width <= rootWidth * 0.98f
                        && height >= rootHeight * 0.68f) {
                    int[] loc = location(group);
                    if (loc != null) {
                        int right = loc[0] + width;
                        int texts = countTextViews(group, 3, 10);
                        String marker = resourceName(group) + " " + className(group);
                        int score = 0;
                        if (containsAny(marker,
                                "sidebar", "side_bar", "drawer", "profile_menu",
                                "side_menu", "navigation_drawer")) score += 12;
                        if (texts >= 3) score += 5;
                        if (loc[0] > rootWidth * 0.04f) score += 3;
                        if (right >= rootWidth - dp(root, 12)) score += 3;
                        if (loc[0] < rootWidth * 0.98f && right > rootWidth * 0.72f) score += 2;

                        if (score >= 8 && score > bestScore) {
                            best = group;
                            bestScore = score;
                        }
                    }
                }

                if (node.depth < 34) {
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
        }
        return best;
    }

    private static int neutralizeNegativeUnderlayTranslations(
            ViewGroup root,
            View sidebar,
            int rootWidth,
            int rootHeight,
            ArrayList<View> touched
    ) {
        int corrected = 0;
        ArrayDeque<View> queue = new ArrayDeque<>();
        queue.addLast(root);
        int visited = 0;
        float threshold = Math.max(dp(root, 2), rootWidth * 0.006f);

        while (!queue.isEmpty() && visited++ < MAX_SIDEBAR_NODES) {
            View view = queue.removeFirst();
            if (view == null || view.getVisibility() != View.VISIBLE) continue;
            if (view == sidebar || isAncestor(sidebar, view)) continue;

            if (view.getWidth() >= rootWidth * 0.45f
                    && view.getHeight() >= rootHeight * 0.32f
                    && view.getTranslationX() <= -threshold) {
                view.setTranslationX(0f);
                touched.add(view);
                corrected++;
            }

            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    queue.addLast(group.getChildAt(i));
                }
            }
        }
        return corrected;
    }

    private static void clearSidebarCompensation() {
        synchronized (SIDEBAR_COMPENSATED) {
            for (View view : new ArrayList<>(SIDEBAR_COMPENSATED.keySet())) {
                if (view == null) continue;
                try {
                    view.setTranslationX(0f);
                } catch (Throwable ignored) {
                }
            }
            SIDEBAR_COMPENSATED.clear();
        }
    }

    private static View directChildContaining(ViewGroup parent, View descendant) {
        if (parent == null || descendant == null) return null;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child == descendant || isAncestor(child, descendant)) return child;
        }
        return null;
    }

    private static boolean isAncestor(View possibleAncestor, View child) {
        try {
            if (!(possibleAncestor instanceof ViewGroup) || child == null) return false;
            ViewParent parent = child.getParent();
            while (parent instanceof View) {
                if (parent == possibleAncestor) return true;
                parent = parent.getParent();
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static int countTextViews(View root, int maxDepth, int maxCount) {
        if (root == null || maxDepth < 0 || maxCount <= 0) return 0;
        int count = root instanceof TextView ? 1 : 0;
        if (count >= maxCount || !(root instanceof ViewGroup) || maxDepth == 0) return count;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < maxCount; i++) {
            count += countTextViews(group.getChildAt(i), maxDepth - 1, maxCount - count);
        }
        return count;
    }

    private static int[] location(View view) {
        try {
            int[] value = new int[2];
            view.getLocationOnScreen(value);
            return value;
        } catch (Throwable ignored) {
            return null;
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

    private static String className(View view) {
        try {
            String name = view.getClass().getSimpleName();
            return name == null ? "" : name.toLowerCase(Locale.ROOT);
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

    private static int opaque(int color) {
        return Color.rgb(Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int dp(View view, int value) {
        try {
            return Math.round(value * view.getResources().getDisplayMetrics().density);
        } catch (Throwable ignored) {
            return value;
        }
    }

    private static final class Guard implements
            ViewTreeObserver.OnPreDrawListener,
            ViewTreeObserver.OnScrollChangedListener,
            ViewTreeObserver.OnGlobalLayoutListener,
            View.OnAttachStateChangeListener {
        WeakReference<Activity> activityRef;
        final View root;
        boolean dirty = true;
        int screenKind;
        long lastHintCheckMs;
        long lastStyleMs;
        boolean sidebarActive;

        Guard(Activity activity, View root) {
            this.activityRef = new WeakReference<>(activity);
            this.root = root;
        }

        void attach() {
            try {
                ViewTreeObserver observer = root.getViewTreeObserver();
                if (observer.isAlive()) {
                    observer.addOnPreDrawListener(this);
                    observer.addOnScrollChangedListener(this);
                    observer.addOnGlobalLayoutListener(this);
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
                    observer.removeOnScrollChangedListener(this);
                    observer.removeOnGlobalLayoutListener(this);
                }
                root.removeOnAttachStateChangeListener(this);
            } catch (Throwable ignored) {
            }
            clearSidebarCompensation();
        }

        @Override
        public boolean onPreDraw() {
            try {
                Activity activity = activityRef.get();
                if (activity == null || activity.isFinishing() || !root.isAttachedToWindow()) {
                    detachAndForget();
                    return true;
                }

                if (!themeActive(root) || ThemeNativeTargets.hasChat(root)) {
                    clearSidebarCompensation();
                    dirty = false;
                    return true;
                }

                long now = SystemClock.uptimeMillis();
                if (dirty || now - lastHintCheckMs >= SCREEN_HINT_REFRESH_MS) {
                    screenKind = dynamicScreenKind(root);
                    lastHintCheckMs = now;
                }

                if (screenKind != 0
                        && (dirty || now - lastStyleMs >= ACTIVE_IDLE_RESTYLE_MS)) {
                    // This is intentionally synchronous: OnPreDraw is the last safe point after a
                    // recycler bind/layout and before the stock-colored child reaches the display.
                    applyThemeImmediately(activity);
                    styleSuggestedAccountsHeader(root);
                    lastStyleMs = now;
                }

                if (dirty || sidebarActive) {
                    sidebarActive = false; // Native-owned main-page compensation owns this path.
                }
                dirty = false;
            } catch (Throwable ignored) {
            }
            return true;
        }

        @Override
        public void onScrollChanged() {
            dirty = true;
        }

        @Override
        public void onGlobalLayout() {
            dirty = true;
        }

        @Override
        public void onViewAttachedToWindow(View v) {
            dirty = true;
        }

        @Override
        public void onViewDetachedFromWindow(View v) {
            detachAndForget();
        }

        private void detachAndForget() {
            detach();
            synchronized (GUARDS) {
                Guard current = GUARDS.get(root);
                if (current == this) GUARDS.remove(root);
            }
        }
    }

    private static final class ScanNode {
        final View view;
        final int depth;

        ScanNode(View view, int depth) {
            this.view = view;
            this.depth = depth;
        }
    }
}
