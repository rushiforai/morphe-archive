/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.webkit.WebView;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class BrowserPrivacyGuard {

    public static void filterJsInterface(WebView webView, Object object, String name) {
        Logger.printInfo(() -> "Browser privacy guard: blocked JS interface '" + name + "'");
    }

    private BrowserPrivacyGuard() {}
}
