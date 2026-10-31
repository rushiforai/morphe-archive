package zn;

import android.os.Handler;
import android.text.TextUtils;
import android.webkit.WebView;
import b.e2;
import com.google.android.gms.internal.consent_sdk.v;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;
import un.j;
import un.k;
import xn.h;

/* loaded from: classes3.dex */
public final class d extends a {

    /* renamed from: g, reason: collision with root package name */
    public WebView f98579g;

    /* renamed from: h, reason: collision with root package name */
    public Long f98580h;

    /* renamed from: i, reason: collision with root package name */
    public final Map f98581i;

    /* renamed from: j, reason: collision with root package name */
    public final String f98582j;

    public d(String str, Map map, String str2) {
        super(str);
        this.f98580h = null;
        this.f98581i = map;
        this.f98582j = str2;
    }

    @Override // zn.a
    public final void d(k kVar, v vVar) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        Map mapUnmodifiableMap = Collections.unmodifiableMap((HashMap) vVar.f32262d);
        for (String str : mapUnmodifiableMap.keySet()) {
            j jVar = (j) mapUnmodifiableMap.get(str);
            jVar.getClass();
            JSONObject jSONObject2 = new JSONObject();
            ao.b.b(jSONObject2, "vendorKey", jVar.f91395a);
            ao.b.b(jSONObject2, "resourceUrl", jVar.f91396b.toString());
            ao.b.b(jSONObject2, "verificationParameters", jVar.f91397c);
            ao.b.b(jSONObject, str, jSONObject2);
        }
        e(kVar, vVar, jSONObject);
    }

    @Override // zn.a
    public final void g() {
        super.g();
        new Handler().postDelayed(new c(this), Math.max(4000 - (this.f98580h == null ? 4000L : TimeUnit.MILLISECONDS.convert(System.nanoTime() - this.f98580h.longValue(), TimeUnit.NANOSECONDS)), 2000L));
        this.f98579g = null;
    }

    @Override // zn.a
    public final void j() {
        WebView webView = new WebView(h.f96194b.f96195a);
        this.f98579g = webView;
        webView.getSettings().setJavaScriptEnabled(true);
        this.f98579g.getSettings().setAllowContentAccess(false);
        this.f98579g.getSettings().setAllowFileAccess(false);
        this.f98579g.setWebViewClient(new bz.a(this, 5));
        this.f98572b = new e2(this.f98579g);
        WebView webView2 = this.f98579g;
        if (webView2 != null) {
            String str = this.f98582j;
            if (!TextUtils.isEmpty(str)) {
                try {
                    webView2.evaluateJavascript(str, null);
                } catch (IllegalStateException unused) {
                    webView2.loadUrl("javascript: " + str);
                }
            }
        }
        Map map = this.f98581i;
        for (String str2 : map.keySet()) {
            String externalForm = ((j) map.get(str2)).f91396b.toExternalForm();
            WebView webView3 = this.f98579g;
            if (externalForm != null && !TextUtils.isEmpty(str2)) {
                String strReplace = "(function() {this.omidVerificationProperties = this.omidVerificationProperties || {};Object.defineProperty(this.omidVerificationProperties, 'injectionId', {get: function() {var currentScript = document && document.currentScript;return currentScript && currentScript.getAttribute('data-injection-id');}, configurable: true});var script = document.createElement('script');script.setAttribute(\"type\",\"text/javascript\");script.setAttribute(\"src\",\"%SCRIPT_SRC%\");script.setAttribute(\"data-injection-id\",\"%INJECTION_ID%\");document.body.appendChild(script);})();".replace("%SCRIPT_SRC%", externalForm).replace("%INJECTION_ID%", str2);
                if (webView3 != null && !TextUtils.isEmpty(strReplace)) {
                    try {
                        webView3.evaluateJavascript(strReplace, null);
                    } catch (IllegalStateException unused2) {
                        webView3.loadUrl("javascript: " + strReplace);
                    }
                }
            }
        }
        this.f98580h = Long.valueOf(System.nanoTime());
    }
}
