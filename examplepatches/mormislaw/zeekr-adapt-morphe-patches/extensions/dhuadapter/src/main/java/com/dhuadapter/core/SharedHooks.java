package com.dhuadapter.core;

import android.app.Activity;
import android.content.res.Configuration;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Shared-hook dispatcher for framework methods needed by MORE THAN ONE category.
 *
 * Each such method is hooked EXACTLY ONCE; categories register their contribution
 * before the factory calls installAll(). This structurally prevents the
 * double-trampoline we previously avoided ad-hoc.
 *
 * Three shared targets, three shapes:
 *  - Configuration.updateFrom / Activity.onConfigurationChanged (beforeCall, arg0
 *    is the Configuration): Cat.4 deCar + Cat.1 densityDpi.
 *  - Resources.getConfiguration (afterCall, RESULT is the Configuration): Cat.1
 *    densityDpi (+ future Cat.4).
 *  - SystemProperties.get(String[,String]) (afterCall, RESULT is a String value
 *    derived from the key): Cat.2 root props + Cat.3 emulator props. First
 *    non-null resolver wins. Guarded by a ThreadLocal re-entrancy flag — a
 *    locale/timezone-driven re-entry (persist.sys.timezone) must hand back the
 *    original result, not recurse (the Telegram SIGSEGV).
 *
 * Register/apply happen on the single-threaded pre-onCreate path; installAll()
 * is called once by the factory after every category's install().
 */
public final class SharedHooks {

    private static final String TAG = HookEnv.TAG;

    // Configuration transform target keys.
    public static final String CONFIG_UPDATE_FROM = "Configuration.updateFrom";
    public static final String ACTIVITY_ON_CONFIG_CHANGED = "Activity.onConfigurationChanged";
    public static final String RESOURCES_GET_CONFIGURATION = "Resources.getConfiguration";

    // arg0-based Configuration transforms (beforeCall).
    private static final TransformRegistry<Configuration> CONFIG_ARG_TRANSFORMS =
            new TransformRegistry<>();
    // result-based Configuration transforms (afterCall).
    private static final TransformRegistry<Configuration> CONFIG_RESULT_TRANSFORMS =
            new TransformRegistry<>();

    // SystemProperties.get resolvers: key -> spoofed value, or null to leave as-is.
    private static final List<Function<String, String>> SYSPROP_RESOLVERS = new ArrayList<>();
    private static final ThreadLocal<Boolean> IN_SYSPROP_HOOK =
            new ThreadLocal<Boolean>() {
                @Override protected Boolean initialValue() { return Boolean.FALSE; }
            };

    private static boolean installed;

    private SharedHooks() {}

    // ── registration (called by categories before installAll) ────────────

    /** Register a beforeCall Configuration transform (arg0) for updateFrom /
     *  onConfigurationChanged. */
    public static void registerConfigTransform(String key, Consumer<Configuration> transform) {
        CONFIG_ARG_TRANSFORMS.register(key, transform);
    }

    /** Register an afterCall Configuration transform mutating the RESULT of
     *  Resources.getConfiguration. */
    public static void registerConfigResultTransform(Consumer<Configuration> transform) {
        CONFIG_RESULT_TRANSFORMS.register(RESOURCES_GET_CONFIGURATION, transform);
    }

    /** Register a SystemProperties.get resolver: returns a spoofed value for a key,
     *  or null to defer. First non-null resolver wins, in registration order. */
    public static void registerSysPropResolver(Function<String, String> resolver) {
        if (resolver != null) {
            SYSPROP_RESOLVERS.add(resolver);
        }
    }

    // ── install (called once by the factory) ─────────────────────────────

    public static void installAll() {
        if (installed) {
            return;
        }
        installed = true;

        installConfigArgHook(CONFIG_UPDATE_FROM, () ->
                Configuration.class.getMethod("updateFrom", Configuration.class));
        installConfigArgHook(ACTIVITY_ON_CONFIG_CHANGED, () ->
                Activity.class.getMethod("onConfigurationChanged", Configuration.class));
        installConfigResultHook();
        installSysPropHook();
    }

