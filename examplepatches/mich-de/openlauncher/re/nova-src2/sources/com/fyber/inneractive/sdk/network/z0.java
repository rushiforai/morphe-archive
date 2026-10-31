package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.InputStream;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class z0 extends t0 {

    /* renamed from: q, reason: collision with root package name */
    public final String f28834q;

    /* renamed from: r, reason: collision with root package name */
    public final AtomicInteger f28835r;

    public z0(f0 f0Var, String str) {
        super(f0Var, g0.f28722c.a(), null);
        this.f28835r = new AtomicInteger();
        this.f28834q = str;
    }

    public static void b(String str) {
        IAConfigManager.Q.f27759s.a(new z0(new y0(str, System.currentTimeMillis()), str));
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) throws n0 {
        try {
            o0 o0Var = new o0();
            o0Var.f28757a = String.valueOf(i5);
            InputStream inputStream = lVar.f28735c;
            if (inputStream == null) {
                return o0Var;
            }
            o0Var.f28758b = com.fyber.inneractive.sdk.util.v.b(inputStream).toString();
            return o0Var;
        } catch (Exception e3) {
            IAlog.a("failed parse hit network request", e3, new Object[0]);
            throw new n0(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final int g() {
        return ((int) Math.pow(2.0d, this.f28835r.get())) * 1000;
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
        return this.f28834q;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final boolean u() {
        return this.f28835r.getAndIncrement() < 4;
    }
}
