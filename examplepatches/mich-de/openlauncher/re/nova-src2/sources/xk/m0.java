package xk;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class m0 implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Iterable[] f95965a;

    public m0(Iterable[] iterableArr) {
        this.f95965a = iterableArr;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        l0 l0Var = new l0(this, this.f95965a.length);
        q1 q1Var = new q1();
        q1Var.f95994b = p1.f95986e;
        q1Var.f95995c = l0Var;
        return q1Var;
    }

    public final String toString() {
        return v30.e.u(this);
    }
}
