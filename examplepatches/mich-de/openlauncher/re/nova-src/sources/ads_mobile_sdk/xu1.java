package ads_mobile_sdk;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.webkit.WebViewFeature;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class xu1 extends o6 {

    /* renamed from: e, reason: collision with root package name */
    public WebView f11835e;

    /* renamed from: f, reason: collision with root package name */
    public Long f11836f;

    /* renamed from: g, reason: collision with root package name */
    public final Map f11837g;

    public xu1(String str, Map map) {
        super(str);
        this.f11836f = null;
        this.f11837g = map;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        Log.w("NativeBridge", "WebView renderer gone: " + renderProcessGoneDetail.toString() + " for WebView: " + webView);
        if (((WebView) this.f7769b.get()) == webView) {
            Log.w("NativeBridge", "Deallocating the Native bridge as it is unusable. No further events will be generated for this session.");
            this.f7769b = new b.e2((Object) null);
        }
        if (webView != null) {
            webView.destroy();
        }
    }

    @Override // ads_mobile_sdk.o6
    public final void b() {
        this.f7769b.clear();
        new Handler().postDelayed(new wu1(this), Math.max(4000 - (this.f11836f == null ? 4000L : TimeUnit.MILLISECONDS.convert(System.nanoTime() - this.f11836f.longValue(), TimeUnit.NANOSECONDS)), 2000L));
        this.f11835e = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00a1  */
    @Override // ads_mobile_sdk.o6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c() {
        WebViewClient aVar;
        Iterator it;
        ib1 ib1Var = ib1.f4719b;
        Context context = ib1Var.f4720a;
        WebView webView = new WebView(context);
        this.f11835e = webView;
        webView.getSettings().setJavaScriptEnabled(true);
        this.f11835e.getSettings().setAllowContentAccess(false);
        this.f11835e.getSettings().setAllowFileAccess(false);
        WebView webView2 = this.f11835e;
        try {
        } catch (Exception e3) {
            Log.e("OMIDLIB", "Error during initialization of AttestationMessageListener", e3);
        } catch (NoClassDefFoundError unused) {
        }
        if (!WebViewFeature.a(WebViewFeature.WEB_MESSAGE_LISTENER) || lk.a(ib1Var.f4720a).a().size() <= 0) {
            if (lk.a(context).a().size() > 0) {
                aVar = new bz.a(this, 2);
            }
            this.f11835e.setWebViewClient(aVar);
            this.f7769b = new b.e2(this.f11835e);
            d62.a(this.f11835e, (String) null);
            Map map = this.f11837g;
            it = map.keySet().iterator();
            if (it.hasNext()) {
                this.f11836f = Long.valueOf(System.nanoTime());
                return;
            } else {
                map.get((String) it.next()).getClass();
                throw new ClassCastException();
            }
        }
        new c10.a(webView2, new lm.e(7)).a();
        aVar = new vu1(this, 0);
        this.f11835e.setWebViewClient(aVar);
        this.f7769b = new b.e2(this.f11835e);
        d62.a(this.f11835e, (String) null);
        Map map2 = this.f11837g;
        it = map2.keySet().iterator();
        if (it.hasNext()) {
        }
    }

    @Override // ads_mobile_sdk.o6
    public final void a(m6 m6Var, ae.l lVar) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        Map mapUnmodifiableMap = Collections.unmodifiableMap((HashMap) lVar.f12774d);
        Iterator it = mapUnmodifiableMap.keySet().iterator();
        if (!it.hasNext()) {
            a(m6Var, lVar, jSONObject);
        } else {
            mapUnmodifiableMap.get((String) it.next()).getClass();
            throw new ClassCastException();
        }
    }
}
