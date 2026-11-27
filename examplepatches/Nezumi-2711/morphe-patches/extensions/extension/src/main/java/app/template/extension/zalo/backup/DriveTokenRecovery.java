package app.template.extension.zalo.backup;

import android.accounts.Account;
import android.app.ActivityManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
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
    private static final String TAG = "DriveTokenRecovery";
    private static final int STATE_OK = 0;
    private static final int STATE_NEEDS_USER = 2;
    private static final long[] RETRY_DELAYS_MS = {2_000L, 6_000L};
    private static final String CHANNEL_ID = "nezumi_drive_auth";
    private static final int NOTIFICATION_ID = 0x4e5a_4401;
    private static final String PREFS = "nezumi_drive_auth";
    private static final String KEY_LAST_NOTIFIED = "last_notified";
    private static final long NOTIFY_INTERVAL_MS = 6 * 60 * 60 * 1000L;

    private static final String MICROG_PACKAGE = "app.revanced.android.gms";
    private static final String GMS_PACKAGE = "com.google.android.gms";
    /** Account type the Drive patch rewrites Zalo's "com.google" accounts to, so microG accepts them. */
    private static final String EXPECTED_ACCOUNT_TYPE = "app.revanced";

    private static volatile Method refreshMethod;
    private static volatile Method getTokenMethod;
    private static volatile Method gmsPathMethod;

    private DriveTokenRecovery() { }

    /** Replaced by the Drive patch with the Java name of Zalo's bundled GoogleAuthUtil class. */
    static String googleAuthUtilClass() {
        return null;
    }

    /** Replaced by the Drive patch with the name of the GoogleAuthUtil getToken method the refresher calls. */
    static String googleAuthGetTokenMethod() {
        return null;
    }

    /**
     * Replaced by the Drive patch with the name of GoogleAuthUtil's static (Context)Z check that picks the
     * Play services GoogleApi token path over the legacy GetToken service bind. Null when it was not found.
     */
    static String googleAuthPathMethod() {
        return null;
    }

    /**
     * Replacement for the GoogleAuthUtil getToken(Context, Account, String) calls in Zalo's Drive token
     * refresher. Calls the original and rethrows its exception unchanged, so Zalo maps it to the same state
     * as before; the only addition is a bug-log line describing the failure, which Zalo itself swallows.
     */
    public static String getToken(Context context, Account account, String scope) throws Throwable {
        return callGetToken(context, account, new Object[] {context, account, scope},
            Context.class, Account.class, String.class);
    }

    /** Same as {@link #getToken(Context, Account, String)} for the getToken(Context, Account, String, Bundle) overload. */
    public static String getToken(Context context, Account account, String scope, Bundle extras) throws Throwable {
        return callGetToken(context, account, new Object[] {context, account, scope, extras},
            Context.class, Account.class, String.class, Bundle.class);
    }

    private static String callGetToken(Context context, Account account, Object[] args, Class<?>... types)
        throws Throwable {
        Method method = getTokenMethod;
        if (method == null || method.getParameterTypes().length != types.length) {
            try {
                String owner = googleAuthUtilClass();
                String name = googleAuthGetTokenMethod();
                if (owner == null || name == null) throw new ClassNotFoundException("GoogleAuthUtil not baked by the patch");
                method = Class.forName(owner, false, DriveTokenRecovery.class.getClassLoader())
                    .getDeclaredMethod(name, types);
                method.setAccessible(true);
            } catch (ReflectiveOperationException | RuntimeException failure) {
                NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "GoogleAuthUtil getToken not found", failure);
                throw failure;
            }
            getTokenMethod = method;
        }
        try {
            return (String) method.invoke(null, args);
        } catch (InvocationTargetException e) {
            Throwable cause = e.getCause() != null ? e.getCause() : e;
            logTokenFailure(context, account, cause);
            throw cause;
        }
    }

    /** Logs why getToken failed without the token or the account e-mail. Never throws. */
    private static void logTokenFailure(Context context, Account account, Throwable failure) {
        try {
            StringBuilder message = new StringBuilder("Drive getToken failed: ").append(describe(failure));
            Throwable cause = failure.getCause();
            if (cause != null && cause != failure) message.append(" (cause ").append(describe(cause)).append(')');
            message.append("; path=").append(tokenPath(context));
            if (account == null) {
                message.append("; account=null");
            } else {
                message.append("; accountType=").append(account.type)
                    .append(EXPECTED_ACCOUNT_TYPE.equals(account.type) ? " (expected)" : " (UNEXPECTED, want "
                        + EXPECTED_ACCOUNT_TYPE + ")")
                    .append("; email=").append(account.name == null || account.name.isEmpty() ? "missing" : "present");
            }
            if (isUserRecoverable(failure)) {
                NezumiLog.i(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, message.toString());
            } else {
                NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, message.toString(), failure);
            }
        } catch (Throwable diagnostics) {
            // Diagnostics must never change how Zalo handles the failure.
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "token failure diagnostics failed", diagnostics);
        }
    }

    private static String describe(Throwable failure) {
        return failure.getClass().getSimpleName() + ": " + failure.getMessage();
    }

    private static boolean isUserRecoverable(Throwable failure) {
        for (Class<?> type = failure.getClass(); type != null; type = type.getSuperclass()) {
            if (type.getName().equals("com.google.android.gms.auth.UserRecoverableAuthException")) return true;
        }
        return false;
    }

    /** "gms-api" when GoogleAuthUtil would use real Play services' GoogleApi client, "legacy-bind" otherwise. */
    private static String tokenPath(Context context) {
        try {
            Method method = gmsPathMethod;
            if (method == null) {
                String owner = googleAuthUtilClass();
                String name = googleAuthPathMethod();
                if (owner == null || name == null || context == null) return "unknown";
                method = Class.forName(owner, false, DriveTokenRecovery.class.getClassLoader())
                    .getDeclaredMethod(name, Context.class);
                if (!Modifier.isStatic(method.getModifiers()) || method.getReturnType() != boolean.class) return "unknown";
                method.setAccessible(true);
                gmsPathMethod = method;
            }
            return Boolean.TRUE.equals(method.invoke(null, context)) ? "gms-api" : "legacy-bind";
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "token path check unavailable", failure);
            return "unknown";
        }
    }

    /** Replacement for {@code useCase.p1(request)} in Zalo's Drive token getter. */
    public static Object refresh(Object useCase, Object request) throws Throwable {
        Object result = invoke(useCase, request);
        try {
            int state = intField(result, -1);
            boolean failed = state > STATE_OK && state != STATE_NEEDS_USER;
            int retries = 0;
            if (failed && !isMainThread()) {
                for (long delay : RETRY_DELAYS_MS) {
                    Object retryRequest = forcedRequest(request, result, state);
                    if (retryRequest == null) {
                        logQuietly("Drive token retry skipped: no email in request (state " + state + ")");
                        break;
                    }
                    NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "Drive token refresh failed (state " + state + "), retrying in " + delay + " ms");
                    Thread.sleep(delay);
                    result = invoke(useCase, retryRequest);
                    retries++;
                    state = intField(result, -1);
                    if (state == STATE_OK || state == STATE_NEEDS_USER) break;
                }
            }
            if (failed) logRefreshOutcome(state, retries);
            if (state == STATE_OK) {
                cancelConsentNotification();
            } else if (state == STATE_NEEDS_USER) {
                notifyConsentNeeded(intentField(result));
            }
        } catch (InterruptedException e) {
            NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "Drive token retry interrupted");
            Thread.currentThread().interrupt();
        } catch (RuntimeException | ReflectiveOperationException e) {
            NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "Drive token recovery skipped", e);
        }
        return result;
    }

    /** One line after a failed refresh: either recovered by a retry, or still failing plus device context. */
    private static void logRefreshOutcome(int state, int retries) {
        try {
            if (state == STATE_OK) {
                if (retries > 0) NezumiLog.i(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "Drive token recovered after " + retries + " retries");
            } else if (state != STATE_NEEDS_USER) {
                NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "Drive token refresh still failing after " + retries + " retries (state " + state + ")"
                    + (isMainThread() ? " [main thread, not retried]" : "") + "; " + deviceContext());
            }
        } catch (Throwable failure) {
            // Diagnostics must never affect the refresh result.
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "refresh outcome diagnostics failed", failure);
        }
    }

    private static void logQuietly(String message) {
        try {
            NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, message);
        } catch (Throwable failure) {
            // Diagnostics must never affect the refresh result.
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "retry diagnostics failed", failure);
        }
    }

    /** Network, background restriction, process importance and microG / Play services state. Never throws. */
    private static String deviceContext() {
        Context context = ZaloEnv.appContext(Patch.DRIVE_BACKUP_VIA_MICROG);
        if (context == null) return "context unavailable";
        StringBuilder out = new StringBuilder();
        out.append("network=").append(networkState(context));
        out.append("; bgRestricted=");
        try {
            ActivityManager manager = context.getSystemService(ActivityManager.class);
            out.append(manager == null || Build.VERSION.SDK_INT < 28 ? "unknown" : manager.isBackgroundRestricted());
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "background restriction unavailable", failure);
            out.append("unknown");
        }
        out.append("; importance=");
        try {
            ActivityManager.RunningAppProcessInfo info = new ActivityManager.RunningAppProcessInfo();
            ActivityManager.getMyMemoryState(info);
            out.append(info.importance <= ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND_SERVICE
                ? "foreground" : "background").append(" (").append(info.importance).append(')');
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "process importance unavailable", failure);
            out.append("unknown");
        }
        out.append("; microG=").append(packageState(context, MICROG_PACKAGE, false));
        out.append("; gms=").append(packageState(context, GMS_PACKAGE, true));
        return out.toString();
    }

    private static String networkState(Context context) {
        try {
            ConnectivityManager manager = context.getSystemService(ConnectivityManager.class);
            if (manager == null) return "unknown";
            Network network = manager.getActiveNetwork();
            if (network == null) return "none";
            NetworkCapabilities caps = manager.getNetworkCapabilities(network);
            if (caps == null) return "unknown";
            return (caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) ? "internet" : "no-internet")
                + (caps.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED) ? ",validated" : ",unvalidated");
        } catch (SecurityException failure) {
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "network state needs ACCESS_NETWORK_STATE", failure);
            return "no-permission";
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "network state unavailable", failure);
            return "unknown";
        }
    }

    private static String packageState(Context context, String packageName, boolean versionCode) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(packageName, 0);
            ApplicationInfo app = info.applicationInfo;
            String version = versionCode
                ? String.valueOf(Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode)
                : info.versionName;
            return (app == null || app.enabled ? "enabled" : "disabled") + " " + version;
        } catch (PackageManager.NameNotFoundException failure) {
            // An answer, not a failure: the package is not installed.
            NezumiLog.d(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, packageName + " not installed");
            return "missing";
        } catch (Throwable failure) {
            NezumiLog.swallowedOnce(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "package state of " + packageName + " unavailable", failure);
            return "unknown";
        }
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
        Context context = ZaloEnv.appContext(Patch.DRIVE_BACKUP_VIA_MICROG);
        if (context == null || consent == null) return;
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        long now = System.currentTimeMillis();
        if (now - prefs.getLong(KEY_LAST_NOTIFIED, 0L) < NOTIFY_INTERVAL_MS) return;

        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager == null) return;
        boolean vietnamese = ZaloEnv.isVietnamese(Patch.DRIVE_BACKUP_VIA_MICROG, context);
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
            NezumiLog.w(Patch.DRIVE_BACKUP_VIA_MICROG, TAG, "Cannot post Drive consent notification", e);
        }
    }

    private static void cancelConsentNotification() {
        Context context = ZaloEnv.appContext(Patch.DRIVE_BACKUP_VIA_MICROG);
        if (context == null) return;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null) manager.cancel(NOTIFICATION_ID);
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().remove(KEY_LAST_NOTIFIED).apply();
    }
}
