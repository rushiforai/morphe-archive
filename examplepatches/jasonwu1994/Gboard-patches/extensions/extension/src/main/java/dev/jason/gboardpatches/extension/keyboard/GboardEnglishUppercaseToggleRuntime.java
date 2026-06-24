package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardEnglishUppercaseToggleRuntime {
    private static volatile Context applicationContext;

    private GboardEnglishUppercaseToggleRuntime() {
    }

    public static boolean isEnabled() {
        try {
            Context context = resolveContext();
            if (context == null) {
                return GboardEnglishUppercaseToggleSettings.DEFAULT_ENABLED;
            }
            SharedPreferences preferences =
                    GboardEnglishUppercaseToggleSettings.preferences(context);
            GboardEnglishUppercaseToggleSettings.ensureDefaults(preferences);
            return GboardEnglishUppercaseToggleSettings.readEnabled(preferences);
        } catch (Throwable ignored) {
            return GboardEnglishUppercaseToggleSettings.DEFAULT_ENABLED;
        }
    }

    private static Context resolveContext() {
        Context cached = applicationContext;
        if (cached != null) {
            return cached;
        }
        Context reflected = reflectedApplicationContext(
                "android.app.ActivityThread",
                "currentApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }
        reflected = reflectedApplicationContext(
                "android.app.AppGlobals",
                "getInitialApplication");
        if (reflected != null) {
            applicationContext = reflected;
            return reflected;
        }
        return null;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Class<?> owner = Class.forName(className);
            Object application = owner.getMethod(methodName).invoke(null);
            if (!(application instanceof Context context)) {
                return null;
            }
            Context resolvedContext = context.getApplicationContext();
            return resolvedContext != null ? resolvedContext : context;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
