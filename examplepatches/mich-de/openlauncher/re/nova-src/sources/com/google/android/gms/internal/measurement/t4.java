package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public abstract class t4 implements f6, b6 {

    /* renamed from: a, reason: collision with root package name */
    public final String f33076a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f33077b = new HashMap();

    public t4(String str) {
        this.f33076a = str;
    }

    public abstract f6 a(j8 j8Var, List list);

    @Override // com.google.android.gms.internal.measurement.b6
    public final f6 b(String str) {
        HashMap map = this.f33077b;
        return map.containsKey(str) ? (f6) map.get(str) : f6.Qo;
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final void c(String str, f6 f6Var) {
        HashMap map = this.f33077b;
        if (f6Var == null) {
            map.remove(str);
        } else {
            map.put(str, f6Var);
        }
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final boolean e(String str) {
        return this.f33077b.containsKey(str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t4)) {
            return false;
        }
        t4 t4Var = (t4) obj;
        String str = this.f33076a;
        if (str != null) {
            return str.equals(t4Var.f33076a);
        }
        return false;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 f(String str, j8 j8Var, ArrayList arrayList) {
        return "toString".equals(str) ? new i6(this.f33076a) : b6.d(this, new i6(str), j8Var, arrayList);
    }

    public final int hashCode() {
        String str = this.f33076a;
        if (str != null) {
            return str.hashCode();
        }
        return 0;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        return this.f33076a;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Double zzd() {
        return Double.valueOf(Double.NaN);
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Boolean zze() {
        return Boolean.TRUE;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final Iterator zzf() {
        return new u5(this.f33077b.keySet().iterator());
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public f6 zzt() {
        return this;
    }
}
