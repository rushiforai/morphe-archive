package app.twoeno.extension.untappd;

import android.os.Bundle;

import java.util.Map;

import app.twoeno.extension.shared.Logger;

/**
 * Disables the ad slots of the activity feed by overriding the Firebase remote config value
 * the React Native code of Untappd reads.
 */
@SuppressWarnings("unused")
public final class HideFeedAdsPatch {
    private static final String FEED_ADS_KEY = "activity_feed_ads";

    private HideFeedAdsPatch() {
    }

    /**
     * Injection point: return value of
     * {@code io.invertase.firebase.config.UniversalFirebaseConfigModule.getAllValuesForApp(String)}.
     *
     * @param values A mutable map of config key to a bundle with "value" and "source".
     */
    @SuppressWarnings("unchecked")
    public static void overrideConfigValues(Object values) {
        if (!(values instanceof Map)) return;

        try {
            Bundle value = new Bundle(2);
            value.putString("value", "0");
            value.putString("source", "remote");
            ((Map<String, Object>) values).put(FEED_ADS_KEY, value);
        } catch (Throwable ex) {
            Logger.error("overrideConfigValues failure", ex);
        }
    }
}
