package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class x2 implements f6 {

    /* renamed from: a, reason: collision with root package name */
    public final f6 f33215a;

    /* renamed from: b, reason: collision with root package name */
    public final String f33216b;

    public x2(String str) {
        this.f33215a = f6.Qo;
        this.f33216b = str;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof x2)) {
            return false;
        }
        x2 x2Var = (x2) obj;
        return this.f33216b.equals(x2Var.f33216b) && this.f33215a.equals(x2Var.f33215a);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        throw new IllegalStateException("Control does not have functions");
    }

    public final int hashCode() {
        return this.f33215a.hashCode() + (this.f33216b.hashCode() * 31);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        throw new IllegalStateException("Control is not a String");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        throw new IllegalStateException("Control is not a double");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        throw new IllegalStateException("Control is not a boolean");
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return null;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        return new x2(this.f33216b, this.f33215a.zzt());
    }

    public x2(String str, f6 f6Var) {
        this.f33215a = f6Var;
        this.f33216b = str;
    }
}
