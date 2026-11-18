package app.afterglow.extension.ui;

import android.app.Activity;
import android.content.Intent;
import android.os.Process;
import android.widget.Toast;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;

/**
 * Restarts YouTube, the Android counterpart of the iOS {@code exit(0)} used by
 * Restart Now, Reset & Restart and Restore default settings. The launch intent
 * is handed to an internal activity in a separate process, so exiting the old process
 * cannot also kill the new activity before its task is ready.
 */
final class AppRestart {
    private AppRestart() {}

    static void restart(Activity activity) {
        try {
            if (!AfterglowPrefs.flush()) throw new IllegalStateException("Could not save preferences before restart");
            Intent restart = new Intent(activity, RestartActivity.class)
                    .putExtra(RestartActivity.OLD_PID, Process.myPid())
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            activity.startActivity(restart);
        } catch (Throwable error) {
            Afterglow.error("AppRestart", error);
            Toast.makeText(activity, "Could not restart YouTube. Please try again.", Toast.LENGTH_LONG).show();
        }
    }
}
