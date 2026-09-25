package app.morphe.extension.tiktok.theme;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
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
 * Profile drawer underlay guard for TikTok 46.7.3.
 *
 * The initial V3 profile detector used exact English/German labels. On the real 46.7.3 profile UI
 * those labels are decorated (for example "+ Bio. hinzufügen" and "Follower*innen"), so the guard
 * never armed and no compensation could run. This revision uses normalized substring signals from
 * the actual profile UI and keeps the fail-open screen-X compensation from V3.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class ThemeProfileOverlayGuardV3 {
    private static final int MAX_NODES = 1900;
    private static final long PROFILE_GRACE_MS = 7000L;
    private static final WeakHashMap<View, Guard> GUARDS = new WeakHashMap<>();
    private static final AtomicInteger LOG_BUDGET = new AtomicInteger(40);

    private ThemeProfileOverlayGuardV3() {}

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
                Logger.printInfo(() -> "[BlueIT Profile Overlay V3.2] installed");
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

    private static boolean profileVisible(View root) {
        try {
            int strong = 0;
            int weak = 0;
            ArrayDeque<Node> queue = new ArrayDeque<>();
            queue.addLast(new Node(root, 0));
            int visited = 0;
            while (!queue.isEmpty() && visited++ < 1500) {
                Node node = queue.removeFirst();
                View view = node.view;
                if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) continue;
                if (view instanceof TextView) {
                    CharSequence text = ((TextView) view).getText();
                    if (text != null) {
                        String value = normalize(text.toString());
                        if (containsAny(value,
                                "profil bearbeiten", "edit profile",
                                "profil teilen", "share profile",
                                "bio hinzufügen", "bio hinzufugen", "add bio",
                                "tiktok studio")) {
                            strong++;
                        }
                        if (containsAny(value,
                                "follower", "following", "folge ich", "gefolgt",
                                "likes", "gefällt mir", "gefallt mir")) {
                            weak++;
                        }
                    }
                }
                String marker = className(view) + " " + resourceName(view);
                if (containsAny(marker,
                        "profile_fragment", "profilepage", "profile_page",
                        "user_profile", "mine_profile", "profile_header", "profile_tab")) {
                    strong++;
                }

                // Own-profile layouts reliably expose at least one strong action plus a profile stat.
                // Some locales hide the edit/share action, so two independent stats are also enough.
                if (strong >= 1 && weak >= 1) return true;
                if (strong >= 2 || weak >= 2) return true;

                if (view instanceof ViewGroup && node.depth < 36) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount(); i++) {
                        queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                    }
                }
            }
            return strong >= 1 && weak >= 1 || strong >= 2 || weak >= 2;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static View findShiftedUnderlay(ViewGroup root, int rootWidth, int rootHeight) {
        View best = null;
        int bestScore = Integer.MIN_VALUE;
        int threshold = Math.max(1, dp(root.getContext(), 1));

        ArrayDeque<Node> queue = new ArrayDeque<>();
        queue.addLast(new Node(root, 0));
        int visited = 0;
        while (!queue.isEmpty() && visited++ < MAX_NODES) {
            Node node = queue.removeFirst();
            View view = node.view;
            if (view == null || view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) {
                continue;
            }

            int[] xy = location(view);
            // Exclude the decor as a candidate, never as a traversal root.
            if (view != root && xy != null) {
                int width = view.getWidth();
                int height = view.getHeight();
                int right = xy[0] + width;
                if (xy[0] <= -threshold
                        && xy[0] > -rootWidth * 1.12f
                        && width >= rootWidth * 0.62f
                        && width <= rootWidth * 1.06f
                        && height >= rootHeight * 0.36f
                        && right > rootWidth * 0.06f) {
                    int texts = countTextViews(view, 6, 24);
                    String marker = className(view) + " " + resourceName(view);
                    int score = 0;
                    score += Math.max(0, 26 - node.depth);
                    score += Math.min(16, texts);
                    if (width >= rootWidth * 0.88f) score += 10;
                    if (height >= rootHeight * 0.68f) score += 10;
                    if (containsAny(marker, "profile", "mine", "user_page", "main_page")) score += 16;
                    if (score > bestScore) {
                        best = view;
                        bestScore = score;
                    }
                }
            }

            if (view instanceof ViewGroup && node.depth < 38) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) {
                    queue.addLast(new Node(group.getChildAt(i), node.depth + 1));
                }
            }
        }
        return best;
    }

    private static boolean compensate(View root, Map<View, TranslationCorrection> corrections) {
        try {
            if (!(root instanceof ViewGroup) || root.getWidth() <= 0 || root.getHeight() <= 0) return false;
            int rootWidth = root.getWidth();
            int rootHeight = root.getHeight();
            View target = findShiftedUnderlay((ViewGroup) root, rootWidth, rootHeight);
            if (target == null) return false;

            int[] xy = location(target);
            if (xy == null || xy[0] >= 0) return false;
            float original = target.getTranslationX();
            float correction = -xy[0];
            float applied = original + correction;
            // A direct native translation is neutralized at zero. Do not restore that obsolete
            // negative position next frame: the closing animator can also legitimately write zero.
            // Nonzero compensation is for a scrolled/offset ancestor and must be undone to measure it.
            if (applied != 0f) {
                corrections.put(target, new TranslationCorrection(original, applied));
            }
            target.setTranslationX(applied);

            if (LOG_BUDGET.getAndDecrement() > 0) {
                final int x = xy[0];
                final float delta = correction;
                final String cls = target.getClass().getName();
                final int width = target.getWidth();
                final int height = target.getHeight();
                Logger.printInfo(() -> "[BlueIT Profile Overlay V3.2] corrected screenX=" + x
                        + " delta=" + delta + " size=" + width + "x" + height + " view=" + cls);
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void restoreTracked(Map<View, TranslationCorrection> corrections) {
        for (Map.Entry<View, TranslationCorrection> entry : new ArrayList<>(corrections.entrySet())) {
            View view = entry.getKey();
            TranslationCorrection value = entry.getValue();
            if (view == null || value == null) continue;
            try {
                // A native animator may have written the next opening/closing position since our
                // previous frame. Undo only our own still-present correction, never that new value.
                if (view.getTranslationX() == value.applied) view.setTranslationX(value.original);
            } catch (Throwable ignored) {
            }
        }
        corrections.clear();
    }

    private static int countTextViews(View root, int depth, int max) {
        if (root == null || depth < 0 || max <= 0) return 0;
        int count = 0;
        if (root instanceof TextView) {
            CharSequence value = ((TextView) root).getText();
            if (value != null && !value.toString().trim().isEmpty()) count = 1;
        }
        if (count >= max || !(root instanceof ViewGroup) || depth == 0) return count;
        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount() && count < max; i++) {
            count += countTextViews(group.getChildAt(i), depth - 1, max - count);
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
            String name = view.getClass().getName();
            return name == null ? "" : name.toLowerCase(Locale.ROOT);
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

    private static String normalize(String value) {
        if (value == null) return "";
        String lower = value.trim().toLowerCase(Locale.ROOT);
        lower = lower.replace('ä', 'a').replace('ö', 'o').replace('ü', 'u').replace('ß', 's');
        lower = lower.replace('*', ' ').replace('+', ' ').replace('.', ' ');
        return lower.replaceAll("\\s+", " ").trim();
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

    private static final class Guard implements ViewTreeObserver.OnPreDrawListener,
            View.OnAttachStateChangeListener {
        WeakReference<Activity> activityRef;
        final View root;
        final Map<View, TranslationCorrection> corrections = new WeakHashMap<>();
        long lastProfileSeenMs;
        boolean profileLogged;
        int noCandidateBudget = 12;

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
            restoreTracked(corrections);
        }

        @Override
        public boolean onPreDraw() {
            try {
                Activity activity = activityRef.get();
                if (activity == null || activity.isFinishing() || !root.isAttachedToWindow()) {
                    detachAndForget();
                    return true;
                }

                // Reset our previous frame's correction before measuring TikTok's real layout again.
                restoreTracked(corrections);
                if (!themeActive(root)) return true;

                long now = SystemClock.uptimeMillis();
                if (profileVisible(root)) {
                    lastProfileSeenMs = now;
                    if (!profileLogged) {
                        profileLogged = true;
                        Logger.printInfo(() -> "[BlueIT Profile Overlay V3.2] profile screen armed");
                    }
                }

                if (lastProfileSeenMs != 0L && now - lastProfileSeenMs <= PROFILE_GRACE_MS) {
                    boolean corrected = compensate(root, corrections);
                    if (!corrected && noCandidateBudget-- > 0) {
                        Logger.printInfo(() -> "[BlueIT Profile Overlay V3.2] profile active; no shifted underlay this frame");
                    }
                }
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

    private static final class Node {
        final View view;
        final int depth;
        Node(View view, int depth) {
            this.view = view;
            this.depth = depth;
        }
    }

    private static final class TranslationCorrection {
        final float original;
        final float applied;

        TranslationCorrection(float original, float applied) {
            this.original = original;
            this.applied = applied;
        }
    }
}
