package app.plyrs1.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

/** Shows the patch credit once for each installed app-data profile. */
public final class FirstLaunchCredit {
    private static final String PREFERENCES = "plyrs1.patch";
    private static final String SHOWN_KEY = "first_launch_credit_shown";
    private static final String MESSAGE = "Patched with ❤️ by Plyrs";

    private FirstLaunchCredit() {
    }
    public static void showOnce(final Context context) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                showAfterActivityAttachment(context);
            }
        });
    }

    private static void showAfterActivityAttachment(Context context) {
        SharedPreferences preferences = context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
        if (preferences.getBoolean(SHOWN_KEY, false)) {
            return;
        }

        preferences.edit().putBoolean(SHOWN_KEY, true).apply();
        Toast.makeText(context, MESSAGE, Toast.LENGTH_LONG).show();
    }
}
