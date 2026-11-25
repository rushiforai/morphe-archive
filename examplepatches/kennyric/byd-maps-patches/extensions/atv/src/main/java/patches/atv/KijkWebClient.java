package patches.atv;

import android.graphics.Bitmap;
import android.net.http.SslError;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.webkit.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.zip.GZIPInputStream;

/** Scoped interception in front of the publisher's unchanged client. */
public final class KijkWebClient extends WebViewClient {
    public static boolean ads;
    public static boolean tracking;
    private static final String TAG = "Morphe-KIJK-ATV";
    private final WebViewClient original;

    private KijkWebClient(WebViewClient original) { this.original = original; }
    public static WebViewClient wrap(WebViewClient original) { return new KijkWebClient(original); }

    private static WebResourceResponse response(String mime, int status, String reason, String body) {
        Map<String, String> headers = new HashMap<>();
        headers.put("Access-Control-Allow-Origin", "*");
        headers.put("Cache-Control", "no-store");
        return new WebResourceResponse(mime, "utf-8", status, reason, headers,
                new ByteArrayInputStream(body.getBytes(StandardCharsets.UTF_8)));
    }

    @Override public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
        String url = request.getUrl().toString();
        int action = KijkPolicy.action(url, ads, tracking);
        if (action != 0) {
            // Do not log token-bearing request URLs or measurement payloads.
            Log.i(TAG, action == 1 ? "omitted FreeWheel ad decision" : "omitted optional measurement request");
            if (action == 1) return response("application/xml", 200, "OK",
                    "<?xml version=\"1.0\"?><vmap:VMAP xmlns:vmap=\"http://www.iab.net/videosuite/vmap\" version=\"1.0\"/>");
            return response(action == 2 ? "application/javascript" : "text/plain",
                    action == 2 ? 200 : 204, action == 2 ? "OK" : "No Content", "");
        }
        if ((ads || tracking) && "GET".equals(request.getMethod()) &&
                (KijkPolicy.isDocument(url) || (ads && KijkPolicy.isPlayerScript(url)))) {
            WebResourceResponse rewritten = rewrite(request);
            if (rewritten != null) return rewritten;
        }
        return original.shouldInterceptRequest(view, request);
    }

    private static WebResourceResponse rewrite(WebResourceRequest request) {
        HttpURLConnection connection = null;
        try {
            String url = request.getUrl().toString();
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(12000);
            connection.setInstanceFollowRedirects(false);
            for (Map.Entry<String, String> header : request.getRequestHeaders().entrySet()) {
                String name = header.getKey();
                if (!name.equalsIgnoreCase("Accept-Encoding") && !name.equalsIgnoreCase("Range") &&
                        !name.equalsIgnoreCase("If-None-Match") && !name.equalsIgnoreCase("If-Modified-Since"))
                    connection.setRequestProperty(name, header.getValue());
            }
            connection.setRequestProperty("Accept-Encoding", "identity");
            String cookies = CookieManager.getInstance().getCookie(url);
            if (cookies != null) connection.setRequestProperty("Cookie", cookies);
            if (connection.getResponseCode() != 200) return null;
            String contentType = connection.getContentType();
            boolean document = KijkPolicy.isDocument(url);
            if (contentType == null || (document ? !contentType.contains("text/html") :
                    !(contentType.contains("javascript") || contentType.contains("text/plain")))) return null;
            InputStream input = connection.getInputStream();
            if ("gzip".equalsIgnoreCase(connection.getContentEncoding())) input = new GZIPInputStream(input);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try (InputStream stream = input) {
                byte[] block = new byte[16384]; int size;
                while ((size = stream.read(block)) != -1) {
                    if (bytes.size() + size > 8 * 1024 * 1024) throw new IOException("Frontend exceeds rewrite limit");
                    bytes.write(block, 0, size);
                }
            }
            String source = new String(bytes.toByteArray(), StandardCharsets.UTF_8);
            String result = document ? KijkPolicy.rewriteHtml(source, ads, tracking) :
                    KijkPolicy.rewriteScript(url, source, ads, tracking);
            if (result.equals(source)) {
                Log.w(TAG, "unrecognized frontend layout; original response retained");
            } else Log.i(TAG, document ? "early privacy/ad bootstrap installed" : "client ad schedule attachment disabled");
            Map<String, String> headers = new HashMap<>();
            for (Map.Entry<String, List<String>> header : connection.getHeaderFields().entrySet()) {
                String name = header.getKey();
                if (name == null || name.equalsIgnoreCase("Content-Length") || name.equalsIgnoreCase("Content-Encoding") ||
                        name.equalsIgnoreCase("Transfer-Encoding") || name.equalsIgnoreCase("Cache-Control")) continue;
                if (name.equalsIgnoreCase("Set-Cookie")) {
                    for (String cookie : header.getValue()) CookieManager.getInstance().setCookie(url, cookie);
                } else headers.put(name, String.join(", ", header.getValue()));
            }
            headers.put("Cache-Control", "no-store");
            return new WebResourceResponse(document ? "text/html" : "application/javascript", "utf-8", 200, "OK", headers,
                    new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception error) {
            Log.w(TAG, "frontend interception unavailable: " + error.getClass().getSimpleName());
            return null;
        } finally { if (connection != null) connection.disconnect(); }
    }

    // KIJK's bridge initialization in onPageFinished remains the publisher's own code.
    @Override public void onPageFinished(WebView v, String u) { original.onPageFinished(v, u); }
    @Override public void onPageStarted(WebView v, String u, Bitmap b) { original.onPageStarted(v, u, b); }
    @Override public void onLoadResource(WebView v, String u) { original.onLoadResource(v, u); }
    @Override public void doUpdateVisitedHistory(WebView v, String u, boolean r) { original.doUpdateVisitedHistory(v, u, r); }
    @Override public boolean shouldOverrideUrlLoading(WebView v, WebResourceRequest r) { return original.shouldOverrideUrlLoading(v, r); }
    @SuppressWarnings("deprecation") @Override public boolean shouldOverrideUrlLoading(WebView v, String u) { return original.shouldOverrideUrlLoading(v, u); }
    @SuppressWarnings("deprecation") @Override public WebResourceResponse shouldInterceptRequest(WebView v, String u) { return original.shouldInterceptRequest(v, u); }
    @Override public void onReceivedError(WebView v, WebResourceRequest r, WebResourceError e) { original.onReceivedError(v, r, e); }
    @SuppressWarnings("deprecation") @Override public void onReceivedError(WebView v, int e, String d, String u) { original.onReceivedError(v, e, d, u); }
    @Override public void onReceivedHttpError(WebView v, WebResourceRequest r, WebResourceResponse e) { original.onReceivedHttpError(v, r, e); }
    @Override public void onReceivedSslError(WebView v, SslErrorHandler h, SslError e) { original.onReceivedSslError(v, h, e); }
    @Override public void onReceivedClientCertRequest(WebView v, ClientCertRequest r) { original.onReceivedClientCertRequest(v, r); }
    @Override public void onReceivedHttpAuthRequest(WebView v, HttpAuthHandler h, String host, String realm) { original.onReceivedHttpAuthRequest(v, h, host, realm); }
    @Override public boolean onRenderProcessGone(WebView v, RenderProcessGoneDetail d) { return original.onRenderProcessGone(v, d); }
    @Override public boolean shouldOverrideKeyEvent(WebView v, KeyEvent e) { return original.shouldOverrideKeyEvent(v, e); }
    @Override public void onUnhandledKeyEvent(WebView v, KeyEvent e) { original.onUnhandledKeyEvent(v, e); }
    @Override public void onFormResubmission(WebView v, Message no, Message yes) { original.onFormResubmission(v, no, yes); }
    @Override public void onScaleChanged(WebView v, float old, float scale) { original.onScaleChanged(v, old, scale); }
}
