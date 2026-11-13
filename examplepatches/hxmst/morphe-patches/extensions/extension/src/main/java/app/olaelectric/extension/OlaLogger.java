package app.olaelectric.extension;

import android.util.Log;

@SuppressWarnings("unused")
public class OlaLogger {
    private static final String TAG = "OlaCompanionPatch";

    public static void logReroute(String originalHost, String targetHost, int port) {
        Log.i(TAG, "Rerouted API call from " + originalHost + " -> " + targetHost + ":" + port);
    }
}
