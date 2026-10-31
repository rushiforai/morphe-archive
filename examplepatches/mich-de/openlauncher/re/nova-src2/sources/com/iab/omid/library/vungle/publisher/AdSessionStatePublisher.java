package com.iab.omid.library.vungle.publisher;

import android.webkit.WebView;
import com.iab.omid.library.vungle.adsession.AdEvents;
import com.iab.omid.library.vungle.adsession.AdSessionConfiguration;
import com.iab.omid.library.vungle.adsession.AdSessionContext;
import com.iab.omid.library.vungle.adsession.ErrorType;
import com.iab.omid.library.vungle.adsession.VerificationScriptResource;
import com.iab.omid.library.vungle.adsession.media.MediaEvents;
import com.iab.omid.library.vungle.internal.g;
import com.iab.omid.library.vungle.internal.h;
import com.iab.omid.library.vungle.utils.c;
import com.iab.omid.library.vungle.utils.d;
import com.iab.omid.library.vungle.utils.f;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class AdSessionStatePublisher {

    /* renamed from: a, reason: collision with root package name */
    private String f35242a;

    /* renamed from: b, reason: collision with root package name */
    private com.iab.omid.library.vungle.weakreference.b f35243b;

    /* renamed from: c, reason: collision with root package name */
    private AdEvents f35244c;

    /* renamed from: d, reason: collision with root package name */
    private MediaEvents f35245d;

    /* renamed from: e, reason: collision with root package name */
    private a f35246e;

    /* renamed from: f, reason: collision with root package name */
    private long f35247f;

    public enum a {
        AD_STATE_IDLE,
        AD_STATE_VISIBLE,
        AD_STATE_NOTVISIBLE
    }

    public AdSessionStatePublisher(String str) {
        a();
        this.f35242a = str;
        this.f35243b = new com.iab.omid.library.vungle.weakreference.b(null);
    }

    private JSONArray a(List<com.iab.omid.library.vungle.attestation.b> list) {
        JSONArray jSONArray = new JSONArray();
        for (com.iab.omid.library.vungle.attestation.b bVar : list) {
            Iterator<String> it = bVar.c().iterator();
            while (it.hasNext()) {
                jSONArray.put(a(bVar, it.next()));
            }
        }
        return jSONArray;
    }

    public void b() {
        this.f35243b.clear();
    }

    public AdEvents c() {
        return this.f35244c;
    }

    public MediaEvents d() {
        return this.f35245d;
    }

    public boolean e() {
        return this.f35243b.get() != null;
    }

    public void f() {
        h.a().a(getWebView(), this.f35242a);
    }

    public void g() {
        h.a().b(getWebView(), this.f35242a);
    }

    public WebView getWebView() {
        return this.f35243b.get();
    }

    public void h() {
        b((JSONObject) null);
    }

    public void i() {
    }

    private JSONObject a(com.iab.omid.library.vungle.attestation.b bVar, String str) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("mechanism", bVar.a());
        jSONObject.put("executionEnvironment", bVar.b().toString());
        jSONObject.put("version", str);
        return jSONObject;
    }

    public void b(String str, long j11) {
        if (j11 >= this.f35247f) {
            this.f35246e = a.AD_STATE_VISIBLE;
            h.a().b(getWebView(), this.f35242a, str);
        }
    }

    private JSONObject a(JSONArray jSONArray) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "supportedAttestationMechanisms", jSONArray);
        return jSONObject;
    }

    public void b(List<com.iab.omid.library.vungle.attestation.b> list) {
        try {
            a(a(a(list)));
        } catch (JSONException e3) {
            d.a("Error creating JSON object publishSupportedAttestationMechanisms", e3);
        }
    }

    public void a() {
        this.f35247f = f.b();
        this.f35246e = a.AD_STATE_IDLE;
    }

    public void b(JSONObject jSONObject) {
        h.a().b(getWebView(), this.f35242a, jSONObject);
    }

    public void a(float f11) {
        h.a().a(getWebView(), this.f35242a, f11);
    }

    public void b(boolean z11) {
        if (e()) {
            h.a().a(getWebView(), this.f35242a, z11 ? "locked" : "unlocked");
        }
    }

    public void a(WebView webView) {
        this.f35243b = new com.iab.omid.library.vungle.weakreference.b(webView);
    }

    public void a(AdEvents adEvents) {
        this.f35244c = adEvents;
    }

    public void a(AdSessionConfiguration adSessionConfiguration) {
        h.a().a(getWebView(), this.f35242a, adSessionConfiguration.toJsonObject());
    }

    public void a(ErrorType errorType, String str) {
        h.a().a(getWebView(), this.f35242a, errorType, str);
    }

    public void a(com.iab.omid.library.vungle.adsession.a aVar, AdSessionContext adSessionContext) throws JSONException {
        a(aVar, adSessionContext, null);
    }

    public void a(com.iab.omid.library.vungle.adsession.a aVar, AdSessionContext adSessionContext, JSONObject jSONObject) throws JSONException {
        String strC = aVar.c();
        JSONObject jSONObject2 = new JSONObject();
        c.a(jSONObject2, "environment", "app");
        c.a(jSONObject2, "adSessionType", adSessionContext.getAdSessionContextType());
        c.a(jSONObject2, "deviceInfo", com.iab.omid.library.vungle.utils.b.d());
        c.a(jSONObject2, "deviceCategory", com.iab.omid.library.vungle.utils.a.a().toString());
        JSONArray jSONArray = new JSONArray();
        jSONArray.put("clid");
        jSONArray.put("vlid");
        c.a(jSONObject2, "supports", jSONArray);
        JSONObject jSONObject3 = new JSONObject();
        c.a(jSONObject3, "partnerName", adSessionContext.getPartner().getName());
        c.a(jSONObject3, "partnerVersion", adSessionContext.getPartner().getVersion());
        c.a(jSONObject2, "omidNativeInfo", jSONObject3);
        JSONObject jSONObject4 = new JSONObject();
        c.a(jSONObject4, "libraryVersion", "1.6.2-Vungle");
        c.a(jSONObject4, "appId", g.b().a().getApplicationContext().getPackageName());
        c.a(jSONObject2, "app", jSONObject4);
        if (adSessionContext.getContentUrl() != null) {
            c.a(jSONObject2, "contentUrl", adSessionContext.getContentUrl());
        }
        if (adSessionContext.getCustomReferenceData() != null) {
            c.a(jSONObject2, "customReferenceData", adSessionContext.getCustomReferenceData());
        }
        if (adSessionContext.getUniversalAdId() != null) {
            c.a(jSONObject2, "universalAdId", adSessionContext.getUniversalAdId());
        }
        JSONObject jSONObject5 = new JSONObject();
        for (VerificationScriptResource verificationScriptResource : adSessionContext.getVerificationScriptResources()) {
            c.a(jSONObject5, verificationScriptResource.getVendorKey(), verificationScriptResource.getVerificationParameters());
        }
        h.a().a(getWebView(), strC, jSONObject2, jSONObject5, jSONObject);
    }

    public void a(MediaEvents mediaEvents) {
        this.f35245d = mediaEvents;
    }

    public void a(String str) {
        a(str, (JSONObject) null);
    }

    public void a(String str, long j11) {
        if (j11 >= this.f35247f) {
            a aVar = this.f35246e;
            a aVar2 = a.AD_STATE_NOTVISIBLE;
            if (aVar != aVar2) {
                this.f35246e = aVar2;
                h.a().b(getWebView(), this.f35242a, str);
            }
        }
    }

    public void a(String str, JSONObject jSONObject) {
        h.a().a(getWebView(), this.f35242a, str, jSONObject);
    }

    public void a(Date date) throws JSONException {
        if (date == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        c.a(jSONObject, "timestamp", Long.valueOf(date.getTime()));
        h.a().a(getWebView(), jSONObject);
    }

    private void a(JSONObject jSONObject) {
        h.a().b(getWebView(), jSONObject);
    }

    public void a(boolean z11) {
        if (e()) {
            h.a().c(getWebView(), this.f35242a, z11 ? "foregrounded" : "backgrounded");
        }
    }
}
