package p1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class q2 extends z1.a0 implements z1.o, e1, y2 {

    /* renamed from: b, reason: collision with root package name */
    public p2 f81531b;

    @Override // z1.z
    public final z1.b0 d() {
        return this.f81531b;
    }

    @Override // z1.z
    public final z1.b0 e(z1.b0 b0Var, z1.b0 b0Var2, z1.b0 b0Var3) {
        if (((p2) b0Var2).f81523c == ((p2) b0Var3).f81523c) {
            return b0Var2;
        }
        return null;
    }

    @Override // z1.z
    public final void f(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableLongStateImpl.LongStateStateRecord");
        this.f81531b = (p2) b0Var;
    }

    @Override // p1.y2
    public Object getValue() {
        return Long.valueOf(m());
    }

    @Override // z1.o
    public final t2 l() {
        return g1.f81425e;
    }

    public final long m() {
        return ((p2) z1.k.t(this.f81531b, this)).f81523c;
    }

    public final void p(long j11) {
        z1.f fVarK;
        p2 p2Var = (p2) z1.k.i(this.f81531b);
        if (p2Var.f81523c != j11) {
            p2 p2Var2 = this.f81531b;
            synchronized (z1.k.f97943c) {
                fVarK = z1.k.k();
                ((p2) z1.k.o(p2Var2, this, fVarK, p2Var)).f81523c = j11;
                Unit unit = Unit.f71706a;
            }
            z1.k.n(fVarK, this);
        }
    }

    @Override // p1.e1
    public void setValue(Object obj) {
        p(((Number) obj).longValue());
    }

    public final String toString() {
        return "MutableLongState(value=" + ((p2) z1.k.i(this.f81531b)).f81523c + ")@" + hashCode();
    }
}
