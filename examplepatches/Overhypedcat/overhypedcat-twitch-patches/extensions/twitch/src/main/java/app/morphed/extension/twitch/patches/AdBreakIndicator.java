package app.morphed.extension.twitch.patches;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.Surface;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.amazonaws.ivs.player.Player;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import app.morphed.extension.twitch.adblock.Problem;

/**
 * A small label in the top left corner of the stream's video while an ad is being blocked, in the
 * vertical and the full screen player. It is only shown while a stream plays with sound (feed
 * previews play muted), over that player's own video view, and never anywhere else.
 */
final class AdBreakIndicator {
    /** Hide the label if no playlist update arrives for this long, for example after leaving the stream. */
    private static final long STALE_MS = 15_000;
    private static final long FLASH_MS = 3_000;
    /** Twitch's player view; its video surface is the one to label. Not obfuscated. */
    private static final String TWITCH_PLAYER_VIEW = "TwitchPlayerView";

    private final Problem.Reporter problems;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable hideRunnable = this::hideNow;
    private final View.OnLayoutChangeListener follow = (view, l, t, r, b, ol, ot, or, ob) -> replace();
    private WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private WeakReference<View> video = new WeakReference<>(null);
    private boolean callbacksRegistered;
    private TextView label;

    AdBreakIndicator(Problem.Reporter problems) {
        this.problems = problems;
    }

    /** Starts following which screen is in front, so the first ad already finds it. */
    void prepare() {
        main.post(() -> safely(this::registerCallbacks));
    }

    void show(String quality) {
        show(quality == null ? "Blocking ads" : "Blocking ads (" + quality + ")", STALE_MS);
    }

    /** Shows {@code text} briefly, for blocks that are over at once (a refused ad request). */
    void flash(String text) {
        main.post(() -> safely(() -> {
            // An ongoing break keeps its own text.
            if (label != null && !text.contentEquals(label.getText())) return;
            showNow(text, FLASH_MS);
        }));
    }

    void hide() {
        main.post(() -> safely(this::hideNow));
    }

    private void show(String text, long visibleMs) {
        main.post(() -> safely(() -> showNow(text, visibleMs)));
    }

    /** Main thread work must never crash Twitch: failures become an error message (E7). */
    private void safely(Runnable work) {
        try {
            work.run();
        } catch (Throwable t) {
            DebugLog.log("Label failed: " + t);
            try {
                hideNow();
            } catch (Throwable ignored) {
                // Nothing more to clean up.
            }
            problems.report(Problem.LABEL_FAILED, t.toString());
        }
    }

