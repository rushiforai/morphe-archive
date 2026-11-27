package dev.rikunode.adblock;

import android.content.Context;
import android.webkit.WebView;
import org.json.JSONObject;

/** Optional X app-prompt cosmetics, independent of the ad filter snapshot. */
final class XAppPromptCss {
    private static final String KEY = "hideXAppPrompts";
    private static final String STYLE_ID = "hoshiori-x-app-prompts-style";
    private static final String CSS =
            "div[role=\"dialog\"][aria-modal=\"true\"]:has(a[href*=\"ct=post-modal\"])," +
            "aside:has(a[href*=\"ct=post-timeline\"]){display:none!important}";

    private XAppPromptCss() {}

    static boolean enabled(Context context) {
        if (context == null) return false;
        try {
            return context.getSharedPreferences("hoshiori_settings", Context.MODE_PRIVATE)
                    .getBoolean(KEY, false);
        } catch (RuntimeException ignored) {
            return false;
        }
    }

    static void inject(WebView view) {
        try {
            if (view == null) return;
            // Check the live document, not the potentially stale onPageFinished URL.
            // Exact HTTPS hosts, top frame, and a status page only.
            String script = "(function(){try{if(window!==window.top||location.protocol!=='https:'||" +
                    "(location.hostname!=='x.com'&&location.hostname!=='twitter.com'))return;" +
                    "var s=document.getElementById('" + STYLE_ID + "');" +
                    "if(!" + enabled(view.getContext()) +
                    "||!/^\\/(?:[^/]+\\/status|i\\/web\\/status)\\/\\d+(?:\\/|$)/.test(location.pathname)){" +
                    "if(s)s.remove();return;}" +
                    "if(!s){s=document.createElement('style');s.id='" + STYLE_ID +
                    "';s.textContent=" + JSONObject.quote(CSS) +
                    ";(document.head||document.documentElement).appendChild(s);}" +
                    "}catch(e){}})();";
            view.evaluateJavascript(script, null);
        } catch (Throwable ignored) {
            // Optional cosmetics must never interrupt article browsing.
        }
    }
}
