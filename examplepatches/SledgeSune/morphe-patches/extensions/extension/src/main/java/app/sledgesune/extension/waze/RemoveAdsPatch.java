package app.sledgesune.extension.waze;

import android.util.Log;

@SuppressWarnings("unused")
public final class RemoveAdsPatch {

    private static final String TAG = "RemoveAdsPatch";

    /**
     * Injection point: start of {@code ConfigManager.onConfigSyncedFromServer()} / {@code onConfigSyncedToServer()}.
     * <p>
     * Most of these are read only by the native core (map pins, takeover timer), so they are written into the
     * config store rather than faked in a Java getter. The full-screen "takeover" ad is also blocked at its JNI
     * callback by the patch, in case the server still sends one.
     */
    public static void applyConfig() {
        try {
            // Sponsored pins on the map, on the phone and in the car.
            WazeConfig.setBoolean("CONFIG_VALUE_GOOGLE_ADS_FEATURE_ENABLED", false);
            WazeConfig.setBoolean("CONFIG_VALUE_GOOGLE_ADS_IN_CAR_ENABLED", false);
            WazeConfig.setBoolean("CONFIG_VALUE_GOOGLE_ADS_DISCOVERY_PINS_ENABLED", false);
            WazeConfig.setLong("CONFIG_VALUE_GOOGLE_ADS_MAX_CONCURRENT_PINS", 0);
            WazeConfig.setLong("CONFIG_VALUE_GOOGLE_ADS_IN_CAR_MAX_CONCURRENT_PINS", 0);
            // Sponsored results in search.
            WazeConfig.setBoolean("CONFIG_VALUE_SEARCH_ADS_FEATURE_ENABLED", false);
            WazeConfig.setBoolean("CONFIG_VALUE_SEARCH_ADS_IN_CAR_FEATURE_ENABLED", false);
            // Ad pre-loading and ad event reporting.
            WazeConfig.setBoolean("CONFIG_VALUE_ADS_INVENTORY_PREDICTION_ENABLED", false);
            WazeConfig.setBoolean("CONFIG_VALUE_AD_EVENTS_FEATURE_ENABLED", false);
            // Full-screen ad when stopped: ask for one at most once every ~30 years.
            WazeConfig.setLong("CONFIG_VALUE_ZSPEED_MIN_TAKEOVER_REQUEST_INTERVAL_SEC", 1_000_000_000L);
            // Promotional launch screens.
            WazeConfig.setString("CONFIG_VALUE_APP_LAUNCH_DYNAMIC_SPLASH_SCREEN_SHOW_FREQUENCY", "OFF");
        } catch (Throwable t) {
            Log.e(TAG, "Could not turn ads off", t);
        }
    }
}
