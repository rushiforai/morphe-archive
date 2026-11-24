package app.template.extension.zalo.backup;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Looper;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import app.template.extension.zalo.shared.ZaloEnv;

/**
 * Wraps Zalo's Drive token refresh (the use case that fetches the drive.appdata token for backups).
 *
 * <p>Zalo's token states: 0 = OK, 1 = network error, 2 = user action needed (microG asks for consent),
 * 3 = Google auth error, 4 = other error. Under microG the background refresh sometimes fails, and Zalo
 * then needs the user to sign in to the Drive account again. This class:
 * <ul>
 *   <li>retries states 1, 3 and 4 with a forced refresh (token cleared and fetched again), off the main thread;</li>
 *   <li>for state 2, posts a notification that opens microG's consent screen directly.</li>
 * </ul>
 *
 * <p>Zalo's request/result classes are obfuscated, so they are read by field type: the request holds
 * (token: String, state: int, email: String, forceRefresh: boolean) and the result holds
 * (token: String, state: int, intent: Intent).
 */
public final class DriveTokenRecovery {
    private static final String TAG = "NezumiDriveToken";
    private static final int STATE_OK = 0;
    private static final int STATE_NEEDS_USER = 2;
    private static final long[] RETRY_DELAYS_MS = {2_000L, 6_000L};
    private static final String CHANNEL_ID = "nezumi_drive_auth";
    private static final int NOTIFICATION_ID = 0x4e5a_4401;
    private static final String PREFS = "nezumi_drive_auth";
    private static final String KEY_LAST_NOTIFIED = "last_notified";
    private static final long NOTIFY_INTERVAL_MS = 6 * 60 * 60 * 1000L;

    private static volatile Method refreshMethod;

    private DriveTokenRecovery() { }

