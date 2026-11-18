package app.afterglow.extension.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;

import app.afterglow.extension.Afterglow;

/** Unexported, short-lived :afterglow_restart process. No alarms or background launch permission. */
public final class RestartActivity extends Activity {
    static final String OLD_PID = "afterglow_restart_pid";

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        int oldPid = getIntent().getIntExtra(OLD_PID, -1);
        if (oldPid <= 0 || oldPid == Process.myPid()) {
            finish();
            return;
        }
        // Preferences were flushed by the caller. Wait for this helper to become foreground.
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                Process.killProcess(oldPid);
                Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
                if (launch == null) throw new IllegalStateException("No YouTube launcher");
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                startActivity(launch);
            } catch (Throwable error) {
                Afterglow.error("RestartActivity", error);
            } finally {
                finish();
                Process.killProcess(Process.myPid());
            }
        }, 400);
    }
}
