package com.vungle.ads.internal;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g extends h {
    public g() {
        super("READY", 2, 0);
    }

    @Override // com.vungle.ads.internal.h
    public final boolean a(h adState) {
        Intrinsics.g(adState, "adState");
        return adState == h.f46846d || adState == h.f46848f || adState == h.f46849g;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "ready";
    }
}
