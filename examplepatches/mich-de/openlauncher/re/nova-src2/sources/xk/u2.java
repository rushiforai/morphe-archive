package xk;

/* loaded from: classes3.dex */
public final class u2 extends d1 {

    /* renamed from: d, reason: collision with root package name */
    public final transient x0 f96026d;

    /* renamed from: e, reason: collision with root package name */
    public final transient v2 f96027e;

    public u2(x0 x0Var, v2 v2Var) {
        this.f96026d = x0Var;
        this.f96027e = v2Var;
    }

    @Override // xk.d1, xk.q0
    public final v0 c() {
        return this.f96027e;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.f96026d.get(obj) != null;
    }

    @Override // xk.q0
    public final int d(Object[] objArr, int i5) {
        return this.f96027e.d(objArr, i5);
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return this.f96027e.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f96026d.size();
    }
}
