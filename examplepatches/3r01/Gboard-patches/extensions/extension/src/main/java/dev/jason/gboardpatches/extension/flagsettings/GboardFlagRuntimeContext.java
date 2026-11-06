package dev.jason.gboardpatches.extension.flagsettings;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.UserManager;

import java.lang.reflect.Method;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

public final class GboardFlagRuntimeContext {
    private static volatile Context applicationContext;

    private GboardFlagRuntimeContext() {
    }

    public static SharedPreferences preferencesOrNull() {
        return preferencesOrNull(resolveContext());
    }

    public static SharedPreferences preferencesOrNull(Context context) {
        if (!isUserUnlocked(context)) {
            return null;
        }
        try {
            return GboardPatchesSettings.preferences(context);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static boolean isUserUnlocked(Context context) {
        if (context == null) {
            return false;
        }
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N) {
            return true;
        }
        try {
            UserManager userManager = null;
            Object service = context.getSystemService(Context.USER_SERVICE);
            if (service instanceof UserManager manager) {
                userManager = manager;
            }
            if (userManager == null) {
                userManager = context.getSystemService(UserManager.class);
            }
            return userManager == null || userManager.isUserUnlocked();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static Context resolveContext() {
        Context cached = applicationContext;
        if (cached != null) {
            return cached;
        }
        Context reflected = reflectedApplicationContext(
                "android.app.ActivityThread", "currentApplication");
        if (reflected == null) {
            reflected = reflectedApplicationContext(
                    "android.app.AppGlobals", "getInitialApplication");
        }
        if (reflected != null) {
            applicationContext = reflected;
        }
        return reflected;
    }

    private static Context reflectedApplicationContext(String className, String methodName) {
        try {
            Method method = Class.forName(className).getDeclaredMethod(methodName);
            method.setAccessible(true);
            Object application = method.invoke(null);
            if (!(application instanceof Context)) {
                return null;
            }
            Context context = (Context) application;
            Context resolved = context.getApplicationContext();
            return resolved == null ? context : resolved;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
