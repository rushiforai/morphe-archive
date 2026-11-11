package app.morphe.extension.twitch.maturewarning;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsMature}.
 *
 * <p>The injected helper reads the shared toggle state when it boots and
 * reports the accepted warnings here, so they appear in logcat under
 * {@code MorpheTwitchMature}. The native SEYTTINGS dialog writes the same
 * preference through {@link MatureWarningPrefs}.</p>
 */
public final class SeyttingsMatureWarningBridge {

    static final String TAG = "MorpheTwitchMature";

    public SeyttingsMatureWarningBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return MatureWarningPrefs.isEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        MatureWarningPrefs.setEnabled(enabled);
    }

    /** Diagnostics: the injected helper reports its state here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
