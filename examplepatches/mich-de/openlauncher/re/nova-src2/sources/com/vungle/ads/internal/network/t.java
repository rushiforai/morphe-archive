package com.vungle.ads.internal.network;

import kotlin.jvm.internal.Intrinsics;
import x80.k0;

/* loaded from: classes4.dex */
public final class t extends k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ k0 f47289a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ m90.g f47290b;

    public t(k0 k0Var, m90.g gVar) {
        this.f47289a = k0Var;
        this.f47290b = gVar;
    }

    @Override // x80.k0
    public final long contentLength() {
        return this.f47290b.f76126b;
    }

    @Override // x80.k0
    public final x80.a0 contentType() {
        return this.f47289a.contentType();
    }

    @Override // x80.k0
    public final void writeTo(m90.h sink) {
        Intrinsics.g(sink, "sink");
        sink.C(this.f47290b.c0());
    }
}
