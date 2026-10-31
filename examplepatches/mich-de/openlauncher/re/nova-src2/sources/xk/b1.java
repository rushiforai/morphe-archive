package xk;

import java.util.Arrays;

/* loaded from: classes.dex */
public abstract class b1 extends q0 implements f2 {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f95867d = 0;

    /* renamed from: b, reason: collision with root package name */
    public transient r2 f95868b;

    /* renamed from: c, reason: collision with root package name */
    public transient d1 f95869c;

    @Override // xk.q0
    public final v0 c() {
        r2 r2Var = this.f95868b;
        if (r2Var != null) {
            return r2Var;
        }
        v0 v0VarC = super.c();
        this.f95868b = (r2) v0VarC;
        return v0VarC;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return ((y2) this).f96064e.a(obj) > 0;
    }

    @Override // xk.q0
    public final int d(Object[] objArr, int i5) {
        lh.h it = entrySet().iterator();
        while (it.hasNext()) {
            j2 j2Var = (j2) ((e2) it.next());
            Arrays.fill(objArr, i5, j2Var.a() + i5, j2Var.b());
            i5 += j2Var.a();
        }
        return i5;
    }

    @Override // java.util.Collection
    public final boolean equals(Object obj) {
        return w.b.i(this, obj);
    }

    @Override // java.util.Collection
    public final int hashCode() {
        return w.l(entrySet());
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return new z0(entrySet().iterator());
    }

    @Override // xk.f2
    /* renamed from: k, reason: merged with bridge method [inline-methods] */
    public final d1 entrySet() {
        d1 a1Var = this.f95869c;
        if (a1Var == null) {
            a1Var = isEmpty() ? z2.f96074j : new a1(this);
            this.f95869c = a1Var;
        }
        return a1Var;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return entrySet().toString();
    }
}
