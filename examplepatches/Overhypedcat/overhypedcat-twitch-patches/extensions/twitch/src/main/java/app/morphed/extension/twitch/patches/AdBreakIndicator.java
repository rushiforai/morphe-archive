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
import android.widget.Toast;

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

    /** WindowManagerGlobal and its list of window roots, looked up once (main thread only). */
    private static Object windowManager;
    private static Field windowViews;

    private final Problem.Reporter problems;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable hideRunnable = this::hideNow;
    private final View.OnLayoutChangeListener follow = (view, l, t, r, b, ol, ot, or, ob) -> replace();
    private WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private WeakReference<View> video = new WeakReference<>(null);
    private boolean callbacksRegistered;
    private TextView label;
    private final ToastThrottle toasts = new ToastThrottle();
    /** The fallback toast on screen (or recently shown), cancelled when the label shows. */
    private Toast toast;

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

    /**
     * Shows {@code text} briefly, for blocks that are over at once (a refused ad). {@code onShown}
     * runs (main thread) only if the user got to see it, as a label or a toast.
     */
    void flash(String text, Runnable onShown) {
        main.post(() -> safely(() -> {
            // An ongoing break keeps its own text; its label already tells the user.
            if (label != null && !text.contentEquals(label.getText())) {
                onShown.run();
                return;
            }
            if (showNow(text, FLASH_MS, false)) onShown.run();
        }));
    }

    /** The break is over. */
    void hide() {
        main.post(() -> safely(() -> {
            toasts.breakOver();
            hideNow();
        }));
    }

    private void show(String text, long visibleMs) {
        main.post(() -> safely(() -> showNow(text, visibleMs, true)));
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

    /** Returns whether the user got to see it (label or toast); {@code duringBreak} for break labels. */
    private boolean showNow(String text, long visibleMs, boolean duringBreak) {
        registerCallbacks();
        Player watched = PlayerRefresher.watchedPlayer();
        if (watched == null) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): no stream playing");
            return false;
        }
        if (PlayerRefresher.playsAudioOnly(watched)) {
            // No video to put it on (its hidden view would place the label over the header).
            hideNow();
            DebugLog.log("Label not shown (" + text + "): audio only");
            return fallbackToast(text, duringBreak);
        }
        // During a break this runs on every poll: while the label still sits over a visible video,
        // only its text and timeout change, without searching every window for the video again.
        View current = video.get();
        if (current != null && inPictureInPicture(current)) {
            // The stream moved into a small player: no label there (see inPictureInPicture).
            hideNow();
            DebugLog.log("Label not shown (" + text + "): picture in picture");
            return false;
        }
        if (label != null && label.isAttachedToWindow() && current != null && current.isShown()
                && visibleArea(current) > 0 && label.getParent() instanceof ViewGroup
                && label.getRootView() == current.getRootView()) {
            dismissToast();
            if (!text.contentEquals(label.getText())) label.setText(text);
            ViewGroup parent = (ViewGroup) label.getParent();
            // The video can move without a layout of its own (a dragged mini player, a scrolling parent).
            place(parent, label, current);
            if (parent.getChildAt(parent.getChildCount() - 1) != label) label.bringToFront();
            main.removeCallbacks(hideRunnable);
            main.postDelayed(hideRunnable, visibleMs);
            return true;
        }
        List<View> previews = new ArrayList<>();
        View surface = findWatchedVideo(watched, previews);
        if (surface == null && !previews.isEmpty()) {
            // Only feed previews are on screen (the stream plays on in the background or a mini
            // player that is not visible): the user is looking for a stream, so nothing is shown.
            hideNow();
            DebugLog.log("Label not shown (" + text + "): only feed previews on screen");
            return false;
        }
        if (surface != null && inPictureInPicture(surface)) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): picture in picture");
            return false;
        }
        if (surface == null) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): the stream's video is not on screen");
            // Something plays with sound but its video cannot be found (audio only, a player in
            // another window): the block is still shown, as a short message.
            return fallbackToast(text, duringBreak);
        }
        ViewGroup host = hostFor(surface);
        if (host == null) {
            hideNow();
            DebugLog.log("Label not shown (" + text + "): no window to show it in");
            return fallbackToast(text, duringBreak);
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
        // The label and a toast are never on screen together: the label takes over.
        dismissToast();
        if (!text.contentEquals(label.getText())) label.setText(text);
        place(host, label, surface);
        // bringToFront relayouts the whole window, so only when something else covers the label.
        if (host.getChildAt(host.getChildCount() - 1) != label) label.bringToFront();
        main.removeCallbacks(hideRunnable);
        main.postDelayed(hideRunnable, visibleMs);
        return true;
    }

    /**
     * Shows the block as a toast when the label cannot be placed over the video. Only while one of
     * Twitch's screens is in front: with the app in the background (audio playing on) or a screen
     * being left, a toast would land over other apps or the main page. One per break (see ToastThrottle).
     */
    private boolean fallbackToast(String text, boolean duringBreak) {
        if (resumedActivity.get() == null) {
            DebugLog.log("No message for \"" + text + "\": Twitch is not in front");
            return false;
        }
        // Already told during this break.
        if (!toasts.allow(duringBreak)) return true;
        Application app = currentApplication();
        if (app == null) {
            problems.report(Problem.LABEL_FAILED, "no screen to show \"" + text + "\" on");
            return false;
        }
        // Only called after hideNow(): no label is on screen while the toast shows.
        dismissToast();
        toast = Toast.makeText(app, text, Toast.LENGTH_SHORT);
        toast.show();
        DebugLog.log("Shown as a message instead: " + text);
        return true;
    }

    private void dismissToast() {
        if (toast == null) return;
        toast.cancel();
        toast = null;
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
    private View findWatchedVideo(Player watched, List<View> previews) {
        Surface surface = PlayerRefresher.surfaceOf(watched);
        List<View> all = new ArrayList<>();
        for (View root : rootViews(resumedActivity.get())) collectVideoViews(root, all);
        // Videos in a scrolling list are feed previews (Live, Following, vertical feed), never the
        // stream being watched: Twitch's TextureViews cannot be matched to their player, so without
        // this the most visible preview would get the label of a stream playing elsewhere.
        List<View> candidates = new ArrayList<>();
        for (View view : all) {
            if (inScrollingList(view)) previews.add(view);
            else candidates.add(view);
        }

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

    /**
     * Whether {@code video} plays in a small player: Android's picture in picture window over other
     * apps, or Twitch's own mini player in a corner of the app. The user asked for no label there
     * (and no message instead); it comes back when the stream is opened again during the break.
     */
    private static boolean inPictureInPicture(View video) {
        Activity activity = activityOf(video.getContext());
        if (activity != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && activity.isInPictureInPictureMode()) {
            return true;
        }
        View root = video.getRootView();
        if (root == null) return false;
        Rect visible = new Rect();
        if (!video.getGlobalVisibleRect(visible)) return false;
        return isMiniPlayer(visible.left, visible.width(), root.getWidth());
    }

    /**
     * Twitch's mini player sits in a corner, under half the screen wide, and grows or shrinks there
     * when it comes back from picture in picture. The stream and past broadcast screens show the
     * video across the whole width, or centred in full screen when the video is narrower than the screen.
     */
    static boolean isMiniPlayer(int left, int width, int windowWidth) {
        if (width <= 0 || windowWidth <= 0) return false;
        if (width * 2 < windowWidth) return true;
        boolean fullWidth = width * 100 >= windowWidth * 95;
        int offCentre = Math.abs(2 * left + width - windowWidth);
        return !fullWidth && offCentre * 10 > windowWidth;
    }

    /**
     * Whether {@code video} is an item of a vertically scrolling list. Twitch's feeds are lists of
     * playing previews; the stream and past broadcast screens keep their player outside any list.
     * Decided by the layout, not by player types, which Twitch changes.
     */
    private static boolean inScrollingList(View video) {
        return Ancestors.any(video,
                view -> view.getParent() instanceof View ? (View) view.getParent() : null,
                view -> view instanceof ViewGroup && (view.canScrollVertically(1) || view.canScrollVertically(-1)));
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
            if (windowViews == null) {
                Class<?> global = Class.forName("android.view.WindowManagerGlobal");
                windowManager = global.getMethod("getInstance").invoke(null);
                Field views = global.getDeclaredField("mViews");
                views.setAccessible(true);
                windowViews = views;
            }
            for (Object view : new ArrayList<>((List<?>) windowViews.get(windowManager))) {
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
