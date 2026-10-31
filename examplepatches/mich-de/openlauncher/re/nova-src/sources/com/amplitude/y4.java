package com.amplitude;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class y4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z4 f20829a;

    public y4(z4 z4Var) {
        this.f20829a = z4Var;
    }

    public final void onMessage(m7.k port, m7.j jVar) {
        String strB;
        H4 h42;
        Intrinsics.g(port, "port");
        if (jVar == null || (strB = jVar.b()) == null || (h42 = this.f20829a.f20839c) == null) {
            return;
        }
        h42.invoke(strB);
    }
}
