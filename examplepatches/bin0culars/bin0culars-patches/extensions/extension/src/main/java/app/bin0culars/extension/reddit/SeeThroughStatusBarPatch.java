package app.bin0culars.extension.reddit;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Resources;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.os.Bundle;
import android.view.Display;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowManager;
import app.bin0culars.extension.reddit.settings.BinocularsMods;
import java.lang.ref.WeakReference;
import kotlin.jvm.functions.Function1;

public final class SeeThroughStatusBarPatch {

    private static volatile long appBarColor = 0L;
    private static volatile boolean sideLayout;
    private static volatile int cachedStatusBarPx = 0;
    private static volatile WeakReference<Activity> currentActivity = null;
    private static volatile Context windowContext = null;
    private static volatile boolean lifecycleRegistered = false;

    private static final Function1<Object, Object> SCRIM_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        GlassNavPatch.drawContent(scope);
                    } catch (Throwable ignored) {
                    }
                    try {
                        if (on()) {
                            drawScrim(scope);
                        }
                    } catch (Throwable ignored) {
                    }
                    return null;
                }
            };

    private static final Function1<Object, Object> BODY_DRAW =
            new Function1<Object, Object>() {
                @Override
                public Object invoke(Object scope) {
                    try {
                        drawBody(scope);
                    } catch (Throwable ignored) {
                    } finally {
                        try {
                            GlassNavPatch.drawContent(scope);
                        } catch (Throwable ignored) {
                        }
                    }
                    return null;
                }
            };

    private SeeThroughStatusBarPatch() {}

    private static boolean on() {
        return BinocularsMods.isEnabled("see_through_status_bar") && !sideLayout;
    }

    public static void sideLayout(boolean value) {
        try {
            sideLayout = value;
        } catch (Throwable ignored) {
        }
    }

    public static long appBarColor(long c) {
        try {
            appBarColor = c;
            return on() ? (c & 0x00FFFFFFFFFFFFFFL) : c;
        } catch (Throwable ignored) {
            return c;
        }
    }

    public static Object appBarBody(Object modifier) {
        try {
            return (on() && appBarColor != 0L) ? drawWithContent(modifier, BODY_DRAW) : modifier;
        } catch (Throwable ignored) {
            return modifier;
        }
    }

    public static Object feedBoxModifier(Object padded, Object unpadded) {
        try {
            return on() ? drawWithContent(unpadded, SCRIM_DRAW) : padded;
        } catch (Throwable ignored) {
            return padded;
        }
    }

    public static float topBarHeight(float dp) {
        try {
            if (!on()) {
                return dp;
            }
            float density = GlassNavPatch.getDensity();
            return dp + (density > 0f ? (statusBarPx() / density) : 0f);
        } catch (Throwable ignored) {
            return dp;
        }
    }

    private static void ensureLifecycleCallbacks() {
        if (lifecycleRegistered) {
            return;
        }
        synchronized (SeeThroughStatusBarPatch.class) {
            if (lifecycleRegistered) {
                return;
            }
            Context ctx = GlassNavPatch.getApplicationContext();
            if (ctx instanceof Application) {
                ((Application) ctx)
                        .registerActivityLifecycleCallbacks(
                                new Application.ActivityLifecycleCallbacks() {
                                    @Override
                                    public void onActivityCreated(
                                            Activity activity, Bundle savedInstanceState) {
                                        currentActivity = new WeakReference<>(activity);
                                    }

                                    @Override
                                    public void onActivityStarted(Activity activity) {}

                                    @Override
                                    public void onActivityResumed(Activity activity) {
                                        currentActivity = new WeakReference<>(activity);
                                    }

                                    @Override
                                    public void onActivityPaused(Activity activity) {}

                                    @Override
                                    public void onActivityStopped(Activity activity) {}

                                    @Override
                                    public void onActivitySaveInstanceState(
                                            Activity activity, Bundle outState) {}

                                    @Override
                                    public void onActivityDestroyed(Activity activity) {
                                        WeakReference<Activity> ref = currentActivity;
                                        if (ref != null && ref.get() == activity) {
                                            currentActivity = null;
                                        }
                                    }
                                });
                lifecycleRegistered = true;
            }
        }
    }

    private static int getDecorViewInset() {
        WeakReference<Activity> ref = currentActivity;
        Activity activity = ref != null ? ref.get() : null;
        if (activity != null && activity.getWindow() != null) {
            View decorView = activity.getWindow().getDecorView();
            if (decorView != null) {
                WindowInsets insets = decorView.getRootWindowInsets();
                if (insets != null) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                        return insets.getInsets(WindowInsets.Type.systemBars()).top;
                    } else {
                        return insets.getSystemWindowInsetTop();
                    }
                }
            }
        }
        return 0;
    }

    private static int getWindowContextInset() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            return 0;
        }
        try {
            if (windowContext == null) {
                synchronized (SeeThroughStatusBarPatch.class) {
                    if (windowContext == null) {
                        Context appContext = GlassNavPatch.getApplicationContext();
                        if (appContext != null) {
                            DisplayManager dm = appContext.getSystemService(DisplayManager.class);
                            if (dm != null) {
                                Display display = dm.getDisplay(Display.DEFAULT_DISPLAY);
                                if (display != null) {
                                    windowContext =
                                            appContext
                                                    .createDisplayContext(display)
                                                    .createWindowContext(
                                                            WindowManager.LayoutParams
                                                                    .TYPE_APPLICATION,
                                                            null);
                                }
                            }
                        }
                    }
                }
            }
            if (windowContext != null) {
                WindowManager wm = windowContext.getSystemService(WindowManager.class);
                if (wm != null) {
                    WindowInsets insets = wm.getCurrentWindowMetrics().getWindowInsets();
                    if (insets != null) {
                        return insets.getInsets(WindowInsets.Type.systemBars()).top;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return 0;
    }

    private static int statusBarPx() {
        try {
            ensureLifecycleCallbacks();

            int inset = getDecorViewInset();
            if (inset > 0) {
                cachedStatusBarPx = inset;
                return inset;
            }

            inset = getWindowContextInset();
            if (inset > 0) {
                cachedStatusBarPx = inset;
                return inset;
            }

            if (cachedStatusBarPx > 0) {
                return cachedStatusBarPx;
            }

            int resourceId =
                    Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android");
            if (resourceId > 0) {
                inset = Resources.getSystem().getDimensionPixelSize(resourceId);
                if (inset > 0) {
                    cachedStatusBarPx = inset;
                    return inset;
                }
            }
        } catch (Throwable ignored) {
        }
        return cachedStatusBarPx;
    }

    private static long packFloats(float x, float y) {
        return ((long) Float.floatToRawIntBits(x) << 32)
                | (Float.floatToRawIntBits(y) & 0xFFFFFFFFL);
    }

    private static void drawScrim(Object scope) {
        long color = appBarColor;
        if (color == 0L) {
            return;
        }
        int h = statusBarPx();
        if (h <= 0) {
            return;
        }
        long scopeSize = GlassNavPatch.drawScopeSize(scope);
        float width = Float.intBitsToFloat((int) (scopeSize >>> 32));
        if (width <= 0f) {
            return;
        }

        int rgb = ((int) (color >>> 32)) & 0x00FFFFFF;
        int n = h;
        int runStart = 0;
        int runAlpha = 0;
        for (int i = 0; i <= n; i++) {
            int alpha = 0;
            if (i < n) {
                double t = (i + 0.5) / (double) n;
                double factor = 0.92 * Math.pow(1.0 - t, 1.6);
                alpha = Math.min(255, Math.max(0, (int) Math.round(255.0 * factor)));
            }
            if (alpha != runAlpha) {
                if (runAlpha > 0) {
                    int bandArgb = (runAlpha << 24) | rgb;
                    long bandColor = ((long) bandArgb & 0xFFFFFFFFL) << 32;

                    long topLeft = packFloats(0f, (float) runStart);
                    long size = packFloats(width, (float) (i - runStart));
                    long cornerRadius = packFloats(0f, 0f);

                    GlassNavPatch.drawRoundRect(
                            scope, bandColor, topLeft, size, cornerRadius, null, 1.0f, 0xF0);
                }
                runStart = i;
                runAlpha = alpha;
            }
        }
    }

    private static void drawBody(Object scope) {
        long color = appBarColor;
        if (color == 0L) {
            return;
        }
        int h = statusBarPx();
        long scopeSize = GlassNavPatch.drawScopeSize(scope);
        float width = Float.intBitsToFloat((int) (scopeSize >>> 32));
        float height = Float.intBitsToFloat((int) scopeSize);
        long topLeft = packFloats(0f, -h);
        long size = packFloats(width, height + h);
        long cornerRadius = packFloats(0f, 0f);
        GlassNavPatch.drawRoundRect(
                scope, color, topLeft, size, cornerRadius, null, 1.0f, 0xF0);
    }

    @SuppressWarnings("rawtypes")
    private static Object drawWithContent(Object modifier, Function1 block) {
        return modifier;
    }
}