    /** Replacement for {@code useCase.p1(request)} in Zalo's Drive token getter. */
    public static Object refresh(Object useCase, Object request) throws Throwable {
        Object result = invoke(useCase, request);
        try {
            int state = intField(result, -1);
            if (state > STATE_OK && state != STATE_NEEDS_USER && !isMainThread()) {
                for (long delay : RETRY_DELAYS_MS) {
                    Object retryRequest = forcedRequest(request, result, state);
                    if (retryRequest == null) break;
                    Log.w(TAG, "Drive token refresh failed (state " + state + "), retrying in " + delay + " ms");
                    Thread.sleep(delay);
                    result = invoke(useCase, retryRequest);
                    state = intField(result, -1);
                    if (state == STATE_OK || state == STATE_NEEDS_USER) break;
                }
            }
            if (state == STATE_OK) {
                cancelConsentNotification();
            } else if (state == STATE_NEEDS_USER) {
                notifyConsentNeeded(intentField(result));
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (RuntimeException | ReflectiveOperationException e) {
            Log.w(TAG, "Drive token recovery skipped", e);
        }
        return result;
    }

    private static Object invoke(Object useCase, Object request) throws Throwable {
        Method method = refreshMethod;
        if (method == null || method.getDeclaringClass() != useCase.getClass()) {
            method = findRefreshMethod(useCase.getClass());
            refreshMethod = method;
        }
        try {
            return method.invoke(useCase, request);
        } catch (java.lang.reflect.InvocationTargetException e) {
            throw e.getCause() != null ? e.getCause() : e;
        }
    }

    private static Method findRefreshMethod(Class<?> type) throws NoSuchMethodException {
        Method found = null;
        for (Method method : type.getDeclaredMethods()) {
            Class<?>[] params = method.getParameterTypes();
            if (!Modifier.isStatic(method.getModifiers()) && method.getReturnType() == Object.class
                && params.length == 1 && params[0] == Object.class && !method.isBridge()) {
                if (found != null) throw new NoSuchMethodException("Ambiguous Drive token refresh method");
                found = method;
            }
        }
        if (found == null) throw new NoSuchMethodException("Drive token refresh method");
        found.setAccessible(true);
        return found;
    }

    /** Builds request(token, failedState, email, forceRefresh = true) so Zalo clears the token before refetching. */
    private static Object forcedRequest(Object request, Object result, int failedState)
        throws ReflectiveOperationException {
        String email = null;
        String token = null;
        for (Field field : request.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != String.class) continue;
            field.setAccessible(true);
            String value = (String) field.get(request);
            if (value != null && value.indexOf('@') > 0) email = value;
            else token = value;
        }
        if (email == null) return null;
        String resultToken = stringField(result);
        if (resultToken != null && !resultToken.isEmpty()) token = resultToken;
        Constructor<?> constructor = request.getClass()
            .getDeclaredConstructor(String.class, int.class, String.class, boolean.class);
        constructor.setAccessible(true);
        return constructor.newInstance(token == null ? "" : token, failedState, email, true);
    }

    private static int intField(Object target, int fallback) throws IllegalAccessException {
        Field field = fieldOfType(target, int.class);
        return field == null ? fallback : field.getInt(target);
    }

    private static String stringField(Object target) throws IllegalAccessException {
        Field field = fieldOfType(target, String.class);
        return field == null ? null : (String) field.get(target);
    }

    private static Intent intentField(Object target) throws IllegalAccessException {
        Field field = fieldOfType(target, Intent.class);
        return field == null ? null : (Intent) field.get(target);
    }

    private static Field fieldOfType(Object target, Class<?> type) {
        if (target == null) return null;
        Field found = null;
        for (Field field : target.getClass().getDeclaredFields()) {
            if (Modifier.isStatic(field.getModifiers()) || field.getType() != type) continue;
            if (found != null) return null;
            found = field;
        }
        if (found != null) found.setAccessible(true);
        return found;
    }

    private static boolean isMainThread() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    private static void notifyConsentNeeded(Intent consent) {
        Context context = ZaloEnv.appContext();
        if (context == null || consent == null) return;
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        long now = System.currentTimeMillis();
        if (now - prefs.getLong(KEY_LAST_NOTIFIED, 0L) < NOTIFY_INTERVAL_MS) return;

        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return;
        boolean vietnamese = ZaloEnv.isVietnamese(context);
        if (manager.getNotificationChannel(CHANNEL_ID) == null) {
            manager.createNotificationChannel(new NotificationChannel(CHANNEL_ID,
                vietnamese ? "Sao lưu Google Drive" : "Google Drive backup",
                NotificationManager.IMPORTANCE_DEFAULT));
        }
        Intent launch = new Intent(consent).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        PendingIntent pending = PendingIntent.getActivity(context, NOTIFICATION_ID, launch,
            PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        String title = vietnamese ? "Cần xác nhận lại Google Drive" : "Confirm Google Drive access";
        String text = vietnamese
            ? "microG cần bạn cho phép lại để Zalo tiếp tục sao lưu. Chạm để xác nhận."
            : "microG needs your permission again so Zalo can keep backing up. Tap to confirm.";
        Notification notification = new Notification.Builder(context, CHANNEL_ID)
            .setSmallIcon(context.getApplicationInfo().icon)
            .setContentTitle(title)
            .setContentText(text)
            .setStyle(new Notification.BigTextStyle().bigText(text))
            .setContentIntent(pending)
            .setAutoCancel(true)
            .build();
        try {
            manager.notify(NOTIFICATION_ID, notification);
            prefs.edit().putLong(KEY_LAST_NOTIFIED, now).apply();
        } catch (SecurityException e) {
            Log.w(TAG, "Cannot post Drive consent notification", e);
        }
    }

    private static void cancelConsentNotification() {
        Context context = ZaloEnv.appContext();
        if (context == null) return;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null) manager.cancel(NOTIFICATION_ID);
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().remove(KEY_LAST_NOTIFIED).apply();
    }
}
