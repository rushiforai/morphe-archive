package xk;

/* loaded from: classes.dex */
public final class x2 extends m1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ y2 f96057d;

    public x2(y2 y2Var) {
        this.f96057d = y2Var;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.f96057d.contains(obj);
    }

    @Override // xk.m1
    public final Object get(int i5) {
        k2 k2Var = this.f96057d.f96064e;
        vk.b0.e(i5, k2Var.f95954c);
        return k2Var.f95952a[i5];
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f96057d.f96064e.f95954c;
    }
}
