package app.starkist.extension.newyorker;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import org.json.JSONObject;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import app.starkist.extension.settings.StarSettings;
import app.starkist.extension.settings.StarSettings.FontChoice;

/**
 * Applies the Star settings text size and font to article pages, which are web pages
 * shown in a WebView. {@link AppTextPatch} covers the rest of the app.
 */
@SuppressWarnings("unused")
public final class ArticleFontPatch {

    private static final String TAG = "StarSettings";

    /** Host the app serves article pages and their assets from. */
    private static final String ASSET_HOST = "appassets.androidplatform.net";
    private static final String STYLESHEET_PATH = "/assets/styles.css";
    private static final String STYLESHEET_ASSET = "styles.css";
    private static final String CUSTOM_FONT_PATH = "/star-settings/custom-font";

    private static final String STYLE_ELEMENT_ID = "starkist-font-patch";

    /** Injected at the start of the article WebViewClient's onPageStarted. */
    public static void onPageStarted(WebView webView) {
        if (webView == null) return;
        webView.getSettings().setTextZoom(StarSettings.getTextZoom(webView.getContext()));
    }

    /**
     * Injected at the start of the article WebViewClient's onPageFinished.
     * The stylesheet is normally already patched by {@link #interceptRequest},
     * but the WebView may reuse a cached copy, so the current CSS is also applied here.
     */
    public static void onPageFinished(WebView webView) {
        if (webView == null) return;

        String css = buildCss(webView.getContext());

        // Add a <style> element once, or update it if the page already has one.
        String js = "(function() {"
                + "var s = document.getElementById('" + STYLE_ELEMENT_ID + "');"
                + "if (!s) { s = document.createElement('style'); s.id = '" + STYLE_ELEMENT_ID + "';"
                + " document.head.appendChild(s); }"
                + "s.textContent = " + JSONObject.quote(css) + ";"
                + "})();";

        webView.evaluateJavascript(js, null);
    }

    /**
     * Injected at the start of the article WebViewClient's shouldInterceptRequest.
     * Serves the user's font file, and the app's stylesheet with the font CSS appended
     * so the chosen font is used from the first frame.
     *
     * @return A response to use, or null to let the app handle the request.
     */
    public static WebResourceResponse interceptRequest(WebView webView, WebResourceRequest request) {
        try {
            if (webView == null || request == null) return null;
            Uri url = request.getUrl();
            if (url == null || !ASSET_HOST.equals(url.getHost())) return null;

            Context context = webView.getContext();
            String path = url.getPath();

            if (CUSTOM_FONT_PATH.equals(path)) {
                File font = StarSettings.getCustomFontFile(context);
                if (!font.isFile()) return null;
                return new WebResourceResponse("font/ttf", null, new FileInputStream(font));
            }

            if (STYLESHEET_PATH.equals(path)) {
                String css = buildCss(context);
                if (css.isEmpty()) return null;
                byte[] stylesheet = concat(readAsset(context, STYLESHEET_ASSET),
                        ("\n" + css + "\n").getBytes(StandardCharsets.UTF_8));
                return new WebResourceResponse("text/css", "utf-8", new ByteArrayInputStream(stylesheet));
            }
        } catch (Exception e) {
            Log.e(TAG, "Could not intercept " + request.getUrl(), e);
        }
        return null;
    }

    /** CSS for the current font choice, or an empty string to keep the app's font. */
    private static String buildCss(Context context) {
        FontChoice font = StarSettings.getFont(context);
        if (font.cssFamily == null) return "";

        StringBuilder css = new StringBuilder();
        if (font == FontChoice.CUSTOM) {
            // The version query makes the WebView fetch the file again after it changes.
            long version = StarSettings.getCustomFontFile(context).lastModified();
            css.append("@font-face { font-family: 'StarCustomFont'; src: url('")
                    .append(CUSTOM_FONT_PATH).append("?v=").append(version).append("'); }\n");
        }
        // Every element on the page: body, headline, summary, byline, captions and drop caps.
        css.append("body, body *, body *::first-letter {")
                .append(" font-family: ").append(font.cssFamily).append(" !important; }");
        return css.toString();
    }

    private static byte[] readAsset(Context context, String name) throws Exception {
        try (InputStream in = context.getAssets().open(name)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[16 * 1024];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
            return out.toByteArray();
        }
    }

    private static byte[] concat(byte[] first, byte[] second) {
        byte[] result = new byte[first.length + second.length];
        System.arraycopy(first, 0, result, 0, first.length);
        System.arraycopy(second, 0, result, first.length, second.length);
        return result;
    }
}
