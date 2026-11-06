package me.dyskal.ytmrpc;

import android.app.Activity;
import android.app.ActivityManager;
import android.os.Bundle;
import android.content.Intent;
import android.net.Uri;

/** Browser callback only. No UI or credentials in intents returned to other applications. */
public final class DiscordOAuthActivity extends Activity {
    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        DiscordRpcPatch.initialize(getApplicationContext());
        Uri uri = getIntent().getData();
        DiscordDiagnostics.info("OAuth callback activity opened");
        DiscordRpcPatch.callback(getApplicationContext(), uri, attempt -> {
            // Wait for a valid state claim before changing the foreground task.
            if (attempt != null && !isFinishing() && !isDestroyed()) {
                try {
                    if (!restoreTask(attempt.returnTaskId)) {
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("morphe_settings_intent"))
                                .setClassName(getPackageName(), "com.google.android.gms.common.api.GoogleApiActivity")
                                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_REORDER_TO_FRONT));
                    }
                } catch (Exception error) { DiscordDiagnostics.failure("Return to Morphe settings", error); }
            }
            finish();
        });
    }

    @SuppressWarnings("deprecation") // persistentId supports API 26 and tasks retained after process death.
    private boolean restoreTask(int taskId) {
        if (taskId < 0) return false;
        ActivityManager manager = getSystemService(ActivityManager.class);
        if (manager == null) return false;
        try {
            for (ActivityManager.AppTask task : manager.getAppTasks()) {
                if (task.getTaskInfo().persistentId == taskId) {
                    task.moveToFront();
                    DiscordDiagnostics.info("Returned to original authorization task");
                    return true;
                }
            }
        } catch (Exception error) { DiscordDiagnostics.failure("Restore authorization task", error); }
        return false;
    }
}
