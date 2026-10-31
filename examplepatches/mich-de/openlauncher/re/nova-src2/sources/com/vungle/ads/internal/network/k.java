package com.vungle.ads.internal.network;

import x80.p0;

/* loaded from: classes4.dex */
public final class k extends p0 {

    /* renamed from: a, reason: collision with root package name */
    public final x80.a0 f47255a;

    /* renamed from: b, reason: collision with root package name */
    public final long f47256b;

    public k(x80.a0 a0Var, long j11) {
        this.f47255a = a0Var;
        this.f47256b = j11;
    }

    @Override // x80.p0
    public final long contentLength() {
        return this.f47256b;
    }

    @Override // x80.p0
    public final x80.a0 contentType() {
        return this.f47255a;
    }

    @Override // x80.p0
    public final m90.i source() {
        throw new IllegalStateException("Cannot read raw response body of a converted body.");
    }
}