    private void showNow(String text, long visibleMs) {
        registerCallbacks();
        Player watched = PlayerRefresher.watchedPlayer();
        if (watched == null) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): no stream playing");
            return;
        }
        View surface = findWatchedVideo(watched);
        if (surface == null) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): the stream's video is not on screen");
            return;
        }
        ViewGroup host = hostFor(surface);
        if (host == null) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): no window to show it in");
            return;
        }

        if (label == null || label.getParent() != host || video.get() != surface) {
            hideNow();
            label = createLabel(host.getContext());
            host.addView(label, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START));
            video = new WeakReference<>(surface);
            // Follows the video into full screen and back, and through rotations.
            surface.addOnLayoutChangeListener(follow);
            DebugLog.log("Label shown: " + text + " in " + host.getClass().getSimpleName()
                    + " over " + surface.getClass().getSimpleName() + " " + describe(surface));
        }
        if (!text.contentEquals(label.getText())) label.setText(text);
        place(host, label, surface);
        // bringToFront relayouts the whole window, so only when something else covers the label.
        if (host.getChildAt(host.getChildCount() - 1) != label) label.bringToFront();
        main.removeCallbacks(hideRunnable);
        main.postDelayed(hideRunnable, visibleMs);
    }

    private void replace() {
        safely(() -> {
            View surface = video.get();
            if (label == null || surface == null || !(label.getParent() instanceof ViewGroup)) return;
            if (visibleArea(surface) == 0) {
                hideNow();
                return;
            }
            place((ViewGroup) label.getParent(), label, surface);
        });
    }

    private void hideNow() {
        main.removeCallbacks(hideRunnable);
        View surface = video.get();
        if (surface != null) surface.removeOnLayoutChangeListener(follow);
        video = new WeakReference<>(null);
        if (label != null) {
            DebugLog.log("Label hidden");
            if (label.getParent() instanceof ViewGroup) ((ViewGroup) label.getParent()).removeView(label);
        }
        label = null;
    }

    /**
     * The video view of {@code watched}: a SurfaceView whose surface is the one the player draws on,
     * else the most visible video view inside Twitch's player view, else the most visible one.
     */
    private View findWatchedVideo(Player watched) {
        Surface surface = PlayerRefresher.surfaceOf(watched);
        List<View> candidates = new ArrayList<>();
        for (View root : rootViews(resumedActivity.get())) collectVideoViews(root, candidates);

        for (View candidate : candidates) {
            if (surface != null && candidate instanceof SurfaceView
                    && ((SurfaceView) candidate).getHolder().getSurface() == surface) {
                return candidate;
            }
        }
        View inPlayer = mostVisible(candidates, true);
        return inPlayer != null ? inPlayer : mostVisible(candidates, false);
    }

    private static void collectVideoViews(View view, List<View> into) {
        if (view == null || !view.isShown()) return;
        if (view instanceof SurfaceView || view instanceof TextureView) {
            if (visibleArea(view) > 0) into.add(view);
            return;
        }
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collectVideoViews(group.getChildAt(i), into);
    }

    private static View mostVisible(List<View> candidates, boolean onlyInPlayer) {
        View best = null;
        long bestArea = 0;
        for (View candidate : candidates) {
            if (onlyInPlayer && !insideTwitchPlayer(candidate)) continue;
            long area = visibleArea(candidate);
            if (area > bestArea) {
                bestArea = area;
                best = candidate;
            }
        }
        return best;
    }

    private static boolean insideTwitchPlayer(View view) {
        for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
            if (parent.getClass().getSimpleName().equals(TWITCH_PLAYER_VIEW)) return true;
        }
        return false;
    }

    /** The video's window root, if it can hold the label; else the activity's window. */
    private ViewGroup hostFor(View surface) {
        View root = surface.getRootView();
        if (root instanceof FrameLayout) return (ViewGroup) root;
        Activity activity = resumedActivity.get();
        if (activity == null) activity = activityOf(surface.getContext());
        if (activity == null) return null;
        View decor = activity.getWindow().getDecorView();
        return decor instanceof FrameLayout ? (ViewGroup) decor : null;
    }

    private static Activity activityOf(Context context) {
        for (Context c = context; c != null; c = c instanceof ContextWrapper ? ((ContextWrapper) c).getBaseContext() : null) {
            if (c instanceof Activity) return (Activity) c;
            if (!(c instanceof ContextWrapper)) break;
        }
        return null;
    }

    /** How many pixels of {@code view} are on screen, after clipping by its parents and the screen. */
    private static long visibleArea(View view) {
        if (view == null) return 0;
        Rect visible = new Rect();
        if (!view.getGlobalVisibleRect(visible)) return 0;
        return (long) visible.width() * visible.height();
    }

    private static String describe(View view) {
        Rect visible = new Rect();
        view.getGlobalVisibleRect(visible);
        return view.getWidth() + "x" + view.getHeight() + ", visible " + visible.toShortString()
                + (insideTwitchPlayer(view) ? ", in TwitchPlayerView" : "");
    }

    /**
     * Root views of all the app's windows, the activity first. Read from WindowManagerGlobal; if
     * Android blocks that, only the activity's window is searched.
     */
    private static List<View> rootViews(Activity activity) {
        List<View> roots = new ArrayList<>();
        if (activity != null) roots.add(activity.getWindow().getDecorView());
        try {
            Class<?> global = Class.forName("android.view.WindowManagerGlobal");
            Object instance = global.getMethod("getInstance").invoke(null);
            Field views = global.getDeclaredField("mViews");
            views.setAccessible(true);
            for (Object view : new ArrayList<>((List<?>) views.get(instance))) {
                if (view instanceof View && !roots.contains(view)) roots.add((View) view);
            }
        } catch (Throwable t) {
            DebugLog.log("Label: other windows not readable (" + t + "), searching the activity only");
        }
        return roots;
    }

    private static TextView createLabel(Context context) {
        TextView view = new TextView(context);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        view.setTextColor(Color.WHITE);
        view.setSingleLine(true);
        int horizontal = dp(context, 8);
        int vertical = dp(context, 3);
        view.setPadding(horizontal, vertical, horizontal, vertical);

        GradientDrawable background = new GradientDrawable();
        background.setColor(0xB3000000);
        background.setCornerRadius(dp(context, 8));
        view.setBackground(background);
        // No elevation shadow; the label is added last to the window, so it is drawn on top anyway.
        view.setOutlineProvider(null);
        view.setClickable(false);
        view.setFocusable(false);
        view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        return view;
    }

    /**
     * Top left corner of the part of the video that is on screen: in full screen the video can be
     * cropped (wider than the screen), and its own corner is then off screen.
     */
    private static void place(ViewGroup host, TextView label, View video) {
        Context context = host.getContext();
        int margin = dp(context, 8);
        // Visible rect in the coordinates of the window's root view, which is the label's parent.
        Rect visible = new Rect();
        video.getGlobalVisibleRect(visible);
        int left = Math.max(0, visible.left);
        int top = Math.max(0, visible.top);
        // In fullscreen there is no status bar and the video reaches the screen edge, where the
        // camera cutout can be (on the left in landscape). Keep the label clear of it.
        WindowInsets insets = host.getRootWindowInsets();
        DisplayCutout cutout = insets != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ? insets.getDisplayCutout() : null;
        if (cutout != null) {
            left = Math.max(left, cutout.getSafeInsetLeft());
            top = Math.max(top, cutout.getSafeInsetTop());
        }

        ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) label.getLayoutParams();
        if (params.leftMargin != left + margin || params.topMargin != top + margin) {
            params.setMargins(left + margin, top + margin, margin, margin);
            label.setLayoutParams(params);
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private void registerCallbacks() {
        if (callbacksRegistered) return;
        Application application = currentApplication();
        if (application == null) return;
        callbacksRegistered = true;
        // The screen with the player is usually already showing when the first ad arrives.
        resumedActivity = new WeakReference<>(findResumedActivity());
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                resumedActivity = new WeakReference<>(activity);
            }

            @Override
            public void onActivityPaused(Activity activity) {
                if (resumedActivity.get() == activity) resumedActivity = new WeakReference<>(null);
                if (label != null && activityOf(label.getContext()) == activity) safely(AdBreakIndicator.this::hideNow);
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /** The activity in the foreground, read from ActivityThread; null if Android blocks the lookup. */
    private static Activity findResumedActivity() {
        try {
            Class<?> activityThreadClass = Class.forName("android.app.ActivityThread");
            Object activityThread = activityThreadClass.getMethod("currentActivityThread").invoke(null);
            Field activitiesField = activityThreadClass.getDeclaredField("mActivities");
            activitiesField.setAccessible(true);
            Map<?, ?> activities = (Map<?, ?>) activitiesField.get(activityThread);
            if (activities == null) return null;
            for (Object record : activities.values()) {
                Field pausedField = record.getClass().getDeclaredField("paused");
                pausedField.setAccessible(true);
                if (pausedField.getBoolean(record)) continue;
                Field activityField = record.getClass().getDeclaredField("activity");
                activityField.setAccessible(true);
                return (Activity) activityField.get(record);
            }
        } catch (Throwable t) {
            // The video's own context is used instead.
            DebugLog.log("Label: screen in front not readable (" + t + ")");
        }
        return null;
    }

    static Application currentApplication() {
        try {
            return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
