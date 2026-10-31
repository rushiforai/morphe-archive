package com.fyber.inneractive.sdk.flow;

import android.content.Context;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public final class y0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f28453a;

    /* renamed from: b, reason: collision with root package name */
    public final t0 f28454b;

    /* renamed from: c, reason: collision with root package name */
    public final InneractiveAdRequest f28455c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.g f28456d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.model.vast.b f28457e;

    /* renamed from: f, reason: collision with root package name */
    public final JSONArray f28458f;

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.features.v f28459g;

    public y0(Context context, t0 t0Var) {
        com.fyber.inneractive.sdk.config.global.features.v vVar;
        JSONArray jSONArrayB;
        com.fyber.inneractive.sdk.config.global.r rVar = t0Var.f28439c;
        InneractiveAdRequest inneractiveAdRequest = t0Var.f28437a;
        com.fyber.inneractive.sdk.response.g gVar = (com.fyber.inneractive.sdk.response.g) t0Var.f28438b;
        com.fyber.inneractive.sdk.model.vast.b bVar = gVar.N;
        if (rVar != null) {
            vVar = (com.fyber.inneractive.sdk.config.global.features.v) rVar.a(com.fyber.inneractive.sdk.config.global.features.v.class);
            jSONArrayB = rVar.b();
        } else {
            vVar = null;
            jSONArrayB = null;
        }
        this.f28453a = context;
        this.f28454b = t0Var;
        this.f28455c = inneractiveAdRequest;
        this.f28456d = gVar;
        this.f28457e = bVar;
        this.f28459g = vVar;
        this.f28458f = jSONArrayB;
    }
}
