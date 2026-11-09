package dev.aayy.bwpatches.extension;

import android.webkit.CookieManager;

/**
 * Runtime logic for the Native Alpha "Persist web app logins" patch.
 *
 * <p>Native Alpha accepts cookies but never flushes WebView's cookie store to disk, so cookies
 * live only in memory and are lost when the web app's process is killed (common when a web app is
 * opened standalone from a home-screen shortcut). This flushes the cookie store on demand so logins
 * and sessions survive closing the web app.
 *
 * <p>Uses only the stable framework {@link CookieManager} API and fails safe: any error is ignored,
 * leaving the app's original behavior.
 */
@SuppressWarnings("unused")
public final class WebAppCookies {

    private WebAppCookies() {
    }

    /** Writes WebView's in-memory cookies to persistent storage. */
    public static void flush() {
        try {
            CookieManager.getInstance().flush();
        } catch (Throwable ignored) {
        }
    }
}
