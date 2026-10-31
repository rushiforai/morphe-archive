package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.util.IAlog;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class x0 extends t0 {

    /* renamed from: q, reason: collision with root package name */
    public final String f28826q;

    /* renamed from: r, reason: collision with root package name */
    public final String f28827r;

    /* renamed from: s, reason: collision with root package name */
    public final AtomicInteger f28828s;

    public x0(e eVar, String str, String str2) {
        super(eVar, g0.f28722c.a(), null);
        this.f28828s = new AtomicInteger();
        this.f28827r = str;
        this.f28826q = str2;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) throws n0 {
        try {
            o0 o0Var = new o0();
            o0Var.f28757a = String.valueOf(i5);
            return o0Var;
        } catch (Exception e3) {
            IAlog.a("failed parse event network request", e3, new Object[0]);
            throw new n0(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final byte[] f() {
        byte[] bArr = new byte[0];
        try {
            IAlog.a("NetworkRequestEvent: network request body %s", this.f28826q);
            return this.f28826q.getBytes(StandardCharsets.UTF_8);
        } catch (Exception unused) {
            return bArr;
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final int g() {
        return ((int) Math.pow(2.0d, this.f28828s.get())) * 1000;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final m0 m() {
        return m0.POST;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final g1 o() {
        return g1.LOW;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final String r() {
        return this.f28827r;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final boolean u() {
        return this.f28828s.getAndIncrement() < 4;
    }
}
