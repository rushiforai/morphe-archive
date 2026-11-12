package app.sledgesune.extension.waze;

import android.util.Log;

@SuppressWarnings("unused")
public final class KeepAlivePatch {

    private static final String TAG = "KeepAlivePatch";

    /** Minutes Waze may stay in the background. The patch replaces this body with the chosen option. */
    public static int minutes() {
        return 60;
    }

    /**
     * Injection point: start of {@code ConfigManager.onConfigSyncedFromServer()} / {@code onConfigSyncedToServer()}.
     * <p>
     * Waze's native core closes the app after "Background timeout ms" (config 858) in the background, or after
     * "Background timeout near destination ms" (859) when the drive is almost over. Both are server-set.
     */
    public static void applyConfig() {
        try {
            long millis = Math.max(1, minutes()) * 60_000L;
            WazeConfig.setLong("CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_MS", millis);
            WazeConfig.setLong("CONFIG_VALUE_POWER_BACKGROUND_TIMEOUT_NEAR_DESTINATION_MS", millis);
        } catch (Throwable t) {
            Log.e(TAG, "Could not set the background timeout", t);
        }
    }
}
