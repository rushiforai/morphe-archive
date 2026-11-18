package io.github.sabopura.morphe.extension.twitch.app;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;

/**
 * Black instead of Twitch's dark greys, for what is drawn with Android views: the window and, after
 * each layout, every view background of the dark palette. Compose draws its own backgrounds and
 * keeps the greys. Read once per start.
 */
public final class AmoledBlack {
    public static final String KEY = "amoled_black";
    private static final int BLACK = 0xFF000000;
    private static final int BODY = 0xFF0E0E10;
    private static final int BASE = 0xFF18181B;
    private static final int RAISED = 0xFF1F1F23;
    private static final int NEAR_BLACK = 0xFF0B0B0D;
    private static Boolean enabled;

    private AmoledBlack() {
    }

    public static void initialize(Context context) {
        ((Application) context.getApplicationContext()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, Bundle state) {
                if (enabled()) apply(activity);
            }

            @Override
            public void onActivityResumed(Activity activity) {
                if (enabled()) repaintWindow(activity);
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    private static boolean enabled() {
        if (enabled == null) {
            try {
                enabled = AppHooks.on(Feature.AMOLED_BLACK, KEY);
            } catch (RuntimeException | LinkageError e) {
                Diagnostics.note("app.amoled-setting", e);
                enabled = false;
            }
        }
        return enabled;
    }

    private static boolean themed(Activity activity) {
        return !activity.getClass().getName().startsWith("io.github.sabopura.")
                && (activity.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
    }

    private static void apply(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null || !themed(activity)) return;
            window.setBackgroundDrawable(new ColorDrawable(BLACK));
            if (black(window.getNavigationBarColor()) != window.getNavigationBarColor()) window.setNavigationBarColor(BLACK);
            View decor = window.getDecorView();
            decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                try {
                    if (themed(activity)) repaint(decor);
                } catch (RuntimeException | LinkageError e) {
                    Diagnostics.note("app.amoled-layout", e);
                }
            });
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.amoled-apply", e);
        }
    }

    private static void repaintWindow(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window != null && themed(activity)) repaint(window.getDecorView());
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.amoled-resume", e);
        }
    }

    /** Twitch's dark greys map to black; the raised grey stays near black so cards stay apart. */
    static int black(int color) {
        switch (color) {
            case BODY:
            case BASE:
                return BLACK;
            case RAISED:
                return NEAR_BLACK;
            default:
                return color;
        }
    }

    /** A view that is gone is skipped: showing it again lays it out, which repaints it then. */
    private static void repaint(View view) {
        if (view.getVisibility() == View.GONE) return;
        Drawable background = view.getBackground();
        if (background instanceof ColorDrawable) {
            int color = ((ColorDrawable) background).getColor();
            if (black(color) != color) ((ColorDrawable) background.mutate()).setColor(black(color));
        } else if (background instanceof GradientDrawable) {
            ColorStateList colors = ((GradientDrawable) background).getColor();
            if (colors != null && !colors.isStateful() && black(colors.getDefaultColor()) != colors.getDefaultColor())
                ((GradientDrawable) background.mutate()).setColor(black(colors.getDefaultColor()));
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) repaint(group.getChildAt(i));
        }
    }
}
