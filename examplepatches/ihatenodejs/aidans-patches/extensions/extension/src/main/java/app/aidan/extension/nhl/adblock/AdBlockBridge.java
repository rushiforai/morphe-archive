package app.aidan.extension.nhl.adblock;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Bytecode hook bridge for NHL WebViews.
 * Intercepts network requests and injects cosmetic filters into article WebViews.
 */
public final class AdBlockBridge {
    private static final String TAG = "AidanAdBlockBridge";

    private static final Map<WebView, DocumentContext> sContextMap =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Handler sMainHandler = new Handler(Looper.getMainLooper());
    private static volatile String sBundledContentScript = null;

    private static final class DocumentContext {
        volatile String url = "";
        volatile String host = "";
        volatile boolean isNhlDocument = false;
        volatile boolean isExcluded = false;
        volatile long generation = 0L;
    }

    private AdBlockBridge() {}

    /**
     * Attaches to an NHL-owned WebView during creation in Li9l / Ltv7.
     */
    public static void attach(WebView webView) {
        if (webView == null) return;
        try {
            AdBlockStore store = AdBlockStore.get(webView.getContext());
            RuleRepository repo = RuleRepository.get(webView.getContext());
            repo.ensureInitialized();

            DocumentContext ctx = new DocumentContext();
            sContextMap.put(webView, ctx);
        } catch (Exception e) {
            Log.w(TAG, "Failed to attach AdBlockBridge to WebView", e);
        }
    }

    /**
     * Modern shouldInterceptRequest override for Lkhd.
     */
    public static WebResourceResponse intercept(WebView view, WebResourceRequest request) {
        if (view == null || request == null) return null;
        Uri uri = request.getUrl();
        if (uri == null) return null;

        String reqUrl = uri.toString();
        String scheme = uri.getScheme();
        if (scheme == null || (!scheme.equalsIgnoreCase("http") && !scheme.equalsIgnoreCase("https"))) {
            return null; // Skip non-HTTP(S)
        }

        try {
            AdBlockStore store = AdBlockStore.get(view.getContext());
            if (!store.isProtectionEnabled() || !store.isEnabled()) return null;
            DocumentContext ctx = sContextMap.get(view);
            String docUrl = ctx != null ? ctx.url : "";
            String docHost = ctx != null ? ctx.host : "";

            // Scope default blocking to NHL website documents (nhl.com and subdomains)
            if (ctx != null && !ctx.isNhlDocument) {
                return null;
            }

            if (store.isSiteExcluded(docHost)) {
                return null;
            }

            RuleRepository repo = RuleRepository.get(view.getContext());
            long handle = repo.getActiveEngineHandle();
            if (handle == 0L) {
                return null;
            }

            String method = request.getMethod() != null ? request.getMethod() : "GET";
            String resType;
            if (request.isForMainFrame()) {
                resType = "main_frame";
            } else {
                String dest = null;
                Map<String, String> headers = request.getRequestHeaders();
                if (headers != null) {
                    for (Map.Entry<String, String> entry : headers.entrySet()) {
                        if ("sec-fetch-dest".equalsIgnoreCase(entry.getKey())) {
                            dest = entry.getValue();
                            break;
                        }
                    }
                }
                resType = mapDestinationToResourceType(dest);
            }
            int match = NativeEngine.match(handle, reqUrl, docUrl, resType, method);
            if (match == 1) {
                store.recordCheck(true);
                store.recordBlockedRequest(docUrl, reqUrl, resType);
                return createEmptyBlockResponse();
            } else {
                store.recordCheck(false);
                return null;
            }
        } catch (Exception e) {
            Log.w(TAG, "Interception error for " + reqUrl, e);
            return null;
        }
    }

