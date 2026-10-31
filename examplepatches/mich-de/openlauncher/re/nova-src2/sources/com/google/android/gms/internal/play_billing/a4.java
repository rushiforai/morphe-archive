package com.google.android.gms.internal.play_billing;

import java.util.Map;

/* loaded from: classes3.dex */
public final class a4 implements Map.Entry, Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparable f33353a;

    /* renamed from: b, reason: collision with root package name */
    public Object f33354b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ z3 f33355c;

    public a4(z3 z3Var, Comparable comparable, Object obj) {
        this.f33355c = z3Var;
        this.f33353a = comparable;
        this.f33354b = obj;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        return this.f33353a.compareTo(((a4) obj).f33353a);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj != this) {
            if (obj instanceof Map.Entry) {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Comparable comparable = this.f33353a;
                if (comparable == null ? key == null : comparable.equals(key)) {
                    Object obj2 = this.f33354b;
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
        return this.f33353a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f33354b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Comparable comparable = this.f33353a;
        int iHashCode = comparable == null ? 0 : comparable.hashCode();
        Object obj = this.f33354b;
        return (obj != null ? obj.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f33355c.g();
        Object obj2 = this.f33354b;
        this.f33354b = obj;
        return obj2;
    }

    public final String toString() {
        return b.u4.m(String.valueOf(this.f33353a), "=", String.valueOf(this.f33354b));
    }
}
