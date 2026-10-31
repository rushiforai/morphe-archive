package com.vungle.ads.internal;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d extends h {
    public d() {
        super("LOADING", 1, 0);
    }

    @Override // com.vungle.ads.internal.h
    public final boolean a(h adState) {
        Intrinsics.g(adState, "adState");
        return adState == h.f46845c || adState == h.f46849g;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "loading";
    }
}
