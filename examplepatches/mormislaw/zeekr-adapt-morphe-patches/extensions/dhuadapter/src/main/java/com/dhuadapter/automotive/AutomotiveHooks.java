package com.dhuadapter.automotive;

import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 4 — Automotive fixes. gate: config.automotiveFix
 *
 * All hooks target pure android.* framework APIs (no app-internal calls):
 *  - CommonUtils.isAutomotiveOS() → false: the map/onboarding white-screen fix
 *    (Waze). On an automotive head unit the app takes its AUTOMOTIVE onboarding
 *    path, whose fragments are added to a 0x0 container in the MDS multi-window
 *    → white screen. Forcing false makes it take the ordinary phone flow.
 *  - ContentResolver.query(androidx.car.app.connection) → NOT_CONNECTED: blocks
 *    the "Using X on Android Auto / check your car's screen" overlay.
 *  - PackageManager.hasSystemFeature("android.hardware.type.automotive") → false:
 *    the OS-level "am I on automotive?" probe. This is the most direct de-mask.
 *  - UiModeManager.getCurrentModeType() → MODE_TYPE_NORMAL(1): drop the car UI mode.
 *  - Configuration.uiMode de-car (UI_MODE_TYPE_CAR → NORMAL) via
 *    Configuration.updateFrom + Activity.onConfigurationChanged. We deliberately
 *    do NOT add a second hook on Resources.getConfiguration (DisplayHooks already
 *    hooks it for DPI) — double-hooking one method stacks trampolines.
 */
public final class AutomotiveHooks {

    private static final String TAG = HookEnv.TAG;
    private static final String FEATURE_AUTOMOTIVE = "android.hardware.type.automotive";
    private static final int UI_MODE_TYPE_MASK = 0x0F;
    private static final int UI_MODE_TYPE_NORMAL = 1;

    private AutomotiveHooks() {}

    public static void install() {
        installCarConnectionHook();
        installAutomotiveOsHook();
        installNoAutomotiveFeature();
        installUiModeNormal();
        installDeCarConfig();
    }

