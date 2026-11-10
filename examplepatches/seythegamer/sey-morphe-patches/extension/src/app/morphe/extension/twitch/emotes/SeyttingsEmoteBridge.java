package app.morphe.extension.twitch.emotes;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsEmotes}.
 *
 * <p>The injected emote script asks for the shared toggle state when it boots
 * and forwards every change made from the web side. The native SEYTTINGS
 * dialog writes the same preference through {@link EmotePrefs}.</p>
 */
public final class SeyttingsEmoteBridge {

    static final String TAG = "MorpheTwitchEmotes";

    public SeyttingsEmoteBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return EmotePrefs.isEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        EmotePrefs.setEnabled(enabled);
    }

    /** Diagnostics: the injected script reports load and render progress here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