    private interface MethodSource { Method get() throws Exception; }

    private static void installConfigArgHook(String key, MethodSource src) {
        if (!CONFIG_ARG_TRANSFORMS.has(key)) {
            return;
        }
        try {
            Pine.hook(src.get(), new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame f) {
                    if (f.args != null && f.args.length > 0 && f.args[0] instanceof Configuration) {
                        CONFIG_ARG_TRANSFORMS.apply(key, (Configuration) f.args[0]);
                    }
                }
            });
            Log.i(TAG, "SharedHooks: " + key + " → "
                    + CONFIG_ARG_TRANSFORMS.count(key) + " transform(s)");
        } catch (Throwable t) {
            Log.e(TAG, "SharedHooks: failed to hook " + key, t);
        }
    }

    private static void installConfigResultHook() {
        if (!CONFIG_RESULT_TRANSFORMS.has(RESOURCES_GET_CONFIGURATION)) {
            return;
        }
        try {
            Method m = android.content.res.Resources.class.getDeclaredMethod("getConfiguration");
            Pine.hook(m, new MethodHook() {
                @Override
                public void afterCall(Pine.CallFrame f) {
                    Object r = f.getResult();
                    if (r instanceof Configuration) {
                        CONFIG_RESULT_TRANSFORMS.apply(RESOURCES_GET_CONFIGURATION, (Configuration) r);
                    }
                }
            });
            Log.i(TAG, "SharedHooks: Resources.getConfiguration → "
                    + CONFIG_RESULT_TRANSFORMS.count(RESOURCES_GET_CONFIGURATION) + " transform(s)");
        } catch (Throwable t) {
            Log.e(TAG, "SharedHooks: failed to hook Resources.getConfiguration", t);
        }
    }

    private static void installSysPropHook() {
        if (SYSPROP_RESOLVERS.isEmpty()) {
            return;
        }
        MethodHook hook = new MethodHook() {
            @Override
            public void afterCall(Pine.CallFrame f) {
                if (IN_SYSPROP_HOOK.get()) {
                    return;   // re-entered on this thread — leave original result
                }
                IN_SYSPROP_HOOK.set(Boolean.TRUE);
                try {
                    if (f.args == null || f.args.length == 0 || !(f.args[0] instanceof String)) {
                        return;
                    }
                    String key = (String) f.args[0];
                    String val = resolveSysProp(key);
                    if (val != null) {
                        f.setResult(val);
                        if (HookEnv.config.debug) {
                            Log.d(TAG, "PropSpoof: SystemProperties.get(" + key + ") → " + val);
                        }
                    }
                } catch (Throwable ignored) {
                } finally {
                    IN_SYSPROP_HOOK.set(Boolean.FALSE);
                }
            }
        };
        try {
            Class<?> sysProps = Class.forName("android.os.SystemProperties");
            Pine.hook(sysProps.getMethod("get", String.class), hook);
            Pine.hook(sysProps.getMethod("get", String.class, String.class), hook);
            Log.i(TAG, "SharedHooks: SystemProperties.get → "
                    + SYSPROP_RESOLVERS.size() + " resolver(s)");
        } catch (Throwable t) {
            Log.e(TAG, "SharedHooks: failed to hook SystemProperties.get", t);
        }
    }

    /** First non-null resolver wins (pure helper, unit-testable via the list). */
    static String resolveSysProp(String key) {
        if (key == null) {
            return null;
        }
        for (Function<String, String> r : SYSPROP_RESOLVERS) {
            try {
                String v = r.apply(key);
                if (v != null) {
                    return v;
                }
            } catch (Throwable ignored) {
                // isolate a bad resolver
            }
        }
        return null;
    }

    /** Test-only reset. */
    static void resetForTest() {
        installed = false;
    }
}
