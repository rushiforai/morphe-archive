package app.morphe.extension.twitch.hidepinned;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsPinned}.
 *
 * <p>The injected helper reads the shared toggle state when it boots and
 * reports how many pinned elements it hid, so they appear in logcat under
 * {@code MorpheTwitchPinned}. The native SEYTTINGS dialog writes the same
 * preference through {@link PinnedChatPrefs}.</p>
 */
public final class SeyttingsPinnedBridge {

    static final String TAG = "MorpheTwitchPinned";

    public SeyttingsPinnedBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return PinnedChatPrefs.isHidePinnedEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        PinnedChatPrefs.setHidePinnedEnabled(enabled);
    }

    /** Diagnostics: the injected helper reports its state here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
