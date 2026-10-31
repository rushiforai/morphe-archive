package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class g6 implements f6 {

    /* renamed from: a, reason: collision with root package name */
    public final String f32563a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f32564b;

    public g6(String str, ArrayList arrayList) {
        this.f32563a = str;
        ArrayList arrayList2 = new ArrayList();
        this.f32564b = arrayList2;
        arrayList2.addAll(arrayList);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g6)) {
            return false;
        }
        g6 g6Var = (g6) obj;
        String str = g6Var.f32563a;
        String str2 = this.f32563a;
        if (str2 == null ? str == null : str2.equals(str)) {
            return this.f32564b.equals(g6Var.f32564b);
        }
        return false;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        throw new IllegalStateException("Statement is not an evaluated entity");
    }

    public final int hashCode() {
        String str = this.f32563a;
        return this.f32564b.hashCode() + ((str != null ? str.hashCode() : 0) * 31);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        throw new IllegalStateException("Statement cannot be cast as String");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        throw new IllegalStateException("Statement cannot be cast as Double");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        throw new IllegalStateException("Statement cannot be cast as Boolean");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return null;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return this;
    }
}
