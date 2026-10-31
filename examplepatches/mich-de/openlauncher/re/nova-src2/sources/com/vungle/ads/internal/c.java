package com.vungle.ads.internal;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends h {
    public c() {
        super("IMPRESSION_LOGGED", 4, 0);
    }

    @Override // com.vungle.ads.internal.h
    public final boolean a(h adState) {
        Intrinsics.g(adState, "adState");
        return adState == h.f46848f || adState == h.f46849g || adState == h.f46845c;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "impressionLogged";
    }
}
