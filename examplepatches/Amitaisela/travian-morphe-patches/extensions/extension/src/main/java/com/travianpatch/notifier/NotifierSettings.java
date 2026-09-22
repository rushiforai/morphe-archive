package com.travianpatch.notifier;

import android.content.Context;
import android.content.SharedPreferences;

/** The user's on/off switch for each notification type, read at the moment a notification would be shown. */
final class NotifierSettings {

    private static final String PREFS = "travian_notifier_settings";

    private NotifierSettings() {
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static boolean isEnabled(Context ctx, NotificationKind kind) {
        return prefs(ctx).getBoolean("kind_" + kind.id, kind.defaultOn);
    }

    static void setEnabled(Context ctx, NotificationKind kind, boolean enabled) {
        prefs(ctx).edit().putBoolean("kind_" + kind.id, enabled).apply();
    }
}
