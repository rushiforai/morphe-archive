package com.fyber.inneractive.sdk.network;

import android.content.Context;
import com.fyber.inneractive.sdk.external.InvalidAppIdException;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Map;

/* loaded from: classes.dex */
public class v0 extends t0 {

    /* renamed from: q, reason: collision with root package name */
    public final Context f28814q;

    /* renamed from: r, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.cache.a f28815r;

    /* renamed from: s, reason: collision with root package name */
    public d0 f28816s;

    public v0(f0 f0Var, Context context, com.fyber.inneractive.sdk.cache.a aVar) {
        super(f0Var, g0.f28722c.a(), null);
        this.f28814q = context;
        this.f28815r = aVar;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public o0 a(l lVar, Map map, int i5) throws Exception {
        if (map != null) {
            this.f28790p = com.fyber.inneractive.sdk.util.s.a(map);
        }
        o0 o0Var = new o0();
        try {
            String string = com.fyber.inneractive.sdk.util.v.b(lVar.f28735c).toString();
            o0Var.f28757a = this.f28815r.a(string);
            o0Var.f28758b = string;
            return o0Var;
        } catch (Exception e3) {
            IAlog.a("failed parse cacheable network request", e3, new Object[0]);
            if (e3 instanceof InvalidAppIdException) {
                throw e3;
            }
            throw new n0(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final int g() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final String h() {
        return this.f28815r.c();
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public a i() throws Throwable {
        d0 d0Var = new d0(this.f28814q, this.f28815r);
        this.f28816s = d0Var;
        com.fyber.inneractive.sdk.cache.n nVarA = d0Var.a();
        String str = nVarA.f27676b;
        Object obj = nVarA.f27675a;
        this.f28815r.c();
        return new a(obj, str);
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final m0 m() {
        return m0.GET;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final g1 o() {
        return g1.LOW;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final String r() {
        return this.f28815r.a();
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final boolean u() {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public void a(o0 o0Var, String str, String str2) {
        d0 d0Var = this.f28816s;
        if (d0Var != null) {
            d0Var.b(str2);
            if (o0Var == null || o0Var.f28758b.isEmpty() || str.isEmpty()) {
                return;
            }
            if (!this.f28816s.a(str, o0Var.f28758b)) {
                IAlog.b("Failed to cache file", new Object[0]);
            } else {
                this.f28815r.a(o0Var.f28757a);
            }
        }
    }
}
