package com.vungle.ads.internal;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b extends h {
    public b() {
        super("FINISHED", 5, 0);
    }

    @Override // com.vungle.ads.internal.h
    public final boolean a(h adState) {
        Intrinsics.g(adState, "adState");
        return false;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "completed";
    }
}
