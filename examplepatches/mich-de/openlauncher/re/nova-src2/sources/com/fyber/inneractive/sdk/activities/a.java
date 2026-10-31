package com.fyber.inneractive.sdk.activities;

import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.network.z;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.k1;
import com.fyber.inneractive.sdk.util.q0;
import com.fyber.inneractive.sdk.util.v;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class a extends WebViewClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ FyberReportAdActivity f27587a;

    public a(FyberReportAdActivity fyberReportAdActivity) {
        this.f27587a = fyberReportAdActivity;
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i5, String str, String str2) {
        IAlog.f("Received Error on WebViewClient: Code: %d, Description: %s, failingUrl: %s", Integer.valueOf(i5), str, str2);
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        z.a("WebViewRendererProcessGone", "Web view renderer process has gone. Web view destroyed", null, null);
        FyberReportAdActivity fyberReportAdActivity = this.f27587a;
        if (fyberReportAdActivity.f27558b == webView) {
            fyberReportAdActivity.f27558b = null;
        }
        if (webView != null) {
            v.a(webView);
            webView.destroy();
        }
        this.f27587a.finish();
        return true;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) throws JSONException {
        com.fyber.inneractive.sdk.flow.h hVar;
        if (str == null) {
            return false;
        }
        if (k1.a(str)) {
            WebView webView2 = this.f27587a.f27558b;
            if (webView2 != null) {
                webView2.loadUrl("chrome://crash");
            }
            return true;
        }
        if (!str.startsWith("fybermarketplace://reportAd?") || (hVar = FyberReportAdActivity.f27557f) == null) {
            return false;
        }
        String strSubstring = str.substring(28);
        com.fyber.inneractive.sdk.flow.g gVar = (com.fyber.inneractive.sdk.flow.g) hVar;
        w wVar = new w(u.FYBER_REPORT_AD, gVar.f28147b, gVar.f28148c);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(PglCryptUtils.KEY_MESSAGE, strSubstring);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", PglCryptUtils.KEY_MESSAGE, strSubstring);
        }
        wVar.f28823f.put(jSONObject);
        wVar.f28824g = true;
        wVar.a((String) null);
        WebView webView3 = this.f27587a.f27558b;
        if (webView3 != null) {
            q0.a(webView3, "reportSent();");
        }
        return true;
    }
}
