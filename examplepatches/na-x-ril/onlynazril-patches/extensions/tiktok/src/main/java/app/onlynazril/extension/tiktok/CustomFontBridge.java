package app.onlynazril.extension.tiktok;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.util.Base64;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import app.onlynazril.extension.tiktok.internal.Debug;
import app.onlynazril.extension.tiktok.internal.RestartPrompt;
import app.onlynazril.extension.tiktok.settings.CustomFontSettings;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.util.Locale;
import java.util.Map;

/**
 * The custom-font patch's hooks.
 *
 * Every engine the app draws text with asks for a face of its own
 * somewhere else: the native factory and the Compose loader are asked
 * for a face outright, Lynx reads the bundled files through the app's
 * asset loader, and a hybrid (H5) page is served font bytes over the
 * WebView client. This class answers each of them with the imported
 * file while the switch says so, and answers nothing otherwise, so the
 * app's own resolution runs as it always did.
 *
 * The factory's callers ask for faces by weight (bold, medium), which
 * one file cannot carry, so a heavier style draws in the file's own
 * face. Nothing here measures text: the app keeps its own metrics, and
 * only the face changes.
 *
 * The picker rides on the foundation activity's onActivityResult, which
 * every activity result in the app passes through. Only the picker's own
 * request code is kept, and only a result that carries a file is
 * imported.
 */
public final class CustomFontBridge {
    private static final int LOG_CAP = 8;

    /** The picker's request code: high enough that the app's own codes never reach it. */
    public static final int REQUEST_PICK_FONT = 0x4F4E54;

    private static int logged;
    private static int pagesLogged;
    private static String cachedScript;
    private static String cachedKey;

    private CustomFontBridge() {}

    /** The face every resolver draws with, or null to keep the app's own. */
    public static Typeface typeface() {
        return serve();
    }

    /**
     * The face for one bundled asset path, or null for anything else.
     *
     * The app's own asset loader is handed every asset font it reads, so the path
     * is checked first: only the faces TikTok bundles are answered, and a Lynx
     * page's or a sticker's own asset font keeps the app's resolution.
     */
    public static Typeface typefaceFor(String path) {
        if (!CustomFontSettings.isBundledFace(path)) return null;
        return serve();
    }

    /**
     * A page's font request, answered with the imported file. Any other
     * request answers null, so the app's own WebView client handles it as
     * it always did.
     */
    public static WebResourceResponse webFont(WebView view, WebResourceRequest request) {
        if (request == null) return null;
        Uri url = request.getUrl();
        return webFontResponse(url == null ? null : url.toString(), request.getRequestHeaders());
    }

    /** The deprecated WebView overload: the request is the URL itself. */
    public static WebResourceResponse webFont(WebView view, String url) {
        return webFontResponse(url, null);
    }

