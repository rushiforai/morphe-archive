package e.e.a;

import android.app.Service;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.PowerManager;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Convert an already running service mini/background session to popup on app exit.
 * Existing decoder, HLS source, timestamp and queue are never recreated.
 */
public final class PopupSwitch216 {
    private static final String TAG = "nicoid-popup-switch216";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static int generation;
    private PopupSwitch216() {}

    private static Field field(Class<?> cls, String name) throws Exception {
        for (Class<?> type = cls; type != null; type = type.getSuperclass()) {
            try {
                Field result = type.getDeclaredField(name);
                result.setAccessible(true);
                return result;
            } catch (NoSuchFieldException ignored) {}
        }
        throw new NoSuchFieldException(name);
    }

    private static Method method(Class<?> cls, String name, Class<?>... signature) throws Exception {
        for (Class<?> type = cls; type != null; type = type.getSuperclass()) {
            try {
                Method result = type.getDeclaredMethod(name, signature);
                result.setAccessible(true);
                return result;
            } catch (NoSuchMethodException ignored) {}
        }
        throw new NoSuchMethodException(name);
    }

    private static Service service() {
        try {
            Class<?> cls = Class.forName("e.e.a.AppResume253");
            Object found = method(cls, "service").invoke(null);
            return found instanceof Service ? (Service) found : null;
        } catch (Exception error) {
            Log.w(TAG, "Current service not available", error);
            return null;
        }
    }

    private static Object activeMini(Service service) {
        try {
            Class<?> cls = Class.forName("e.e.a.DirectBackground235");
            Object state = field(cls, "active").get(null);
            return state != null && field(state.getClass(), "service").get(state) == service
                    ? state : null;
        } catch (Exception ignored) { return null; }
    }

    public static void left(Context context) {
        if (context == null) return;
        final int ticket = ++generation;
        final Context app = context.getApplicationContext();
        // AppResume253.left() runs before its away flag is updated. Waiting also
        // allows a mini-player's Activity.onPause() to detach its display host.
        MAIN.postDelayed(() -> attempt(app == null ? context : app, ticket, 0), 180);
    }

    private static boolean appIsAway() {
        try {
            return field(Class.forName("e.e.a.AppResume253"), "away").getBoolean(null);
        } catch (Exception error) {
            Log.w(TAG, "Unable to verify app background state", error);
            return false;
        }
    }

    private static void retry(Context context, int ticket, int attempt, String reason) {
        if (ticket != generation || !appIsAway()) return;
        if (attempt >= 4) {
            Log.w(TAG, "Retained popup conversion not ready: " + reason);
            return;
        }
        MAIN.postDelayed(() -> attempt(context, ticket, attempt + 1), 180);
    }

    private static void attempt(Context context, int ticket, int attempt) {
        if (ticket != generation || !appIsAway()) return;
        SharedPreferences saved = PreferenceManager.getDefaultSharedPreferences(context);
        if (!"popup".equals(saved.getString("app_switch_playback", "none"))) return;
        // Screen lock must NEVER show a popup or alter screen-off playback.
        PowerManager power = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        if (power == null || !power.isInteractive()) return;
        Service service = service();
        if (service == null) {
            retry(context, ticket, attempt, "service not bound");
            return;
        }
        if (!Settings.canDrawOverlays(service)) {
            Log.w(TAG, "Popup overlay permission is missing");
            return;
        }
        try {
            Class<?> type = service.getClass();
            Field background = field(type, "p0");
            if (!background.getBoolean(null)) {
                retry(context, ticket, attempt, "service has not entered retained background mode");
                return;
            }
            View root = (View) field(type, "a").get(service);
            WindowManager manager = (WindowManager) field(type, "b").get(service);
            WindowManager.LayoutParams params =
                    (WindowManager.LayoutParams) field(type, "U").get(service);
            Object video = field(type, "e").get(service);
            if (root == null || manager == null || params == null || video == null) {
                retry(context, ticket, attempt, "service presentation not prepared");
                return;
            }
            if (root.isAttachedToWindow() || root.getParent() != null) {
                Log.i(TAG, "Service popup root is already attached; no duplicate window");
                return;
            }
            Object length = method(video.getClass(), "getDuration").invoke(video);
            if (!(length instanceof Number) || ((Number)length).longValue() <= 0) {
                retry(context, ticket, attempt, "decoder duration not yet available");
                return;
            }

            // A foreground return may race the asynchronous retry. Never
            // detach a mini-player after the app has resumed.
            if (ticket != generation || !appIsAway()) return;
            Object mini = activeMini(service);
            Object previousHost = mini == null ? null : field(mini.getClass(), "host").get(mini);
            boolean detachedMini = false;
            boolean added = false;
            try {
                // The service-owned VideoView is temporarily reparented into the
                // mini host. Give it back to the service root first.
                if (mini != null) {
                    method(mini.getClass(), "detach").invoke(mini);
                    method(mini.getClass(), "returnVideo").invoke(mini);
                    detachedMini = true;
                }
                method(video.getClass(), "setReleaseOnDetachFromWindow", boolean.class)
                        .invoke(video, false);
                manager.addView(root, params);
                added = true;
                background.setBoolean(null, false);
                method(type, "b", boolean.class).invoke(service, false);
                Class<?> rendererType =
                        Class.forName("com.devbrackets.android.exomedia.ExoMedia$RendererType");
                Object videoRenderer = rendererType.getField("VIDEO").get(null);
                method(video.getClass(), "setRendererEnabled", rendererType, boolean.class)
                        .invoke(video, videoRenderer, true);
                if (mini != null) method(mini.getClass(), "close", boolean.class)
                        .invoke(mini, false);
                Log.i(TAG, "Existing background decoder presented as popup without reload");
            } catch (Exception failure) {
                // Roll back the display policy; keep the service decoder alive.
                background.setBoolean(null, true);
                if (added) try { manager.removeViewImmediate(root); }
                    catch (RuntimeException ignored) {}
                try { method(type, "b", boolean.class).invoke(service, true); }
                    catch (Exception ignored) {}
                if (mini != null && detachedMini && previousHost instanceof android.app.Activity) {
                    android.app.Activity host = (android.app.Activity) previousHost;
                    if (!host.isFinishing() && !host.isDestroyed()) {
                        try { method(mini.getClass(), "attach", android.app.Activity.class)
                                .invoke(mini, host); }
                        catch (Exception ignored) {}
                    }
                }
                Log.w(TAG, "Cannot present service playback as popup; retaining audio", failure);
            }
        } catch (Exception error) {
            Log.w(TAG, "Service popup transition unavailable", error);
        }
    }
}
