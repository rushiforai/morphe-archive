/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.webkit.WebView;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * JavaScript bridges kept off the in-app browser's pages while the switch is on.
 *
 * <p>Off by default, unlike the other device switches: TikTok's own hybrid pages, the shop
 * checkout and the CAPTCHA page among them, are built on that bridge and stop working without
 * it. With the switch off, and before the settings context exists, the interface is added
 * exactly as TikTok asked. The call goes back through the WebView virtually, so a subclass
 * override still runs; the invoke-super inside the override is not rewritten, which is what
 * keeps this from calling itself.
 */
@SuppressWarnings("unused")
public final class BrowserPrivacyGuard {

    public static void filterJsInterface(WebView webView, Object object, String name) {
        if (Utils.getContext() == null || !Settings.BLOCK_WEBVIEW_JS_INTERFACES.get()) {
            webView.addJavascriptInterface(object, name);
            return;
        }
        Logger.printInfo(() -> "Browser privacy guard: blocked JS interface '" + name + "'");
    }

    private BrowserPrivacyGuard() {}
}
