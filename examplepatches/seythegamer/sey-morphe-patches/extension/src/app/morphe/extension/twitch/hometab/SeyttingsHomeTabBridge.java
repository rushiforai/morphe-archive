package app.morphe.extension.twitch.hometab;

import android.util.Log;
import android.webkit.JavascriptInterface;

/**
 * JavaScript bridge exposed to the Twitch web app as
 * {@code window.seyttingsHomeTab}.
 *
 * <p>The injected {@code twitch-hometab.js} reads the enabled state and the
 * chosen tab from here when it boots and reports its state changes, so they
 * appear in logcat under {@code MorpheTwitchHomeTab}. The native SEYTTINGS
 * dialog writes the same preference through {@link HomeTabPrefs}.</p>
 */
public final class SeyttingsHomeTabBridge {

    static final String TAG = "MorpheTwitchHomeTab";

    public SeyttingsHomeTabBridge() {
    }

    @JavascriptInterface
    public boolean isEnabled() {
        return HomeTabPrefs.isEnabled();
    }

    @JavascriptInterface
    public void setEnabled(boolean enabled) {
        HomeTabPrefs.setEnabled(enabled);
    }

    @JavascriptInterface
    public String getHomeTab() {
        return HomeTabPrefs.getHomeTab();
    }

    @JavascriptInterface
    public void setHomeTab(String tab) {
        HomeTabPrefs.setHomeTab(tab);
    }

    /** Diagnostics: the injected helper reports its state here. */
    @JavascriptInterface
    public void report(String message) {
        Log.i(TAG, String.valueOf(message));
    }
}
