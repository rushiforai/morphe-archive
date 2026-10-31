package com.dhuadapter.display;

import android.app.Activity;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.TextView;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 1 — Display / UI (rendering-DPI, layout-DPI, orientation, font,
 * inset padding, WebView zoom/UA). The one category ON by default. Window
 * chrome (fullscreen / rounded corners / back button) lives in LifecycleHooks.
 */
public final class DisplayHooks {

    private static final String TAG = HookEnv.TAG;
    private static Typeface customTypeface;

    private DisplayHooks() {}

    public static void install() {
        installDisplayMetricsHook();
        installConfigurationHook();
        installSetRequestedOrientationHook();
        installViewOnAttachedHook();
        installSetPaddingRelativeHook();
        installWebViewZoomHook();
        installConfigUpdateFromDensity();
        installEarlyDensityPoints();
        installWidthCapResources();   // phone-UI: rewrite the Configuration the framework uses to SELECT resources
    }

    // Density-only Configuration transform for paths WITHOUT paired metrics
    // (SharedHooks updateFrom / getConfiguration results). Keeps densityDpi
    // consistent with our single chosen density; the full dp recompute needs
    // real pixels and happens in recomputeDp (updateConfiguration / pushMetrics).
    private static void capConfig(Configuration c) {
        if (c == null) return;
        c.densityDpi = HookEnv.config.configDpi;
    }

