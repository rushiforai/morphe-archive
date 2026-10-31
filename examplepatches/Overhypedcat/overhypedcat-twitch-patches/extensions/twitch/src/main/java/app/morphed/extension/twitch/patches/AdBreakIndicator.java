package app.morphed.extension.twitch.patches;

import android.app.Activity;
import android.app.Application;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.os.Build;
import android.view.DisplayCutout;
import android.view.Gravity;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Map;

/**
 * A small label in the top left corner of the video while an ad break is being blocked.
 */
final class AdBreakIndicator {
    /** Hide the label if no playlist update arrives for this long, for example after leaving the stream. */
    private static final long STALE_MS = 15_000;

    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable hideRunnable = this::hideNow;
    private WeakReference<Activity> resumedActivity = new WeakReference<>(null);
    private WeakReference<View> video = new WeakReference<>(null);
    private boolean callbacksRegistered;
    private TextView label;

    void show(String quality) {
        String text = quality == null ? "Blocking ads" : "Blocking ads (" + quality + ")";
        main.post(() -> {
            registerCallbacks();
            Activity activity = resumedActivity.get();
            if (activity == null) {
                DebugLog.log("Label: no screen in front, not shown");
                return;
            }
            if (label == null) DebugLog.log("Label shown: " + text + " on " + activity.getClass().getSimpleName());

            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            if (label == null || label.getContext() != activity) {
                hideNow();
                label = createLabel(activity);
                decor.addView(label, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.TOP | Gravity.START));
            }
            if (!text.contentEquals(label.getText())) label.setText(text);
            // Repositioned on every update so it follows the video into fullscreen, landscape or a smaller
            // player. The view tree is only searched again when the remembered video view is gone.
            View surface = video.get();
            if (surface == null || !surface.isAttachedToWindow() || !surface.isShown()) {
                surface = findVideoSurface(decor);
                video = new WeakReference<>(surface);
            }
            place(activity, decor, label, surface);
            // bringToFront relayouts the whole window, so only when something else covers the label.
            if (decor.getChildAt(decor.getChildCount() - 1) != label) label.bringToFront();
            main.removeCallbacks(hideRunnable);
            main.postDelayed(hideRunnable, STALE_MS);
        });
    }

    void hide() {
        main.post(this::hideNow);
    }

    private void hideNow() {
        main.removeCallbacks(hideRunnable);
        if (label != null) DebugLog.log("Label hidden");
        if (label != null && label.getParent() instanceof ViewGroup) {
            ((ViewGroup) label.getParent()).removeView(label);
        }
        label = null;
    }

    private static TextView createLabel(Activity activity) {
        TextView view = new TextView(activity);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        view.setTextColor(Color.WHITE);
        view.setSingleLine(true);
        int horizontal = dp(activity, 8);
        int vertical = dp(activity, 3);
        view.setPadding(horizontal, vertical, horizontal, vertical);

        GradientDrawable background = new GradientDrawable();
        background.setColor(0xB3000000);
        background.setCornerRadius(dp(activity, 8));
        view.setBackground(background);
        // No elevation shadow; the label is added last to the window, so it is drawn on top anyway.
        view.setOutlineProvider(null);
        view.setClickable(false);
        view.setFocusable(false);
        view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
        return view;
    }

    /** Top left corner of the video, or of the screen below the status bar when no video is found. */
    private static void place(Activity activity, ViewGroup decor, TextView label, View video) {
        int margin = dp(activity, 8);
        int left = 0;
        int top;
        if (video != null) {
            int[] videoLocation = new int[2];
            int[] decorLocation = new int[2];
            video.getLocationInWindow(videoLocation);
            decor.getLocationInWindow(decorLocation);
            left = videoLocation[0] - decorLocation[0];
            top = videoLocation[1] - decorLocation[1];
        } else {
            WindowInsets insets = decor.getRootWindowInsets();
            top = insets != null ? insets.getSystemWindowInsetTop() : 0;
        }
        // In fullscreen there is no status bar and the video reaches the screen edge, where the
        // camera cutout can be (on the left in landscape). Keep the label clear of it.
        WindowInsets insets = decor.getRootWindowInsets();
        DisplayCutout cutout = insets != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ? insets.getDisplayCutout() : null;
        if (cutout != null) {
            left = Math.max(left, cutout.getSafeInsetLeft());
            top = Math.max(top, cutout.getSafeInsetTop());
        }

        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) label.getLayoutParams();
        if (params.leftMargin != left + margin || params.topMargin != top + margin) {
            params.setMargins(left + margin, top + margin, margin, margin);
            label.setLayoutParams(params);
        }
    }

    /** The largest visible SurfaceView or TextureView, which is what the player draws the video on. */
    private static View findVideoSurface(View view) {
        if (!view.isShown()) return null;
        if (view instanceof SurfaceView || view instanceof TextureView) {
            return view.getWidth() > 0 && view.getHeight() > 0 ? view : null;
        }
        if (!(view instanceof ViewGroup)) return null;

        View largest = null;
        long largestArea = 0;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View surface = findVideoSurface(group.getChildAt(i));
            if (surface == null) continue;
            long area = (long) surface.getWidth() * surface.getHeight();
            if (area > largestArea) {
                largestArea = area;
                largest = surface;
            }
        }
        return largest;
    }

    private static int dp(Activity activity, int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
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
                if (label != null && label.getContext() == activity) hideNow();
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
        } catch (Throwable ignored) {
            // Falls back to the lifecycle callbacks from the next screen change on.
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
