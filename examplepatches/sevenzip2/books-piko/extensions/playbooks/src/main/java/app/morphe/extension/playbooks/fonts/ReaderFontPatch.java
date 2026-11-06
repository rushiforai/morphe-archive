package app.morphe.extension.playbooks.fonts;

import android.content.Context;
import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

/**
 * Hooked into the reader WebViewClient's shouldInterceptRequest. The reader requests
 * {@code http://<volume>.localhost/fonts/<file>} for every @font-face it declares and loads its
 * engine from {@code http://<volume>.localhost/assets/compiled.js}.
 */
@SuppressWarnings("unused")
public final class ReaderFontPatch {
    private static final String TAG = FontStore.TAG;
    private static final String FONTS_PATH = "/fonts/";
    private static final String ENGINE_PATH = "/assets/compiled.js";
    private static final String ENGINE_ASSET = "compiled.js";
    private static final Charset UTF_8 = Charset.forName("UTF-8");

    private static final Object CACHE_LOCK = new Object();
    private static String cachedSignature;
    private static byte[] cachedEngine;

    private ReaderFontPatch() {
    }

    /**
     * @return A response to serve instead of the original one, or null to continue normally.
     */
    public static WebResourceResponse interceptRequest(WebView view, String url) {
        if (view == null || url == null || !url.contains(".localhost/")) return null;

        try {
            Uri uri = Uri.parse(url);
            String host = uri.getHost();
            String path = uri.getPath();
            if (host == null || path == null || !host.endsWith(".localhost")) return null;

            boolean isFont = path.startsWith(FONTS_PATH);
            boolean isEngine = path.equals(ENGINE_PATH);
            if (!isFont && !isEngine) return null;

            Context context = view.getContext();
            FontStore store = FontStore.get(context);
            if (!store.isActive()) {
                if (isEngine) Log.i(TAG, "Custom reader font inactive (disabled or no font picked)");
                return null;
            }

            return isFont
                    ? fontResponse(store, path.substring(FONTS_PATH.length()))
                    : engineResponse(context, store.config());
        } catch (Throwable throwable) {
            Log.e(TAG, "Reader font interception failed for " + url, throwable);
            return null;
        }
    }

    static void invalidateCache() {
        synchronized (CACHE_LOCK) {
            cachedSignature = null;
            cachedEngine = null;
        }
    }

    private static WebResourceResponse fontResponse(FontStore store, String fileName) throws IOException {
        FontConfig config = store.config();
        if (!config.replaces(fileName)) return null;

        FontVariant variant = FontVariant.ofFileName(fileName);
        Log.i(TAG, "Serving custom font (" + variant.key + ") for " + fileName);
        InputStream input = new BufferedInputStream(store.open(variant));
        String mimeType = FontFiles.detectMimeType(FontFiles.peekHeader(input));
        if (mimeType == null) mimeType = "font/ttf";

        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Access-Control-Allow-Origin", "*");
        headers.put("Cache-Control", "no-store");
        return new WebResourceResponse(mimeType, null, 200, "OK", headers, input);
    }

    private static WebResourceResponse engineResponse(Context context, FontConfig config) throws IOException {
        byte[] engine;
        synchronized (CACHE_LOCK) {
            String signature = config.signature();
            if (!signature.equals(cachedSignature) || cachedEngine == null) {
                String original = new String(readAsset(context, ENGINE_ASSET), UTF_8);
                CompiledJsRewriter.Result result = CompiledJsRewriter.rewrite(original, config);
                cachedEngine = result.js.getBytes(UTF_8);
                cachedSignature = signature;
                Log.i(TAG, "Reader engine rewritten: " + result.summary + " (" + signature + ")");
            }
            engine = cachedEngine;
        }
        return new WebResourceResponse("text/javascript", "utf-8", new ByteArrayInputStream(engine));
    }

    private static byte[] readAsset(Context context, String name) throws IOException {
        InputStream input = context.getAssets().open(name);
        try {
            ByteArrayOutputStream output = new ByteArrayOutputStream(256 * 1024);
            byte[] buffer = new byte[16 * 1024];
            int read;
            while ((read = input.read(buffer)) != -1) {
                output.write(buffer, 0, read);
            }
            return output.toByteArray();
        } finally {
            input.close();
        }
    }
}
