package app.proxma.rox;

import android.util.Log;

/**
 * ROX is wrapped in Google's Play licence check. On a re-signed copy it finds the wrong installer and
 * sends the user to a "Get this app from Play" screen, then closes the app. The patch turns each entry
 * point away and logs which one was hit.
 */
public final class PlayCheck {

    private static final String TAG = "PROXMA_ROX";

    private PlayCheck() {}

    public static void skippedAppStart() {
        Log.i(TAG, "PLAY skipped licence check at app start");
    }

    public static void skippedClient() {
        Log.i(TAG, "PLAY skipped licence client check");
    }

    public static void skippedProvider() {
        Log.i(TAG, "PLAY skipped licence check in provider");
    }

    public static void skippedPaywall() {
        Log.i(TAG, "PLAY skipped Play Store paywall screen");
    }
}
