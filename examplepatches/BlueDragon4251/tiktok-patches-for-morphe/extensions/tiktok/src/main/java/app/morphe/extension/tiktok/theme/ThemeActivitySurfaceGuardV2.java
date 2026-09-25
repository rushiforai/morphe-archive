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
import java.util.Locale;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

import app.morphe.extension.shared.Logger;

/**
 * Second-generation Activity guard for TikTok 46.7.3.
 *
 * dev.16 proved that the earlier row guard ran before draw, but TikTok still painted a large
 * stock-light recommendation section around those rows. This guard therefore styles the complete
 * visible full-width section first and only then its row/header children. It is intentionally scoped
 * to a visible Activity/Notifications title and remains fail-open.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeActivitySurfaceGuardV2 {
    private static final int MAX_NODES = 1900;
    private static final WeakHashMap<View, Guard> GUARDS = new WeakHashMap<>();
    private static final AtomicBoolean LOGGED = new AtomicBoolean(false);

    private ThemeActivitySurfaceGuardV2() {}

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
            return root != null && root.getContext() != null
                    && !"default".equals(ThemeStateStore.currentPreset(root.getContext()));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isActivityScreen(View root) {
        try {
            int rootHeight = root.getHeight();
            if (rootHeight <= 0) return false;
            ArrayDeque<Node> queue = new ArrayDeque<>();
            queue.addLast(new Node(root, 0));
            int visited = 0;
            while (!queue.isEmpty() && visited++ < 900) {
                Node node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE) continue;
                if (view instanceof TextView) {
                    CharSequence text = ((TextView) view).getText();
                    if (text != null) {
                        String value = text.toString().trim().toLowerCase(Locale.ROOT);
                        int[] xy = location(view);
                        if (xy != null && xy[1] >= 0 && xy[1] < rootHeight * 0.28f
                                && (value.equals("aktivität")
                                || value.equals("activity")
                                || value.equals("all activity")
                                || value.equals("alle aktivitäten")
                                || value.equals("notifications")
                                || value.equals("benachrichtigungen"))) {
                            return true;
                        }
                    }
                }
                if (view instanceof ViewGroup && node.depth < 28) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void style(Activity activity, View root) {
        try {
            Context context = root.getContext();
            int rootWidth = root.getWidth();
            int rootHeight = root.getHeight();
            if (rootWidth <= 0 || rootHeight <= 0) return;

            int background = ThemeEngine.backgroundColor(context);
            int surface = ThemeEngine.surfaceColor(context);
            int text = ThemeEngine.textColor(context);
            int secondary = ThemeEngine.secondaryTextColor(context);
            int divider = ThemeEngine.dividerColor(context);

            ArrayDeque<Node> queue = new ArrayDeque<>();
            queue.addLast(new Node(root, 0));
            int visited = 0;
            int sections = 0;
            int rows = 0;

            while (!queue.isEmpty() && visited++ < MAX_NODES) {
                Node node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) {
                    continue;
                }

                int[] xy = location(view);
                if (xy != null) {
                    int bottom = xy[1] + Math.max(0, view.getHeight());
                    if (bottom < 0 || xy[1] > rootHeight) continue;
                }

                if (view instanceof TextView) {
                    styleText((TextView) view, text, secondary);
                }

                if (view instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) view;
                    int width = group.getWidth();
                    int height = group.getHeight();
                    int[] groupXy = location(group);
                    if (groupXy != null) {
                        int top = groupXy[1];
                        int bottom = top + height;

                        // TikTok's lower recommendation area is one large stock-light container.
                        // Paint that container itself, not merely the individual visible rows.
                        if (width >= rootWidth * 0.84f
                                && height >= Math.max(dp(context, 110), rootHeight * 0.16f)
                                && top >= rootHeight * 0.20f
                                && top < rootHeight * 0.96f
                                && bottom > rootHeight * 0.38f) {
                            group.setBackgroundColor(opaque(background));
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                                group.setBackgroundTintList(null);
                            }
                            sections++;
                        }

                        // Full-width section labels such as "Vorgeschlagene Konten".
                        if (width >= rootWidth * 0.72f
                                && height >= dp(context, 16)
                                && height <= dp(context, 76)
                                && top >= rootHeight * 0.16f) {
                            group.setBackgroundColor(opaque(background));
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                                group.setBackgroundTintList(null);
                            }
                        }

                        if (isRow(group, rootWidth, rootHeight)
                                && !parentIsRow(group, rootWidth, rootHeight)) {
                            applyRow(group, surface, divider);
                            rows++;
                        }
                    }

                    if (node.depth < 36) {
                        for (int i = 0; i < group.getChildCount(); i++) {
                            queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                        }
                    }
                }
            }

            if (LOGGED.compareAndSet(false, true)) {
                final int sectionCount = sections;
                final int rowCount = rows;
                Logger.printInfo(() -> "[BlueIT Activity Guard V2] complete section styled sections="
                        + sectionCount + " rows=" + rowCount);
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isRow(ViewGroup group, int rootWidth, int rootHeight) {
        try {
            int width = group.getWidth();
            int height = group.getHeight();
            if (width < rootWidth * 0.72f || width > rootWidth * 1.04f) return false;
            if (height < dp(group.getContext(), 46) || height > dp(group.getContext(), 146)) return false;
            int[] xy = location(group);
            if (xy == null || xy[1] < rootHeight * 0.12f || xy[1] > rootHeight * 0.99f) return false;
            int texts = countTextViews(group, 4, 8);
            return texts >= 1 && texts <= 7;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean parentIsRow(ViewGroup group, int rootWidth, int rootHeight) {
        try {
            ViewParent parent = group.getParent();
            return parent instanceof ViewGroup && isRow((ViewGroup) parent, rootWidth, rootHeight);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void applyRow(ViewGroup group, int surface, int divider) {
        try {
            GradientDrawable drawable = new GradientDrawable();
            drawable.setShape(GradientDrawable.RECTANGLE);
            drawable.setColor(surface);
            drawable.setCornerRadius(dp(group.getContext(), 20));
            drawable.setStroke(Math.max(1, dp(group.getContext(), 1)), divider);
            group.setBackground(drawable);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                group.setBackgroundTintList(null);
                group.setClipToOutline(true);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void styleText(TextView view, int primary, int secondary) {
        try {
            CharSequence value = view.getText();
            String raw = value == null ? "" : value.toString().trim();
            String lower = raw.toLowerCase(Locale.ROOT);
            boolean header = lower.equals("vorgeschlagene konten")
                    || lower.equals("vorgeschlagene accounts")
                    || lower.equals("suggested accounts")
                    || lower.equals("suggested users")
                    || lower.equals("suggested accounts for you")
                    || lower.equals("konten, die dir gefallen könnten");
            boolean small = textSizeSp(view) < 14.5f;
            view.setTextColor(header || !small ? primary : secondary);
            view.setHintTextColor(secondary);
        } catch (Throwable ignored) {
        }
    }

    private static int countTextViews(View root, int depth, int max) {
        if (root == null || depth < 0 || max <= 0) return 0;
        int count = root instanceof TextView ? 1 : 0;
        if (count >= max || !(root instanceof ViewGroup) || depth == 0) return count;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < max; i++) {
            count += countTextViews(group.getChildAt(i), depth - 1, max - count);
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

    private static final class Guard implements
            ViewTreeObserver.OnPreDrawListener,
            ViewTreeObserver.OnScrollChangedListener,
            ViewTreeObserver.OnGlobalLayoutListener,
            View.OnAttachStateChangeListener {
        WeakReference<Activity> activityRef;
        final View root;
        boolean dirty = true;
        boolean activityScreen;

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
                if (dirty || !activityScreen) activityScreen = isActivityScreen(root);
                if (activityScreen) style(activity, root);
                dirty = false;
            } catch (Throwable ignored) {
            }
            return true;
        }

        @Override public void onScrollChanged() { dirty = true; }
        @Override public void onGlobalLayout() { dirty = true; }
        @Override public void onViewAttachedToWindow(View v) { dirty = true; }
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
