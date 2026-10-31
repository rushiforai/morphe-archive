package com.google.protobuf;

import java.util.Map;

/* loaded from: classes3.dex */
public final class e2 implements Map.Entry, Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparable f34849a;

    /* renamed from: b, reason: collision with root package name */
    public Object f34850b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d2 f34851c;

    public e2(d2 d2Var, Comparable comparable, Object obj) {
        this.f34851c = d2Var;
        this.f34849a = comparable;
        this.f34850b = obj;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f34849a.compareTo(((e2) obj).f34849a);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj != this) {
            if (obj instanceof Map.Entry) {
                Map.Entry entry = (Map.Entry) obj;
                Object key = entry.getKey();
                Comparable comparable = this.f34849a;
                if (comparable == null ? key == null : comparable.equals(key)) {
                    Object obj2 = this.f34850b;
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
    public final Object getKey() {
        return this.f34849a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f34850b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Comparable comparable = this.f34849a;
        int iHashCode = comparable == null ? 0 : comparable.hashCode();
        Object obj = this.f34850b;
        return (obj != null ? obj.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f34851c.b();
        Object obj2 = this.f34850b;
        this.f34850b = obj;
        return obj2;
    }

    public final String toString() {
        return this.f34849a + "=" + this.f34850b;
    }
}
