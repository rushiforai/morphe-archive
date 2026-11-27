package org.ungoogled.car;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

/**
 * Opens Waze Mod's permission screen for Maps, from the phone (a notification sent while Android Auto runs), and
 * reconnects when the user allows it. Waze Mod's screen answers its caller, so it is started for a result.
 */
public final class WazeModAccessActivity extends Activity {
    static final String EXTRA_REQUEST = "org.ungoogled.car.WAZE_MOD_REQUEST";
    private static final int REQUEST = 1;

    /**
     * What opens Waze Mod's permission screen for Maps from the phone, or null when no Waze Mod with the Data API is
     * installed.
     */
    public static Intent request(android.content.Context context) {
        for (String pkg : WazeModClient.HOSTS) {
            try {
                if (!context.getPackageManager().queryIntentServices(
                        new Intent(WazeModClient.ACTION_BIND).setPackage(pkg), 0).isEmpty()) {
                    return new Intent(context, WazeModAccessActivity.class).putExtra(EXTRA_REQUEST,
                            new Intent(WazeModClient.ACTION_REQUEST_ACCESS).setPackage(pkg));
                }
            } catch (RuntimeException ignored) {
            }
        }
        return null;
    }

    /** Run when access was granted (the Android Auto session reconnects). */
    static volatile Runnable onGranted;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null) return;
        Intent request = getIntent().getParcelableExtra(EXTRA_REQUEST);
        if (request == null) {
            finish();
            return;
        }
        try {
            startActivityForResult(request, REQUEST);
        } catch (ActivityNotFoundException | SecurityException e) {
            Log.w("UA-WAZE", "opening Waze Mod's permission screen", e);
            finish();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        Log.i("UA-WAZE", "Waze Mod access: " + (resultCode == RESULT_OK ? "granted" : "refused"));
        Runnable granted = onGranted;
        if (resultCode == RESULT_OK && granted != null) granted.run();
        finish();
    }
}
