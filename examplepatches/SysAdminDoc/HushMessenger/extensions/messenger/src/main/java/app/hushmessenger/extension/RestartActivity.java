package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.widget.TextView;
import android.widget.Toast;

/** Reopen the real launcher in a fresh process after pending settings writes finish. */
public class RestartActivity extends Activity {
    @Override @SuppressWarnings("deprecation") public void onCreate(Bundle state) {
        // On a Root Mount install this screen can be the first thing in the process, before any hook.
        HostScreens.start(this);
        Settings.initialize(this);
        boolean light = Settings.preferences.getBoolean("light", false);
        setTheme(light ? android.R.style.Theme_Material_Light_NoActionBar : android.R.style.Theme_Material_NoActionBar);
        super.onCreate(state);
        SettingsUi ui = new SettingsUi(this, light);
        getWindow().setStatusBarColor(ui.background);
        getWindow().setNavigationBarColor(ui.background);
        getWindow().getDecorView().setSystemUiVisibility(light ? android.view.View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | android.view.View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0);
        TextView status = new TextView(this);
        status.setText(new SettingsText(this).get("restarting"));
        status.setTextColor(ui.text);
        status.setBackgroundColor(ui.background);
        status.setGravity(Gravity.CENTER);
        setContentView(status);
        Intent launch = launcherIntent(this);
        if (launch == null) {
            fail("restart_unavailable");
            return;
        }
        new Thread(() -> {
            boolean saved = saveBeforeRestart(Settings.preferences);
            runOnUiThread(() -> completeRestart(launch, saved));
        }, "HushMessenger-save-restart").start();
    }

    static Intent launcherIntent(Context context) {
        String packageName = context.getPackageName();
        PackageManager packages = context.getPackageManager();
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(packageName);
        for (ResolveInfo match : packages.queryIntentActivities(query, 0)) {
            var activity = match.activityInfo;
            if (activity == null || !packageName.equals(activity.packageName) || activity.name == null ||
                activity.name.startsWith("app.hushmessenger.extension.") ||
                (activity.targetActivity != null && activity.targetActivity.startsWith("app.hushmessenger.extension.")) ||
                !enabledNow(packages, packageName, activity)) continue;
            return Intent.makeRestartActivityTask(new ComponentName(packageName, activity.name)).setPackage(packageName);
        }
        return null;
    }

    /**
     * ActivityInfo.enabled is the manifest value. Alternate app icons are manifest-disabled aliases
     * that Messenger enables at runtime, so the runtime state decides and the manifest only backs DEFAULT.
     */
    static boolean enabledNow(PackageManager packages, String packageName, ActivityInfo activity) {
        int state;
        try { state = packages.getComponentEnabledSetting(new ComponentName(packageName, activity.name)); }
        // queryIntentActivities without MATCH_DISABLED_COMPONENTS has already left out disabled components.
        catch (IllegalArgumentException | SecurityException unknown) { return true; }
        if (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED) return true;
        if (state != PackageManager.COMPONENT_ENABLED_STATE_DEFAULT) return false;
        return activity.applicationInfo != null ? activity.isEnabled() : activity.enabled;
    }

    static boolean saveBeforeRestart(SharedPreferences preferences) {
        try {
            // A changed value forces a disk write of the latest choices, including pending apply() calls.
            return preferences != null && preferences.edit().putLong("restart_requested_at", System.nanoTime()).commit();
        } catch (RuntimeException error) {
            Log.e("HushMessenger", "Couldn't save settings before restart", error);
            return false;
        }
    }

    void completeRestart(Intent launch, boolean saved) {
        if (isFinishing() || isDestroyed()) return;
        if (!saved) {
            fail("restart_save_failed");
            return;
        }
        try {
            startActivity(launch);
            finish();
            exitProcess();
        } catch (android.content.ActivityNotFoundException | SecurityException error) {
            Log.e("HushMessenger", "Couldn't restart Messenger", error);
            fail("restart_unavailable");
        }
    }

    void exitProcess() { System.exit(0); }

    private void fail(String message) {
        Log.e("HushMessenger", message);
        Toast.makeText(this, new SettingsText(this).get(message), Toast.LENGTH_LONG).show();
        finish();
    }
}
