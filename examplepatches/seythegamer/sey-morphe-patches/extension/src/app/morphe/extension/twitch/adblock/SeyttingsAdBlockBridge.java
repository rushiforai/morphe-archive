package app.morphe.extension.twitch.adblock;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsAds}.
 *
 * <p>The injected HLS filter asks for the shared toggle state when it boots
 * and reports ad-break decisions here, so they appear in logcat under
 * {@code MorpheTwitchAdBlock}. The native SEYTTINGS dialog writes the same
 * preference through {@link AdBlockPrefs}.</p>
 */
public final class SeyttingsAdBlockBridge {

    static final String TAG = "MorpheTwitchAdBlock";

    public SeyttingsAdBlockBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return AdBlockPrefs.isEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        AdBlockPrefs.setEnabled(enabled);
    }

    /** Diagnostics: the injected filter reports its decisions here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
