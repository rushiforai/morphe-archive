/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.media.session.MediaController;
import android.media.session.MediaSessionManager;
import android.provider.Settings;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

public final class MediaSessionPatch {
    private static final long PROMPT_INTERVAL_MS = 24L * 60L * 60L * 1000L;
    private static final String PREFERENCES = "morphe_daily_board";
    private static final String LAST_ACCESS_PROMPT = "notification_access_prompt";

    private MediaSessionPatch() {
    }

    public static List<MediaController> startListening(
            Object sessionDataSource,
            MediaSessionManager manager,
            MediaSessionManager.OnActiveSessionsChangedListener listener
    ) {
        Context context = contextFrom(sessionDataSource);
        if (context == null || !hasNotificationAccess(context)) {
            if (context != null) requestNotificationAccess(context);
            return Collections.emptyList();
        }

        ComponentName component = listenerComponent(context);
        try {
            manager.addOnActiveSessionsChangedListener(listener, component);
            return manager.getActiveSessions(component);
        } catch (SecurityException ignored) {
            requestNotificationAccess(context);
            return Collections.emptyList();
        }
    }

    public static boolean hasNotificationAccess(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        return manager != null &&
                manager.isNotificationListenerAccessGranted(listenerComponent(context));
    }

    public static void requestNotificationAccess(Context context) {
        long now = System.currentTimeMillis();
        long lastPrompt = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .getLong(LAST_ACCESS_PROMPT, 0L);
        if (now - lastPrompt < PROMPT_INTERVAL_MS) return;

        context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE)
                .edit()
                .putLong(LAST_ACCESS_PROMPT, now)
                .apply();

        ComponentName component = listenerComponent(context);
        Intent intent = new Intent(Settings.ACTION_NOTIFICATION_LISTENER_DETAIL_SETTINGS)
                .putExtra(Settings.EXTRA_NOTIFICATION_LISTENER_COMPONENT_NAME,
                        component.flattenToString())
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
        } catch (RuntimeException ignored) {
            Intent fallback = new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(fallback);
        }
    }

    private static ComponentName listenerComponent(Context context) {
        return new ComponentName(context, DailyBoardNotificationListener.class);
    }

    private static Context contextFrom(Object source) {
        try {
            Field contextField = source.getClass().getDeclaredField("a");
            contextField.setAccessible(true);
            return (Context) contextField.get(source);
        } catch (ReflectiveOperationException | ClassCastException ignored) {
            return null;
        }
    }
}
