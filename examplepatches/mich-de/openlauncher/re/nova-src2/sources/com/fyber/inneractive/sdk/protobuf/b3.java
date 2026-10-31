package com.fyber.inneractive.sdk.protobuf;

import java.util.Map;

/* loaded from: classes3.dex */
public final class b3 implements Map.Entry, Comparable {

    /* renamed from: a, reason: collision with root package name */
    public final Comparable f30771a;

    /* renamed from: b, reason: collision with root package name */
    public Object f30772b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e3 f30773c;

    public b3(e3 e3Var, Map.Entry entry) {
        Comparable comparable = (Comparable) entry.getKey();
        Object value = entry.getValue();
        this.f30773c = e3Var;
        this.f30771a = comparable;
        this.f30772b = value;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.f30771a.compareTo(((b3) obj).f30771a);
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry entry = (Map.Entry) obj;
        Comparable comparable = this.f30771a;
        Object key = entry.getKey();
        if (comparable == null ? key == null : comparable.equals(key)) {
            Object obj2 = this.f30772b;
            Object value = entry.getValue();
            if (obj2 == null ? value == null : obj2.equals(value)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f30771a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f30772b;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Comparable comparable = this.f30771a;
        int iHashCode = comparable == null ? 0 : comparable.hashCode();
        Object obj = this.f30772b;
        return iHashCode ^ (obj != null ? obj.hashCode() : 0);
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f30773c.a();
        Object obj2 = this.f30772b;
        this.f30772b = obj;
        return obj2;
    }

    public final String toString() {
        return this.f30771a + "=" + this.f30772b;
    }

    public b3(e3 e3Var, Comparable comparable, Object obj) {
        this.f30773c = e3Var;
        this.f30771a = comparable;
        this.f30772b = obj;
    }
}
