package io.github.jordanwoodson.extension.shared.twitch;

import android.app.Activity;
import android.app.Application;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;

import io.github.jordanwoodson.extension.shared.Logger;
import io.github.jordanwoodson.extension.shared.settings.Settings;

/**
 * AMOLED black: Twitch's dark theme with black instead of its dark greys, for the parts drawn with views. The
 * window background and navigation bar turn black, and after each layout every view background of the dark
 * palette is repainted: the body and base greys (#0e0e10, #18181b) black, the raised grey (#1f1f23) a near black
 * so cards stay apart. Compose screens draw their own backgrounds and keep Twitch's greys. Read once per start.
 * Channel point reward tiles keep the color the channel chose, even when it is one of those greys (issue 76).
 */
@SuppressWarnings("unused")
public final class TwitchTheme {
    static final String KEY = "amoled_black";
    private static final int BODY = 0xFF0E0E10;
    private static final int BASE = 0xFF18181B;
    private static final int RAISED = 0xFF1F1F23;
    private static final int NEAR_BLACK = 0xFF0B0B0D;
    private static Boolean enabled;
    /** The view ID of a channel point reward tile, whose background is the reward's own color; 0 if unknown. */
    private static int rewardTile = -1;

    private TwitchTheme() {
    }

    /**
     * Injection point: the start of the Application's onCreate. The switch is read when the first activity is
     * created, once Lurk's settings can be read, and kept until the app restarts; while it is off the callbacks
     * return at once.
     */
    public static void init(Application application) {
        if (application == null) return;
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity activity, Bundle state) { if (enabled()) apply(activity); }
            @Override public void onActivityStarted(Activity activity) { }
            @Override public void onActivityResumed(Activity activity) { if (enabled()) repaintWindow(activity); }
            @Override public void onActivityPaused(Activity activity) { }
            @Override public void onActivityStopped(Activity activity) { }
            @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) { }
            @Override public void onActivityDestroyed(Activity activity) { }
        });
    }

    private static boolean enabled() {
        Boolean on = enabled;
        if (on == null) {
            enabled = on = Settings.isEnabled(KEY);
            if (on) Logger.d("theme: AMOLED black");
        }
        return on;
    }

    private static boolean dark(Activity activity) {
        return (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
    }

    private static void apply(Activity activity) {
        // Lurk's own settings screen keeps its look.
        if (activity.getClass().getName().startsWith("io.github.jordanwoodson.")) return;
        try {
            Window window = activity.getWindow();
            if (window == null || !dark(activity)) return;
            if (rewardTile == -1) {
                rewardTile = activity.getResources().getIdentifier("reward_inner_container", "id", activity.getPackageName());
            }
            window.setBackgroundDrawable(new ColorDrawable(Color.BLACK));
            if (black(window.getNavigationBarColor()) != window.getNavigationBarColor()) window.setNavigationBarColor(Color.BLACK);
            View decor = window.getDecorView();
            decor.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (!dark(activity)) return;
                    repaint(decor);
                }
            });
        } catch (RuntimeException e) {
            Logger.d("theme: " + e);
        }
    }

    private static void repaintWindow(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window != null && dark(activity) && !activity.getClass().getName().startsWith("io.github.jordanwoodson.")) {
                repaint(window.getDecorView());
            }
        } catch (RuntimeException e) {
            Logger.d("theme: " + e);
        }
    }

    /** The AMOLED color for one of Twitch's dark greys, or the color itself. */
    static int black(int color) {
        switch (color) {
            case BODY:
            case BASE:
                return Color.BLACK;
            case RAISED:
                return NEAR_BLACK;
            default:
                return color;
        }
    }

    /** Repaints the dark-grey backgrounds of a view tree. */
    static void repaint(View view) {
        if (rewardTile > 0 && view.getId() == rewardTile) return;
        Drawable background = view.getBackground();
        if (background instanceof ColorDrawable) {
            int color = ((ColorDrawable) background).getColor();
            int mapped = black(color);
            if (mapped != color) ((ColorDrawable) background.mutate()).setColor(mapped);
        } else if (background instanceof GradientDrawable) {
            ColorStateList colors = ((GradientDrawable) background).getColor();
            if (colors != null && !colors.isStateful()) {
                int color = colors.getDefaultColor();
                int mapped = black(color);
                if (mapped != color) ((GradientDrawable) background.mutate()).setColor(mapped);
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) repaint(group.getChildAt(i));
        }
    }
}
