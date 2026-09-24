package app.template.extension;

import android.annotation.SuppressLint;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;

import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

/**
 * Injected into the app's WebViewClient onPageStarted (A5.k1):
 *
 *  - hookWebView: strips the `capture` attribute from file inputs so the file
 *    picker doesn't force the camera.
 *  - injectCharityFramework: runs the Charity Framework Bplace bundle on
 *    framework pages (bplace.art / localhost) and installs
 *    window.charityNative, a synchronous CORS-free fetch bridge.
 */
public class ScriptHook {
    private static final String FIX_SCRIPT =
        "(function(){" +
        "if(window.__bplaceFileInputFixInstalled){return;}" +
        "window.__bplaceFileInputFixInstalled=true;" +
        "var stripCapture=function(){" +
        "  document.querySelectorAll('input[type=\"file\"][capture]').forEach(function(el){" +
        "    el.removeAttribute('capture');" +
        "  });" +
        "};" +
        "var install=function(){" +
        "  stripCapture();" +
        "  if(document.documentElement&&!window.__bplaceFileInputFixObserver){" +
        "    window.__bplaceFileInputFixObserver=new MutationObserver(stripCapture);" +
        "    window.__bplaceFileInputFixObserver.observe(document.documentElement," +
        "      {childList:true,subtree:true,attributes:true,attributeFilter:['capture']});" +
        "  }" +
        "};" +
        "if(document.documentElement){install();}" +
        "else{document.addEventListener('readystatechange',install,{once:true});" +
        "     document.addEventListener('DOMContentLoaded',install,{once:true});}" +
        "})();";

    // Idempotency guard: onPageStarted can fire more than once for a page, and
    // evaluating the bundle twice would double-run the framework. A fresh
    // document resets the flag, so one inject per page load is enough.
    private static final String FRAMEWORK_GUARD_PRE =
        "(function(){if(window.__charityFrameworkInjected){return;}window.__charityFrameworkInjected=true;";
    private static final String FRAMEWORK_GUARD_POST = "})();";

    private static String frameworkScript;

    private static String frameworkScript() {
        String cached = frameworkScript;
        if (cached == null) {
            cached = FRAMEWORK_GUARD_PRE + "\n" +
                CharityScriptAssets.BUNDLE + "\n" +
                FRAMEWORK_GUARD_POST;
            frameworkScript = cached;
        }
        return cached;
    }

    public static void hookWebView(WebView view) {
        view.evaluateJavascript(FIX_SCRIPT, null);
    }

    public static void injectCharityFramework(WebView view) {
        if (!isFrameworkUrl(view.getUrl())) return;
        view.addJavascriptInterface(new CharityBridge(), "charityNative");
        view.evaluateJavascript(frameworkScript(), null);
    }

    private static boolean isFrameworkUrl(String url) {
        if (url == null) return false;
        try {
            String host = new URL(url).getHost();
            if (host == null) return false;
            String h = host.toLowerCase(Locale.US);
            return h.equals("bplace.art")
                || h.endsWith(".bplace.art")
                || h.equals("localhost")
                || h.equals("127.0.0.1");
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * window.charityNative.fetch(method, url, headersJson, body, anonymous, timeoutMs, responseType)
     *
     * Synchronous mirror of GM.xmlHttpRequest used by the framework's mobile
     * GM shim. It is not subject to CORS and returns a JSON envelope:
     *   {"status":..., "statusText":..., "responseHeaders":..., "responseText":...,
     *    "finalUrl":..., "total":...}
     *   {"timedout":true}
     *   {"error":{"statusText":...}}
     */
    @SuppressLint("DefaultLocale")
    public static class CharityBridge {
        @JavascriptInterface
        public String fetch(String method, String url, String headersJson, String body,
                            boolean anonymous, long timeout, String responseType) {
            HttpURLConnection conn = null;
            try {
                String scheme = new URL(url).getProtocol();
                if (!"http".equalsIgnoreCase(scheme) && !"https".equalsIgnoreCase(scheme)) {
                    return errorEnvelope("unsupported scheme: " + scheme);
                }

                int ms = timeout > 0 && timeout <= Integer.MAX_VALUE ? (int) timeout : 0;
                conn = (HttpURLConnection) new URL(url).openConnection();
                conn.setRequestMethod(method == null || method.isEmpty() ? "GET" : method.toUpperCase(Locale.US));
                if (ms > 0) {
                    conn.setConnectTimeout(ms);
                    conn.setReadTimeout(ms);
                }
                if (headersJson != null && !headersJson.isEmpty()) {
                    JSONObject headers = new JSONObject(headersJson);
                    Iterator<String> keys = headers.keys();
                    while (keys.hasNext()) {
                        String key = keys.next();
                        conn.setRequestProperty(key, headers.getString(key));
                    }
                }
                if (body != null && !body.isEmpty()) {
                    conn.setDoOutput(true);
                    byte[] data = body.getBytes(StandardCharsets.UTF_8);
                    conn.setFixedLengthStreamingMode(data.length);
                    OutputStream out = conn.getOutputStream();
                    try {
                        out.write(data);
                    } finally {
                        out.close();
                    }
                }

                int status = conn.getResponseCode();
                InputStream in = status >= 400 ? conn.getErrorStream() : conn.getInputStream();
                String text = readAll(in);

                JSONObject envelope = new JSONObject();
                envelope.put("status", status);
                envelope.put("statusText", safe(conn.getResponseMessage()));
                envelope.put("responseHeaders", headersToString(conn));
                envelope.put("responseText", text == null ? "" : text);
                envelope.put("finalUrl", safe(conn.getURL()));
                envelope.put("total", text == null ? 0 : text.length());
                return envelope.toString();
            } catch (SocketTimeoutException e) {
                return "{\"timedout\":true}";
            } catch (Exception e) {
                return errorEnvelope(String.valueOf(e.getMessage()));
            } finally {
                if (conn != null) conn.disconnect();
            }
        }

        private static String errorEnvelope(String message) {
            return "{\"error\":{\"statusText\":\""
                + String.valueOf(message).replace("\\", "\\\\").replace("\"", "\\\"")
                + "\"}}";
        }

        private static String safe(String s) {
            return s == null ? "" : s;
        }

        private static String safe(URL u) {
            return u == null ? "" : u.toString();
        }

        private static String headersToString(HttpURLConnection conn) {
            StringBuilder sb = new StringBuilder();
            Map<String, java.util.List<String>> fields = conn.getHeaderFields();
            if (fields != null) {
                for (Map.Entry<String, java.util.List<String>> entry : fields.entrySet()) {
                    String key = entry.getKey();
                    if (key == null) continue;
                    for (String value : entry.getValue()) {
                        if (value == null) continue;
                        if (sb.length() > 0) sb.append("\r\n");
                        sb.append(key).append(": ").append(value);
                    }
                }
            }
            return sb.toString();
        }

        private static String readAll(InputStream in) throws IOException {
            if (in == null) return "";
            java.io.ByteArrayOutputStream buffer = new java.io.ByteArrayOutputStream();
            byte[] chunk = new byte[8192];
            int read;
            while ((read = in.read(chunk)) != -1) {
                buffer.write(chunk, 0, read);
            }
            in.close();
            return new String(buffer.toByteArray(), StandardCharsets.UTF_8);
        }
    }
}