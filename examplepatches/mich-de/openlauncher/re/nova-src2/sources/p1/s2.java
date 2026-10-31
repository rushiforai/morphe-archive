package p1;

import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class s2 extends z1.a0 implements z1.o {

    /* renamed from: b, reason: collision with root package name */
    public final t2 f81551b;

    /* renamed from: c, reason: collision with root package name */
    public r2 f81552c;

    public s2(Object obj, t2 t2Var) {
        this.f81551b = t2Var;
        z1.f fVarK = z1.k.k();
        r2 r2Var = new r2(fVarK.g(), obj);
        if (!(fVarK instanceof z1.a)) {
            r2Var.f97902b = new r2(1, obj);
        }
        this.f81552c = r2Var;
    }

    @Override // z1.z
    public final z1.b0 d() {
        return this.f81552c;
    }

    @Override // z1.z
    public final z1.b0 e(z1.b0 b0Var, z1.b0 b0Var2, z1.b0 b0Var3) {
        if (this.f81551b.a(((r2) b0Var2).f81544c, ((r2) b0Var3).f81544c)) {
            return b0Var2;
        }
        return null;
    }

    @Override // z1.z
    public final void f(z1.b0 b0Var) {
        Intrinsics.e(b0Var, "null cannot be cast to non-null type androidx.compose.runtime.SnapshotMutableStateImpl.StateStateRecord<T of androidx.compose.runtime.SnapshotMutableStateImpl>");
        this.f81552c = (r2) b0Var;
    }

    @Override // p1.y2
    public final Object getValue() {
        return ((r2) z1.k.t(this.f81552c, this)).f81544c;
    }

    @Override // z1.o
    public final t2 l() {
        return this.f81551b;
    }

    @Override // p1.e1
    public final void setValue(Object obj) {
        z1.f fVarK;
        r2 r2Var = (r2) z1.k.i(this.f81552c);
        if (this.f81551b.a(r2Var.f81544c, obj)) {
            return;
        }
        r2 r2Var2 = this.f81552c;
        synchronized (z1.k.f97943c) {
            fVarK = z1.k.k();
            ((r2) z1.k.o(r2Var2, this, fVarK, r2Var)).f81544c = obj;
            Unit unit = Unit.f71706a;
        }
        z1.k.n(fVarK, this);
    }

    public final String toString() {
        return "MutableState(value=" + ((r2) z1.k.i(this.f81552c)).f81544c + ")@" + hashCode();
    }
}
