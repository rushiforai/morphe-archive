package app.morphed.extension.twitch.patches;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import java.util.EnumSet;
import java.util.Set;

import app.morphed.extension.twitch.adblock.Problem;

/**
 * Tells the user once per app launch and problem that the ad blocker needs an update.
 */
final class ProblemNotifier implements Problem.Reporter {
    private static final String TAG = "TwitchMorphed";

    private final Set<Problem> shown = EnumSet.noneOf(Problem.class);
    private final Handler main = new Handler(Looper.getMainLooper());

    @Override
    public void report(Problem problem, String detail) {
        Log.w(TAG, problem.code + " " + problem.description + ": " + detail);
        DebugLog.log("PROBLEM " + problem.code + " " + problem.description + ": " + detail);
        synchronized (shown) {
            if (!shown.add(problem)) return;
        }
        main.post(() -> {
            Context context = applicationContext();
            if (context == null) return;
            String message = "Ad blocker needs an update (" + problem.code + ")\n" + problem.description;
            if (detail != null && !detail.isEmpty()) message += "\n" + shorten(detail);
            Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        });
    }

    /** The detail names what Twitch changed; long URLs are cut so the message stays small. */
    private static String shorten(String detail) {
        return detail.length() <= 120 ? detail : detail.substring(0, 117) + "...";
    }

    private static Context applicationContext() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }
}
