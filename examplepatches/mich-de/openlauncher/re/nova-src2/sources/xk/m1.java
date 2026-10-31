package xk;

/* loaded from: classes.dex */
public abstract class m1 extends d1 {
    @Override // xk.q0
    public final int d(Object[] objArr, int i5) {
        return c().d(objArr, i5);
    }

    public abstract Object get(int i5);

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return c().listIterator(0);
    }

    @Override // xk.d1
    public final v0 p() {
        return new l1(this);
    }
}
