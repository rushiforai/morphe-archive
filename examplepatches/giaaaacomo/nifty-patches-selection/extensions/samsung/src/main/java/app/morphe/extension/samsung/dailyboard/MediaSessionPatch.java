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
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.service.notification.NotificationListenerService;

import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;

public final class MediaSessionPatch {
    private static final long PROMPT_INTERVAL_MS = 24L * 60L * 60L * 1000L;
    private static final long PENDING_SESSION_TIMEOUT_MS = 10_000L;
    private static final String PREFERENCES = "morphe_daily_board";
    private static final String LAST_ACCESS_PROMPT = "notification_access_prompt";
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());
    private static final Object SESSION_LOCK = new Object();

    private static boolean notificationListenerConnected;
    private static PendingSession pendingSession;

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
        synchronized (SESSION_LOCK) {
            if (!notificationListenerConnected) {
                NotificationListenerService.requestRebind(component);
            }
        }
        PendingSession pending = new PendingSession(manager, listener, component);
        try {
            List<MediaController> controllers = pending.connect();
            clearPendingSession(pending);
            return controllers;
        } catch (SecurityException ignored) {
            synchronized (SESSION_LOCK) {
                pendingSession = pending;
            }
            MAIN_HANDLER.postDelayed(
                    () -> clearPendingSession(pending),
                    PENDING_SESSION_TIMEOUT_MS
            );
            NotificationListenerService.requestRebind(component);
            return Collections.emptyList();
        }
    }

    static void onNotificationListenerConnected() {
        PendingSession pending;
        synchronized (SESSION_LOCK) {
            notificationListenerConnected = true;
            pending = pendingSession;
        }
        if (pending == null) return;

        try {
            List<MediaController> controllers = pending.connect();
            pending.listener.onActiveSessionsChanged(controllers);
            clearPendingSession(pending);
        } catch (SecurityException ignored) {
            // Keep the short-lived pending request until Android finishes binding the service.
        }
    }

    static void onNotificationListenerDisconnected(Context context) {
        synchronized (SESSION_LOCK) {
            notificationListenerConnected = false;
        }
        if (hasNotificationAccess(context)) {
            NotificationListenerService.requestRebind(listenerComponent(context));
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

    private static void clearPendingSession(PendingSession pending) {
        synchronized (SESSION_LOCK) {
            if (pendingSession == pending) pendingSession = null;
        }
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

    private static final class PendingSession {
        final MediaSessionManager manager;
        final MediaSessionManager.OnActiveSessionsChangedListener listener;
        final ComponentName component;

        PendingSession(
                MediaSessionManager manager,
                MediaSessionManager.OnActiveSessionsChangedListener listener,
                ComponentName component
        ) {
            this.manager = manager;
            this.listener = listener;
            this.component = component;
        }

        List<MediaController> connect() {
            manager.removeOnActiveSessionsChangedListener(listener);
            manager.addOnActiveSessionsChangedListener(listener, component);
            return manager.getActiveSessions(component);
        }
    }
}
