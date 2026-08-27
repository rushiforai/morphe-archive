package app.morphe.extension.discord.bunny.launcher;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONObject;

import java.lang.reflect.Method;

/** A single semantic destination handed from Android startup to Bunny navigation. */
public final class LauncherNavigationState {
    private static final String TAG = "BunnyShortcut";
    private static final String PREFERENCES = "bunny_launcher_navigation";
    private static final String KEY_PENDING = "pending_destination";

    private LauncherNavigationState() {}

    public static void request(Context context, String destination) {
        if (!BunnyShortcutContract.TARGET_SETTINGS.equals(destination)
                && !BunnyShortcutContract.TARGET_RECOVERY.equals(destination)) return;
        preferences(context).edit().putString(KEY_PENDING, destination).apply();
    }

    static void clear(Context context) {
        preferences(context).edit().remove(KEY_PENDING).apply();
    }

    public static boolean handleUrl(Context context, String raw, Object promise) {
        SharedPreferences preferences = preferences(context);

        if ("bunny-morphe://launcher/peek-navigation".equals(raw)) {
            String target = preferences.getString(KEY_PENDING, null);

            JSONObject result = new JSONObject();
            try {
                result.put("status", "success");
                result.put("target", target == null ? JSONObject.NULL : target);
            } catch (Throwable ignored) {}

            resolve(promise, result.toString());
            return true;
        }

        String acknowledgePrefix =
                "bunny-morphe://launcher/ack-navigation?target=";

        if (raw == null || !raw.startsWith(acknowledgePrefix)) {
            return false;
        }

        String requestedTarget =
                raw.substring(acknowledgePrefix.length());

        boolean allowedTarget =
                BunnyShortcutContract.TARGET_SETTINGS.equals(requestedTarget)
                        || BunnyShortcutContract.TARGET_RECOVERY.equals(requestedTarget);

        String pendingTarget =
                preferences.getString(KEY_PENDING, null);

        boolean acknowledged =
                allowedTarget
                        && requestedTarget.equals(pendingTarget);

        if (acknowledged) {
            preferences.edit().remove(KEY_PENDING).apply();
        } else {
        }

        String remainingTarget =
                acknowledged ? null : pendingTarget;

        JSONObject result = new JSONObject();
        try {
            result.put("status", "success");
            result.put("acknowledged", acknowledged);
            result.put(
                    "target",
                    remainingTarget == null
                            ? JSONObject.NULL
                            : remainingTarget
            );
        } catch (Throwable ignored) {}

        resolve(promise, result.toString());
        return true;
    }
    private static SharedPreferences preferences(Context context) {
        Context app = context.getApplicationContext();
        return (app == null ? context : app).getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }

    private static void resolve(Object promise, Object value) {
        if (promise == null) return;
        try {
            Method method = null;
            for (Method candidate : promise.getClass().getMethods()) {
                if (candidate.getName().equals("resolve")
                        && candidate.getParameterTypes().length == 1) {
                    method = candidate;
                    break;
                }
            }
            if (method == null) {
                for (Method candidate : promise.getClass().getDeclaredMethods()) {
                    if (candidate.getName().equals("resolve")
                            && candidate.getParameterTypes().length == 1) {
                        method = candidate;
                        break;
                    }
                }
            }
            if (method == null) {
                Log.e(TAG, "React Native promise has no resolve method");
                return;
            }
            method.setAccessible(true);
            method.invoke(promise, value);
        } catch (Throwable error) {
            Log.e(TAG, "Could not resolve launcher navigation promise", error);
        }
    }
}
