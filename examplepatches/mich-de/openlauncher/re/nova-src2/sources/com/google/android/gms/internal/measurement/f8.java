package com.google.android.gms.internal.measurement;

import android.os.Bundle;

/* loaded from: classes.dex */
public final class f8 extends j7 {

    /* renamed from: a, reason: collision with root package name */
    public final ai.d2 f32529a;

    public f8(ai.d2 d2Var) {
        this.f32529a = d2Var;
    }

    @Override // com.google.android.gms.internal.measurement.k7
    public final void b(String str, String str2, Bundle bundle, long j11) {
        this.f32529a.a(str, str2, bundle, j11);
    }

    @Override // com.google.android.gms.internal.measurement.k7
    public final int zzf() {
        return System.identityHashCode(this.f32529a);
    }
}
