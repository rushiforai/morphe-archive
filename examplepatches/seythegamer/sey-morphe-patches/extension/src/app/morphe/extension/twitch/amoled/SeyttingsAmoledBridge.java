package app.morphe.extension.twitch.amoled;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsAmoled}.
 *
 * <p>The injected theme reads the shared toggle state when it boots and reports
 * its state changes here, so they appear in logcat under
 * {@code MorpheTwitchAmoled}. The native SEYTTINGS dialog writes the same
 * preference through {@link AmoledPrefs}.</p>
 */
public final class SeyttingsAmoledBridge {

    static final String TAG = "MorpheTwitchAmoled";

    public SeyttingsAmoledBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return AmoledPrefs.isEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        AmoledPrefs.setEnabled(enabled);
    }

    /** Diagnostics: the injected theme reports its state here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
