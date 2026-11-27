package app.template.extension.zalo.settings;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.shared.ZaloEnv;
import app.template.extension.zalo.ui.ZaloUi;

/**
 * Options that only take full effect after Zalo restarts. Each one is tracked by its pref key:
 * the value this process started with, and the value saved since. An option is pending while the
 * two differ, so changing it back clears it. The state lives in memory and ends with the process.
 */
public final class RestartPrompt {
    private RestartPrompt() { }

    private static final String TAG = "RestartPrompt";

    private static final Map<String, Object> STARTUP = new HashMap<>();

    private static final Map<String, Object> CURRENT = new HashMap<>();

    /** Records the value this process started with. Only the first call per key counts. */
    public static synchronized void track(String key, Object startupValue) {
        if (STARTUP.containsKey(key)) return;
        STARTUP.put(key, startupValue);
        CURRENT.put(key, startupValue);
    }

    /** Records a newly saved value for a tracked option. */
    public static synchronized void changed(String key, Object value) {
        if (!STARTUP.containsKey(key)) return;
        CURRENT.put(key, value);
    }

    public static synchronized boolean isPending(String key) {
        return STARTUP.containsKey(key) && !Objects.equals(STARTUP.get(key), CURRENT.get(key));
    }

    public static synchronized boolean anyPending() {
        for (String key : STARTUP.keySet()) {
            if (isPending(key)) return true;
        }
        return false;
    }

    /** The saved values right now, to compare against when the settings page closes. */
    static synchronized Map<String, Object> snapshot() {
        return new HashMap<>(CURRENT);
    }

    /** True when a pending option was changed after {@code snapshot} was taken. */
    static synchronized boolean changedSince(Map<String, Object> snapshot) {
        for (String key : STARTUP.keySet()) {
            if (isPending(key) && !Objects.equals(snapshot.get(key), CURRENT.get(key))) return true;
        }
        return false;
    }

    /** Asks the user to restart now. {@code onLater} runs when they decline. */
    static void ask(Context context, boolean darkMode, Runnable onLater) {
        Activity activity = ZaloEnv.activityOf(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            // No window to show the dialog on; the banner asks next time the page opens.
            onLater.run();
            return;
        }
        boolean vietnamese = ZaloEnv.isVietnamese(Patch.CORE, context);
        ZaloUi.confirm(context, darkMode,
            vietnamese ? "Khởi động lại Zalo?" : "Restart Zalo?",
            vietnamese ? "Một số thay đổi chỉ được áp dụng đầy đủ sau khi khởi động lại. Zalo sẽ đóng và mở lại ngay."
                : "Some changes are fully applied only after a restart. Zalo will close and reopen right away.",
            vietnamese ? "Để sau" : "Later",
            vietnamese ? "Khởi động lại" : "Restart",
            onLater, () -> restart(context));
    }

    /** Saves pending writes, reopens Zalo's launcher in a fresh task and ends this process. */
    public static void restart(Context context) {
        Activity activity = ZaloEnv.activityOf(context);
        Context starter = activity != null ? activity : context.getApplicationContext();
        Intent launch = starter.getPackageManager().getLaunchIntentForPackage(starter.getPackageName());
        ComponentName component = launch == null ? null : launch.getComponent();
        if (component == null) {
            NezumiLog.e(Patch.CORE, TAG, "no launcher activity for " + starter.getPackageName() + ", not restarting");
            return;
        }
        // apply() writes in the background; an empty commit() waits for those writes first.
        NezumiPrefs.of(starter).edit().commit();
        NezumiLog.i(Patch.CORE, TAG, "restart requested by user");
        NezumiLog.flushPending();
        starter.startActivity(Intent.makeRestartActivityTask(component));
        if (activity != null) activity.finishAffinity();
        android.os.Process.killProcess(android.os.Process.myPid());
        System.exit(0);
    }
}
