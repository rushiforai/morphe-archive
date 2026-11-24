package app.template.extension.extension;

import android.app.Activity;
import android.app.ActivityOptions;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;

import java.lang.ref.WeakReference;

public final class SharedDestinationActivity extends Activity {
    private static final String TAG = "QM-WazeDestination";
    private static final String WAZE_ENTRY = "com.waze.FreeMapAppActivity";
    private static volatile WeakReference<Activity> runningMap = new WeakReference<>(null);

    public static void trackDisplay(Activity mapActivity) {
        runningMap = new WeakReference<>(mapActivity);
    }

    static Activity currentMapActivity() {
        Activity activity = runningMap.get();
        return activity == null || activity.isFinishing() || activity.isDestroyed() ? null : activity;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            forwardDestination(getIntent());
        } finally {
            finish();
        }
    }

    private void forwardDestination(Intent source) {
        String action = source.getAction();
        if (!Intent.ACTION_VIEW.equals(action) && !Intent.ACTION_SEND.equals(action)
                && !Intent.ACTION_SEARCH.equals(action) && !"android.intent.action.NAVIGATE".equals(action)) return;

        Intent destination = new Intent(source);
        destination.setSelector(null);
        destination.setClassName(getPackageName(), WAZE_ENTRY);
        destination.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | (source.getFlags()
                & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION)));

        Uri referrer = getReferrer();
        if (referrer != null && !destination.hasExtra(Intent.EXTRA_REFERRER)) {
            destination.putExtra(Intent.EXTRA_REFERRER, referrer);
        }

        if (Build.VERSION.SDK_INT >= 26) {
            int displayId = currentWazeDisplay();
            if (displayId != Display.INVALID_DISPLAY) {
                try {
                    Bundle options = ActivityOptions.makeBasic().setLaunchDisplayId(displayId).toBundle();
                    startActivity(destination, options);
                    Log.i(TAG, "Opened shared destination on Waze display " + displayId);
                    return;
                } catch (SecurityException | IllegalArgumentException error) {
                    Log.w(TAG, "Waze display is unavailable", error);
                }
            }
        }
        startActivity(destination);
    }

    @SuppressWarnings("deprecation")
    private static int currentWazeDisplay() {
        Activity activity = currentMapActivity();
        if (activity == null) return Display.INVALID_DISPLAY;

        // Query the activity's current display so moves and display removal are picked up.
        Display display = Build.VERSION.SDK_INT >= 30
                ? activity.getDisplay() : activity.getWindowManager().getDefaultDisplay();
        if (display == null || !display.isValid() || display.getState() == Display.STATE_OFF) {
            return Display.INVALID_DISPLAY;
        }
        return display.getDisplayId();
    }
}
