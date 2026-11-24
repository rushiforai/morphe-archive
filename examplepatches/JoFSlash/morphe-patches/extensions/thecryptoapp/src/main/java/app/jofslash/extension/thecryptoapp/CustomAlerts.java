package app.jofslash.extension.thecryptoapp;

import android.content.Context;
import android.util.Log;

/**
 * Entry point injected into com.crypter.cryptocyrrency.app.App.onCreate().
 *
 * <p>Wires up the self-contained custom price-alert feature: creates the notification channel,
 * schedules the periodic AlarmManager check, and runs one immediate check in the background so a
 * freshly added rule fires quickly. It is entirely self-contained and never references the host
 * app's own classes, its Pro entitlement, or its server-side alerts. Never throws into the host.
 */
@SuppressWarnings("unused")
public final class CustomAlerts {

    static final String TAG = "JoFCryptoApp";

    private static volatile boolean started = false;

    private CustomAlerts() {
    }

    /** Called once from App.onCreate(). */
    public static void init(Context context) {
        try {
            if (started) {
                return;
            }
            started = true;

            final Context app = context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;

            Log.i(TAG, "init: custom price-alert feature starting");

            AlertNotifier.ensureChannel(app);
            AlertScheduler.schedule(app);

            // Immediate "it's alive" check so a rule added before relaunch fires right away,
            // using the same code path as the scheduled alarm. Off the main thread.
            Thread t = new Thread(() -> {
                Log.i(TAG, "init: running immediate check");
                AlertChecker.checkNow(app);
            }, "CryptoAlerts-init");
            t.setDaemon(true);
            t.start();
        } catch (Throwable t) {
            Log.e(TAG, "init: unexpected failure", t);
        }
    }
}
