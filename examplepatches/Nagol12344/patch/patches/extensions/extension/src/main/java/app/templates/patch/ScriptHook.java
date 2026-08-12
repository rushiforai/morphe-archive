package app.template.extension;

import android.webkit.WebView;

public class ScriptHook {
    private static final String FIX_SCRIPT =
        "document.querySelectorAll('input[type=\"file\"]').forEach(function(el){" +
        "  el.removeAttribute('capture');" +
        "});" +
        "new MutationObserver(function(){" +
        "  document.querySelectorAll('input[type=\"file\"][capture]').forEach(function(el){" +
        "    el.removeAttribute('capture');" +
        "  });" +
        "}).observe(document.body, {childList:true, subtree:true});";

    public static void hookWebView(WebView view) {
        view.evaluateJavascript(FIX_SCRIPT, null);
    }
}//edit