    private static WebResourceResponse webFontResponse(String url, Map<String, String> headers) {
        try {
            if (!isFontRequest(url, headers)) return null;
            File file = CustomFontSettings.selectedFile();
            if (file == null) return null;
            report("customfont: font served to a page");
            return new WebResourceResponse(mime(file), "", new FileInputStream(file));
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Gives a finished page the imported face.
     *
     * The interceptor only replaces bytes for a font the page already asks for; a hybrid page that
     * never asks for one kept its own fonts. Here the face is carried in as a data URI and applied
     * with a stylesheet, so the page does not have to request anything.
     */
    public static void onPageFinished(WebView view, String url) {
        try {
            if (view == null) return;
            File file = CustomFontSettings.selectedFile();
            if (file == null) return;
            String script = script(file);
            if (script == null) return;
            view.post(() -> {
                try {
                    view.evaluateJavascript(script, null);
                    reportPage("customfont: page font injected");
                } catch (Throwable t) {
                    reportPage("customfont: page injection failed (" + t + ")");
                }
            });
        } catch (Throwable t) {
            reportPage("customfont: page injection failed (" + t + ")");
        }
    }

    /** The injection script, rebuilt only when the chosen file changes. */
    private static synchronized String script(File file) {
        String key = file.getAbsolutePath() + "|" + file.lastModified() + "|" + file.length();
        if (key.equals(cachedKey) && cachedScript != null) return cachedScript;
        try {
            byte[] bytes = read(file);
            if (bytes == null || bytes.length == 0) return null;
            String data = Base64.encodeToString(bytes, Base64.NO_WRAP);
            String source = "url(data:" + mime(file) + ";base64," + data + ") format('" + format(file) + "')";
            String css = "@font-face{font-family:'MorpheFont';src:" + source + ";font-display:swap}"
                    + "body,p,span,div,a,button,input,textarea,select,li,h1,h2,h3,h4,h5,h6,"
                    + "label,td,th,strong,em,small{font-family:'MorpheFont',sans-serif!important}";
            String js = "(function(){function go(){"
                    + "if(document.getElementById('morphe-font'))return;"
                    + "var s=document.createElement('style');s.id='morphe-font';s.textContent="
                    + JSONObject.quote(css)
                    + ";(document.head||document.documentElement).appendChild(s);}"
                    + "if(document.readyState==='loading'){"
                    + "document.addEventListener('DOMContentLoaded',go);}else{go();}})();";
            cachedKey = key;
            cachedScript = js;
            return js;
        } catch (Throwable t) {
            report("customfont: page font failed (" + t + ")");
            return null;
        }
    }

    private static byte[] read(File file) throws Exception {
        FileInputStream in = new FileInputStream(file);
        try {
            byte[] out = new byte[(int) file.length()];
            int offset = 0;
            while (offset < out.length) {
                int count = in.read(out, offset, out.length - offset);
                if (count < 0) break;
                offset += count;
            }
            return out;
        } finally {
            in.close();
        }
    }

    private static String mime(File file) {
        String name = file.getName().toLowerCase(Locale.ROOT);
        if (name.endsWith(".woff2")) return "font/woff2";
        if (name.endsWith(".woff")) return "font/woff";
        if (name.endsWith(".ttf")) return "font/ttf";
        return "font/otf";
    }

    private static String format(File file) {
        String name = file.getName().toLowerCase(Locale.ROOT);
        if (name.endsWith(".woff2")) return "woff2";
        if (name.endsWith(".woff")) return "woff";
        if (name.endsWith(".ttf")) return "truetype";
        return "opentype";
    }

    /**
     * Whether the request is one the app's own font interceptor would answer: a
     * font URL, a font content type, or one of the named font endpoints a page's
     * CSS asks for. Kept to those, so a request that is not a font is never
     * answered here.
     */
    private static boolean isFontRequest(String url, Map<String, String> headers) {
        if (headers != null) {
            for (Map.Entry<String, String> header : headers.entrySet()) {
                if (header.getKey() == null || header.getValue() == null) continue;
                if (!"content-type".equalsIgnoreCase(header.getKey())) continue;
                if (header.getValue().toLowerCase(Locale.ROOT).contains("font")) return true;
            }
        }
        if (url == null) return false;
        String lower = url.toLowerCase(Locale.ROOT);
        return lower.contains(".woff")
                || lower.contains(".woff2")
                || lower.contains(".otf")
                || lower.contains("_default_font")
                || lower.contains("tiktokvffont")
                || lower.contains("tiktoksans-vf");
    }

    /** The imported face, or null while the switch is off or nothing is picked. */
    private static Typeface serve() {
        try {
            Typeface font = CustomFontSettings.typeface();
            if (font == null) return null;
            report("customfont: font served");
            return font;
        } catch (Throwable t) {
            report("customfont: font lookup failed (" + t + ")");
            return null;
        }
    }

    /**
     * The foundation activity's result delivery, hooked at its entry.
     *
     * A picked font is copied into the app's own files before the
     * prompt asks for the restart the already-laid-out text needs;
     * anything else falls through untouched.
     */
    public static void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        try {
            if (requestCode != REQUEST_PICK_FONT) return;
            if (resultCode != Activity.RESULT_OK || data == null) return;
            Uri uri = data.getData();
            if (uri == null) return;
            boolean imported = CustomFontSettings.importFont(activity, uri);
            report("customfont: import " + (imported ? "succeeded" : "failed"));
            if (imported) RestartPrompt.askNow(activity);
        } catch (Throwable t) {
            report("customfont: import handling failed (" + t + ")");
        }
    }

    private static void report(String message) {
        if (logged++ < LOG_CAP) Debug.print(message);
    }

    /**
     * The page injection has its own cap: the face resolvers log first and would otherwise use up
     * the shared one before a page has even finished loading.
     */
    private static void reportPage(String message) {
        if (pagesLogged++ < LOG_CAP) Debug.print(message);
    }
}
