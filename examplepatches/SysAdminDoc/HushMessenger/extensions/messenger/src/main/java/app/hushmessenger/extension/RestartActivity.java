package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.widget.TextView;
import android.widget.Toast;

/** Reopen the real launcher in a fresh process after pending settings writes finish. */
public class RestartActivity extends Activity {
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        Settings.initialize(this);
        TextView status = new TextView(this);
        status.setText(new SettingsText(this).get("restarting"));
        status.setTextColor(0xffeeeeee);
        status.setBackgroundColor(0xff000000);
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
        Intent query = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(packageName);
        for (ResolveInfo match : context.getPackageManager().queryIntentActivities(query, 0)) {
            var activity = match.activityInfo;
            if (activity == null || !packageName.equals(activity.packageName) ||
                activity.name.startsWith("app.hushmessenger.extension.") ||
                (activity.targetActivity != null && activity.targetActivity.startsWith("app.hushmessenger.extension."))) continue;
            return Intent.makeRestartActivityTask(new ComponentName(packageName, activity.name)).setPackage(packageName);
        }
        return null;
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
