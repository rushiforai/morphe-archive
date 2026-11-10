package app.morphe.extension.twitch.expandchat;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsChatExpand}.
 *
 * <p>The injected footer script reads the shared toggle on boot and the native
 * SEYTTINGS dialog writes the same preference through
 * {@link ExpandChatPrefs}.</p>
 */
public final class SeyttingsExpandChatBridge {

    static final String TAG = "MorpheTwitchExpandChat";

    public SeyttingsExpandChatBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return ExpandChatPrefs.isEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        ExpandChatPrefs.setEnabled(enabled);
    }

    /** Diagnostics: the injected script reports apply and toggle events here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