    private static void installCarConnectionHook() {
        if (!HookEnv.config.automotiveFix) {
            return;
        }
        try {
            // Hook ContentResolver.query to intercept car connection queries
            Method queryMethod = android.content.ContentResolver.class.getMethod("query",
                    android.net.Uri.class,           // uri
                    String[].class,                    // projection
                    String.class,                      // selection
                    String[].class,                    // selectionArgs
                    String.class);                     // sortOrder
            Pine.hook(queryMethod, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        android.net.Uri uri = (android.net.Uri) callFrame.args[0];
                        if (uri != null) {
                            String uriStr = uri.toString();
                            if (uriStr.contains("androidx.car.app.connection")) {
                                // Short-circuit: return NOT_CONNECTED cursor
                                // without calling the original method
                                android.database.MatrixCursor cursor = new android.database.MatrixCursor(
                                        new String[]{"connection_type"});
                                cursor.addRow(new Object[]{0}); // NOT_CONNECTED
                                callFrame.setResult(cursor);
                                Log.i(TAG, "Blocked CarConnection query → NOT_CONNECTED");
                            }
                        }
                        // All other queries pass through to original
                    } catch (Exception e) {
                        // Don't break other queries on error
                        Log.e(TAG, "CarConnection hook error", e);
                    }
                }
            });
            Log.i(TAG, "Hook installed: CarConnection (Android Auto blocked)");
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook CarConnection", e);
        }
    }

    private static void installAutomotiveOsHook() {
        if (!HookEnv.config.automotiveFix) {
            Log.i(TAG, "Automotive fix disabled (config.automotiveFix=false)");
            return;
        }
        try {
            Class<?> cu = Class.forName("androidx.car.app.utils.CommonUtils",
                    false, HookEnv.classLoader);
            // Signature varies by app version — isAutomotiveOS(Context)Z or a
            // no-arg variant; resolve whichever the target ships, by name.
            Method m = null;
            for (Method cand : cu.getDeclaredMethods()) {
                if ("isAutomotiveOS".equals(cand.getName())
                        && cand.getReturnType() == boolean.class) {
                    m = cand;
                    break;
                }
            }
            if (m == null) {
                throw new NoSuchMethodException("isAutomotiveOS");
            }
            m.setAccessible(true);
            Pine.hook(m, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    callFrame.setResult(Boolean.FALSE);
                }
            });
            Log.i(TAG, "Hook installed: CommonUtils.isAutomotiveOS -> false "
                    + "(force phone onboarding flow)");
        } catch (ClassNotFoundException e) {
            // androidx.car.app not present (app doesn't use it) — nothing to do.
            if (HookEnv.config.debug) {
                Log.d(TAG, "AutomotiveOsHook: androidx.car.app.utils.CommonUtils "
                        + "absent, skipping");
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook CommonUtils.isAutomotiveOS", t);
        }
    }

    // PackageManager.hasSystemFeature("android.hardware.type.automotive") → false.
    // Abstract on PackageManager, so hook the concrete ApplicationPackageManager
    // (both the 1-arg and the API-31 2-arg overloads). before-call: only override
    // the automotive feature query, everything else passes through.
    private static void installNoAutomotiveFeature() {
        MethodHook noAuto = new MethodHook() {
            @Override
            public void beforeCall(Pine.CallFrame callFrame) {
                try {
                    Object[] args = callFrame.args;
                    if (args != null && args.length > 0
                            && FEATURE_AUTOMOTIVE.equals(args[0])) {
                        callFrame.setResult(Boolean.FALSE);
                        if (HookEnv.config.debug) {
                            Log.d(TAG, "hasSystemFeature(automotive) → false");
                        }
                    }
                } catch (Throwable t) {
                    Log.e(TAG, "hasSystemFeature hook error", t);
                }
            }
        };
        try {
            Class<?> apm = Class.forName("android.app.ApplicationPackageManager");
            hookIfPresent(apm, "hasSystemFeature", noAuto, String.class);
            hookIfPresent(apm, "hasSystemFeature", noAuto, String.class, int.class);
            Log.i(TAG, "Hook installed: hasSystemFeature(automotive) → false");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook hasSystemFeature", t);
        }
    }

    // UiModeManager.getCurrentModeType() → MODE_TYPE_NORMAL(1). Concrete class,
    // hookable directly. Drops the car UI mode some apps branch on.
    private static void installUiModeNormal() {
        try {
            Method m = android.app.UiModeManager.class.getMethod("getCurrentModeType");
            Pine.hook(m, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame callFrame) {
                    callFrame.setResult(UI_MODE_TYPE_NORMAL);
                }
            });
            Log.i(TAG, "Hook installed: UiModeManager.getCurrentModeType → NORMAL");
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook UiModeManager.getCurrentModeType", t);
        }
    }

    // Configuration.uiMode de-car: clear UI_MODE_TYPE_CAR → NORMAL. Registered as
    // shared transforms on Configuration.updateFrom + Activity.onConfigurationChanged
    // via SharedHooks, so these methods are hooked ONCE even though Category 1
    // (density) also contributes to updateFrom. We never hook Resources.getConfiguration
    // here — DisplayHooks owns that for DPI.
    private static void installDeCarConfig() {
        java.util.function.Consumer<android.content.res.Configuration> deCar =
                AutomotiveHooks::deCar;
        com.dhuadapter.core.SharedHooks.registerConfigTransform(
                com.dhuadapter.core.SharedHooks.CONFIG_UPDATE_FROM, deCar);
        com.dhuadapter.core.SharedHooks.registerConfigTransform(
                com.dhuadapter.core.SharedHooks.ACTIVITY_ON_CONFIG_CHANGED, deCar);
        Log.i(TAG, "Registered: Configuration uiMode de-car "
                + "(updateFrom + onConfigurationChanged via SharedHooks)");
    }

    // Clear UI_MODE_TYPE_CAR from a Configuration's uiMode, forcing NORMAL.
    private static void deCar(android.content.res.Configuration cfg) {
        if (cfg == null) return;
        cfg.uiMode = (cfg.uiMode & ~UI_MODE_TYPE_MASK) | UI_MODE_TYPE_NORMAL;
    }

    // Hook a method by name+params if it exists (overload may be absent on older API).
    private static void hookIfPresent(Class<?> cls, String name,
            MethodHook hook, Class<?>... params) {
        try {
            Method m = cls.getMethod(name, params);
            Pine.hook(m, hook);
        } catch (NoSuchMethodException e) {
            // overload not present on this API level — fine
        } catch (Throwable t) {
            Log.e(TAG, "Failed to hook " + cls.getSimpleName() + "." + name, t);
        }
    }
}
