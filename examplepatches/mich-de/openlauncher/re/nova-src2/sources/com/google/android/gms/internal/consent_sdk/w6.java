package com.google.android.gms.internal.consent_sdk;

import java.util.Map;

/* loaded from: classes3.dex */
public final class w6 implements Map.Entry, Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparable f32283a;

    /* renamed from: b, reason: collision with root package name */
    public Object f32284b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ v6 f32285c;

    public w6(v6 v6Var, Comparable comparable, Object obj) {
        this.f32285c = v6Var;
        this.f32283a = comparable;
        this.f32284b = obj;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        return this.f32283a.compareTo(((w6) obj).f32283a);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj != this) {
            if (obj instanceof Map.Entry) {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Comparable comparable = this.f32283a;
                if (comparable == null ? key == null : comparable.equals(key)) {
                    Object obj2 = this.f32284b;
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
        return this.f32283a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f32284b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Comparable comparable = this.f32283a;
        int iHashCode = comparable == null ? 0 : comparable.hashCode();
        Object obj = this.f32284b;
        return (obj != null ? obj.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f32285c.g();
        Object obj2 = this.f32284b;
        this.f32284b = obj;
        return obj2;
    }

    public final String toString() {
        return b.u4.m(String.valueOf(this.f32283a), "=", String.valueOf(this.f32284b));
    }
}
