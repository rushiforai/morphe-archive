package app.libby.font;

import android.content.Context;
import android.webkit.WebView;

import org.json.JSONObject;

/**
 * Runs inside the patched app. Called from the patched WebViewClient.onPageFinished.
 *
 * The Libby reader is a WebView container page that hosts the chapter in a same-origin
 * iframe. CSS cannot cross a document boundary, so the injected controller styles the
 * iframe document and re-applies on every chapter change.
 */
public final class FontHook {

    private static final String FAMILY = "MorpheFont";

    private FontHook() {
    }

    public static void onPageFinished(WebView webView, String url) {
        if (webView == null || url == null) {
            return;
        }
        // Only the reader host; skip everything else (libbyapp.com shell, chapter frames, ...).
        if (!url.contains("read.libbyshelf.com")) {
            return;
        }
        if (url.contains("/chapter-")) {
            return;
        }

        Context context = webView.getContext();
        String fontUrl = FontBridge.fontUrl(context);
        boolean hasFont = !fontUrl.isEmpty();
        String format = FontBridge.fontFormat(context);
        // The whole library travels with init so the UI can draw the font list
        // without a second bridge call, and so a deleted font cannot linger.
        String library = FontBridge.libraryStateJson(context);

        // HTML and CSS are fetched from FontBridge at runtime. Keeping them out
        // of this script avoids embedding markup in the injected JavaScript and
        // avoids quoting the whole UI on every page.
        String script = "(function(){if(window.MorpheFont){return;}"
                + FontUiData.JS + "})();";
        String init = "MorpheFont.init("
                + JSONObject.quote(hasFont ? fontCss(fontUrl, format) : "") + ","
                + (hasFont && FontBridge.isEnabled(context)) + ","
                + JSONObject.quote(hasFont ? FontBridge.fontName(context) : "") + ","
                + hasFont + ","
                + JSONObject.quote(library) + ");";
        webView.evaluateJavascript(script + init, null);
    }

    private static String fontCss(String url, String format) {
        String cssFormat = "ttf".equals(format) ? "truetype"
                : "otf".equals(format) ? "opentype" : format;
        // The repeated attribute gives this rule enough specificity to beat
        // Libby's book-design rules, including OpenDyslexic's
        // "html.RS-BIFOCAL * { font-family: ... !important }".
        String root = "html[data-morphe-font-root][data-morphe-font-root]"
                + "[data-morphe-font-root]";
        return "@font-face{font-family:" + FAMILY
                + ";src:url(" + url + ") format('" + cssFormat + "');"
                + "font-weight:400;font-style:normal}"
                + root + "," + root + " body," + root + " body *{"
                + "font-family:" + FAMILY + ",serif !important}";
    }
}