    /**
     * Legacy shouldInterceptRequest override for Lkhd.
     */
    public static WebResourceResponse interceptLegacy(WebView view, String url) {
        if (view == null || url == null) return null;
        if (!url.startsWith("http://") && !url.startsWith("https://")) {
            return null;
        }

        try {
            AdBlockStore store = AdBlockStore.get(view.getContext());
            if (!store.isProtectionEnabled() || !store.isEnabled()) return null;
            DocumentContext ctx = sContextMap.get(view);
            String docUrl = ctx != null ? ctx.url : "";
            String docHost = ctx != null ? ctx.host : "";

            if (ctx != null && !ctx.isNhlDocument) return null;
            if (store.isSiteExcluded(docHost)) return null;

            RuleRepository repo = RuleRepository.get(view.getContext());
            long handle = repo.getActiveEngineHandle();
            if (handle == 0L) return null;

            int match = NativeEngine.match(handle, url, docUrl, "other", "GET");
            if (match == 1) {
                store.recordCheck(true);
                store.recordBlockedRequest(docUrl, url, "other");
                return createEmptyBlockResponse();
            } else {
                store.recordCheck(false);
                return null;
            }
        } catch (Exception e) {
            return null;
        }
    }

    private static String mapDestinationToResourceType(String dest) {
        if (dest == null) return "other";
        switch (dest.toLowerCase(Locale.ROOT)) {
            case "document":
                return "main_frame";
            case "iframe":
            case "frame":
                return "subdocument";
            case "style":
                return "stylesheet";
            case "script":
            case "worker":
            case "sharedworker":
            case "serviceworker":
            case "audioworklet":
            case "paintworklet":
                return "script";
            case "image":
                return "image";
            case "font":
                return "font";
            case "video":
            case "audio":
            case "track":
                return "media";
            case "object":
            case "embed":
                return "object";
            case "report":
                return "csp_report";
            case "empty":
                return "xmlhttprequest";
            default:
                return "other";
        }
    }

    /**
     * Injected into Lkhd.onPageStarted.
     */
    public static void onPageStarted(WebView view, String url) {
        if (view == null || url == null) return;
        try {
            DocumentContext ctx = sContextMap.get(view);
            if (ctx == null) {
                ctx = new DocumentContext();
                sContextMap.put(view, ctx);
            }

            ctx.url = url;
            Uri uri = Uri.parse(url);
            String host = uri.getHost() != null ? uri.getHost().toLowerCase() : "";
            ctx.host = host;
            ctx.isNhlDocument = host.endsWith("nhl.com") || host.endsWith("nhle.com");

            AdBlockStore store = AdBlockStore.get(view.getContext());
            ctx.isExcluded = store.isSiteExcluded(host);
            if (store.isProtectionEnabled() && store.isCosmeticFiltering() && ctx.isNhlDocument && !ctx.isExcluded) {
                injectCosmetics(view, url);
            }
        } catch (Exception e) {
            Log.w(TAG, "onPageStarted error", e);
        }
    }

    /**
     * Injected into Lkhd.onPageFinished.
     */
    public static void onPageFinished(WebView view, String url) {
        if (view == null || url == null) return;
        try {
            AdBlockStore store = AdBlockStore.get(view.getContext());
            DocumentContext ctx = sContextMap.get(view);
            if (ctx != null && store.isProtectionEnabled() && store.isCosmeticFiltering() && ctx.isNhlDocument && !ctx.isExcluded) {
                injectCosmetics(view, url);
            }
        } catch (Exception ignored) {}
    }

