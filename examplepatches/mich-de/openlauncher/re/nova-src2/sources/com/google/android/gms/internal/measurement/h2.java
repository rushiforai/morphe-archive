package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class h2 implements f6 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f32591a;

    public h2(Boolean bool) {
        this.f32591a = bool == null ? false : bool.booleanValue();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h2) && this.f32591a == ((h2) obj).f32591a;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        boolean zEquals = "toString".equals(str);
        boolean z11 = this.f32591a;
        if (zEquals) {
            return new i6(Boolean.toString(z11));
        }
        throw new IllegalArgumentException(a80.m.h(Boolean.toString(z11), ".", str, " is not a function."));
    }

    public final int hashCode() {
        return Boolean.valueOf(this.f32591a).hashCode();
    }

    public final String toString() {
        return String.valueOf(this.f32591a);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        return Boolean.toString(this.f32591a);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        return Double.valueOf(true != this.f32591a ? 0.0d : 1.0d);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        return Boolean.valueOf(this.f32591a);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return null;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return new h2(Boolean.valueOf(this.f32591a));
    }
}
