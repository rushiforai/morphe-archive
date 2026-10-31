package p1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class m2 extends z1.a0 implements z1.o, e1, y2 {

    /* renamed from: b, reason: collision with root package name */
    public l2 f81513b;

    @Override // z1.z
    public final z1.b0 d() {
        return this.f81513b;
    }

    @Override // z1.z
    public final z1.b0 e(z1.b0 b0Var, z1.b0 b0Var2, z1.b0 b0Var3) {
        if (((l2) b0Var2).f81501c == ((l2) b0Var3).f81501c) {
            return b0Var2;
        }
        return null;
    }

    @Override // z1.z
    public final void f(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableFloatStateImpl.FloatStateStateRecord");
        this.f81513b = (l2) b0Var;
    }

    @Override // p1.y2
    public Object getValue() {
        return Float.valueOf(m());
    }

    @Override // z1.o
    public final t2 l() {
        return g1.f81425e;
    }

    public final float m() {
        return ((l2) z1.k.t(this.f81513b, this)).f81501c;
    }

    public final void p(float f11) {
        z1.f fVarK;
        l2 l2Var = (l2) z1.k.i(this.f81513b);
        if (l2Var.f81501c == f11) {
            return;
        }
        l2 l2Var2 = this.f81513b;
        synchronized (z1.k.f97943c) {
            fVarK = z1.k.k();
            ((l2) z1.k.o(l2Var2, this, fVarK, l2Var)).f81501c = f11;
            Unit unit = Unit.f71706a;
        }
        z1.k.n(fVarK, this);
    }

    @Override // p1.e1
    public void setValue(Object obj) {
        p(((Number) obj).floatValue());
    }

    public final String toString() {
        return "MutableFloatState(value=" + ((l2) z1.k.i(this.f81513b)).f81501c + ")@" + hashCode();
    }
}
