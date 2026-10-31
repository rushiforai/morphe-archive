package com.google.android.gms.internal.measurement;

import java.util.HashMap;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: d, reason: collision with root package name */
    public static final xk.d1 f32393d = xk.d1.l(3, "_syn", "_err", "_el");

    /* renamed from: a, reason: collision with root package name */
    public String f32394a;

    /* renamed from: b, reason: collision with root package name */
    public final long f32395b;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f32396c;

    public b(String str, long j11, HashMap map) {
        this.f32394a = str;
        this.f32395b = j11;
        HashMap map2 = new HashMap();
        this.f32396c = map2;
        if (map != null) {
            map2.putAll(map);
        }
    }

    public static Object b(Object obj, String str, Object obj2) {
        if (f32393d.contains(str) && (obj2 instanceof Double)) {
            return Long.valueOf(Math.round(((Double) obj2).doubleValue()));
        }
        if (str.startsWith("_")) {
            if (!(obj instanceof String) && obj != null) {
                return obj;
            }
        } else if (!(obj instanceof Double)) {
            if (obj instanceof Long) {
                return Long.valueOf(Math.round(((Double) obj2).doubleValue()));
            }
            if (obj instanceof String) {
                return obj2.toString();
            }
        }
        return obj2;
    }

    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final b clone() {
        return new b(this.f32394a, this.f32395b, new HashMap(this.f32396c));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.f32395b == bVar.f32395b && this.f32394a.equals(bVar.f32394a)) {
            return this.f32396c.equals(bVar.f32396c);
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = this.f32394a.hashCode() * 31;
        long j11 = this.f32395b;
        return this.f32396c.hashCode() + ((iHashCode + ((int) (j11 ^ (j11 >>> 32)))) * 31);
    }

    public final String toString() {
        String str = this.f32394a;
        String string = this.f32396c.toString();
        int length = String.valueOf(str).length();
        long j11 = this.f32395b;
        StringBuilder sb2 = new StringBuilder(length + 25 + String.valueOf(j11).length() + 9 + string.length() + 1);
        b.c0.C(sb2, "Event{name='", str, "', timestamp=");
        sb2.append(j11);
        sb2.append(", params=");
        sb2.append(string);
        sb2.append("}");
        return sb2.toString();
    }
}