    // Recompute BOTH dp dimensions for OUR single density (configDpi ==
    // metricsDpi), dynamically from the CURRENT window's real size — no
    // hardcoded dp, NO phone cap (native tablet layout preserved).
    //
    // Windowed-mode aware (e.g. a car launcher running the app in a resized /
    // freeform / docked window): prefer WindowManager.getCurrentWindowMetrics()
    // .getBounds() (API 30+), which reflects the actual WINDOW size, over
    // DisplayMetrics (which on some builds reports the whole DISPLAY, not the
    // window). We take the SMALLER of the two per axis: if the window == full
    // screen they are equal (no change); if the launcher gave a narrower/shorter
    // window, the window bounds win, so screenWidthDp/screenHeightDp track the
    // real window. Fullscreen-aware too: bounds/metrics shrink with the bars.
    //   screenWidthDp  = usableWidthPx  / density
    //   screenHeightDp = usableHeightPx / density
    private static void recomputeDp(Configuration c, DisplayMetrics dm) {
        if (c == null) return;
        c.densityDpi = HookEnv.config.configDpi;                 // impose our density
        if (dm == null || dm.widthPixels <= 0 || dm.heightPixels <= 0) return;
        float ourDensity = HookEnv.config.configDpi / 160f;      // Android: density = densityDpi / 160

        int wPx = dm.widthPixels;
        int hPx = dm.heightPixels;

        // Prefer current WINDOW bounds when they are smaller (windowed / resized).
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R && HookEnv.appContext != null) {
                android.view.WindowManager wm =
                        HookEnv.appContext.getSystemService(android.view.WindowManager.class);
                if (wm != null) {
                    android.view.WindowMetrics wmet = wm.getCurrentWindowMetrics();
                    if (wmet != null) {
                        android.graphics.Rect b = wmet.getBounds();
                        int bw = b.width(), bh = b.height();
                        // take the smaller per axis: full-screen -> equal (no-op);
                        // launcher window -> window bounds are smaller and win.
                        if (bw > 0 && bw < wPx) wPx = bw;
                        if (bh > 0 && bh < hPx) hPx = bh;
                    }
                }
            }
        } catch (Throwable ignore) { /* fall back to DisplayMetrics */ }

        int wDp = Math.round(wPx / ourDensity);                  // window width  → dp
        int hDp = Math.round(hPx / ourDensity);                  // window height → dp
        c.screenWidthDp  = wDp;
        c.screenHeightDp = hDp;
        c.smallestScreenWidthDp = Math.min(wDp, hDp);
    }

    // THE KEY HOOK — ResourcesImpl.updateConfiguration builds the ResTable_config
    // the framework uses to SELECT resource buckets (values-w####dp / sw###dp).
    // We rewrite the dp dimensions here to match OUR density, dynamically from
    // the paired real DisplayMetrics — no phone cap, tablet layout preserved.
    private static void installWidthCapResources() {
        if (!HookEnv.config.display) return;
        try {
            Class<?> impl = Class.forName("android.content.res.ResourcesImpl");
            Class<?> compat = Class.forName("android.content.res.CompatibilityInfo");
            Method m = impl.getDeclaredMethod("updateConfiguration",
                    Configuration.class, DisplayMetrics.class, compat);
            m.setAccessible(true);
            Pine.hook(m, new MethodHook() {
                @Override public void beforeCall(Pine.CallFrame f) {
                    try {
                        Configuration cfg = (f.args != null && f.args.length > 0 && f.args[0] instanceof Configuration)
                                ? (Configuration) f.args[0] : null;
                        DisplayMetrics dm = (f.args != null && f.args.length > 1 && f.args[1] instanceof DisplayMetrics)
                                ? (DisplayMetrics) f.args[1] : null;
                        if (cfg != null) {
                            recomputeDp(cfg, dm);   // dynamic dp from real px ÷ our density
                        }
                    } catch (Throwable t) { /* ignore */ }
                }
            });
            Log.i(TAG, "Hook installed: ResourcesImpl.updateConfiguration dynamic dp @ "
                    + HookEnv.config.configDpi + "dpi");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook ResourcesImpl.updateConfiguration", t);
        }
    }

    // Optional fallback: force the tablet bool resources false by name (version-stable).
    // Category 1 contribution to the SHARED Configuration.updateFrom hook: cap
    // width toward phone + force configDpi. Registered via SharedHooks (single
    // hook shared with Category 4's deCar) — NOT a second Pine hook on updateFrom.
    private static void installConfigUpdateFromDensity() {
        com.dhuadapter.core.SharedHooks.registerConfigTransform(
                com.dhuadapter.core.SharedHooks.CONFIG_UPDATE_FROM,
                DisplayHooks::capConfig);
        Log.i(TAG, "Registered: Configuration.updateFrom width-cap + densityDpi (via SharedHooks)");
    }

    // Early density points: apply metrics BEFORE Application.onCreate and on the
    // earliest ContextWrapper, so the app sees our density from the very start.
    // Both are pure android.* framework methods. These are also the first points
    // where a WORKING context exists — settings-panel runtime overrides are
    // applied here (before pushMetrics), retried until one hook succeeds.
    private static void installEarlyDensityPoints() {
        // Instrumentation.callApplicationOnCreate(Application) — fires just before
        // Application.onCreate; push metrics onto the app's Resources first.
        try {
            Method m = android.app.Instrumentation.class.getMethod(
                    "callApplicationOnCreate", android.app.Application.class);
            Pine.hook(m, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame f) {
                    try {
                        if (f.args != null && f.args.length > 0
                                && f.args[0] instanceof android.content.Context) {
                            android.content.Context ctx = (android.content.Context) f.args[0];
                            if (HookEnv.config != null) {
                                HookEnv.config.applyRuntimeOverrides(ctx);
                            }
                            pushMetrics(ctx);
                        }
                    } catch (Throwable t) { /* ignore */ }
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook Instrumentation.callApplicationOnCreate", t);
        }

        // ContextWrapper.attachBaseContext(Context) — protected; resolve reflectively.
        // The first fire is the Application itself; the passed base context is
        // already usable for SharedPreferences, so runtime overrides load here —
        // the earliest point they can.
        try {
            Method m = android.content.ContextWrapper.class.getDeclaredMethod(
                    "attachBaseContext", android.content.Context.class);
            m.setAccessible(true);
            Pine.hook(m, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame f) {
                    try {
                        if (f.args != null && f.args.length > 0
                                && f.args[0] instanceof android.content.Context) {
                            android.content.Context ctx = (android.content.Context) f.args[0];
                            if (HookEnv.config != null) {
                                HookEnv.config.applyRuntimeOverrides(ctx);
                            }
                            pushMetrics(ctx);
                        }
                    } catch (Throwable t) { /* ignore */ }
                }
            });
            Log.i(TAG, "Hook installed: early density (callApplicationOnCreate + attachBaseContext)");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook ContextWrapper.attachBaseContext", t);
        }
    }

    // Push our density onto a context's Resources metrics + configuration.
    private static void pushMetrics(android.content.Context ctx) {
        try {
            android.content.res.Resources res = ctx.getResources();
            if (res == null) return;
            scaleMetrics(res.getDisplayMetrics(), HookEnv.config.metricsDpi);
            android.content.res.Configuration cfg = res.getConfiguration();
            if (cfg != null) {
                recomputeDp(cfg, res.getDisplayMetrics());
            }
        } catch (Throwable t) { /* ignore — afterCall hooks remain the primary path */ }
    }

    // Apply metricsDpi to a DisplayMetrics (rendering-DPI mutation)
    private static void scaleMetrics(DisplayMetrics dm, int dpi) {
        if (dm == null) return;
        float d = dpi / 160f;
        dm.densityDpi = dpi;
        dm.density = d;
        dm.scaledDensity = d;
        dm.xdpi = dpi;
        dm.ydpi = dpi;
    }

    private static void installDisplayMetricsHook() {
        // Resources.getDisplayMetrics() → result
        try {
            Method rGetMetrics = android.content.res.Resources.class
                    .getDeclaredMethod("getDisplayMetrics");
            Pine.hook(rGetMetrics, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        scaleMetrics((DisplayMetrics) callFrame.getResult(), HookEnv.config.metricsDpi);
                    } catch (Exception e) { /* ignore */ }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook Resources.getDisplayMetrics", e);
        }

        // Display.getMetrics(DisplayMetrics) → arg[0]
        try {
            Method dGetMetrics = Display.class.getMethod("getMetrics", DisplayMetrics.class);
            Pine.hook(dGetMetrics, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        if (callFrame.args.length > 0
                                && callFrame.args[0] instanceof DisplayMetrics) {
                            scaleMetrics((DisplayMetrics) callFrame.args[0], HookEnv.config.metricsDpi);
                        }
                    } catch (Exception e) { /* ignore */ }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook Display.getMetrics", e);
        }

        // Display.getRealMetrics(DisplayMetrics) → arg[0] (some apps use this)
        try {
            Method dRealMetrics = Display.class.getMethod("getRealMetrics", DisplayMetrics.class);
            Pine.hook(dRealMetrics, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        if (callFrame.args.length > 0
                                && callFrame.args[0] instanceof DisplayMetrics) {
                            scaleMetrics((DisplayMetrics) callFrame.args[0], HookEnv.config.metricsDpi);
                        }
                    } catch (Exception e) { /* ignore */ }
                }
            });
        } catch (Exception e) { /* getRealMetrics optional */ }

        Log.i(TAG, "Hook installed: getDisplayMetrics/getMetrics → " + HookEnv.config.metricsDpi + "dpi");
    }

    private static void installConfigurationHook() {
        // Register a result-transform on the SHARED Resources.getConfiguration hook
        // (afterCall sets densityDpi) instead of hooking the method directly — so it
        // is composited with any other category that needs getConfiguration, hooked once.
        com.dhuadapter.core.SharedHooks.registerConfigResultTransform(
                DisplayHooks::capConfig);
        Log.i(TAG, "Registered: Resources.getConfiguration width-cap + densityDpi (via SharedHooks)");
    }

    private static void installSetRequestedOrientationHook() {
        try {
            Method method = Activity.class.getMethod("setRequestedOrientation", int.class);
            Pine.hook(method, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        if (HookEnv.config.forceOrientation) {
                            int original = (int) callFrame.args[0];
                            callFrame.args[0] = ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED;
                            if (HookEnv.config.debug) {
                                Log.d(TAG, "setRequestedOrientation: " + original
                                        + " -> SCREEN_ORIENTATION_UNSPECIFIED");
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "setRequestedOrientation hook error", e);
                    }
                }
            });
            Log.i(TAG, "Hook installed: Activity.setRequestedOrientation");
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook Activity.setRequestedOrientation", e);
        }
    }

    private static void installViewOnAttachedHook() {
        try {
            Method method = View.class.getDeclaredMethod("onAttachedToWindow");
            method.setAccessible(true);
            Pine.hook(method, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        View view = (View) callFrame.thisObject;
                        if (view instanceof TextView && HookEnv.config.fontOverride != null) {
                            if (customTypeface == null) {
                                try {
                                    customTypeface = Typeface.createFromAsset(
                                            view.getContext().getAssets(),
                                            "fonts/" + HookEnv.config.fontOverride);
                                } catch (Exception e) {
                                    Log.w(TAG, "Font not found: fonts/"
                                            + HookEnv.config.fontOverride + ", disabling override");
                                    HookEnv.config.fontOverride = null; // don't retry every view
                                    return;
                                }
                            }
                            ((TextView) view).setTypeface(customTypeface);
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "onAttachedToWindow hook error", e);
                    }
                }
            });
            Log.i(TAG, "Hook installed: View.onAttachedToWindow");
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook View.onAttachedToWindow", e);
        }
    }

    private static void installSetPaddingRelativeHook() {
        try {
            Method method = View.class.getMethod("setPaddingRelative",
                    int.class, int.class, int.class, int.class);
            Pine.hook(method, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        View view = (View) callFrame.thisObject;
                        if (view.getParent() instanceof View) {
                            String parentClass =
                                    view.getParent().getClass().getName();
                            if (parentClass.contains("Inset")
                                    || parentClass.contains("FitWindows")
                                    || parentClass.contains("NavigationBar")
                                    || parentClass.contains("StatusBar")) {
                                callFrame.args[0] = 0; // start
                                callFrame.args[1] = 0; // top
                                callFrame.args[2] = 0; // end
                                callFrame.args[3] = 0; // bottom
                                if (HookEnv.config.debug) {
                                    Log.d(TAG, "Zeroed inset padding for parent: "
                                            + parentClass);
                                }
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "setPaddingRelative hook error", e);
                    }
                }
            });
            Log.i(TAG, "Hook installed: View.setPaddingRelative");
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook View.setPaddingRelative", e);
        }
    }

    private static void installWebViewZoomHook() {
        // Only set textZoom on WebSettings — clean, universal, no JS injection
        try {
            Method getSettings = WebView.class.getMethod("getSettings");
            Pine.hook(getSettings, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    try {
                        WebSettings settings = (WebSettings) callFrame.getResult();
                        if (settings != null && settings.getTextZoom() == 100) {
                            settings.setTextZoom((int) (HookEnv.config.density() * 100));
                        }
                    } catch (Exception e) { /* ignore */ }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook WebView.getSettings", e);
        }

        // WebView User-Agent fix: some apps render the map via a WebView and the
        // default DHU/emulator UA gets rejected by the tile/map server → blank
        // white map. Force a standard mobile Chrome UA so map content loads.
        try {
            Method getDefaultUA = WebSettings.class.getMethod(
                    "getDefaultUserAgent", Context.class);
            Pine.hook(getDefaultUA, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    if (HookEnv.config.userAgentOverride != null
                            && !HookEnv.config.userAgentOverride.isEmpty()) {
                        callFrame.setResult(HookEnv.config.userAgentOverride);
                    }
                }
            });
            Log.i(TAG, "Hook installed: WebSettings.getDefaultUserAgent → "
                    + (HookEnv.config.userAgentOverride != null ? "custom UA" : "unchanged"));
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook getDefaultUserAgent", e);
        }

        Log.i(TAG, "Hook installed: WebView textZoom (" + (int)(HookEnv.config.density() * 100) + "%)");
    }
}
