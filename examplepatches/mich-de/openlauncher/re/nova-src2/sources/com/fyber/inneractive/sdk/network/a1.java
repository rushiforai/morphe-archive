package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.ignite.IgniteResponseOuterClass$IgniteResponse;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.InputStream;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class a1 extends t0 {

    /* renamed from: q, reason: collision with root package name */
    public final byte[] f28689q;

    /* renamed from: r, reason: collision with root package name */
    public final AtomicInteger f28690r;

    public a1(com.fyber.inneractive.sdk.ignite.b bVar, byte[] bArr, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(bVar, g0.f28722c.a(), rVar);
        this.f28690r = new AtomicInteger();
        this.f28689q = bArr;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final o0 a(l lVar, Map map, int i5) throws n0 {
        try {
            o0 o0Var = new o0();
            InputStream inputStream = lVar.f28735c;
            if (inputStream == null) {
                return o0Var;
            }
            String str = new String(com.fyber.inneractive.sdk.util.v.a(inputStream), "UTF-8");
            IgniteResponseOuterClass$IgniteResponse from = IgniteResponseOuterClass$IgniteResponse.parseFrom(str.getBytes());
            o0Var.f28758b = str;
            o0Var.f28757a = from;
            return o0Var;
        } catch (Exception e3) {
            IAlog.a("failed parse ignite network request", e3, new Object[0]);
            throw new n0(e3);
        } catch (Throwable th2) {
            IAlog.a("failed parse ignite network request", th2, new Object[0]);
            throw new n0("failed to parse ignite network request");
        }
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final byte[] f() {
        return this.f28689q;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final int g() {
        return ((int) Math.pow(2.0d, this.f28690r.get())) * 1000;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final m0 m() {
        return m0.POST;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final String n() {
        return "application/x-protobuf; messageType=IgniteRequest";
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final g1 o() {
        return g1.HIGH;
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final String r() {
        return "https://init-mp.fyber.com/init";
    }

    @Override // com.fyber.inneractive.sdk.network.t0
    public final boolean u() {
        return this.f28690r.getAndIncrement() < 4;
    }
}
