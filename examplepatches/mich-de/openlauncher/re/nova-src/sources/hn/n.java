package hn;

import java.util.Map;

/* loaded from: classes.dex */
public final class n implements Map.Entry {

    /* renamed from: a, reason: collision with root package name */
    public n f59923a;

    /* renamed from: b, reason: collision with root package name */
    public n f59924b;

    /* renamed from: c, reason: collision with root package name */
    public n f59925c;

    /* renamed from: d, reason: collision with root package name */
    public n f59926d;

    /* renamed from: e, reason: collision with root package name */
    public n f59927e;

    /* renamed from: f, reason: collision with root package name */
    public final Object f59928f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f59929g;

    /* renamed from: h, reason: collision with root package name */
    public Object f59930h;

    /* renamed from: i, reason: collision with root package name */
    public int f59931i;

    public n(boolean z11) {
        this.f59928f = null;
        this.f59929g = z11;
        this.f59927e = this;
        this.f59926d = this;
    }

    @Override // java.util.Map.Entry
    public final boolean equals(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object obj2 = this.f59928f;
            if (obj2 != null ? obj2.equals(entry.getKey()) : entry.getKey() == null) {
                Object obj3 = this.f59930h;
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
        return this.f59928f;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f59930h;
    }

    @Override // java.util.Map.Entry
    public final int hashCode() {
        Object obj = this.f59928f;
        int iHashCode = obj == null ? 0 : obj.hashCode();
        Object obj2 = this.f59930h;
        return (obj2 != null ? obj2.hashCode() : 0) ^ iHashCode;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        if (obj == null && !this.f59929g) {
            throw new NullPointerException("value == null");
        }
        Object obj2 = this.f59930h;
        this.f59930h = obj;
        return obj2;
    }

    public final String toString() {
        return this.f59928f + "=" + this.f59930h;
    }

    public n(boolean z11, n nVar, Object obj, n nVar2, n nVar3) {
        this.f59923a = nVar;
        this.f59928f = obj;
        this.f59929g = z11;
        this.f59931i = 1;
        this.f59926d = nVar2;
        this.f59927e = nVar3;
        nVar3.f59926d = this;
        nVar2.f59927e = this;
    }
}
