package aq;

import java.util.Map;

/* loaded from: classes4.dex */
public final class c0 implements Map.Entry {

    /* renamed from: a, reason: collision with root package name */
    public c0 f15423a;

    /* renamed from: b, reason: collision with root package name */
    public c0 f15424b;

    /* renamed from: c, reason: collision with root package name */
    public c0 f15425c;

    /* renamed from: d, reason: collision with root package name */
    public c0 f15426d;

    /* renamed from: e, reason: collision with root package name */
    public c0 f15427e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f15428f;

    /* renamed from: g, reason: collision with root package name */
    public final int f15429g;

    /* renamed from: h, reason: collision with root package name */
    public Object f15430h;

    /* renamed from: i, reason: collision with root package name */
    public int f15431i;

    public c0() {
        this.f15428f = null;
        this.f15429g = -1;
        this.f15427e = this;
        this.f15426d = this;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object obj2 = this.f15428f;
            if (obj2 != null ? obj2.equals(entry.getKey()) : entry.getKey() == null) {
                Object obj3 = this.f15430h;
                if (obj3 == null) {
                    if (entry.getValue() == null) {
                        return true;
                    }
                } else if (obj3.equals(entry.getValue())) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f15428f;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f15430h;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object obj = this.f15428f;
        int iHashCode = obj == null ? 0 : obj.hashCode();
        Object obj2 = this.f15430h;
        return (obj2 != null ? obj2.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        Object obj2 = this.f15430h;
        this.f15430h = obj;
        return obj2;
    }

    public final String toString() {
        return this.f15428f + "=" + this.f15430h;
    }

    public c0(c0 c0Var, Object obj, int i5, c0 c0Var2, c0 c0Var3) {
        this.f15423a = c0Var;
        this.f15428f = obj;
        this.f15429g = i5;
        this.f15431i = 1;
        this.f15426d = c0Var2;
        this.f15427e = c0Var3;
        c0Var3.f15426d = this;
        c0Var2.f15427e = this;
    }
}
