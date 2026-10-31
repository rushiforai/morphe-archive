package com.fyber.inneractive.sdk.flow.storepromo.controller.webview;

import android.net.Uri;
import android.text.TextUtils;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.r;
import com.fyber.inneractive.sdk.config.v;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h0;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class b extends WebViewClient {

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f28308c = {"https://fonts.googleapis.com", "https://fonts.googleapis.com"};

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a f28309a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a f28310b;

    public b(com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a aVar, com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a aVar2) {
        this.f28309a = aVar;
        this.f28310b = aVar2;
    }

    public final void a(String str, RenderProcessGoneDetail renderProcessGoneDetail) {
        String strValueOf = renderProcessGoneDetail != null ? String.valueOf(renderProcessGoneDetail.didCrash()) : "unknown";
        IAlog.a("%s: onRenderProcessGone: handled, webview crashed: %s view: %s", "StorePromoWebviewClient", strValueOf, str);
        String str2 = "Webview did crash: " + strValueOf + " on webview: " + str;
        com.fyber.inneractive.sdk.network.events.b bVar = com.fyber.inneractive.sdk.network.events.b.WEB_VIEW_CRASH_ERROR;
        com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a aVar = this.f28310b;
        if (aVar != null) {
            aVar.a(bVar, str2, null);
        }
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) {
        super.onReceivedError(webView, i5, str, str2);
        IAlog.a("%s: onReceivedError: error: %s errorCode: %d, failing url: %s", "StorePromoWebviewClient", str, Integer.valueOf(i5), str2);
        if (a(str2)) {
            return;
        }
        String str3 = str + " errCode: " + i5;
        com.fyber.inneractive.sdk.network.events.b bVar = com.fyber.inneractive.sdk.network.events.b.TEMPLATE_CONTENT_ERROR;
        if (!h0.e(str2)) {
            str2 = null;
        }
        com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a aVar = this.f28310b;
        if (aVar != null) {
            aVar.a(bVar, str3, str2);
        }
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        if (webView == null) {
            a("unknown", renderProcessGoneDetail);
            return true;
        }
        a(webView.toString(), renderProcessGoneDetail);
        webView.destroy();
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        IAlog.a("%s: shouldOverrideUrlLoading: url: %s", "StorePromoWebviewClient", str);
        Uri uri = Uri.parse(str);
        if (uri == null || TextUtils.isEmpty(uri.getScheme()) || TextUtils.isEmpty(uri.getAuthority()) || TextUtils.isEmpty(uri.getHost()) || !"FyRemote://".toLowerCase().contains(uri.getScheme())) {
            return true;
        }
        HashMap mapA = h0.a(uri);
        String host = uri.getHost();
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a aVar = this.f28309a;
        if (aVar == null) {
            return true;
        }
        aVar.a(host, mapA);
        return true;
    }

    public static boolean a(String str) {
        v vVar;
        if (str == null || (vVar = IAConfigManager.Q.f27761u) == null) {
            return false;
        }
        r rVar = vVar.f27936b;
        String[] strArr = f28308c;
        String strA = rVar.a("font_urls", (String) null);
        if (strA != null) {
            try {
                JSONArray jSONArray = new JSONArray(strA);
                String[] strArr2 = new String[jSONArray.length()];
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    strArr2[i5] = jSONArray.getString(i5);
                }
                strArr = strArr2;
            } catch (JSONException unused) {
            }
        }
        for (String str2 : strArr) {
            if (str.contains(str2.trim())) {
                return true;
            }
        }
        return false;
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, WebResourceRequest webResourceRequest, WebResourceError webResourceError) {
        int errorCode;
        String string;
        super.onReceivedError(webView, webResourceRequest, webResourceError);
        String string2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (webResourceError != null) {
            if (webResourceError.getDescription() != null) {
                string2 = webResourceError.getDescription().toString();
            }
            errorCode = webResourceError.getErrorCode();
        } else {
            errorCode = -999;
        }
        if (webResourceRequest != null && webResourceRequest.getUrl() != null) {
            string = webResourceRequest.getUrl().toString();
        } else {
            string = "unknown";
        }
        IAlog.a("%s: onReceivedError: error: %s errorCode: %d, failing url: %s", "StorePromoWebviewClient", string2, Integer.valueOf(errorCode), string);
        if (a(string)) {
            return;
        }
        String str = string2 + " errCode: " + errorCode;
        com.fyber.inneractive.sdk.network.events.b bVar = com.fyber.inneractive.sdk.network.events.b.TEMPLATE_CONTENT_ERROR;
        if (!h0.e(string)) {
            string = null;
        }
        com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a aVar = this.f28310b;
        if (aVar != null) {
            aVar.a(bVar, str, string);
        }
    }
}
