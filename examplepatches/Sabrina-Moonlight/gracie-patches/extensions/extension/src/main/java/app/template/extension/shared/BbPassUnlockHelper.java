/*
 * Copyright (C) 2026 Sabrina-Moonlight / Gracie Patches
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.template.extension.shared;

import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Method;

/**
 * Activates Bimi Boo BB Pass / SharedSub local state.
 * Safe no-op if classes or methods are missing.
 */
@SuppressWarnings("unused")
public final class BbPassUnlockHelper {

    private static final long FAR_EXPIRY_MS = 4102444800000L;

    private BbPassUnlockHelper() {
    }

    public static void activate(Context context) {
        if (context == null) {
            return;
        }
        try {
            Context app = context.getApplicationContext();
            if (app == null) {
                app = context;
            }
            setLocalActive(app);
            writePrefs(app);
        } catch (Throwable ignored) {
            // Never crash the host app from the extension.
        }
    }

    private static void setLocalActive(Context ctx) {
        try {
            Class<?> client = Class.forName("com.bimiboo.pass.SharedSubClient");
            Method m = client.getMethod(
                    "setLocalActiveSharedSubscription",
                    Context.class,
                    boolean.class,
                    long.class
            );
            m.invoke(null, ctx, Boolean.TRUE, Long.valueOf(FAR_EXPIRY_MS));
        } catch (Throwable ignored) {
            try {
                Class<?> client = Class.forName("com.bimiboo.pass.SharedSubClient");
                Object instance = client.getDeclaredConstructor().newInstance();
                Method m = client.getMethod(
                        "setLocalActiveSharedSubscription",
                        Context.class,
                        boolean.class,
                        long.class
                );
                m.invoke(instance, ctx, Boolean.TRUE, Long.valueOf(FAR_EXPIRY_MS));
            } catch (Throwable ignored2) {
            }
        }
    }

    private static void writePrefs(Context ctx) {
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(
                    "bbpass_shared_sub",
                    Context.MODE_PRIVATE
            );
            prefs.edit()
                    .putBoolean("KEY_ACTIVE", true)
                    .putBoolean("active", true)
                    .putBoolean("isActive", true)
                    .putBoolean("KEY_TRUSTED", true)
                    .putLong("KEY_EXPIRES", FAR_EXPIRY_MS)
                    .putLong("expiresAt", FAR_EXPIRY_MS)
                    .apply();
        } catch (Throwable ignored) {
        }
    }
}
