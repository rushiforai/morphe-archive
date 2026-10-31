package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes3.dex */
public class c6 implements f6, b6 {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f32427a = new HashMap();

    @Override // com.google.android.gms.internal.measurement.b6
    public final f6 b(String str) {
        HashMap map = this.f32427a;
        return map.containsKey(str) ? (f6) map.get(str) : f6.Qo;
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final void c(String str, f6 f6Var) {
        HashMap map = this.f32427a;
        if (f6Var == null) {
            map.remove(str);
        } else {
            map.put(str, f6Var);
        }
    }

    @Override // com.google.android.gms.internal.measurement.b6
    public final boolean e(String str) {
        return this.f32427a.containsKey(str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof c6) {
            return this.f32427a.equals(((c6) obj).f32427a);
        }
        return false;
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public f6 f(String str, j8 j8Var, ArrayList arrayList) {
        return "toString".equals(str) ? new i6(toString()) : b6.d(this, new i6(str), j8Var, arrayList);
    }

    public final int hashCode() {
        return this.f32427a.hashCode();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("{");
        HashMap map = this.f32427a;
        if (!map.isEmpty()) {
            for (String str : map.keySet()) {
                sb2.append(String.format("%s: %s,", str, map.get(str)));
            }
            sb2.deleteCharAt(sb2.lastIndexOf(","));
        }
        sb2.append("}");
        return sb2.toString();
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final String zzc() {
        return "[object Object]";
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
        return new u5(this.f32427a.keySet().iterator());
    }

    @Override // com.google.android.gms.internal.measurement.f6
    public final f6 zzt() {
        c6 c6Var = new c6();
        for (Map.Entry entry : this.f32427a.entrySet()) {
            boolean z11 = entry.getValue() instanceof b6;
            HashMap map = c6Var.f32427a;
            if (z11) {
                map.put((String) entry.getKey(), (f6) entry.getValue());
            } else {
                map.put((String) entry.getKey(), ((f6) entry.getValue()).zzt());
            }
        }
        return c6Var;
    }
}
