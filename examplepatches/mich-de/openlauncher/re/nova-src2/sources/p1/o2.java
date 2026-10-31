package p1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class o2 extends z1.a0 implements z1.o, e1, y2 {

    /* renamed from: b, reason: collision with root package name */
    public n2 f81518b;

    @Override // z1.z
    public final z1.b0 d() {
        return this.f81518b;
    }

    @Override // z1.z
    public final z1.b0 e(z1.b0 b0Var, z1.b0 b0Var2, z1.b0 b0Var3) {
        if (((n2) b0Var2).f81516c == ((n2) b0Var3).f81516c) {
            return b0Var2;
        }
        return null;
    }

    @Override // z1.z
    public final void f(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableIntStateImpl.IntStateStateRecord");
        this.f81518b = (n2) b0Var;
    }

    @Override // p1.y2
    public Object getValue() {
        return Integer.valueOf(m());
    }

    @Override // z1.o
    public final t2 l() {
        return g1.f81425e;
    }

    public final int m() {
        return ((n2) z1.k.t(this.f81518b, this)).f81516c;
    }

    public final void p(int i5) {
        z1.f fVarK;
        n2 n2Var = (n2) z1.k.i(this.f81518b);
        if (n2Var.f81516c != i5) {
            n2 n2Var2 = this.f81518b;
            synchronized (z1.k.f97943c) {
                fVarK = z1.k.k();
                ((n2) z1.k.o(n2Var2, this, fVarK, n2Var)).f81516c = i5;
                Unit unit = Unit.f71706a;
            }
            z1.k.n(fVarK, this);
        }
    }

    @Override // p1.e1
    public void setValue(Object obj) {
        p(((Number) obj).intValue());
    }

    public final String toString() {
        return "MutableIntState(value=" + ((n2) z1.k.i(this.f81518b)).f81516c + ")@" + hashCode();
    }
}
