package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;

/**
 * Frame-synchronous dynamic list guard for TikTok 46.7.3.
 *
 * The first V3 implementation styled the outermost row-shaped ancestor. On TikTok's inbox the
 * actual bound cell is nested inside that ancestor, so the stock child covered the themed card and
 * only exposed its edge while the row was clipped near the viewport boundary. The activity page has
 * the same nesting problem plus independently rebound full-width light containers.
 *
 * This revision styles the deepest visible row-shaped containers and repaints Activity section
 * containers before painting cards. Running from pre-draw means recycler rebinding cannot win the
 * last frame and restore stock colors while scrolling.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeDynamicListGuardV3 {
    private static final int SCREEN_NONE = 0;
    private static final int SCREEN_INBOX = 1;
    private static final int SCREEN_ACTIVITY = 2;
    private static final int MAX_NODES = 1900;
    private static final WeakHashMap<View, Guard> GUARDS = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> BOUND_INBOX_ROWS = new WeakHashMap<>();
    private static final AtomicInteger INBOX_LOG_BUDGET = new AtomicInteger(10);
    private static final AtomicInteger ACTIVITY_LOG_BUDGET = new AtomicInteger(10);

    private ThemeDynamicListGuardV3() {}

    /** Exact SessionListBaseVH.Z5 bind hook; works before measurement and without title heuristics. */
    public static void onInboxRowBound(View row) {
        try {
            if (!(row instanceof ViewGroup) || !themeActive(row)) return;
            synchronized (BOUND_INBOX_ROWS) {
                BOUND_INBOX_ROWS.put(row, Boolean.TRUE);
            }
            styleBoundInboxRow((ViewGroup) row);
        } catch (Throwable ignored) {
        }
    }

    private static void styleBoundInboxRow(ViewGroup row) {
        Context context = row.getContext();
        applyRowSurface(row, ThemeEngine.surfaceColor(context), ThemeEngine.dividerColor(context), 16);
        // The verified holder's itemView owns the card. Nested full-cell fillers must reveal it,
        // including after an async child bind; keep avatars and compact controls untouched.
        paintRowFillers(row, Color.TRANSPARENT, row.getWidth(), row.getHeight(), 8);
    }

    private static void styleBoundInboxRows(View root) {
        synchronized (BOUND_INBOX_ROWS) {
            for (View row : new ArrayList<>(BOUND_INBOX_ROWS.keySet())) {
                if (row instanceof ViewGroup && row.isAttachedToWindow()
                        && row.getRootView() == root && row.getVisibility() == View.VISIBLE) {
                    styleBoundInboxRow((ViewGroup) row);
                }
            }
        }
    }

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
                Logger.printInfo(() -> "[BlueIT Dynamic List V3.2] installed");
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

    private static ScreenInfo detectScreen(View root) {
        int kind = SCREEN_NONE;
        int titleBottom = 0;
        int titleTop = Integer.MAX_VALUE;
        try {
            int rootHeight = root.getHeight();
            if (rootHeight <= 0) return new ScreenInfo(kind, titleBottom);
            boolean directChat = false;
            ArrayDeque<Node> queue = new ArrayDeque<>();
            queue.addLast(new Node(root, 0));
            int visited = 0;
            while (!queue.isEmpty() && visited++ < 900) {
                Node node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE) continue;
                if (view instanceof TextView) {
                    TextView tv = (TextView) view;
                    CharSequence value = tv.getText();
                    if (value != null) {
                        String lower = value.toString().trim().toLowerCase(Locale.ROOT);
                        if (lower.equals("schreib etwas") || lower.equals("schreibe etwas")
                                || lower.equals("write a message") || lower.equals("send a message")
                                || lower.equals("type a message") || lower.equals("write something")) {
                            directChat = true;
                        }
                        int[] xy = location(tv);
                        if (xy != null && xy[1] >= 0 && xy[1] < rootHeight * 0.33f
                                && xy[1] < titleTop) {
                            if (isInboxTitle(lower)) {
                                kind = SCREEN_INBOX;
                                titleTop = xy[1];
                                titleBottom = xy[1] + tv.getHeight();
                            } else if (isActivityTitle(lower)) {
                                kind = SCREEN_ACTIVITY;
                                titleTop = xy[1];
                                titleBottom = xy[1] + tv.getHeight();
                            }
                        }
                    }
                }
                if (view instanceof ViewGroup && node.depth < 30) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
            if (directChat) kind = SCREEN_NONE;
        } catch (Throwable ignored) {
        }
        return new ScreenInfo(kind, titleBottom);
    }

    private static boolean isInboxTitle(String value) {
        return value.equals("posteingang") || value.equals("inbox")
                || value.equals("messages") || value.equals("nachrichten");
    }

    private static boolean isActivityTitle(String value) {
        return value.equals("aktivität") || value.equals("activity")
                || value.equals("all activity") || value.equals("alle aktivitäten")
                || value.equals("notifications") || value.equals("benachrichtigungen");
    }

    private static boolean isSuggestedLabel(String value) {
        String lower = value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
        return lower.equals("vorgeschlagene konten")
                || lower.equals("vorgeschlagene accounts")
                || lower.equals("suggested accounts")
                || lower.equals("suggested users")
                || lower.equals("suggested accounts for you")
                || lower.equals("konten, die dir gefallen könnten");
    }

    private static void style(View root, ScreenInfo screen) {
        try {
            Context context = root.getContext();
            int rootWidth = root.getWidth();
            int rootHeight = root.getHeight();
            if (rootWidth <= 0 || rootHeight <= 0) return;

            int background = opaque(ThemeEngine.backgroundColor(context));
            int surface = ThemeEngine.surfaceColor(context);
            int primary = ThemeEngine.textColor(context);
            int secondary = ThemeEngine.secondaryTextColor(context);
            int divider = ThemeEngine.dividerColor(context);

            ArrayList<ViewGroup> rowCandidates = new ArrayList<>();
            ArrayList<ViewGroup> activitySections = new ArrayList<>();
            ArrayList<TextView> suggested = new ArrayList<>();
            IdentityHashMap<ViewGroup, Integer> ancestorHits = new IdentityHashMap<>();

            ArrayDeque<Node> queue = new ArrayDeque<>();
            queue.addLast(new Node(root, 0));
            int visited = 0;
            while (!queue.isEmpty() && visited++ < MAX_NODES) {
                Node node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) continue;
                int[] xy = location(view);
                if (xy != null) {
                    int bottom = xy[1] + Math.max(0, view.getHeight());
                    if (bottom < 0 || xy[1] > rootHeight) continue;
                }

                if (view instanceof TextView) {
                    TextView tv = (TextView) view;
                    CharSequence value = tv.getText();
                    String raw = value == null ? "" : value.toString().trim();
                    boolean header = isSuggestedLabel(raw);
                    float sp = textSizeSp(tv);
                    tv.setTextColor(header || sp >= 14.5f ? primary : secondary);
                    tv.setHintTextColor(secondary);
                    if (header) suggested.add(tv);
                }

                if (view instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) view;
                    if (group != root && isRow(group, rootWidth, rootHeight, screen.titleBottom)) {
                        rowCandidates.add(group);
                    }

                    if (screen.kind == SCREEN_ACTIVITY
                            && group != root
                            && isActivitySectionCandidate(group, rootWidth, rootHeight, screen.titleBottom)) {
                        activitySections.add(group);
                    }

                    if (node.depth < 36) {
                        for (int i = 0; i < group.getChildCount(); i++) {
                            queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                        }
                    }
                }
            }

            // Activity uses multiple independently rebound Recycler/Compose host containers. Paint
            // those broad hierarchy nodes first; card styling below then deliberately wins for rows.
            int sectionCount = 0;
            if (screen.kind == SCREEN_ACTIVITY) {
                for (ViewGroup group : activitySections) {
                    try {
                        group.setBackgroundColor(background);
                        sectionCount++;
                    } catch (Throwable ignored) {
                    }
                }
            }

            // Suggested-account headers can sit inside a separate host that is not row-shaped.
            for (TextView label : suggested) {
                View current = label;
                for (int i = 0; i < 7; i++) {
                    ViewParent parent = current.getParent();
                    if (!(parent instanceof ViewGroup)) break;
                    ViewGroup group = (ViewGroup) parent;
                    if (group.getWidth() >= rootWidth * 0.62f) {
                        try {
                            group.setBackgroundColor(background);
                        } catch (Throwable ignored) {
                        }
                    }
                    current = group;
                    if (group == root) break;
                }
            }

            // Style the deepest row-shaped node in each nested cell chain. The old outermost choice
            // is exactly why the border only appeared when a chat row was almost outside the window.
            int rowCount = 0;
            for (ViewGroup group : rowCandidates) {
                if (hasRowDescendant(group, rootWidth, rootHeight, screen.titleBottom, 4)) continue;
                applyRowSurface(group, surface, divider, screen.kind == SCREEN_ACTIVITY ? 18 : 16);
                paintRowFillers(group, surface, rootWidth, group.getHeight(), 4);
                bumpAncestors(group, root, ancestorHits);
                rowCount++;
            }

            // If TikTok inserts an extra owning host after a bind, row ancestry still gives us a
            // stable Activity section even when its own drawable is not a ColorDrawable.
            if (screen.kind == SCREEN_ACTIVITY) {
                for (Map.Entry<ViewGroup, Integer> entry : ancestorHits.entrySet()) {
                    ViewGroup group = entry.getKey();
                    int hits = entry.getValue() == null ? 0 : entry.getValue();
                    if (group == null || group == root || hits < 2) continue;
                    if (group.getWidth() < rootWidth * 0.76f || group.getHeight() < dp(context, 72)) continue;
                    int[] groupXy = location(group);
                    if (groupXy == null) continue;
                    int bottom = groupXy[1] + group.getHeight();
                    if (bottom <= Math.max(screen.titleBottom, rootHeight * 0.12f)
                            || groupXy[1] >= rootHeight) continue;
                    try {
                        group.setBackgroundColor(background);
                        sectionCount++;
                    } catch (Throwable ignored) {
                    }
                }
                // Re-apply row surfaces after ancestry painting so cards are always the last writer.
                for (ViewGroup group : rowCandidates) {
                    if (hasRowDescendant(group, rootWidth, rootHeight, screen.titleBottom, 4)) continue;
                    applyRowSurface(group, surface, divider, 18);
                    paintRowFillers(group, surface, rootWidth, group.getHeight(), 4);
                }
            }

            AtomicInteger budget = screen.kind == SCREEN_ACTIVITY
                    ? ACTIVITY_LOG_BUDGET : INBOX_LOG_BUDGET;
            if (budget.getAndDecrement() > 0) {
                final int k = screen.kind;
                final int r = rowCount;
                final int s = sectionCount;
                Logger.printInfo(() -> "[BlueIT Dynamic List V3.2] kind=" + k
                        + " visualRows=" + r + " sections=" + s);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void applyRowSurface(ViewGroup group, int surface, int divider, int radiusDp) {
        try {
            GradientDrawable drawable = new GradientDrawable();
            drawable.setShape(GradientDrawable.RECTANGLE);
            drawable.setColor(surface);
            drawable.setCornerRadius(dp(group.getContext(), radiusDp));
            drawable.setStroke(Math.max(1, dp(group.getContext(), 1)), divider);
            group.setBackground(drawable);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                group.setBackgroundTintList(null);
                group.setClipToOutline(true);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void paintRowFillers(
            ViewGroup row,
            int surface,
            int rootWidth,
            int rowHeight,
            int depth
    ) {
        if (row == null || depth <= 0 || rootWidth <= 0 || rowHeight <= 0) return;
        try {
            for (int i = 0; i < row.getChildCount(); i++) {
                View child = row.getChildAt(i);
                if (!(child instanceof ViewGroup)) continue;
                ViewGroup group = (ViewGroup) child;
                int width = group.getWidth();
                int height = group.getHeight();
                if (width >= rootWidth * 0.72f
                        && height >= rowHeight * 0.72f
                        && height <= rowHeight * 1.12f) {
                    group.setBackgroundColor(surface);
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        group.setBackgroundTintList(null);
                    }
                }
                paintRowFillers(group, surface, rootWidth, rowHeight, depth - 1);
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isActivitySectionCandidate(
            ViewGroup group,
            int rootWidth,
            int rootHeight,
            int titleBottom
    ) {
        try {
            int width = group.getWidth();
            int height = group.getHeight();
            if (width < rootWidth * 0.82f) return false;
            if (height < dp(group.getContext(), 48) || height > rootHeight * 0.94f) return false;
            int[] xy = location(group);
            if (xy == null) return false;
            int minTop = Math.max(titleBottom - dp(group.getContext(), 10), Math.round(rootHeight * 0.06f));
            int bottom = xy[1] + height;
            if (bottom <= minTop || xy[1] >= rootHeight) return false;
            return group.getChildCount() > 0
                    && (countTextViews(group, 4, 12) >= 1 || height >= rootHeight * 0.20f);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean hasRowDescendant(
            ViewGroup root,
            int rootWidth,
            int rootHeight,
            int titleBottom,
            int depth
    ) {
        if (root == null || depth <= 0) return false;
        try {
            for (int i = 0; i < root.getChildCount(); i++) {
                View child = root.getChildAt(i);
                if (!(child instanceof ViewGroup)) continue;
                ViewGroup group = (ViewGroup) child;
                if (isRow(group, rootWidth, rootHeight, titleBottom)) return true;
                if (hasRowDescendant(group, rootWidth, rootHeight, titleBottom, depth - 1)) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void bumpAncestors(View child, View root, IdentityHashMap<ViewGroup, Integer> hits) {
        try {
            ViewParent parent = child.getParent();
            int depth = 0;
            while (parent instanceof ViewGroup && depth++ < 12) {
                ViewGroup group = (ViewGroup) parent;
                if (group == root) break;
                Integer value = hits.get(group);
                hits.put(group, value == null ? 1 : value + 1);
                parent = group.getParent();
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isRow(ViewGroup group, int rootWidth, int rootHeight, int titleBottom) {
        try {
            int width = group.getWidth();
            int height = group.getHeight();
            if (width < rootWidth * 0.68f || width > rootWidth * 1.06f) return false;
            if (height < dp(group.getContext(), 44) || height > dp(group.getContext(), 154)) return false;
            int[] xy = location(group);
            if (xy == null) return false;
            int minTop = Math.max(titleBottom - dp(group.getContext(), 8), Math.round(rootHeight * 0.08f));
            if (xy[1] < minTop || xy[1] > rootHeight * 1.01f) return false;
            int texts = countTextViews(group, 4, 9);
            return texts >= 1 && texts <= 8;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int countTextViews(View root, int depth, int max) {
        if (root == null || depth < 0 || max <= 0) return 0;
        int count = 0;
        if (root instanceof TextView) {
            CharSequence text = ((TextView) root).getText();
            if (text != null && !text.toString().trim().isEmpty()) count = 1;
        }
        if (count >= max || !(root instanceof ViewGroup) || depth == 0) return count;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < max; i++) {
            count += countTextViews(group.getChildAt(i), depth - 1, max - count);
        }
        return count;
    }

    private static float textSizeSp(TextView view) {
        try {
            float density = view.getResources().getDisplayMetrics().scaledDensity;
            return density > 0f ? view.getTextSize() / density : 16f;
        } catch (Throwable ignored) {
            return 16f;
        }
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

    private static int opaque(int color) {
        return Color.rgb(Color.red(color), Color.green(color), Color.blue(color));
    }

    private static int dp(Context context, int value) {
        try {
            return Math.round(value * context.getResources().getDisplayMetrics().density);
        } catch (Throwable ignored) {
            return value;
        }
    }

    private static final class Guard implements ViewTreeObserver.OnPreDrawListener,
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
                if (observer.isAlive()) observer.addOnPreDrawListener(this);
                root.addOnAttachStateChangeListener(this);
            } catch (Throwable ignored) {
            }
        }

        void detach() {
            try {
                ViewTreeObserver observer = root.getViewTreeObserver();
                if (observer.isAlive()) observer.removeOnPreDrawListener(this);
                root.removeOnAttachStateChangeListener(this);
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
                if (!themeActive(root) || ThemeNativeTargets.hasChat(root)) return true;
                ScreenInfo screen = detectScreen(root);
                if (screen.kind != SCREEN_NONE) style(root, screen);
                // Exact holders win after the geometry fallback, including clipped/returning rows.
                styleBoundInboxRows(root);
            } catch (Throwable ignored) {
            }
            return true;
        }

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

    private static final class ScreenInfo {
        final int kind;
        final int titleBottom;
        ScreenInfo(int kind, int titleBottom) {
            this.kind = kind;
            this.titleBottom = titleBottom;
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
