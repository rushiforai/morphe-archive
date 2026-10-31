package com.fyber.inneractive.sdk.util;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public InneractiveAdSpot f31166a;

    /* renamed from: c, reason: collision with root package name */
    public boolean f31168c;

    /* renamed from: b, reason: collision with root package name */
    public boolean f31167b = false;

    /* renamed from: d, reason: collision with root package name */
    public long f31169d = 0;

    /* renamed from: e, reason: collision with root package name */
    public long f31170e = 0;

    /* renamed from: f, reason: collision with root package name */
    public long f31171f = 0;

    public final void a(boolean z11) {
        this.f31168c = z11;
        boolean z12 = this.f31167b;
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d;
        if (z12) {
            if (z11) {
                str = "skip";
            }
            IAlog.a("%s%s timer could not start. Timer is in action!", "AdExperienceLatency: ", str);
        } else {
            if (z11) {
                str = "skip";
            }
            IAlog.a("%s%s timer started", "AdExperienceLatency: ", str);
            this.f31169d = System.currentTimeMillis();
            this.f31167b = true;
        }
    }

    public final void a() {
        if (!this.f31167b || this.f31170e <= 0) {
            return;
        }
        this.f31171f += System.currentTimeMillis() - this.f31170e;
        this.f31170e = 0L;
    }

    public final void a(String str) throws JSONException {
        com.fyber.inneractive.sdk.config.global.r rVar;
        if (!this.f31167b || this.f31168c) {
            return;
        }
        String strA = c0.a(System.currentTimeMillis(), this.f31169d, this.f31171f);
        InneractiveAdSpot inneractiveAdSpot = this.f31166a;
        com.fyber.inneractive.sdk.flow.x adContent = inneractiveAdSpot != null ? inneractiveAdSpot.getAdContent() : null;
        com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.USER_CLOSE_ACTION_LATENCY;
        InneractiveAdRequest inneractiveAdRequest = adContent != null ? adContent.f28437a : null;
        com.fyber.inneractive.sdk.response.e eVar = adContent != null ? adContent.f28438b : null;
        JSONArray jSONArrayB = (adContent == null || (rVar = adContent.f28439c) == null) ? null : rVar.b();
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("close_action_latency", strA);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "close_action_latency", strA);
        }
        if (!TextUtils.isEmpty(str)) {
            try {
                jSONObject.put("origin", str);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "origin", str);
            }
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
        this.f31169d = 0L;
        this.f31170e = 0L;
        this.f31171f = 0L;
        this.f31167b = false;
    }
}
