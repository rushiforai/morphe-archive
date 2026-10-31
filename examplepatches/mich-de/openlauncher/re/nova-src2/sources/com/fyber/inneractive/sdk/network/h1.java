package com.fyber.inneractive.sdk.network;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Map;

/* loaded from: classes.dex */
public final class h1 extends t0 {

    /* renamed from: q, reason: collision with root package name */
    public final String f28726q;

    public h1(f0 f0Var, String str) {
        super(f0Var, g0.f28722c.a(), null);
        this.f28726q = str;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) {
        o0 o0Var = new o0();
        com.fyber.inneractive.sdk.click.c cVar = new com.fyber.inneractive.sdk.click.c();
        if (lVar != null) {
            ArrayList arrayList = lVar.f28738f;
            cVar.f27703a.clear();
            cVar.f27703a.addAll(arrayList);
            InputStream inputStream = lVar.f28735c;
            if (inputStream != null) {
                String string = com.fyber.inneractive.sdk.util.v.b(inputStream).toString();
                cVar.f27704b = string;
                o0Var.f28758b = string;
            }
        }
        o0Var.f28757a = cVar;
        return o0Var;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final int g() {
        return 0;
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
        return this.f28726q;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final boolean u() {
        return false;
    }
}
