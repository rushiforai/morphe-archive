package com.google.android.gms.internal.measurement;

import java.util.Map;

/* loaded from: classes3.dex */
public final class w2 implements Map.Entry, Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparable f33177a;

    /* renamed from: b, reason: collision with root package name */
    public Object f33178b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ v2 f33179c;

    public w2(v2 v2Var, Comparable comparable, Object obj) {
        this.f33179c = v2Var;
        this.f33177a = comparable;
        this.f33178b = obj;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        return this.f33177a.compareTo(((w2) obj).f33177a);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj != this) {
            if (obj instanceof Map.Entry) {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Comparable comparable = this.f33177a;
                if (comparable == null ? key == null : comparable.equals(key)) {
                    Object obj2 = this.f33178b;
                    Object value = entry.getValue();
                    if (obj2 == null ? value == null : obj2.equals(value)) {
                    }
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.util.Map.Entry
    public final /* synthetic */ Object getKey() {
        return this.f33177a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f33178b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Comparable comparable = this.f33177a;
        int iHashCode = comparable == null ? 0 : comparable.hashCode();
        Object obj = this.f33178b;
        return (obj != null ? obj.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f33179c.f();
        Object obj2 = this.f33178b;
        this.f33178b = obj;
        return obj2;
    }

    public final String toString() {
        String strValueOf = String.valueOf(this.f33177a);
        String strValueOf2 = String.valueOf(this.f33178b);
        return b.c0.r(new StringBuilder(strValueOf.length() + 1 + strValueOf2.length()), strValueOf, "=", strValueOf2);
    }
}
