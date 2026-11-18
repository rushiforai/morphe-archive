package pl.dudek.extension.gardenscapes;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/** UI-only diagnostics. Never stores account data or changes authentication results. */
public final class PlayGamesDiagnostics {
    private PlayGamesDiagnostics() {}

    public static void show(Context context, String status) {
        if (context == null) return;
        try {
            Context application = context.getApplicationContext();
            if (application == null) return;
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Toast.makeText(application, "Google Play Games: " + status,
                            Toast.LENGTH_LONG).show();
                } catch (RuntimeException ignored) {
                    // Reporting must never interrupt the game's original callback.
                }
            });
        } catch (RuntimeException ignored) {
            // A missing UI must not turn a recoverable sign-in failure into a crash.
        }
    }
}
