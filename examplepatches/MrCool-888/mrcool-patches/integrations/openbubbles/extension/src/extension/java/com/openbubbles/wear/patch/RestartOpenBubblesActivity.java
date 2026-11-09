package com.openbubbles.wear.patch;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Process;
import android.os.RemoteException;

/** Relaunches OpenBubbles from an app-private process after the main process has exited. */
public final class RestartOpenBubblesActivity extends Activity {
    private static final String PID = "main_pid";
    private static final String LIFETIME = "main_lifetime";
    private boolean restarting;

    static void restart(Activity activity) {
        Bundle handoff = new Bundle();
        handoff.putInt(PID, Process.myPid());
        handoff.putBinder(LIFETIME, new Binder());
        activity.startActivity(new Intent(activity, RestartOpenBubblesActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                .putExtras(handoff));
    }

    public static boolean isRestartProcess() {
        return Application.getProcessName().endsWith(":morphe_restart");
    }

    @Override protected void onPostResume() {
        super.onPostResume();
        if (restarting) return;
        restarting = true;

        Bundle handoff = getIntent().getExtras();
        int pid = handoff == null ? 0 : handoff.getInt(PID);
        IBinder lifetime = handoff == null ? null : handoff.getBinder(LIFETIME);
        Intent launcher = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (!isRestartProcess() || pid <= 0 || pid == Process.myPid() || lifetime == null
                || launcher == null || launcher.getComponent() == null) {
            finish();
            return;
        }

        Runnable relaunch = () -> {
            startActivity(Intent.makeRestartActivityTask(launcher.getComponent()));
            finish();
        };
        try {
            // Wait for Binder death so the new activity cannot land in the old process.
            lifetime.linkToDeath(() -> runOnUiThread(relaunch), 0);
            Process.killProcess(pid);
        } catch (RemoteException alreadyExited) {
            relaunch.run();
        }
    }
}
