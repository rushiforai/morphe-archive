package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.Locale;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.Logger;

/**
 * Frame-synchronous styling for TikTok's Activity/recommendation list.
 *
 * The generic surface styler deliberately leaves the bottom ~96dp alone because Inbox has a bottom
 * navigation bar. TikTok's standalone Activity screen has no such bar, so Recycler rows entering
 * from the bottom could remain stock-light until they moved farther up. This guard is scoped by the
 * exact visible Activity title and styles only visible list strips/rows immediately before draw.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeActivitySurfaceGuard {
    private static final int MAX_SCAN_NODES = 2600;
    private static final long HINT_REFRESH_MS = 120L;
    private static final long ACTIVE_RESTYLE_MS = 120L;
    private static final WeakHashMap<View, Guard> GUARDS = new WeakHashMap<>();
    private static final AtomicBoolean ACTIVE_LOGGED = new AtomicBoolean(false);

    private ThemeActivitySurfaceGuard() {}

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

    private static boolean isActivityScreen(View root) {
        try {
            if (root == null || root.getHeight() <= 0) return false;
            int rootHeight = root.getHeight();
            ArrayDeque<ScanNode> queue = new ArrayDeque<>();
            queue.addLast(new ScanNode(root, 0));
            int visited = 0;

            while (!queue.isEmpty() && visited++ < 900) {
                ScanNode node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE) continue;

                if (view instanceof TextView) {
                    CharSequence value = ((TextView) view).getText();
                    if (value != null) {
                        String lower = value.toString().trim().toLowerCase(Locale.ROOT);
                        int[] location = location(view);
                        if (location != null
                                && location[1] >= 0
                                && location[1] < rootHeight * 0.28f
                                && (lower.equals("aktivität")
                                || lower.equals("activity")
                                || lower.equals("all activity")
                                || lower.equals("alle aktivitäten")
                                || lower.equals("notifications")
                                || lower.equals("benachrichtigungen"))) {
                            return true;
                        }
                    }
                }

                if (view instanceof ViewGroup && node.depth < 28) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void styleVisibleActivity(View root) {
        try {
            if (!(root instanceof ViewGroup) || root.getWidth() <= 0 || root.getHeight() <= 0) return;

            Context context = root.getContext();
            int rootWidth = root.getWidth();
            int rootHeight = root.getHeight();
            int background = ThemeEngine.backgroundColor(context);
            int surface = ThemeEngine.surfaceColor(context);
            int text = ThemeEngine.textColor(context);
            int secondary = ThemeEngine.secondaryTextColor(context);
            int divider = ThemeEngine.dividerColor(context);

            ArrayDeque<ScanNode> queue = new ArrayDeque<>();
            queue.addLast(new ScanNode(root, 0));
            int visited = 0;

            while (!queue.isEmpty() && visited++ < MAX_SCAN_NODES) {
                ScanNode node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) {
                    continue;
                }

                int[] location = location(view);
                if (location != null) {
                    int top = location[1];
                    int bottom = top + Math.max(0, view.getHeight());
                    if (bottom < 0 || top > rootHeight) continue;
                }

                if (view instanceof TextView) {
                    styleText((TextView) view, text, secondary);
                }

                if (view instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) view;
                    int width = group.getWidth();
                    int height = group.getHeight();
                    int[] groupLocation = location(group);

                    if (groupLocation != null) {
                        int top = groupLocation[1];
                        int bottom = top + height;

                        // Full-width separator/header strips, including "Vorgeschlagene Konten".
                        if (width >= rootWidth * 0.86f
                                && height >= dp(context, 18)
                                && height <= dp(context, 58)
                                && top >= rootHeight * 0.14f
                                && top < rootHeight * 0.94f) {
                            group.setBackgroundColor(opaque(background));
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                                group.setBackgroundTintList(null);
                            }
                        }

                        if (isActivityRow(group, rootWidth, rootHeight)
                                && !parentIsActivityRow(group, rootWidth, rootHeight)) {
                            applyRowSurface(group, surface, divider);
                        }

                        // The standalone Activity list legitimately reaches the system navigation
                        // area. Do not exclude rows just because their bottom is within the final
                        // 96dp, which was the source of the visible stock-light rows in dev.15.
                        if (bottom > 0 && top < rootHeight && node.depth < 36) {
                            for (int i = 0; i < group.getChildCount(); i++) {
                                queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                            }
                        }
                    } else if (node.depth < 36) {
                        for (int i = 0; i < group.getChildCount(); i++) {
                            queue.addLast(new ScanNode(group.getChildAt(i), node.depth + 1));
                        }
                    }
                }
            }

            if (ACTIVE_LOGGED.compareAndSet(false, true)) {
                Logger.printInfo(() -> "[BlueIT Activity Guard] visible recommendations styled before draw");
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isActivityRow(ViewGroup group, int rootWidth, int rootHeight) {
        try {
            int width = group.getWidth();
            int height = group.getHeight();
            if (width < rootWidth * 0.74f || width > rootWidth * 1.03f) return false;
            if (height < dp(group.getContext(), 48) || height > dp(group.getContext(), 136)) {
                return false;
            }

            int[] location = location(group);
            if (location == null) return false;
            if (location[1] < rootHeight * 0.12f || location[1] > rootHeight * 0.96f) return false;

            int texts = countTextViews(group, 4, 8);
            return texts >= 1 && texts <= 7 && group.getChildCount() >= 1;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean parentIsActivityRow(ViewGroup group, int rootWidth, int rootHeight) {
        try {
            ViewParent parent = group.getParent();
            return parent instanceof ViewGroup
                    && isActivityRow((ViewGroup) parent, rootWidth, rootHeight);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void applyRowSurface(ViewGroup group, int surface, int divider) {
        try {
            Context context = group.getContext();
            GradientDrawable drawable = new GradientDrawable();
            drawable.setShape(GradientDrawable.RECTANGLE);
            drawable.setColor(surface);
            drawable.setCornerRadius(dp(context, 20));
            drawable.setStroke(Math.max(1, dp(context, 1)), divider);
            group.setBackground(drawable);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                group.setBackgroundTintList((ColorStateList) null);
                group.setClipToOutline(true);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void styleText(TextView textView, int primary, int secondary) {
        try {
            CharSequence value = textView.getText();
            String raw = value == null ? "" : value.toString().trim();
            String lower = raw.toLowerCase(Locale.ROOT);
            String resource = resourceName(textView);

            boolean suggestedHeader = lower.equals("vorgeschlagene konten")
                    || lower.equals("vorgeschlagene accounts")
                    || lower.equals("suggested accounts")
                    || lower.equals("suggested users")
                    || lower.equals("suggested accounts for you")
                    || lower.equals("konten, die dir gefallen könnten");

            boolean secondaryText = !suggestedHeader && (containsAny(resource,
                    "summary", "subtitle", "secondary", "description", "desc", "hint", "time")
                    || textSizeSp(textView) < 14.5f);

            int color = suggestedHeader ? primary : (secondaryText ? secondary : primary);
            textView.setTextColor(color);
            textView.setHintTextColor(secondary);
            textView.setLinkTextColor(ThemeEngine.accentColor(textView.getContext()));
        } catch (Throwable ignored) {
        }
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

    private static float textSizeSp(TextView view) {
        try {
            float scaled = view.getResources().getDisplayMetrics().scaledDensity;
            return scaled > 0f ? view.getTextSize() / scaled : 16f;
        } catch (Throwable ignored) {
            return 16f;
        }
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

    private static int dp(Context context, int value) {
        try {
            return Math.round(value * context.getResources().getDisplayMetrics().density);
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
        boolean activityScreen;
        long lastHintCheckMs;
        long lastStyleMs;

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
                    activityScreen = false;
                    dirty = false;
                    return true;
                }

                long now = SystemClock.uptimeMillis();
                if (dirty || now - lastHintCheckMs >= HINT_REFRESH_MS) {
                    activityScreen = isActivityScreen(root);
                    lastHintCheckMs = now;
                }

                if (activityScreen && (dirty || now - lastStyleMs >= ACTIVE_RESTYLE_MS)) {
                    styleVisibleActivity(root);
                    lastStyleMs = now;
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
