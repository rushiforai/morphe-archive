package app.morphed.extension.twitch;

import android.app.Application;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

/** The app the patches run in, for code that is called from places without a Context. */
public final class App {
    public static final String TAG = "TwitchMorphed";
    public static final Handler MAIN = new Handler(Looper.getMainLooper());

    private App() {
    }

    public static Application application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            Log.e(TAG, "No application", t);
            return null;
        }
    }

    /** Runs on the main thread; a failure there must never crash Twitch, so it is logged and handed back. */
    public static void onMain(Runnable work) {
        MAIN.post(() -> {
            try {
                work.run();
            } catch (Throwable t) {
                Log.e(TAG, "Main thread work failed", t);
            }
        });
    }
}
