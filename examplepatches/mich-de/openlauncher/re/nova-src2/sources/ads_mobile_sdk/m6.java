package ads_mobile_sdk;

import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import b.a9;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class m6 extends b.v3 {

    /* renamed from: a, reason: collision with root package name */
    public final ae.l f7015a;

    /* renamed from: c, reason: collision with root package name */
    public b.e2 f7017c;

    /* renamed from: d, reason: collision with root package name */
    public o6 f7018d;

    /* renamed from: g, reason: collision with root package name */
    public final String f7021g;

    /* renamed from: h, reason: collision with root package name */
    public final i50.c f7022h;

    /* renamed from: b, reason: collision with root package name */
    public final yr0 f7016b = new yr0();

    /* renamed from: e, reason: collision with root package name */
    public boolean f7019e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f7020f = false;

    /* JADX WARN: Multi-variable type inference failed */
    public m6(e20.r rVar, ae.l lVar, String str) throws JSONException {
        i50.c cVar = new i50.c(2);
        cVar.f61379b = new b.e2((Object) null);
        this.f7022h = cVar;
        this.f7015a = lVar;
        this.f7021g = str;
        this.f7017c = new b.e2((Object) null);
        l6 l6Var = (l6) lVar.f12777g;
        if (l6Var == l6.f6096b || l6Var == l6.f6097c) {
            WebView webView = (WebView) lVar.f12772b;
            b.f7 f7Var = new b.f7(str);
            if (webView != null && lk.a(ib1.f4719b.f4720a).a().size() > 0) {
                webView.setWebViewClient(new bz.a(webView.getWebViewClient()));
            }
            if (webView != null && !webView.getSettings().getJavaScriptEnabled()) {
                webView.getSettings().setJavaScriptEnabled(true);
            }
            f7Var.f7769b = new b.e2(webView);
            this.f7018d = f7Var;
        } else {
            this.f7018d = new xu1(str, Collections.unmodifiableMap((HashMap) lVar.f12774d));
        }
        this.f7018d.c();
        n6.f7447c.f7448a.add(this);
        o6 o6Var = this.f7018d;
        d62 d62Var = d62.f2192a;
        WebView webView2 = (WebView) o6Var.f7769b.get();
        String str2 = o6Var.f7768a;
        JSONObject jSONObject = new JSONObject();
        c72.a(jSONObject, "impressionOwner", (ha2) rVar.f52080b);
        c72.a(jSONObject, "mediaEventsOwner", (ha2) rVar.f52081c);
        c72.a(jSONObject, "creativeType", (d00) rVar.f52082d);
        c72.a(jSONObject, "impressionType", (q31) rVar.f52083e);
        c72.a(jSONObject, "isolateVerificationScripts", Boolean.valueOf(rVar.f52079a));
        d62Var.a(webView2, "init", jSONObject, str2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // b.v3
    public final void a() {
        if (this.f7020f) {
            return;
        }
        i50.c cVar = this.f7022h;
        View view = (View) ((b.e2) cVar.f61379b).get();
        if (view != null) {
            p6 p6Var = (p6) cVar.f61381d;
            if (p6Var != null) {
                view.removeOnAttachStateChangeListener(p6Var);
                cVar.f61381d = null;
            }
            if (((a9) cVar.f61380c) != null) {
                if (view.getViewTreeObserver().isAlive()) {
                    view.getViewTreeObserver().removeOnWindowFocusChangeListener((a9) cVar.f61380c);
                }
                cVar.f61380c = null;
            }
        }
        ((b.e2) cVar.f61379b).clear();
        this.f7017c.clear();
        if (!this.f7020f) {
            this.f7016b.f12274a.clear();
        }
        this.f7020f = true;
        o6 o6Var = this.f7018d;
        d62.f2192a.a((WebView) o6Var.f7769b.get(), "finishSession", o6Var.f7768a);
        n6 n6Var = n6.f7447c;
        ArrayList arrayList = n6Var.f7449b;
        boolean z11 = arrayList.size() > 0;
        n6Var.f7448a.remove(this);
        arrayList.remove(this);
        if (z11 && arrayList.size() <= 0) {
            p72 p72VarA = p72.a();
            p72VarA.getClass();
            tj3 tj3Var = tj3.f9961g;
            tj3Var.getClass();
            Handler handler = tj3.f9963i;
            if (handler != null) {
                handler.removeCallbacks(tj3.f9965k);
                tj3.f9963i = null;
            }
            tj3Var.f9966a.clear();
            tj3.f9962h.post(new qj3(tj3Var, 0));
            i6 i6Var = i6.f4638d;
            i6Var.f12549a = false;
            i6Var.f12551c = null;
            si0 si0Var = p72VarA.f8125d;
            si0Var.f9566b.getContentResolver().unregisterContentObserver(si0Var);
        }
        this.f7018d.b();
        this.f7018d = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // b.v3
    public final void b() throws JSONException {
        if (this.f7019e || this.f7018d == null) {
            return;
        }
        this.f7019e = true;
        n6 n6Var = n6.f7447c;
        boolean z11 = n6Var.f7449b.size() > 0;
        n6Var.f7449b.add(this);
        if (!z11) {
            p72 p72VarA = p72.a();
            p72VarA.getClass();
            i6 i6Var = i6.f4638d;
            i6Var.f12551c = p72VarA;
            i6Var.f12549a = true;
            boolean zA = i6Var.a();
            i6Var.f12550b = zA;
            i6Var.a(zA);
            tj3.f9961g.getClass();
            if (tj3.f9963i == null) {
                Handler handler = new Handler(Looper.getMainLooper());
                tj3.f9963i = handler;
                handler.post(tj3.f9964j);
                tj3.f9963i.postDelayed(tj3.f9965k, 200L);
            }
            si0 si0Var = p72VarA.f8125d;
            si0Var.f9572h.submit(new qj3(si0Var, 1));
            si0Var.f9566b.getContentResolver().registerContentObserver(Settings.System.CONTENT_URI, true, si0Var);
        }
        float f11 = p72.a().f8123a;
        o6 o6Var = this.f7018d;
        d62 d62Var = d62.f2192a;
        d62Var.a((WebView) o6Var.f7769b.get(), "setDeviceVolume", Float.valueOf(f11), o6Var.f7768a);
        o6 o6Var2 = this.f7018d;
        Date date = p.f8037f.f8038b;
        Date date2 = date != null ? (Date) date.clone() : null;
        o6Var2.getClass();
        if (date2 != null) {
            JSONObject jSONObject = new JSONObject();
            c72.a(jSONObject, "timestamp", Long.valueOf(date2.getTime()));
            d62Var.a((WebView) o6Var2.f7769b.get(), "setLastActivity", jSONObject);
        }
        o6 o6Var3 = this.f7018d;
        ArrayList arrayListA = lk.a(ib1.f4719b.f4720a).a();
        o6Var3.getClass();
        try {
            JSONArray jSONArrayA = o6.a(arrayListA);
            JSONObject jSONObject2 = new JSONObject();
            c72.a(jSONObject2, "supportedAttestationMechanisms", jSONArrayA);
            d62Var.a((WebView) o6Var3.f7769b.get(), "setSupportedAttestations", jSONObject2);
        } catch (JSONException e3) {
            Log.e("OMIDLIB", "Error creating JSON object publishSupportedAttestationMechanisms", e3);
        }
        this.f7018d.a(this, this.f7015a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // b.v3
    public final void a(View view) {
        if (this.f7020f || ((View) this.f7017c.get()) == view) {
            return;
        }
        i50.c cVar = this.f7022h;
        View view2 = (View) ((b.e2) cVar.f61379b).get();
        if (view2 != null) {
            p6 p6Var = (p6) cVar.f61381d;
            if (p6Var != null) {
                view2.removeOnAttachStateChangeListener(p6Var);
                cVar.f61381d = null;
            }
            if (((a9) cVar.f61380c) != null) {
                if (view2.getViewTreeObserver().isAlive()) {
                    view2.getViewTreeObserver().removeOnWindowFocusChangeListener((a9) cVar.f61380c);
                }
                cVar.f61380c = null;
            }
        }
        ((b.e2) cVar.f61379b).clear();
        if (view != null) {
            cVar.f61379b = new b.e2(view);
            p6 p6Var2 = new p6(cVar);
            cVar.f61381d = p6Var2;
            view.addOnAttachStateChangeListener(p6Var2);
            if (view.isAttachedToWindow()) {
                cVar.a(view);
            }
        }
        this.f7017c = new b.e2(view);
        this.f7018d.a$2();
        Collection<m6> collectionUnmodifiableCollection = Collections.unmodifiableCollection(n6.f7447c.f7448a);
        if (collectionUnmodifiableCollection == null || collectionUnmodifiableCollection.isEmpty()) {
            return;
        }
        for (m6 m6Var : collectionUnmodifiableCollection) {
            if (m6Var != this && ((View) m6Var.f7017c.get()) == view) {
                m6Var.f7017c.clear();
            }
        }
    }
}