    /**
     * Article loadUrl gate: replaces direct WebView.loadUrl(url, headers) calls in Lowk / Ltv7.
     */
    public static void load(WebView view, String url, Map<String, String> headers) {
        if (view == null) return;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            performLoad(view, url, headers);
        } else {
            sMainHandler.post(() -> performLoad(view, url, headers));
        }
    }

    private static void performLoad(WebView view, String url, Map<String, String> headers) {
        try {
            DocumentContext ctx = sContextMap.get(view);
            if (ctx == null) {
                attach(view);
            }
            if (headers != null) {
                view.loadUrl(url, headers);
            } else {
                view.loadUrl(url);
            }
        } catch (Exception e) {
            Log.e(TAG, "Failed to load URL in WebView", e);
        }
    }

    private static void injectCosmetics(WebView view, String documentUrl) {
        sMainHandler.post(() -> {
            try {
                AdBlockStore store = AdBlockStore.get(view.getContext());
                DocumentContext ctx = sContextMap.get(view);
                if (ctx == null || !store.isProtectionEnabled() || !store.isCosmeticFiltering() || !ctx.isNhlDocument || store.isSiteExcluded(ctx.host)) {
                    return;
                }

                // 1. Injected bundled content script
                ensureBundledScriptLoaded(view);
                if (sBundledContentScript != null) {
                    view.evaluateJavascript(sBundledContentScript, null);
                }
                // 2. Fetch domain-specific cosmetic CSS from active native engine
                RuleRepository repo = RuleRepository.get(view.getContext());
                long handle = repo.getActiveEngineHandle();
                if (handle != 0L) {
                    String json = NativeEngine.cosmetics(handle, documentUrl);
                    if (json != null && !json.isEmpty()) {
                        String js = "if (window.__aidanAdBlockUpdateGenericCss) { "
                                + "try { "
                                + "var res = " + json + "; "
                                + "if (res.hideSelectors && res.hideSelectors.length > 0) { "
                                + "  window.__aidanAdBlockUpdateGenericCss(res.hideSelectors.join(',\\n') + ' { display: none !important; }'); "
                                + "} "
                                + "} catch(e){} }";
                        view.evaluateJavascript(js, null);
                    }
                }
            } catch (Exception e) {
                Log.w(TAG, "Failed to inject cosmetics into WebView", e);
            }
        });
    }
    /**
     * Refreshes protection state across all currently attached active WebViews.
     * Injects cosmetics if eligible, or triggers teardown if protection is paused or disabled.
     */
    public static void refreshProtection() {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            performRefreshProtection();
        } else {
            sMainHandler.post(AdBlockBridge::performRefreshProtection);
        }
    }

    private static void performRefreshProtection() {
        try {
            for (Map.Entry<WebView, DocumentContext> entry : sContextMap.entrySet()) {
                WebView view = entry.getKey();
                DocumentContext ctx = entry.getValue();
                if (view == null || ctx == null) continue;

                AdBlockStore store = AdBlockStore.get(view.getContext());
                boolean eligible = store.isProtectionEnabled() && store.isCosmeticFiltering()
                        && ctx.isNhlDocument && !store.isSiteExcluded(ctx.host);

                if (eligible) {
                    injectCosmetics(view, ctx.url);
                } else {
                    view.evaluateJavascript("if (window.__aidanAdBlockDisable) { window.__aidanAdBlockDisable(); }", null);
                }
            }
        } catch (Exception e) {
            Log.w(TAG, "Failed to refresh protection across WebViews", e);
        }
    }


    private static void ensureBundledScriptLoaded(WebView view) {
        if (sBundledContentScript != null) return;
        try {
            InputStream is = null;
            try {
                is = view.getContext().getAssets().open("aidan/nhl/adblock/content.js");
            } catch (Exception ignored) {
                is = AdBlockBridge.class.getResourceAsStream("/nhl/adblock/content.js");
            }
            if (is != null) {
                byte[] bytes = new byte[is.available()];
                is.read(bytes);
                is.close();
                sBundledContentScript = new String(bytes, StandardCharsets.UTF_8);
            }
        } catch (Exception e) {
            Log.w(TAG, "Failed to load bundled content.js", e);
        }
    }

    private static WebResourceResponse createEmptyBlockResponse() {
        return new WebResourceResponse(
                "text/plain",
                "UTF-8",
                204,
                "No Content",
                Collections.emptyMap(),
                new ByteArrayInputStream(new byte[0])
        );
    }
}
