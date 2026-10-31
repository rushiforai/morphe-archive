package xk;

import java.util.Map;

/* loaded from: classes.dex */
public final class t2 extends d1 {

    /* renamed from: d, reason: collision with root package name */
    public final transient x0 f96018d;

    /* renamed from: e, reason: collision with root package name */
    public final transient Object[] f96019e;

    /* renamed from: f, reason: collision with root package name */
    public final transient int f96020f;

    /* renamed from: g, reason: collision with root package name */
    public final transient int f96021g;

    public t2(x0 x0Var, Object[] objArr, int i5, int i11) {
        this.f96018d = x0Var;
        this.f96019e = objArr;
        this.f96020f = i5;
        this.f96021g = i11;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        if (obj instanceof Map.Entry) {
            Map.Entry entry = (Map.Entry) obj;
            Object key = entry.getKey();
            Object value = entry.getValue();
            if (value != null && value.equals(this.f96018d.get(key))) {
                return true;
            }
        }
        return false;
    }

    @Override // xk.q0
    public final int d(Object[] objArr, int i5) {
        return c().d(objArr, i5);
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return c().listIterator(0);
    }

    @Override // xk.d1
    public final v0 p() {
        return new s2(this);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f96021g;
    }
}
