package app.ayham.extension.music;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

@SuppressWarnings("unused")
public final class HelloPatch {
    private static final String TAG = "AyhamPatches";

    private HelloPatch() {
    }

    /** Injection point: start of MusicActivity.onCreate. */
    public static void onCreate(Activity activity) {
        Log.i(TAG, "Hello patch active in " + activity.getClass().getName());
        new Handler(Looper.getMainLooper()).post(() ->
                Toast.makeText(activity, "Hello from Ayham patches", Toast.LENGTH_LONG).show());
    }
}
