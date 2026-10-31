package com.google.android.gms.internal.measurement;

import android.os.Bundle;

/* loaded from: classes3.dex */
public final class e8 extends j7 {

    /* renamed from: a, reason: collision with root package name */
    public final ai.c2 f32495a;

    public e8(ai.c2 c2Var) {
        this.f32495a = c2Var;
    }

    @Override // com.google.android.gms.internal.measurement.k7
    public final void b(String str, String str2, Bundle bundle, long j11) {
        ((c10.a) this.f32495a).y(str, str2, bundle, j11);
    }

    @Override // com.google.android.gms.internal.measurement.k7
    public final int zzf() {
        return System.identityHashCode(this.f32495a);
    }
}
